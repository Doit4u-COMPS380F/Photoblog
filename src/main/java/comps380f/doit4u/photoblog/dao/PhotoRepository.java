package comps380f.doit4u.photoblog.dao;

import comps380f.doit4u.photoblog.model.Photo;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PhotoRepository extends JpaRepository<Photo, Long> {
    List<Photo> findByUsername(String username);
}
