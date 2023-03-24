package comps380f.doit4u.photoblog.exception;

public class UserNotFound extends Exception {
    public UserNotFound(long id) {
        super("User " + id + " does not exist.");
    }
}
