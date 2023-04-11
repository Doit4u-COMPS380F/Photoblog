package comps380f.doit4u.photoblog.dao;

import comps380f.doit4u.photoblog.model.TicketUser;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TicketUserRepository extends JpaRepository<TicketUser, String> { }