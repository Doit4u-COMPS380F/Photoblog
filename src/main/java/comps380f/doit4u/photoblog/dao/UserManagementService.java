package comps380f.doit4u.photoblog.dao;

import comps380f.doit4u.photoblog.model.TicketUser;
import jakarta.annotation.Resource;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
public class UserManagementService {
    @Resource
    private TicketUserRepository tuRepo;

    @Transactional
    public List<TicketUser> getTicketUsers() {
        return tuRepo.findAll();
    }

    @Transactional
    public void delete(String username) {
        TicketUser ticketUser = tuRepo.findById(username).orElse(null);
        if (ticketUser == null) {
            throw new UsernameNotFoundException("User '" + username + "' not found.");
        }
        tuRepo.delete(ticketUser);
    }

    @Transactional
    public void createTicketUser(String username, String password, String[] roles) {
        TicketUser user = new TicketUser(username, password, roles);
        tuRepo.save(user);
    }
}