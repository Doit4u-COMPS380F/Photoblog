package comps380f.doit4u.photoblog.dao;

import comps380f.doit4u.photoblog.exception.PhotoNotFound;
import comps380f.doit4u.photoblog.exception.UserNotFound;
import comps380f.doit4u.photoblog.model.PhotoUser;
import jakarta.annotation.Resource;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.util.List;

@Service
public class UserManagementService {
    @Resource
    private PhotoUserRepository puRepo;

    @Transactional
    public List<PhotoUser> getPhotoUsers() {
        return puRepo.findAll();
    }

    @Transactional
    public void delete(String username) {
        PhotoUser photoUser = puRepo.findById(username).orElse(null);
        if (photoUser == null) {
            throw new UsernameNotFoundException("User '" + username + "' not found.");
        }
        puRepo.delete(photoUser);
    }

    @Transactional
    public void createPhotoUser(String username, String password, String phone, String email,  String[] roles) {
        PhotoUser user = new PhotoUser(username, password, phone, email, roles, "");
        puRepo.save(user);
    }

    @Transactional
    public PhotoUser getPhotoUsersByUserName(String username) {
        return puRepo.findById(username).orElse(null);
    }

    @Transactional
    public void updateDescription(String username, String description) {
        PhotoUser photoUser = puRepo.findById(username).orElse(null);
        if (photoUser == null) {
            throw new UsernameNotFoundException("User '" + username + "' not found.");
        }
        photoUser.setDescription(description);
        puRepo.save(photoUser);
    }

    @Transactional
    public void updatePhotoUser(String username, String password, String phone,
                           String email, String[] roles)
            throws IOException, UserNotFound {
        PhotoUser photoUser = puRepo.findById(username).orElse(null);
        if (photoUser == null) {
            throw new UsernameNotFoundException("User '" + username + "' not found.");
        }
        photoUser.setPassword(password);
        photoUser.setPhone(phone);
        photoUser.setEmail(email);
        if(roles != null)
            photoUser.setRoles(roles);
        puRepo.save(photoUser);
    }
}