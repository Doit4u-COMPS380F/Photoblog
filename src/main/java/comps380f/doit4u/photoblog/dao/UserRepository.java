package comps380f.doit4u.photoblog.dao;

import comps380f.doit4u.photoblog.model.Photo;
import comps380f.doit4u.photoblog.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
}
