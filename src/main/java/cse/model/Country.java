package cse.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "countries")
public class Country implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private Long id;
	private String countryCode;
	private String countryDescription;
	private String countrySubdivisionTypeName;
	private String internationalCallPrefix; 
	private Boolean isActive;
	private Long sortOrder;
	private Long _DataChanges_RowID;
	private String NCICCountryCode;

	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
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
	public String getCountryCode() {
		return countryCode;
	}
	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}
	public String getCountryDescription() {
		return countryDescription;
	}
	public void setCountryDescription(String countryDescription) {
		this.countryDescription = countryDescription;
	}
	public String getCountrySubdivisionTypeName() {
		return countrySubdivisionTypeName;
	}
	public void setCountrySubdivisionTypeName(String countrySubdivisionTypeName) {
		this.countrySubdivisionTypeName = countrySubdivisionTypeName;
	}
	public String getInternationalCallPrefix() {
		return internationalCallPrefix;
	}
	public void setInternationalCallPrefix(String internationalCallPrefix) {
		this.internationalCallPrefix = internationalCallPrefix;
	}
	public String getNCICCountryCode() {
		return NCICCountryCode;
	}
	public void setNCICCountryCode(String nCICCountryCode) {
		NCICCountryCode = nCICCountryCode;
	}
	
	
	
}