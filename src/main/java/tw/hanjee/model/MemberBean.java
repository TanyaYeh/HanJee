package tw.hanjee.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import tw.hanjee.forum.model.CommentBean;
import tw.hanjee.forum.model.PostBean;
import tw.hanjee.friend.model.Person_InfoBean;
import tw.hanjee.schedule.model.ScheduleBean;

@Entity
@Table(name = "login_table")
public class MemberBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer member_id;
	private String account;
	private String password;
	private java.sql.Timestamp register_date;
	private String realname;
	private String address;
	private String mobile_phone;
	private String gender;
	private String nickname;
	private String email;
	private String home_phone;
	@JsonIgnore
	@OneToMany(mappedBy = "memberBean")
	private List<ScheduleBean> schBean = new ArrayList<ScheduleBean>();
	
	@JsonIgnore
	@OneToOne(fetch = FetchType.LAZY, mappedBy = "bean", cascade = CascadeType.ALL)
	private Person_InfoBean person_InfoBean;
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "mb", cascade = CascadeType.ALL)
	private List<CommentBean> comment = new ArrayList<CommentBean>();
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "mb", cascade = CascadeType.ALL)
	private List<PostBean> posts = new ArrayList<PostBean>();
	
	
	
	
	public MemberBean() {
		
	}

	public Integer getMember_id() {
		return member_id;
	}
	
	public MemberBean(String account) {
	super();
	this.account = account;
}
	public MemberBean(Integer member_id, String account, String password) {
		super();
		this.member_id = member_id;
		this.account = account;
		this.password = password;
	}
	public void setMember_id(Integer member_id) {
		this.member_id = member_id;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public java.sql.Timestamp getRegister_date() {
		return register_date;
	}
	public void setRegister_date(java.sql.Timestamp register_date) {
		this.register_date = register_date;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getMobile_phone() {
		return mobile_phone;
	}
	public void setMobile_phone(String mobile_phone) {
		this.mobile_phone = mobile_phone;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHome_phone() {
		return home_phone;
	}
	public void setHome_phone(String home_phone) {
		this.home_phone = home_phone;
	}



}
