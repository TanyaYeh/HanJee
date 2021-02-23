package tw.hanjee.friend.model;

import java.sql.Blob;


import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;
import org.springframework.web.multipart.MultipartFile;


import tw.hanjee.model.MemberBean;

@Entity

@Table(name = "person_Info")
public class Person_InfoBean {
	
	@Id
	@GeneratedValue(generator = "generator")
	@GenericGenerator(name = "generator", strategy = "foreign", parameters = @Parameter(name = "property", value = "bean"))
	private Integer member_id;
	
//@Transient
//	private Integer rel_no;
	private Double per_high;
	private Double per_wei;
	private String per_rel;
	private String per_job;
	private String per_inc;
	private String per_int;
	private String per_con;
	private String dream;
	private Blob profile;
	private String img_name;
	
	@Transient
	private MultipartFile multipartFile;
	
	@OneToOne(fetch = FetchType.LAZY)
	@PrimaryKeyJoinColumn(name = "member_id")
	private MemberBean bean;
	
//	@OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.PERSIST)
//	@JoinColumn(name = "rel_no")
//	private Friend_RelationBean fRbean;
	
	
	public Person_InfoBean() {
	}

	public Person_InfoBean(String img_name,Blob profile) {
	}
	
	public MemberBean getBean() {
		return bean;
	}

	public void setBean(MemberBean bean) {
		this.bean = bean;
	}

//	public Friend_RelationBean getFRbean() {
//		return fRbean;
//	}
//
//	public void setFRbean(Friend_RelationBean fRbean) {
//		this.fRbean = fRbean;
//	}

	public Integer getMember_id() {
		return member_id;
	}

	public void setMember_id(Integer member_id) {
		this.member_id = member_id;
	}

	public Double getPer_high() {
		return per_high;
	}

	public void setPer_high(Double per_high) {
		this.per_high = per_high;
	}

	public Double getPer_wei() {
		return per_wei;
	}

	public void setPer_wei(Double per_wei) {
		this.per_wei = per_wei;
	}

	public String getPer_rel() {
		return per_rel;
	}

	public void setPer_rel(String per_rel) {
		this.per_rel = per_rel;
	}

	public String getPer_job() {
		return per_job;
	}

	public void setPer_job(String per_job) {
		this.per_job = per_job;
	}

	public String getPer_inc() {
		return per_inc;
	}

	public void setPer_inc(String per_inc) {
		this.per_inc = per_inc;
	}

	public String getPer_int() {
		return per_int;
	}

	public void setPer_int(String per_int) {
		this.per_int = per_int;
	}

	public String getPer_con() {
		return per_con;
	}

	public void setPer_con(String per_con) {
		this.per_con = per_con;
	}

	public String getDream() {
		return dream;
	}

	public void setDream(String dream) {
		this.dream = dream;
	}

	public Blob getProfile() {
		return profile;
	}

	public void setProfile(Blob profile) {
		this.profile = profile;
	}

	public String getImg_name() {
		return img_name;
	}

	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}

	public MultipartFile getmultipartFile() {
		return multipartFile;
	}

	public void setmultipartFile(MultipartFile eMultipartFile) {
		this.multipartFile = eMultipartFile;
	}

	public Person_InfoBean(MemberBean bean) {
		super();
		this.bean = bean;
	}
	

}
