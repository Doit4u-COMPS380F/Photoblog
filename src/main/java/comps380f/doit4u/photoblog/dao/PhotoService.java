package comps380f.doit4u.photoblog.dao;

import comps380f.doit4u.photoblog.exception.AttachmentNotFound;
import comps380f.doit4u.photoblog.exception.PhotoNotFound;
import comps380f.doit4u.photoblog.model.Attachment;
import comps380f.doit4u.photoblog.model.Photo;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Service
public class PhotoService {
    @Resource
    private PhotoRepository pRepo;

    @Resource
    private AttachmentRepository aRepo;

    @Transactional
    public List<Photo> getPhotos() {
        return pRepo.findAll();
    }

    @Transactional
    public Photo getPhoto(long id)
            throws PhotoNotFound {
        Photo photo = pRepo.findById(id).orElse(null);
        if (photo == null) {
            throw new PhotoNotFound(id);
        }
        return photo;
    }

    @Transactional
    public Attachment getAttachment(long photoId, UUID attachmentId)
            throws PhotoNotFound, AttachmentNotFound {
        Photo photo = pRepo.findById(photoId).orElse(null);
        if (photo == null) {
            throw new PhotoNotFound(photoId);
        }
        Attachment attachment = aRepo.findById(attachmentId).orElse(null);
        if (attachment == null) {
            throw new AttachmentNotFound(attachmentId);
        }
        return attachment;
    }

    @Transactional(rollbackFor = PhotoNotFound.class)
    public void delete(long id) throws PhotoNotFound {
        Photo deletedPhoto = pRepo.findById(id).orElse(null);
        if (deletedPhoto == null) {
            throw new PhotoNotFound(id);
        }
        pRepo.delete(deletedPhoto);
    }

    @Transactional(rollbackFor = AttachmentNotFound.class)
    public void deleteAttachment(long photoId, UUID attachmentId)
            throws PhotoNotFound, AttachmentNotFound {
        Photo photo = pRepo.findById(photoId).orElse(null);
        if (photo == null) {
            throw new PhotoNotFound(photoId);
        }
        for (Attachment attachment : photo.getAttachments()) {
            if (attachment.getId().equals(attachmentId)) {
                photo.deleteAttachment(attachment);
                pRepo.save(photo);
                return;
            }
        }
        throw new AttachmentNotFound(attachmentId);
    }

    @Transactional
    public long createPhoto(String username, String caption, List<MultipartFile> attachments)
            throws IOException {
        Photo photo = new Photo();
        photo.setUsername(username);
        photo.setCaption(caption);

        for (MultipartFile filePart : attachments) {
            Attachment attachment = new Attachment();
            attachment.setName(filePart.getOriginalFilename());
            attachment.setMimeContentType(filePart.getContentType());
            attachment.setContents(filePart.getBytes());
            attachment.setPhoto(photo);
            if (attachment.getName() != null && attachment.getName().length() > 0
                    && attachment.getContents() != null
                    && attachment.getContents().length > 0) {
                photo.getAttachments().add(attachment);
            }
        }
        Photo savedPhoto = pRepo.save(photo);
        return savedPhoto.getId();
    }

    @Transactional(rollbackFor = PhotoNotFound.class)
    public void updatePhoto(long id, String caption, List<MultipartFile> attachments)
            throws IOException, PhotoNotFound {
        Photo updatedPhoto = pRepo.findById(id).orElse(null);
        if (updatedPhoto == null) {
            throw new PhotoNotFound(id);
        }
        updatedPhoto.setCaption(caption);

        for (MultipartFile filePart : attachments) {
            Attachment attachment = new Attachment();
            attachment.setName(filePart.getOriginalFilename());
            attachment.setMimeContentType(filePart.getContentType());
            attachment.setContents(filePart.getBytes());
            attachment.setPhoto(updatedPhoto);
            if (attachment.getName() != null && attachment.getName().length() > 0
                    && attachment.getContents() != null
                    && attachment.getContents().length > 0) {
                updatedPhoto.getAttachments().add(attachment);
            }
        }
        pRepo.save(updatedPhoto);
    }

    @Transactional
    public List<Photo> getPhotosByUsername(String username)
            throws PhotoNotFound {
        List<Photo> photo = pRepo.findByUsername(username);
        if (photo == null) {
            throw new PhotoNotFound(username);
        }
        return photo;
    }
}
