package comps380f.doit4u.photoblog.model;

import jakarta.persistence.*;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import java.util.ArrayList;
import java.util.List;

@Entity
public class Photo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String username;
    private String caption;

    @OneToMany(mappedBy = "photo", fetch = FetchType.EAGER,
            cascade = CascadeType.ALL, orphanRemoval = true)
    @Fetch(FetchMode.SUBSELECT)
    private List<Attachment> attachments = new ArrayList<>();

    @OneToMany(mappedBy = "photo", fetch = FetchType.EAGER,
            cascade = CascadeType.ALL, orphanRemoval = true)
    @Fetch(FetchMode.SUBSELECT)
    private List<Attachment> comments = new ArrayList<>();

    // getters and setters of all properties
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getUsername() { return username; }

    public void setUsername(String username) { this.username = username; }

    public String getCaption() { return caption; }

    public void setCaption(String caption) {
        this.caption = caption;
    }

    public List<Attachment> getAttachments() {
        return attachments;
    }

    public void setAttachments(List<Attachment> attachments) {
        this.attachments = attachments;
    }

    public List<Attachment> getComments() { return comments; }

    public void setComments(List<Attachment> comments) { this.comments = comments; }

    public void deleteAttachment(Attachment attachment) {
        attachment.setPhoto(null);
        this.attachments.remove(attachment);
    }

    public void updateComment);
    }

    public void deleteComment(Comment comment) {
        comment.setPhoto(null);
        this.comments.remove(comment);
    }
}


