package cse.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "person_biographics")
public class PersonBiographic implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	private Long id;
	
	private String FirstName;
	private String MiddleName;
	private String LastName;
	private String NameSuffixCode;
	private String NamePrefixCode;
	
	private String Address;
	private String ApartmentNumber;
	private String City;
	private String CountrySubdivisionCode;
	private String PostalCode;
	private String CountryCode;
	
	
	private String SocialSecurityNumber;
	private String HomePhoneNumber;
	private String WorkPhoneNumber;
	
	private Date DateOfBirth;
	private String HeightInInches;
	private String WeightInPounds;
	private String HairColorCode;
	private String EyeColorCode;
	private String RaceCode;
	private String SexCode;
	
	private String CountryCode_Birth;
	private String CountrySubdivisionCode_Birth;
	
	private String EmailAddress_Primary;
	private String EmailAddress_Alternate;
	
	private Boolean IsSubmitted;
	
	private String CountryCode_Citizenship;
	
	
	private String employeeId;
	
	

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
	public String getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}
	
	public String getMiddleName() {
		return MiddleName;
	}
	public void setMiddleName(String middleName) {
		MiddleName = middleName;
	}

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getNameSuffixCode() {
		return NameSuffixCode;
	}
	public void setNameSuffixCode(String nameSuffixCode) {
		NameSuffixCode = nameSuffixCode;
	}
	public String getNamePrefixCode() {
		return NamePrefixCode;
	}
	public void setNamePrefixCode(String namePrefixCode) {
		NamePrefixCode = namePrefixCode;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public String getApartmentNumber() {
		return ApartmentNumber;
	}
	public void setApartmentNumber(String apartmentNumber) {
		ApartmentNumber = apartmentNumber;
	}
	public String getCity() {
		return City;
	}
	public void setCity(String city) {
		City = city;
	}
	public String getCountrySubdivisionCode() {
		return CountrySubdivisionCode;
	}
	public void setCountrySubdivisionCode(String countrySubdivisionCode) {
		CountrySubdivisionCode = countrySubdivisionCode;
	}
	public String getPostalCode() {
		return PostalCode;
	}
	public void setPostalCode(String postalCode) {
		PostalCode = postalCode;
	}
	public String getCountryCode() {
		return CountryCode;
	}
	public void setCountryCode(String countryCode) {
		CountryCode = countryCode;
	}
	public String getSocialSecurityNumber() {
		return SocialSecurityNumber;
	}
	public void setSocialSecurityNumber(String socialSecurityNumber) {
		SocialSecurityNumber = socialSecurityNumber;
	}
	public String getHomePhoneNumber() {
		return HomePhoneNumber;
	}
	public void setHomePhoneNumber(String homePhoneNumber) {
		HomePhoneNumber = homePhoneNumber;
	}
	public String getWorkPhoneNumber() {
		return WorkPhoneNumber;
	}
	public void setWorkPhoneNumber(String workPhoneNumber) {
		WorkPhoneNumber = workPhoneNumber;
	}
	public Date getDateOfBirth() {
		return DateOfBirth;
	}
	public void setDateOfBirth(Date dateOfBirth) {
		DateOfBirth = dateOfBirth;
	}
	public String getHeightInInches() {
		return HeightInInches;
	}
	public void setHeightInInches(String heightInInches) {
		HeightInInches = heightInInches;
	}
	public String getWeightInPounds() {
		return WeightInPounds;
	}
	public void setWeightInPounds(String weightInPounds) {
		WeightInPounds = weightInPounds;
	}
	public String getHairColorCode() {
		return HairColorCode;
	}
	public void setHairColorCode(String hairColorCode) {
		HairColorCode = hairColorCode;
	}
	public String getEyeColorCode() {
		return EyeColorCode;
	}
	public void setEyeColorCode(String eyeColorCode) {
		EyeColorCode = eyeColorCode;
	}
	public String getRaceCode() {
		return RaceCode;
	}
	public void setRaceCode(String raceCode) {
		RaceCode = raceCode;
	}
	public String getSexCode() {
		return SexCode;
	}
	public void setSexCode(String sexCode) {
		SexCode = sexCode;
	}
	public String getCountryCode_Birth() {
		return CountryCode_Birth;
	}
	public void setCountryCode_Birth(String countryCode_Birth) {
		CountryCode_Birth = countryCode_Birth;
	}
	public String getCountrySubdivisionCode_Birth() {
		return CountrySubdivisionCode_Birth;
	}
	public void setCountrySubdivisionCode_Birth(String countrySubdivisionCode_Birth) {
		CountrySubdivisionCode_Birth = countrySubdivisionCode_Birth;
	}
	public String getEmailAddress_Primary() {
		return EmailAddress_Primary;
	}
	public void setEmailAddress_Primary(String emailAddress_Primary) {
		EmailAddress_Primary = emailAddress_Primary;
	}
	public String getEmailAddress_Alternate() {
		return EmailAddress_Alternate;
	}
	public void setEmailAddress_Alternate(String emailAddress_Alternate) {
		EmailAddress_Alternate = emailAddress_Alternate;
	}
	public Boolean getIsSubmitted() {
		return IsSubmitted;
	}
	public void setIsSubmitted(Boolean isSubmitted) {
		IsSubmitted = isSubmitted;
	}
	public String getCountryCode_Citizenship() {
		return CountryCode_Citizenship;
	}
	public void setCountryCode_Citizenship(String countryCode_Citizenship) {
		CountryCode_Citizenship = countryCode_Citizenship;
	}
	
	
	
}