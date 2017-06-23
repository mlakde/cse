package cse.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "criminal_history")
public class CriminalRecord implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	private Long id;
	private Date crimeFormSignDate;
	private String intial;
	
	private Boolean que1;
	private Boolean que2;
	private Boolean que3;
	private Boolean que4;
	
	private Boolean que5;
	private Boolean que6;
	private Boolean que7;
	private Boolean que8;
	private Boolean que9;
	private Boolean que10;
	private Boolean que11;
	private Boolean que12;
	
	
	
	private Boolean que13;
	private Boolean que14;
	private Boolean que15;
	private Boolean que16;
	private Boolean que17;
	private Boolean que18;
	private Boolean que19;
	private Boolean que20;
	
	

	private Boolean que21;
	private Boolean que22;
	private Boolean que23;
	private Boolean que24;
	private Boolean que25;
	private Boolean que26;
	private Boolean que27;
	private Boolean que28;
	
	
	private Boolean que29;
	private Boolean que30;
	private Boolean que31;
	private Boolean que32;
	private Boolean que33;
	private Boolean que34;
	private Boolean que35;
	private Boolean que36;
	
	
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Boolean getQue1() {
		return que1;
	}
	public void setQue1(Boolean que1) {
		this.que1 = que1;
	}
	public Boolean getQue2() {
		return que2;
	}
	public void setQue2(Boolean que2) {
		this.que2 = que2;
	}
	public Boolean getQue3() {
		return que3;
	}
	public void setQue3(Boolean que3) {
		this.que3 = que3;
	}
	public Boolean getQue4() {
		return que4;
	}
	public void setQue4(Boolean que4) {
		this.que4 = que4;
	}
	public Boolean getQue5() {
		return que5;
	}
	public void setQue5(Boolean que5) {
		this.que5 = que5;
	}
	public Boolean getQue6() {
		return que6;
	}
	public void setQue6(Boolean que6) {
		this.que6 = que6;
	}
	public Boolean getQue7() {
		return que7;
	}
	public void setQue7(Boolean que7) {
		this.que7 = que7;
	}
	public Boolean getQue8() {
		return que8;
	}
	public void setQue8(Boolean que8) {
		this.que8 = que8;
	}
	public Boolean getQue9() {
		return que9;
	}
	public void setQue9(Boolean que9) {
		this.que9 = que9;
	}
	public Boolean getQue10() {
		return que10;
	}
	public void setQue10(Boolean que10) {
		this.que10 = que10;
	}
	public Boolean getQue11() {
		return que11;
	}
	public void setQue11(Boolean que11) {
		this.que11 = que11;
	}
	public Boolean getQue12() {
		return que12;
	}
	public void setQue12(Boolean que12) {
		this.que12 = que12;
	}
	public Boolean getQue13() {
		return que13;
	}
	public void setQue13(Boolean que13) {
		this.que13 = que13;
	}
	public Boolean getQue14() {
		return que14;
	}
	public void setQue14(Boolean que14) {
		this.que14 = que14;
	}
	public Boolean getQue15() {
		return que15;
	}
	public void setQue15(Boolean que15) {
		this.que15 = que15;
	}
	public Boolean getQue16() {
		return que16;
	}
	public void setQue16(Boolean que16) {
		this.que16 = que16;
	}
	public Boolean getQue17() {
		return que17;
	}
	public void setQue17(Boolean que17) {
		this.que17 = que17;
	}
	public Boolean getQue18() {
		return que18;
	}
	public void setQue18(Boolean que18) {
		this.que18 = que18;
	}
	public Boolean getQue19() {
		return que19;
	}
	public void setQue19(Boolean que19) {
		this.que19 = que19;
	}
	public Boolean getQue20() {
		return que20;
	}
	public void setQue20(Boolean que20) {
		this.que20 = que20;
	}
	public Boolean getQue21() {
		return que21;
	}
	public void setQue21(Boolean que21) {
		this.que21 = que21;
	}
	public Boolean getQue22() {
		return que22;
	}
	public void setQue22(Boolean que22) {
		this.que22 = que22;
	}
	public Boolean getQue23() {
		return que23;
	}
	public void setQue23(Boolean que23) {
		this.que23 = que23;
	}
	public Boolean getQue24() {
		return que24;
	}
	public void setQue24(Boolean que24) {
		this.que24 = que24;
	}
	public Boolean getQue25() {
		return que25;
	}
	public void setQue25(Boolean que25) {
		this.que25 = que25;
	}
	public Boolean getQue26() {
		return que26;
	}
	public void setQue26(Boolean que26) {
		this.que26 = que26;
	}
	public Boolean getQue27() {
		return que27;
	}
	public void setQue27(Boolean que27) {
		this.que27 = que27;
	}
	public Boolean getQue28() {
		return que28;
	}
	public void setQue28(Boolean que28) {
		this.que28 = que28;
	}
	public Boolean getQue29() {
		return que29;
	}
	public void setQue29(Boolean que29) {
		this.que29 = que29;
	}
	public Boolean getQue30() {
		return que30;
	}
	public void setQue30(Boolean que30) {
		this.que30 = que30;
	}
	public Boolean getQue31() {
		return que31;
	}
	public void setQue31(Boolean que31) {
		this.que31 = que31;
	}
	public Boolean getQue32() {
		return que32;
	}
	public void setQue32(Boolean que32) {
		this.que32 = que32;
	}
	public Boolean getQue33() {
		return que33;
	}
	public void setQue33(Boolean que33) {
		this.que33 = que33;
	}
	public Boolean getQue34() {
		return que34;
	}
	public void setQue34(Boolean que34) {
		this.que34 = que34;
	}
	public Boolean getQue35() {
		return que35;
	}
	public void setQue35(Boolean que35) {
		this.que35 = que35;
	}
	public Boolean getQue36() {
		return que36;
	}
	public void setQue36(Boolean que36) {
		this.que36 = que36;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public Date getCrimeFormSignDate() {
		return crimeFormSignDate;
	}
	public void setCrimeFormSignDate(Date crimeFormSignDate) {
		this.crimeFormSignDate = crimeFormSignDate;
	}
	public String getIntial() {
		return intial;
	}
	public void setIntial(String intial) {
		this.intial = intial;
	}
	
	
	
	
	
}