package cse.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "access_information")
public class AccessInformation implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	private Long id;
	private String directCompanyEmployee;
	private String SponsoredEmployeeOfCONCESSIONAIRE;
	private String directCompanyEmployeeOfLAWA;
	private String employeeJobTitle;
	private String lawaJobLocation;
	private String badgeColor;
	
	private String USCustomsSeal;
	private String weaponStar;
	private String RAD;
	private Boolean LAXPoliceDrivethruPost;
	private Boolean ATC;
	private Boolean ASM;
	private Boolean AOAFamiliarization;
	private Boolean Escort;
	private String criticalIcon;
	
	
	
	private Boolean airportSecurityTraining;
	private Boolean restrictedAreaDriverTraining;
	
	private String contact;
	private String authorityId;
	private Date authorizedDate;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getDirectCompanyEmployee() {
		return directCompanyEmployee;
	}
	public void setDirectCompanyEmployee(String directCompanyEmployee) {
		this.directCompanyEmployee = directCompanyEmployee;
	}
	public String getSponsoredEmployeeOfCONCESSIONAIRE() {
		return SponsoredEmployeeOfCONCESSIONAIRE;
	}
	public void setSponsoredEmployeeOfCONCESSIONAIRE(String sponsoredEmployeeOfCONCESSIONAIRE) {
		SponsoredEmployeeOfCONCESSIONAIRE = sponsoredEmployeeOfCONCESSIONAIRE;
	}
	public String getDirectCompanyEmployeeOfLAWA() {
		return directCompanyEmployeeOfLAWA;
	}
	public void setDirectCompanyEmployeeOfLAWA(String directCompanyEmployeeOfLAWA) {
		this.directCompanyEmployeeOfLAWA = directCompanyEmployeeOfLAWA;
	}
	public String getEmployeeJobTitle() {
		return employeeJobTitle;
	}
	public void setEmployeeJobTitle(String employeeJobTitle) {
		this.employeeJobTitle = employeeJobTitle;
	}
	public String getLawaJobLocation() {
		return lawaJobLocation;
	}
	public void setLawaJobLocation(String lawaJobLocation) {
		this.lawaJobLocation = lawaJobLocation;
	}
	public String getBadgeColor() {
		return badgeColor;
	}
	public void setBadgeColor(String badgeColor) {
		this.badgeColor = badgeColor;
	}
	public String getUSCustomsSeal() {
		return USCustomsSeal;
	}
	public void setUSCustomsSeal(String uSCustomsSeal) {
		USCustomsSeal = uSCustomsSeal;
	}
	public String getWeaponStar() {
		return weaponStar;
	}
	public void setWeaponStar(String weaponStar) {
		this.weaponStar = weaponStar;
	}
	public String getRAD() {
		return RAD;
	}
	public void setRAD(String rAD) {
		RAD = rAD;
	}
	public Boolean getLAXPoliceDrivethruPost() {
		return LAXPoliceDrivethruPost;
	}
	public void setLAXPoliceDrivethruPost(Boolean lAXPoliceDrivethruPost) {
		LAXPoliceDrivethruPost = lAXPoliceDrivethruPost;
	}
	public Boolean getATC() {
		return ATC;
	}
	public void setATC(Boolean aTC) {
		ATC = aTC;
	}
	public Boolean getASM() {
		return ASM;
	}
	public void setASM(Boolean aSM) {
		ASM = aSM;
	}
	public Boolean getAOAFamiliarization() {
		return AOAFamiliarization;
	}
	public void setAOAFamiliarization(Boolean aOAFamiliarization) {
		AOAFamiliarization = aOAFamiliarization;
	}
	public Boolean getEscort() {
		return Escort;
	}
	public void setEscort(Boolean escort) {
		Escort = escort;
	}
	public String getCriticalIcon() {
		return criticalIcon;
	}
	public void setCriticalIcon(String criticalIcon) {
		this.criticalIcon = criticalIcon;
	}
	public Boolean getAirportSecurityTraining() {
		return airportSecurityTraining;
	}
	public void setAirportSecurityTraining(Boolean airportSecurityTraining) {
		this.airportSecurityTraining = airportSecurityTraining;
	}
	public Boolean getRestrictedAreaDriverTraining() {
		return restrictedAreaDriverTraining;
	}
	public void setRestrictedAreaDriverTraining(Boolean restrictedAreaDriverTraining) {
		this.restrictedAreaDriverTraining = restrictedAreaDriverTraining;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getAuthorityId() {
		return authorityId;
	}
	public void setAuthorityId(String authorityId) {
		this.authorityId = authorityId;
	}
	public Date getAuthorizedDate() {
		return authorizedDate;
	}
	public void setAuthorizedDate(Date authorizedDate) {
		this.authorizedDate = authorizedDate;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}