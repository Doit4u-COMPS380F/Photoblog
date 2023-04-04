package comps380f.doit4u.photoblog.validator;

import comps380f.doit4u.photoblog.controller.UserManagementController.Form;
import comps380f.doit4u.photoblog.dao.PhotoUserRepository;
import comps380f.doit4u.photoblog.model.PhotoUser;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class UserValidator implements Validator {
    @Resource
    PhotoUserRepository photoUserRepo;
    @Override
    public boolean supports(Class<?> type) {
        return Form.class.equals(type);
    }
    @Override
    public void validate(Object o, Errors errors) {
        Form user = (Form) o;
        ValidationUtils.rejectIfEmpty(errors, "confirm_password", "",
                "Please confirm your password.");
        if (!user.getPassword().equals(user.getConfirm_password())) {
            errors.rejectValue("confirm_password", "", "Password does not match.");
        }
        if (user.getUsername().equals("")) {
            return;
        }
        PhotoUser ticketUser = photoUserRepo.findById(user.getUsername()).orElse(null);
        if (ticketUser != null) {
            errors.rejectValue("username", "", "User already exists.");
        }
    }
}