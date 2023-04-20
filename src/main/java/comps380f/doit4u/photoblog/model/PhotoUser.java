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
    private String phone;
    private String email;
    private String description;

    @OneToMany(mappedBy = "user", fetch = FetchType.EAGER,
            cascade = CascadeType.ALL, orphanRemoval = true)
    private List<UserRole> roles = new ArrayList<>();

    public PhotoUser() {}

    public PhotoUser(String username, String password, String phone, String email,  String[] roles, String description) {
        this.username = username;
        this.password = password;
        this.phone = phone;
        this.email = email;
        for (String role : roles) {
            this.roles.add(new UserRole(this, role));
        }
        this.description = description;
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public List<UserRole> getRoles() { return roles; }

    public String[] getRole(){
        String[] roles = new String[this.roles.size()];
        for(int i = 0; i < roles.length; i++) {
            roles[i] = this.roles.get(i).getRole();
            System.out.println(roles[i]);
        }
        return roles;
    }

    public void setRoles(List<UserRole> roles) { this.roles = roles; }

    public void setRoles(String[] roles) {
        this.roles.clear();
        for (String role : roles) {
            this.roles.add(new UserRole(this, role));
        }
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }
}