package comps380f.doit4u.photoblog.exception;

public class PhotoNotFound extends Exception {
    public PhotoNotFound(long id) {
        super("Photo " + id + " does not exist.");
    }
}
