package comps380f.doit4u.photoblog.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.springframework.web.bind.annotation.PathVariable;

@Setter
@Getter
@Entity
public class Comment {

    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column
    private String content;

    @Column
    private String author;

    @Column
    private String reference;

    public void setReference(@PathVariable String ticketId) {
        reference = ticketId;
    }

    public String getReference() {
        return reference;
    }
}
