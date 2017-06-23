package cse.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Embeddable;
import javax.persistence.Lob;
import javax.persistence.OneToOne;

@Embeddable
public class ApplicationComment implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Lob
	private String comment;
	
	@OneToOne
	private User authorizedSigner;
	
	private Date createdDate;
	
	
	public ApplicationComment(){	
	}
	
	public ApplicationComment(String comment, User authorizedSigner){
		this.comment = comment;
		this.authorizedSigner = authorizedSigner;
	}
	
	
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public User getAuthorizedSigner() {
		return authorizedSigner;
	}

	public void setAuthorizedSigner(User authorizedSigner) {
		this.authorizedSigner = authorizedSigner;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	
}