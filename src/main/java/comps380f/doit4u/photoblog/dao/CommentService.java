package comps380f.doit4u.photoblog.dao;

import comps380f.doit4u.photoblog.model.Comment;
import comps380f.doit4u.photoblog.dao.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class CommentService {

    @Autowired
    private CommentRepository commentRepository;

    public List<Comment> findAll() {
        return commentRepository.findAll();
    }

    public Comment saveComment(Comment comment) { return commentRepository.save(comment); }

    public void deleteById(int id) { commentRepository.deleteById(id); }

}
