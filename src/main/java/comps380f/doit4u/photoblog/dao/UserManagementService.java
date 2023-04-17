package comps380f.doit4u.photoblog.dao;

import comps380f.doit4u.photoblog.exception.UserNotFound;
import comps380f.doit4u.photoblog.model.Photo;
import comps380f.doit4u.photoblog.model.PhotoUser;
import comps380f.doit4u.photoblog.model.UserRole;
import jakarta.annotation.Resource;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.util.List;

@Service
public class UserManagementService {
    @Resource
    private PhotoUserRepository tuRepo;

    @Transactional
    public List<PhotoUser> getPhotoUsers() {
        return tuRepo.findAll();
    }

    @Transactional(rollbackFor = UserNotFound.class)
    public void updatePhotoUser(String username, String password, String phone, String email, List<UserRole> roles)
        throws IOException, UserNotFound {
        PhotoUser updatePhotoUser = tuRepo.findOne(username).orElse(null);
        if (updatePhotoUser == null) {
            throw new UserNotFound(username);
        }
        updatePhotoUser.setPassword(password);
        updatePhotoUser.setPhone(phone);
        updatePhotoUser.setEmail(email);
        updatePhotoUser.setRoles(roles);
        tuRepo.save(updatePhotoUser);
    }

    @Transactional
    public void delete(String username) {
        PhotoUser photoUser = tuRepo.findById(username).orElse(null);
        if (photoUser == null) {
            throw new UsernameNotFoundException("User '" + username + "' not found.");
        }
        tuRepo.delete(photoUser);
    }

    @Transactional
    public void createPhotoUser(String username, String password, String phone, String email, String[] roles) {
        PhotoUser user = new PhotoUser(username, password, phone, email, roles);
        tuRepo.save(user);
    }
}