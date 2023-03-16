package comps380f.doit4u.photoblog.model;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;


public class photo {
    private long id;
    private String customerName;
    private String subject;
    private String body;
    private Map<String, user> user = new ConcurrentHashMap<>();

    // Getters and Setters of id, customerName, subject, body (not attachments)
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public user getAttachment(String name) {
        return this.user.get(name);
    }

    public Collection<user> getAttachments() {
        return this.user.values();
    }

    public void addAttachment(user users) {
        this.user.put(users.getId(), users);
    }

    public int getNumberOfAttachments() {
        return this.user.size();
    }
}