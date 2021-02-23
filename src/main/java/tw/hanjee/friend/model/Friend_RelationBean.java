package tw.hanjee.friend.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import tw.hanjee.model.MemberBean;

@Entity
@Table(name = "friend_relation")
public class Friend_RelationBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer rel_no;
	@Transient
	private Integer member_id;
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "member_id")
	private MemberBean mb;
	@Transient
	private Integer friend_id;
	@ManyToOne(cascade = CascadeType.PERSIST )
	@JoinColumn(name = "friend_id" )
	private MemberBean fb;
	private String realname;
	private String close_rel;
	private String comment;
	private java.sql.Date meet_day;
	private Integer status;
	
	
	
	public Friend_RelationBean() {
		
	}
	
	

	public Friend_RelationBean(Integer member_id, Integer friend_id) {
	
		this.member_id = member_id;
		this.friend_id = friend_id;
	}



	public Friend_RelationBean(MemberBean mb, MemberBean fb) {
		super();
		this.mb = mb;
		this.fb = fb;
	}



	public Integer getRel_no() {
		return rel_no;
	}
	public void setRel_no(Integer rel_no) {
		this.rel_no = rel_no;
	}
	public Integer getMember_id() {
		return member_id;
	}
	public void setMember_id(Integer member_id) {
		this.member_id = member_id;
	}
	public MemberBean getMb() {
		return mb;
	}
	public void setMb(MemberBean mb) {
		this.mb = mb;
	}
	public Integer getFriend_id() {
		return friend_id;
	}
	public void setFriend_id(Integer friend_id) {
		this.friend_id = friend_id;
	}
	public MemberBean getFb() {
		return fb;
	}
	public void setFb(MemberBean fb) {
		this.fb = fb;
	}
	public String getRealnamee() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getClose_rel() {
		return close_rel;
	}
	public String setClose_rel(String close_rel) {
		return this.close_rel = close_rel;
	}
	public String getComment() {
		return comment;
	}
	public String setComment(String comment) {
		return this.comment = comment;
	}
	public java.sql.Date getMeet_day() {
		return meet_day;
	}
	public void setMeet_day(java.sql.Date meet_day) {
		this.meet_day = meet_day;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	
}
