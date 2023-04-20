package comps380f.doit4u.photoblog.dao;

import comps380f.doit4u.photoblog.dao.CommentRepository;
import comps380f.doit4u.photoblog.model.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.util.List;

@Service
public class CommentService {

    @Autowired
    private CommentRepository commentRepository;

    public List<Comment> getComments() {
        return commentRepository.findAll();
    }

    public Comment saveComment(Comment comment) { return commentRepository.save(comment); }

    @Transactional
    public Comment getComment(long id) {
        Comment comment = commentRepository.findById((int)id).orElse(null);
        return comment;
    }

    @Transactional
    public long createComment(String author, String content, String reference) throws IOException {
        Comment comment = new Comment();
        comment.setAuthor(author);
        comment.setContent(content);
        comment.setReference(reference);

        Comment savedComment = commentRepository.save(comment);
        return savedComment.getId();
    }

    public void deleteById(int id) { commentRepository.deleteById(id); }

}
