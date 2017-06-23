package cse.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "country_subdivisions")
public class CountrySubdivision implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private Long id;
	private String countrySubdivisionCode;
	private String countrySubdivisionName;
	private Boolean isActive;
	private Long sortOrder;
	private Long _DataChanges_RowID;
	private String NCICCountrySubdivisionCode;

	@ManyToOne
	private Country country;
	
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
	

	public String getCountrySubdivisionName() {
		return countrySubdivisionName;
	}
	public void setCountrySubdivisionName(String countrySubdivisionName) {
		this.countrySubdivisionName = countrySubdivisionName;
	}
	public String getCountrySubdivisionCode() {
		return countrySubdivisionCode;
	}
	public void setCountrySubdivisionCode(String countrySubdivisionCode) {
		this.countrySubdivisionCode = countrySubdivisionCode;
	}
	public String getNCICCountrySubdivisionCode() {
		return NCICCountrySubdivisionCode;
	}
	public void setNCICCountrySubdivisionCode(String nCICCountrySubdivisionCode) {
		NCICCountrySubdivisionCode = nCICCountrySubdivisionCode;
	}
	public Country getCountry() {
		return country;
	}
	public void setCountry(Country country) {
		this.country = country;
	}
	
	
	
}