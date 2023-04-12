package comps380f.doit4u.photoblog.controller;

import comps380f.doit4u.photoblog.dao.UserManagementService;
import comps380f.doit4u.photoblog.validator.UserValidator;
import jakarta.annotation.Resource;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;

@Controller
@RequestMapping("/user")
public class UserManagementController {
    private final Logger logger = LogManager.getLogger(this.getClass());

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private UserValidator userValidator;

    @Resource
    UserManagementService umService;

    @GetMapping({"", "/", "/index"})
    public String list(ModelMap model) {
        model.addAttribute("photoUsers", umService.getPhotoUsers());
        return "listUser";
    }

    public static class Form {
        @NotEmpty(message="Please enter your user name.")
        private String username;
        @NotEmpty(message="Please enter your password.")
        @Size(min=6, max=15, message="Your password length must be between {min} and {max}.")
        @Pattern.List({
                @Pattern(regexp=".*[A-Z].*", message="Your password must contain at least one uppercase letter."),
                @Pattern(regexp=".*[\\d\\W].*", message="Your password must contain at least one symbol (non-alphanumeric character).")
        })
        private String password;
        private String confirm_password;
        @NotEmpty(message="Please select at least one role.")
        private String[] roles;

        // getters and setters for all properties
        public String getUsername() {
            return username;
        }

        public void setUsername(String username) {
            this.username = username;
        }

        public String getPassword() { return password; }

        public void setPassword(String password) {
            this.password = password;
        }

        public String getConfirm_password() { return confirm_password; }

        public void setConfirm_password(String confirm_password) { this.confirm_password = confirm_password; }

        public String[] getRoles() {
            return roles;
        }

        public void setRoles(String[] roles) {
            this.roles = roles;
        }
    }

    @GetMapping("/create")
    public ModelAndView create() {
        return new ModelAndView("addUser", "photoUser", new Form());
    }

    @PostMapping("/create")
    public String create(@ModelAttribute("photoUser") @Valid Form form, BindingResult result) throws IOException {
        userValidator.validate(form, result);

        if (result.hasErrors()) { return "addUser"; }

        umService.createPhotoUser(form.getUsername(),
//                form.getPassword(), form.getRoles());
                passwordEncoder.encode(form.getPassword()), form.getRoles());
        logger.info("User " + form.getUsername() + " created.");
        return "redirect:/user";
    }

    @GetMapping("/delete/{username}")
    public String deletePhoto(@PathVariable("username") String username) {
        umService.delete(username);
        logger.info("User " + username + " deleted.");
        return "redirect:/user";
    }
}