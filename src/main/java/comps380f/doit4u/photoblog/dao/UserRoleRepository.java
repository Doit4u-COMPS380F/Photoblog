package comps380f.doit4u.photoblog.dao;

import comps380f.doit4u.photoblog.model.UserRole;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRoleRepository extends JpaRepository<UserRole, Integer> {
}