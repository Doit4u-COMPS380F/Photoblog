package comps380f.doit4u.photoblog.dao;

import comps380f.doit4u.photoblog.model.PhotoUser;
import jakarta.annotation.Resource;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserManagementService {
    @Resource
    private PhotoUserRepository tuRepo;

    @Transactional
    public List<PhotoUser> getPhotoUsers() {
        return tuRepo.findAll();
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
    public void createPhotoUser(String username, String password, String[] roles) {
        PhotoUser user = new PhotoUser(username, password, roles);
        tuRepo.save(user);
    }
}