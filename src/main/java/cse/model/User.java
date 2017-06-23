package cse.model;

import java.io.Serializable;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Table;
import javax.persistence.Transient;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

@Entity
@Table(name = "users")
public class User implements Serializable,UserDetails {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue
    private Long id;
    private String password; 
    private String firstName;
	private String lastName;
	private String email;
	
    
	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@SuppressWarnings("unused")
	private boolean enabled;
    
 
    /**
     * There are two special roles in the system: ROLE_ADMIN and ROLE_REVIEWER.
     * Anyone who doesn't have either role is a regular user, i.e. applicant.
     */
    @ElementCollection
    @CollectionTable(name = "authorities",
        joinColumns = @JoinColumn(name = "user_id") )
    @Column(name = "role")
    private Set<String> roles;

    /**
     * This field is used for password confirmation during registration - it's
     * not stored in the database.
     */
    @Transient
    private String password2;

    public User()
    {
        roles = new HashSet<String>();
    }

    public boolean isAdmin()
    {
        return roles.contains( "ROLE_ADMIN" );
    }

    public boolean isAs()
    {
        return roles.contains( "ROLE_AS" );
    }
    public boolean isAgent()
    {
        return roles.contains( "ROLE_AGENT" );
    }
    public boolean isApplicant()
    {
        return roles.contains( "ROLE_APPLICANT" );
    }
    public Long getId()
    {
        return id;
    }

    public void setId( Long id )
    {
        this.id = id;
    }

    public String getPassword()
    {
        return password;
    }

    public void setPassword( String password )
    {
        this.password = password;
    }
    public Set<String> getRoles()
    {
        return roles;
    }

    public void setRoles( Set<String> roles )
    {
        this.roles = roles;
    }

    public String getPassword2()
    {
        return password2;
    }

    public void setPassword2( String password2 )
    {
        this.password2 = password2;
    }
    
    

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		Set<GrantedAuthority> authorities = new HashSet<GrantedAuthority>();
        for( String role : roles )
            authorities.add( new SimpleGrantedAuthority( role ) );
        return authorities;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return null;
	}
}