package cse.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "eye_colors")
public class EyeColor implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private Long id;
	private String eyeColorCode;
	private String eyeColorDescription;
	private Boolean isActive;
	private Long sortOrder;
	private Long _DataChanges_RowID;

	
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
	public String getEyeColorCode() {
		return eyeColorCode;
	}
	public void setEyeColorCode(String eyeColorCode) {
		this.eyeColorCode = eyeColorCode;
	}
	public String getEyeColorDescription() {
		return eyeColorDescription;
	}
	public void setEyeColorDescription(String eyeColorDescription) {
		this.eyeColorDescription = eyeColorDescription;
	}
	
	
	
}