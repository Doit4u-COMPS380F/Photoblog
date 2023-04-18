package comps380f.doit4u.photoblog.controller;

import comps380f.doit4u.photoblog.model.Comment;
import comps380f.doit4u.photoblog.dao.CommentService;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/comment")
public class CommentController {

    @Autowired
    private CommentService commentService;

    @RequestMapping("/read-comment")
    public String showReadCommentPage(Model model) {
        model.addAttribute("comments", commentService.findAll());
        return "readcomment";
    }

    /*
    @GetMapping("/create-comment")
    public ModelAndView create() {

        return new ModelAndView("createcomment", "commentForm", new CommentController.Form());
    }

    public static class Form {
        private String content;
        public String getContent() {
            return content;
        }
        public void setContent(String content) {
            this.content = content;
        }

    }

    @PostMapping("/create-comment")
    public View create(TicketController.Form form, Principal principal) throws IOException {
        long ticketId = tService.createTicket(principal.getName(),
                form.getSubject(), form.getBody(), form.getAttachments());
        return new RedirectView("/ticket/view/" + ticketId, true);
    }
    */

    @RequestMapping("/create-comment")
    public String showCreateCommentPage(Model model) {
        System.out.println("Adding Attribute");
        model.addAttribute("command", new Comment());
        System.out.println("Ready to Return");
        return "createcomment";
    }

    @RequestMapping(value = "/create-comment", method = RequestMethod.POST)
    public String createContact(@ModelAttribute("comment") Comment comment) {
        System.out.println("Ready to Save Comment");
        commentService.saveComment(comment);
        System.out.println("A Comment is Saved");
        return "redirect:/comment/read-comment";
    }

    @RequestMapping(value = "/delete-comment/{id}")
    public String deleteComment(@PathVariable int id) {
        commentService.deleteById(id);
        return "redirect:/comment/read-comment";
    }

}
