package comps380f.doit4u.photoblog.dao;

import comps380f.doit4u.photoblog.model.Comment;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CommentRepository extends JpaRepository<Comment, Long> {
}
