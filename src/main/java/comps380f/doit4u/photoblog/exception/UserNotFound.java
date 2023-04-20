package comps380f.doit4u.photoblog.exception;

public class UserNotFound extends Exception {
    public UserNotFound(long id) {
        super("User " + id + " does not exist.");
    }

    public UserNotFound(String username) {
        super("User " + username + " does not exist.");
    }
}
