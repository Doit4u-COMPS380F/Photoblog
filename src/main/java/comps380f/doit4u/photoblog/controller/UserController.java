package comps380f.doit4u.photoblog.controller;

import comps380f.doit4u.photoblog.dao.UserService;
import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

import java.io.IOException;
import java.util.List;
import java.util.Objects;

@Controller
@RequestMapping("/user")
public class UserController {

    @Resource
    private UserService uService;

    @GetMapping("/create")
    public ModelAndView create() {
        return new ModelAndView("add", "userForm", new Form());
    }

    public static class Form {
        private String userName;
        private String subject;
        private String body;
        private List<MultipartFile> attachments;

        // Getters and Setters of customerName, subject, body, attachments
        public String getUserName() {
            return userName;
        }

        public void setUserName(String userName) {
            this.userName = userName;
        }

        public String getSubject() {
            return subject;
        }

        public void setSubject(String subject) {
            this.subject = subject;
        }

        public String getBody() {
            return body;
        }

        public void setBody(String body) {
            this.body = body;
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
        long userId = uService.createUser(form.getUserName(),
                form.getSubject(), form.getBody(), form.getAttachments());
        return new RedirectView("/user/view/" + userId, true);
    }

    @GetMapping(value = {"/register", ""})
    public String regForm(ModelMap model) {
//        model.addAttribute("ticketDatabase", uService.getUser());
        return "registerForm";
    }

    @PostMapping(value = {"/register"})
    public String reg(ModelMap model) {
//        model.addAttribute("ticketDatabase", uService.getUser());
        return "registerResult";
    }

    @GetMapping(value = {"/logout"})
    public String logout(ModelMap model) {

        return "redirect:login";
    }

    @GetMapping(value = {"/login"})
    public String login(ModelMap model) {
        return "login";
    }

    @PostMapping(value = {"/login"})
    public String login(HttpServletRequest request) {
        // Authenticate user
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if (username.equals("username") && password.equals("p@ssw0rd")) {
            // Create new session
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            System.out.println("username: " + username + " authenticated");
            return "home";
        } else {
            return "redirect:/login?error";
        }
    }
}
