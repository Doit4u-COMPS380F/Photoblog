package comps380f.doit4u.photoblog.controller;

import comps380f.doit4u.photoblog.dao.CommentService;
import comps380f.doit4u.photoblog.dao.PhotoService;
import comps380f.doit4u.photoblog.dao.UserManagementService;
import comps380f.doit4u.photoblog.exception.PhotoNotFound;
import comps380f.doit4u.photoblog.validator.UserValidator;
import jakarta.annotation.Resource;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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

    @Resource
    private PhotoService pService;

    @Autowired
    private CommentService cService;

    @GetMapping({"", "/", "/index"})
    public String list(ModelMap model) {
        model.addAttribute("photoUsers", umService.getPhotoUsers());
        return "listUser";
    }

    public  static class DescriptionForm {
        private String description;

        public String getDescription() {
            return description;
        }

        public void setDescription(String description) {
            this.description = description;
        }
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
        private String phone;
        private String email;
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

        public String getPhone() { return phone; }

        public void setPhone(String phone) { this.phone = phone; }

        public String getEmail() { return email; }

        public void setEmail(String email) { this.email = email; }

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
                passwordEncoder.encode(form.getPassword()), form.getPhone(), form.getEmail(), form.getRoles());
        logger.info("User " + form.getUsername() + " created.");

        // Check if the current user has ADMIN role
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ADMIN"))) {
            return "redirect:/user";
        } else {
            return "redirect:/index";
        }
    }

    @GetMapping("/delete/{username}")
    public String deletePhoto(@PathVariable("username") String username) throws PhotoNotFound {
        umService.delete(username);
        logger.info("User " + username + " deleted.");
        return "redirect:/user";
    }

    @GetMapping("/profile/{username}")
    public ModelAndView list(@PathVariable("username") String username) throws PhotoNotFound {
        ModelAndView modelAndView = new ModelAndView("profile");
        modelAndView.addObject("userProfile", umService.getPhotoUsersByUserName(username));
        modelAndView.addObject("photoDatabase", pService.getPhotosByUsername(username));
        DescriptionForm descriptionForm = new DescriptionForm();
        descriptionForm.setDescription(umService.getPhotoUsersByUserName(username).getDescription());
        modelAndView.addObject("descriptionForm", descriptionForm);
        modelAndView.addObject("comments", cService.getComments());
        return modelAndView;
    }

    @PostMapping("/profile/{username}")
    public String updateDescription(@PathVariable("username") String username, @ModelAttribute("descriptionForm") @Valid DescriptionForm descriptionForm, BindingResult result) throws PhotoNotFound {
        if (result.hasErrors()) { return "profile"; }

        umService.updateDescription(username, descriptionForm.getDescription());
        logger.info("User " + username + " updated description.");
        return "redirect:/user/profile/" + username + "?updated";
    }
}