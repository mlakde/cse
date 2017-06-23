package cse.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;


/*** class to hold the application token
 * 
* @author mlakde
*/


@Entity
@Table(name = "application_tokens")
public class ApplicationToken implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	private Long id;
	private String FirstName;
	private String LastName;
	private String EmailAddress_Primary;
	private String SocialSecurityNumber;
	private String companyName;
	private String companyDivision;
	private String companyCode;
	private String applicationToken;
	private Date createdDate;
	private Date expiryDate;
	private Boolean active;
	
	@OneToOne
	private User authorizedSigner;
	
	@OneToOne
	private ApplicationType applicationType;
	
	public ApplicationType getApplicationType() {
		return applicationType;
	}

	public void setApplicationType(ApplicationType applicationType) {
		this.applicationType = applicationType;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getExpiryDate() {
		return expiryDate;
	}

	public void setExpiryDate(Date expiryDate) {
		this.expiryDate = expiryDate;
	}

	public Boolean getActive() {
		return active;
	}

	public void setActive(Boolean active) {
		this.active = active;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getApplicationToken() {
		return applicationToken;
	}

	public void setApplicationToken(String applicationToken) {
		this.applicationToken = applicationToken;
	}

	
	
	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getCompanyDivision() {
		return companyDivision;
	}

	public void setCompanyDivision(String companyDivision) {
		this.companyDivision = companyDivision;
	}

	public String getCompanyCode() {
		return companyCode;
	}

	public void setCompanyCode(String companyCode) {
		this.companyCode = companyCode;
	}

	

	public String getFirstName() {
		return FirstName;
	}

	public void setFirstName(String firstName) {
		FirstName = firstName;
	}

	public String getLastName() {
		return LastName;
	}

	public void setLastName(String lastName) {
		LastName = lastName;
	}

	public String getEmailAddress_Primary() {
		return EmailAddress_Primary;
	}

	public void setEmailAddress_Primary(String emailAddress_Primary) {
		EmailAddress_Primary = emailAddress_Primary;
	}

	public String getSocialSecurityNumber() {
		return SocialSecurityNumber;
	}

	public void setSocialSecurityNumber(String socialSecurityNumber) {
		SocialSecurityNumber = socialSecurityNumber;
	}

	public User getAuthorizedSigner() {
		return authorizedSigner;
	}

	public void setAuthorizedSigner(User authorizedSigner) {
		this.authorizedSigner = authorizedSigner;
	}

	
}