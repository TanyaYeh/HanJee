package tw.hanjee.schedule.model;

import java.sql.Date;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;

import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import javax.persistence.Table;
import javax.persistence.Transient;

import tw.hanjee.model.MemberBean;

@Entity
@Table(name = "schedule")
public class ScheduleBean {
	@Id
	private Integer sch_no;
	private java.sql.Date sch_startD;
	private java.sql.Date sch_endD;
	private String sch_endP;
	private Double sch_amount;
	@Transient
	private Integer member_id;
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "member_id")
	private MemberBean memberBean;
	@Transient
	private Integer pla_no;
	@OneToMany(mappedBy = "sBBean")
	private Set<PlaceBean> place = new LinkedHashSet<PlaceBean>();
	@OneToMany(mappedBy = "scheduleBean")
	private List<DailyScheduleBean> dailySchedule = new LinkedList<DailyScheduleBean>();

	public Integer getSch_no() {
		return sch_no;
	}

	public void setSch_no(Integer sch_no) {
		
		this.sch_no = sch_no*100;
	}

	public java.sql.Date getSch_startD() {
		return sch_startD;
	}

	public ScheduleBean(String sch_endP) {
		super();
		this.sch_endP = sch_endP;
		
	}

	public void setSch_startD(java.sql.Date sch_startD) {
		this.sch_startD = sch_startD;
	}

	public ScheduleBean(Integer sch_no, String sch_endP) {
		super();
		this.sch_no = sch_no;
		this.sch_endP = sch_endP;
	}

	public java.sql.Date getSch_endD() {
		return sch_endD;
	}

	public void setSch_endD(java.sql.Date sch_endD) {
		this.sch_endD = sch_endD;
	}

	public String getEndP() {
		return sch_endP;
	}

	public void setEndP(String endP) {
		this.sch_endP = endP;
	}

	public Double getSch_amount() {
		return sch_amount;
	}

	public void setSch_amount(Double sch_amount) {
		this.sch_amount = sch_amount;
	}

	public Integer getMember_id() {
		return member_id;
	}

	public void setMember_id(Integer member_id) {
		this.member_id = member_id;
	}

	public MemberBean getMemberBean() {
		return memberBean;
	}

	public void setMemberBean(MemberBean memberBean) {
		this.memberBean = memberBean;
	}

	public Integer getPla_no() {
		return pla_no;
	}

	public void setPla_no(Integer pla_no) {
		this.pla_no = pla_no;
	}

	public Set<PlaceBean> getPlace() {
		return place;
	}

	public void setPlace(Set<PlaceBean> place) {
		this.place = place;
	}



	

	public List<DailyScheduleBean> getDailySchedule() {
		return dailySchedule;
	}

	public void setDailySchedule(List<DailyScheduleBean> dailySchedule) {
		this.dailySchedule = dailySchedule;
	}

	public ScheduleBean() {
		
	}

	public ScheduleBean(Integer sch_no, String sch_endP, MemberBean memberBean) {
		super();
		this.sch_no = sch_no;
		this.sch_endP = sch_endP;
		this.memberBean = memberBean;
	}

	public ScheduleBean(Integer sch_no, Date sch_startD, Date sch_endD, String endP, Double sch_amount,
			Integer member_id, MemberBean memberBean, Integer pla_no, Set<PlaceBean> place,
			List<DailyScheduleBean> dailySchedule) {
		super();
		this.sch_no = sch_no;
		this.sch_startD = sch_startD;
		this.sch_endD = sch_endD;
		this.sch_endP = endP;
		this.sch_amount = sch_amount;
		this.member_id = member_id;
		this.memberBean = memberBean;
		this.pla_no = pla_no;
		this.place = place;
		this.dailySchedule = dailySchedule;
	}

	public ScheduleBean(Integer member_id, MemberBean memberBean, List<DailyScheduleBean> dailySchedule) {
		super();
		this.member_id = member_id;
		this.memberBean = memberBean;
		this.dailySchedule = dailySchedule;
	}

	

}
