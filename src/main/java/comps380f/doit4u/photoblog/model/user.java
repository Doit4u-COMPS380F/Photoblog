package comps380f.doit4u.photoblog.model;

public class user {
    private String id;
    private String name;
    private String username;
    private String userType;
    private long[] contents;

    // Getters and Setters of id, name, mimeContentType, contents
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUserType() {
        return userType;
    }

    public void setContents(String userType) {
        this.userType = userType;
    }

    public long[] getContents() {
        return contents;
    }

    public void setContents(long[] contents) {
        this.contents = contents;
    }
}
