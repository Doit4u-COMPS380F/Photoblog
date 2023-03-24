package comps380f.doit4u.photoblog.controller;

import comps380f.doit4u.photoblog.dao.PhotoService;
import comps380f.doit4u.photoblog.exception.AttachmentNotFound;
import comps380f.doit4u.photoblog.exception.PhotoNotFound;
import comps380f.doit4u.photoblog.model.Attachment;
import comps380f.doit4u.photoblog.model.Photo;
import comps380f.doit4u.photoblog.view.DownloadingView;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("")
public class PhotoController {

    @Resource
    private PhotoService pService;

    // Controller methods, Form-backing object, ...
    @GetMapping(value = {"", "/index"})
    public String list(ModelMap model) {
        model.addAttribute("photoDatabase", pService.getPhotos());
        return "index";
    }

    @GetMapping("/create")
    public ModelAndView create() {
        return new ModelAndView("add", "photoForm", new Form());
    }

    public static class Form {
        private String caption;
        private List<MultipartFile> attachments;

        // Getters and Setters of body, attachments
        public String getCaption() {
            return caption;
        }

        public void setCatpion(String caption) {
            this.caption = caption;
        }

        public List<MultipartFile> getAttachments() {
            return attachments;
        }

        public void setAttachments(List<MultipartFile> attachments) {
            this.attachments = attachments;
        }
    }

    @PostMapping("/create")
    public View create(Form form) throws IOException {
        long photoId = pService.createPhoto(form.getCaption(), form.getAttachments());
        return new RedirectView("/view/" + photoId, true);
    }

    @GetMapping("/view/{photoId}")
    public String view(@PathVariable("photoId") long photoId,
                       ModelMap model)
            throws PhotoNotFound {
        Photo photo = pService.getPhoto(photoId);
        model.addAttribute("photoId", photoId);
        model.addAttribute("photo", photo);
        return "view";
    }

    @GetMapping("/{photoId}/attachment/{attachment:.+}")
    public View download(@PathVariable("photoId") long photoId,
                         @PathVariable("attachment") UUID attachmentId)
            throws PhotoNotFound, AttachmentNotFound {
        Attachment attachment = pService.getAttachment(photoId, attachmentId);
        return new DownloadingView(attachment.getName(),
                    attachment.getMimeContentType(), attachment.getContents());
    }

    @GetMapping("/delete/{photoId}")
    public String deletePhoto(@PathVariable("photoId") long photoId)
            throws PhotoNotFound {
        pService.delete(photoId);
        return "redirect:/index";
    }

    @GetMapping("/{photoId}/delete/{attachment:.+}")
    public String deleteAttachment(@PathVariable("photoId") long photoId,
                                   @PathVariable("attachment") UUID attachmentId)
            throws PhotoNotFound, AttachmentNotFound {
        pService.deleteAttachment(photoId, attachmentId);
        return "redirect:/view/" + photoId;
    }

    @ExceptionHandler({PhotoNotFound.class, AttachmentNotFound.class})
    public ModelAndView error(Exception e) {
        return new ModelAndView("error", "message", e.getMessage());
    }
}

