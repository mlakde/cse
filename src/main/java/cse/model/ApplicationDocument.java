package cse.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Embeddable;



@Embeddable
public class ApplicationDocument implements Serializable {
	private static final long serialVersionUID = 1L;
	
	
	private String DocumentType;
	private Date ExpirationDate;
	private String DocumentID;
	private String State;
	private String Country;
	
	public ApplicationDocument (){
	}
	
	public ApplicationDocument (String DocumentType, Date ExpirationDate, String DocumentId, String State, String Country){
		this.DocumentType = DocumentType;
		this.ExpirationDate = ExpirationDate;
		this.DocumentID = DocumentId;
		this.State = State;
		this.Country = Country;
	}
	
	private Date createdDate;
	
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	public String getDocumentType() {
		return DocumentType;
	}
	public void setDocumentType(String documentType) {
		DocumentType = documentType;
	}
	public Date getExpirationDate() {
		return ExpirationDate;
	}
	public void setExpirationDate(Date expirationDate) {
		ExpirationDate = expirationDate;
	}
	public String getDocumentID() {
		return DocumentID;
	}
	public void setDocumentID(String documentID) {
		DocumentID = documentID;
	}
	public String getState() {
		return State;
	}
	public void setState(String state) {
		State = state;
	}
	public String getCountry() {
		return Country;
	}
	public void setCountry(String country) {
		Country = country;
	}

	
}