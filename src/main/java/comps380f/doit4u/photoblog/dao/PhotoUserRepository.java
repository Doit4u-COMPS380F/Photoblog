package comps380f.doit4u.photoblog.dao;

import comps380f.doit4u.photoblog.model.PhotoUser;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PhotoUserRepository extends JpaRepository<PhotoUser, String> {
}
