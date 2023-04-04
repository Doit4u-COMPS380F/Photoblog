package comps380f.doit4u.photoblog.model;

import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "users")
public class PhotoUser {
    @Id
    private String username;

    private String password;

    @OneToMany(mappedBy = "user", fetch = FetchType.EAGER,
            cascade = CascadeType.ALL, orphanRemoval = true)
    private List<UserRole> roles = new ArrayList<>();

    public PhotoUser() {}

    public PhotoUser(String username, String password, String[] roles) {
        this.username = username;
        this.password = "{noop}" + password;
        for (String role : roles) {
            this.roles.add(new UserRole(this, role));
        }
    }

    // getters and setters of all properties
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public List<UserRole> getRoles() {
        return roles;
    }

    public void setRoles(List<UserRole> roles) {
        this.roles = roles;
    }
}