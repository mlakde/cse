package cse.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "person_aliases")
public class PersonAlias implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private Long id;
	private String FirstName;
	private String MiddleName;
	private String LastName;
	private String NameSuffixCode;
	private String NamePrefixCode;

	@ManyToOne
	private PersonBiographic personBiographic;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getFirstName() {
		return FirstName;
	}
	public void setFirstName(String firstName) {
		FirstName = firstName;
	}
	public String getMiddleName() {
		return MiddleName;
	}
	public void setMiddleName(String middleName) {
		MiddleName = middleName;
	}
	public String getLastName() {
		return LastName;
	}
	public void setLastName(String lastName) {
		LastName = lastName;
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
	public PersonBiographic getPersonBiographic() {
		return personBiographic;
	}
	public void setPersonBiographic(PersonBiographic personBiographic) {
		this.personBiographic = personBiographic;
	}
	

}