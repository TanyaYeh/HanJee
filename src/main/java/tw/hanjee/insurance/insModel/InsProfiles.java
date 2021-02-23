package tw.hanjee.insurance.insModel;

import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "insProfiles")
public class InsProfiles {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int insId;
	private String insNum;
	private String insName;
	private Date insBirth;
	private String insIdentify;
	private String insGender;
	private String insAddress;
	private String insPhone;
	private String insPlan;
	private String insBenefit;
	
	@Transient
	private int insBenefitRelation;
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "insBenefitRelation")
	private InsBenefitRelation insBR;
	
	@Transient
	private int insTravLocation;
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "insTravLocation")
	private InsLocationFee insLF;
	
	private Date insTravStartDate;
	private Date insTravEndDate;
	private long insTravDays;

	public InsProfiles() {
	}
	
	

	public InsProfiles(String insNum, String insName, Date insBirth, String insIdentify, String insGender,
			String insAddress, String insPhone, String insPlan, String insBenefit, int insBenefitRelation,
			int insTravLocation, Date insTravStartDate, Date insTravEndDate, long insTravDays) {
		this.insNum = insNum;
		this.insName = insName;
		this.insBirth = insBirth;
		this.insIdentify = insIdentify;
		this.insGender = insGender;
		this.insAddress = insAddress;
		this.insPhone = insPhone;
		this.insPlan = insPlan;
		this.insBenefit = insBenefit;
		this.insBenefitRelation = insBenefitRelation;
		this.insTravLocation = insTravLocation;
		this.insTravStartDate = insTravStartDate;
		this.insTravEndDate = insTravEndDate;
		this.insTravDays = insTravDays;
	}



	public InsProfiles(String insNum, String insName, Date insBirth, String insIdentify, String insGender,
			String insAddress, String insPhone, String insPlan, String insBenefit, InsBenefitRelation insBR,
			InsLocationFee insLF, Date insTravStartDate, Date insTravEndDate, long insTravDays) {
		this.insNum = insNum;
		this.insName = insName;
		this.insBirth = insBirth;
		this.insIdentify = insIdentify;
		this.insGender = insGender;
		this.insAddress = insAddress;
		this.insPhone = insPhone;
		this.insPlan = insPlan;
		this.insBenefit = insBenefit;
		this.insBR = insBR;
		this.insLF = insLF;
		this.insTravStartDate = insTravStartDate;
		this.insTravEndDate = insTravEndDate;
		this.insTravDays = insTravDays;
	}

	public InsProfiles(int insId, String insNum, String insName, Date insBirth, String insIdentify, String insGender,
			String insAddress, String insPhone, String insPlan, String insBenefit, InsBenefitRelation insBR,
			InsLocationFee insLF, Date insTravStartDate, Date insTravEndDate, long insTravDays) {
		this.insId = insId;
		this.insNum = insNum;
		this.insName = insName;
		this.insBirth = insBirth;
		this.insIdentify = insIdentify;
		this.insGender = insGender;
		this.insAddress = insAddress;
		this.insPhone = insPhone;
		this.insPlan = insPlan;
		this.insBenefit = insBenefit;
		this.insBR = insBR;
		this.insLF = insLF;
		this.insTravStartDate = insTravStartDate;
		this.insTravEndDate = insTravEndDate;
		this.insTravDays = insTravDays;
	}

	
	// Get and Set Method
	public int getInsId() {
		return insId;
	}

	public void setInsId(int insId) {
		this.insId = insId;
	}

	public String getInsNum() {
		return insNum;
	}

	public void setInsNum(String insNum) {
		this.insNum = insNum;
	}

	public String getInsName() {
		return insName;
	}

	public void setInsName(String insName) {
		this.insName = insName;
	}

	public Date getInsBirth() {
		return insBirth;
	}

	public void setInsBirth(Date insBirth) {
		this.insBirth = insBirth;
	}

	public String getInsIdentify() {
		return insIdentify;
	}

	public void setInsIdentify(String insIdentify) {
		this.insIdentify = insIdentify;
	}

	public String getInsGender() {
		return insGender;
	}

	public void setInsGender(String insGender) {
		this.insGender = insGender;
	}

	public String getInsAddress() {
		return insAddress;
	}

	public void setInsAddress(String insAddress) {
		this.insAddress = insAddress;
	}

	public String getInsPhone() {
		return insPhone;
	}

	public void setInsPhone(String insPhone) {
		this.insPhone = insPhone;
	}

	public String getInsPlan() {
		return insPlan;
	}

	public void setInsPlan(String insPlan) {
		this.insPlan = insPlan;
	}

	public String getInsBenefit() {
		return insBenefit;
	}

	public void setInsBenefit(String insBenefit) {
		this.insBenefit = insBenefit;
	}

	public int getInsBenefitRelation() {
		return insBenefitRelation;
	}

	public void setInsBenefitRelation(int insBenefitRelation) {
		this.insBenefitRelation = insBenefitRelation;
	}

	public InsBenefitRelation getInsBR() {
		return insBR;
	}

	public void setInsBR(InsBenefitRelation insBR) {
		this.insBR = insBR;
	}

	public int getInsTravLocation() {
		return insTravLocation;
	}

	public void setInsTravLocation(int insTravLocation) {
		this.insTravLocation = insTravLocation;
	}

	public InsLocationFee getInsLF() {
		return insLF;
	}

	public void setInsLF(InsLocationFee insLF) {
		this.insLF = insLF;
	}

	public Date getInsTravStartDate() {
		return insTravStartDate;
	}

	public void setInsTravStartDate(Date insTravStartDate) {
		this.insTravStartDate = insTravStartDate;
	}

	public Date getInsTravEndDate() {
		return insTravEndDate;
	}

	public void setInsTravEndDate(Date insTravEndDate) {
		this.insTravEndDate = insTravEndDate;
	}

	public long getInsTravDays() {
		return insTravDays;
	}

	public void setInsTravDays(long insTravDays) {
		this.insTravDays = insTravDays;
	}

	
	
	
	
}
