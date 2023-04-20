package comps380f.doit4u.photoblog.controller;

import comps380f.doit4u.photoblog.dao.CommentService;
import comps380f.doit4u.photoblog.model.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

import java.io.IOException;
import java.security.Principal;

@Controller
@RequestMapping("/comment")
public class CommentController {

    @Autowired
    private CommentService commentService;
    private String refersToTicketId;

    @RequestMapping("/read-comment")
    public String showReadCommentPage(Model model) {
        model.addAttribute("comments", commentService.getComments());
        System.out.println("Model Attributes = " +model);
        return "readcomment";
    }

    @GetMapping("/create-comment/{ticketId}")
    public ModelAndView createComment(@PathVariable("ticketId") long ticketId) {
        String reference = Long.toString(ticketId);
        System.out.println("Ready to Add Comment");
        Form aForm = new Form();
        refersToTicketId = Long.toString(ticketId);
        return new ModelAndView("createcomment", "commentForm", aForm);
    }

    public static class Form {
        private String content;
        private String reference;
        public String getContent() { return content; }
        public void setContent(String content) { this.content = content; }
        public String getReference() { return reference; }
        public void setReference(String reference) { this.reference = reference; }

    }

    @PostMapping("/create-comment")
    public View createComment(Form form, Principal principal) throws IOException {
        long commentId = commentService.createComment(principal.getName(), form.getContent(), refersToTicketId);
        return new RedirectView("/Doit4u/Photoblog/index");
    }

    @GetMapping("/comment/{ticketId}")
    public String view(@PathVariable("ticketId") long ticketId, ModelMap model) {
        Comment comment = commentService.getComment(ticketId);
        model.addAttribute("ticketId", ticketId);
        model.addAttribute("ticket", comment);
        return "redirect:/comment/read-comment";
    }

    @RequestMapping(value = "/delete-comment/{id}")
    public String deleteComment(@PathVariable int id) {
        commentService.deleteById(id);
        return "redirect:/index";
    }

}
