package cse.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table(name = "document_types")
public class DocumentType implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private Long id;
	
	private String DocumentTypeNumber;
	
	@Lob
	private String DocumentTypeDescription;
	
	private String EntityTypeCode;
	private String RequiresIssuingAuthority;
	private String RequiresIdentificationNumber;
	private Boolean RequiresExpirationDate;
	private Boolean isActive;
	private Long sortOrder;
	private Long _DataChanges_RowID;
	private Boolean I9Compliant;
	private Boolean Requires_CountrySubdivisionCode;
	private String Force_CountryCode;
	private String LegalStatusCode;
	private Boolean RequiresExpirationDate_Optional;
	private Boolean Requires_CountrySubdivisionCode_Optional;
	private Boolean RequiresIssuingAuthority_School;
	
	private String DocumentTypeCode;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getDocumentTypeNumber() {
		return DocumentTypeNumber;
	}
	public void setDocumentTypeNumber(String documentTypeNumber) {
		DocumentTypeNumber = documentTypeNumber;
	}
	public String getDocumentTypeDescription() {
		return DocumentTypeDescription;
	}
	public void setDocumentTypeDescription(String documentTypeDescription) {
		DocumentTypeDescription = documentTypeDescription;
	}
	public String getEntityTypeCode() {
		return EntityTypeCode;
	}
	public void setEntityTypeCode(String entityTypeCode) {
		EntityTypeCode = entityTypeCode;
	}
	public String getRequiresIssuingAuthority() {
		return RequiresIssuingAuthority;
	}
	public void setRequiresIssuingAuthority(String requiresIssuingAuthority) {
		RequiresIssuingAuthority = requiresIssuingAuthority;
	}
	public String getRequiresIdentificationNumber() {
		return RequiresIdentificationNumber;
	}
	public void setRequiresIdentificationNumber(String requiresIdentificationNumber) {
		RequiresIdentificationNumber = requiresIdentificationNumber;
	}
	
	public Boolean getRequiresExpirationDate() {
		return RequiresExpirationDate;
	}
	public void setRequiresExpirationDate(Boolean requiresExpirationDate) {
		RequiresExpirationDate = requiresExpirationDate;
	}
	public Boolean getIsActive() {
		return isActive;
	}
	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}
	public Long getSortOrder() {
		return sortOrder;
	}
	public void setSortOrder(Long sortOrder) {
		this.sortOrder = sortOrder;
	}
	public Long get_DataChanges_RowID() {
		return _DataChanges_RowID;
	}
	public void set_DataChanges_RowID(Long _DataChanges_RowID) {
		this._DataChanges_RowID = _DataChanges_RowID;
	}
	public Boolean getI9Compliant() {
		return I9Compliant;
	}
	public void setI9Compliant(Boolean i9Compliant) {
		I9Compliant = i9Compliant;
	}
	public Boolean getRequires_CountrySubdivisionCode() {
		return Requires_CountrySubdivisionCode;
	}
	public void setRequires_CountrySubdivisionCode(Boolean requires_CountrySubdivisionCode) {
		Requires_CountrySubdivisionCode = requires_CountrySubdivisionCode;
	}
	public String getForce_CountryCode() {
		return Force_CountryCode;
	}
	public void setForce_CountryCode(String force_CountryCode) {
		Force_CountryCode = force_CountryCode;
	}
	public String getLegalStatusCode() {
		return LegalStatusCode;
	}
	public void setLegalStatusCode(String legalStatusCode) {
		LegalStatusCode = legalStatusCode;
	}
	public Boolean getRequiresExpirationDate_Optional() {
		return RequiresExpirationDate_Optional;
	}
	public void setRequiresExpirationDate_Optional(Boolean requiresExpirationDate_Optional) {
		RequiresExpirationDate_Optional = requiresExpirationDate_Optional;
	}
	public Boolean getRequires_CountrySubdivisionCode_Optional() {
		return Requires_CountrySubdivisionCode_Optional;
	}
	public void setRequires_CountrySubdivisionCode_Optional(Boolean requires_CountrySubdivisionCode_Optional) {
		Requires_CountrySubdivisionCode_Optional = requires_CountrySubdivisionCode_Optional;
	}
	public Boolean getRequiresIssuingAuthority_School() {
		return RequiresIssuingAuthority_School;
	}
	public void setRequiresIssuingAuthority_School(Boolean requiresIssuingAuthority_School) {
		RequiresIssuingAuthority_School = requiresIssuingAuthority_School;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getDocumentTypeCode() {
		return DocumentTypeCode;
	}
	public void setDocumentTypeCode(String documentTypeCode) {
		DocumentTypeCode = documentTypeCode;
	}
	
	
	
	
}