package comps380f.doit4u.photoblog.controller;

import comps380f.doit4u.photoblog.model.Comment;
import comps380f.doit4u.photoblog.dao.CommentService;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/ticket")
public class CommentController {

    @Autowired
    private CommentService commentService;

    @RequestMapping("/read-comment")
    public String showReadCommentPage(Model model) {
        model.addAttribute("comments", commentService.findAll());
        return "readcomment";
    }

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
        return "redirect:/read-comment";
    }

    @RequestMapping(value = "/delete-comment/{id}")
    public String deleteComment(@PathVariable int id) {
        commentService.deleteById(id);
        return "redirect:/read-comment";
    }

}
