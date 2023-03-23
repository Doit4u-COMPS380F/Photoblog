package comps380f.doit4u.photoblog.dao;

import comps380f.doit4u.photoblog.exception.UserNotFound;
import comps380f.doit4u.photoblog.model.User;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Service
public class UserService {
    @Resource
    private UserRepository uRepo;

    @Transactional
    public List<User> getUsers() {
        return uRepo.findAll();
    }

    @Transactional
    public User getUser(long id)
            throws UserNotFound {
        User User = uRepo.findById(id).orElse(null);
        if (User == null) {
            throw new UserNotFound(id);
        }
        return User;
    }

    @Transactional(rollbackFor = UserNotFound.class)
    public void delete(long id) throws UserNotFound {
        User deletedUser = uRepo.findById(id).orElse(null);
        if (deletedUser == null) {
            throw new UserNotFound(id);
        }
        uRepo.delete(deletedUser);
    }

    @Transactional
    public long createUser(String customerName, String subject,
                             String body, List<MultipartFile> attachments)
            throws IOException {
        User User = new User();
        User.setUserName(customerName);
        User savedUser = uRepo.save(User);
        return savedUser.getId();
    }
}
