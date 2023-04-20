package comps380f.doit4u.photoblog.model;

import jakarta.persistence.*;

@Entity
@Table(name = "user_roles")
public class UserRole {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_role_id")
    private int id;

    @Column(insertable = false, updatable = false)
    private String username;
    private String role;

    @ManyToOne
    @JoinColumn(name = "username")
    private PhotoUser user;

    public UserRole() {
    }

    public UserRole(PhotoUser user, String role) {
        this.user = user;
        this.role = role;
    }

    // getters and setters of all properties
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public PhotoUser getUser() {
        return user;
    }

    public void setUser(PhotoUser user) {
        this.user = user;
    }
}