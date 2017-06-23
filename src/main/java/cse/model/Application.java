package cse.model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.CollectionTable;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "applications")
public class Application implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	private Long id;
	
	@OneToOne
	private ApplicationToken applicationToken;
	
	@OneToOne
	private ApplicationType applicationType;
	@OneToOne
	private ApplicationStatus applicationStatus;
	@OneToOne
	private User authorizedSigner;
	
	@ElementCollection
    @CollectionTable(name = "application_comments",
        joinColumns = @JoinColumn(name = "application_id") )
    private List<ApplicationComment> comments;
	
	@OneToOne
	private PersonBiographic personBiographic;

	@OneToOne
	private CriminalRecord criminalRecord;
	
	@OneToOne
	private ApplicationReceipt applicationReceipt;
	
	
	@ElementCollection
    @CollectionTable(name = "application_documents",
        joinColumns = @JoinColumn(name = "application_id") )
    private List<ApplicationDocument> applicationDocument;
	
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public ApplicationToken getApplicationToken() {
		return applicationToken;
	}

	public void setApplicationToken(ApplicationToken applicationToken) {
		this.applicationToken = applicationToken;
	}

	public ApplicationType getApplicationType() {
		return applicationType;
	}

	public void setApplicationType(ApplicationType applicationType) {
		this.applicationType = applicationType;
	}

	public ApplicationStatus getApplicationStatus() {
		return applicationStatus;
	}

	public void setApplicationStatus(ApplicationStatus applicationStatus) {
		this.applicationStatus = applicationStatus;
	}

	public User getAuthorizedSigner() {
		return authorizedSigner;
	}

	public void setAuthorizedSigner(User authorizedSigner) {
		this.authorizedSigner = authorizedSigner;
	}

	public List<ApplicationComment> getComments() {
		return comments;
	}

	public void setComments(List<ApplicationComment> comments) {
		this.comments = comments;
	}

	public PersonBiographic getPersonBiographic() {
		return personBiographic;
	}

	public void setPersonBiographic(PersonBiographic personBiographic) {
		this.personBiographic = personBiographic;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public CriminalRecord getCriminalRecord() {
		return criminalRecord;
	}

	public void setCriminalRecord(CriminalRecord criminalRecord) {
		this.criminalRecord = criminalRecord;
	}

	public ApplicationReceipt getApplicationReceipt() {
		return applicationReceipt;
	}

	public void setApplicationReceipt(ApplicationReceipt applicationReceipt) {
		this.applicationReceipt = applicationReceipt;
	}

	public List<ApplicationDocument> getApplicationDocument() {
		return applicationDocument;
	}

	public void setApplicationDocument(List<ApplicationDocument> applicationDocument) {
		this.applicationDocument = applicationDocument;
	}


	
	
	
}