package comps380f.doit4u.photoblog.dao;


import comps380f.doit4u.photoblog.model.Attachment;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface AttachmentRepository extends JpaRepository<Attachment, UUID> {
}
