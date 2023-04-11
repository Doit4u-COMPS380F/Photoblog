package comps380f.doit4u.photoblog.validator;

import comps380f.doit4u.photoblog.controller.UserManagementController;
import comps380f.doit4u.photoblog.dao.TicketUserRepository;
import comps380f.doit4u.photoblog.model.TicketUser;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class UserValidator implements Validator {
    @Resource
    TicketUserRepository ticketUserRepo;

    @Override
    public boolean supports(Class<?> type) {
        return UserManagementController.Form.class.equals(type);
    }

    @Override
    public void validate(Object o, Errors errors) {
        UserManagementController.Form user = (UserManagementController.Form) o;
        ValidationUtils.rejectIfEmpty(errors, "confirm_password", "",
                "Please confirm your password.");
        if (!user.getPassword().equals(user.getConfirm_password())) {
            errors.rejectValue("confirm_password", "", "Password does not match.");
        }
        if (user.getUsername().equals("")) {
            return;
        }
        TicketUser ticketUser = ticketUserRepo.findById(user.getUsername()).orElse(null);
        if (ticketUser != null) {
            errors.rejectValue("username", "", "User already exists.");
        }
    }
}