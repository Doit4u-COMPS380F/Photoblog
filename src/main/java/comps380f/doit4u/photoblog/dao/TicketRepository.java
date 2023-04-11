package comps380f.doit4u.photoblog.dao;

import comps380f.doit4u.photoblog.model.Ticket;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TicketRepository extends JpaRepository<Ticket, Long> { }
