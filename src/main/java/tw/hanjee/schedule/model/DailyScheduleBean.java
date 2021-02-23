package tw.hanjee.schedule.model;

import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;

import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "DailySchedule")
public class DailyScheduleBean {
	@Id
	private Integer sch_dno;
	@Transient
	private Integer sch_no;
	private java.sql.Date sch_Daily;
	private Integer sch_Pla1;
	private Integer sch_Pla2;
	private Integer sch_Pla3;
	private Integer sch_Pla4;
	private Integer sch_Pla5;
	private Double distance;
	private Double amount;
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "sch_no")
	private ScheduleBean scheduleBean;
	
	public DailyScheduleBean(ScheduleBean scheduleBean) {
		super();
		this.scheduleBean = scheduleBean;
	}
	public Integer getSch_dno() {
		return sch_dno;
	}
	public void setSch_dno(Integer sch_dno) {
		this.sch_dno = sch_dno;
	}
	public Integer getSch_no() {
		return sch_no;
	}
	public void setSch_no(Integer sch_no) {
		this.sch_no = sch_no;
	}
	public java.sql.Date getSch_Daily() {
		return sch_Daily;
	}
	public void setSch_Daily(java.sql.Date sch_Daily) {
		this.sch_Daily = sch_Daily;
	}
	public Integer getSch_Pla1() {
		return sch_Pla1;
	}
	public void setSch_Pla1(Integer sch_Pla1) {
		this.sch_Pla1 = sch_Pla1;
	}
	public Integer getSch_Pla2() {
		return sch_Pla2;
	}
	public void setSch_Pla2(Integer sch_Pla2) {
		this.sch_Pla2 = sch_Pla2;
	}
	public Integer getSch_Pla3() {
		return sch_Pla3;
	}
	public void setSch_Pla3(Integer sch_Pla3) {
		this.sch_Pla3 = sch_Pla3;
	}
	public Integer getSch_Pla4() {
		return sch_Pla4;
	}
	public void setSch_Pla4(Integer sch_Pla4) {
		this.sch_Pla4 = sch_Pla4;
	}
	public Integer getSch_Pla5() {
		return sch_Pla5;
	}
	public void setSch_Pla5(Integer sch_Pla5) {
		this.sch_Pla5 = sch_Pla5;
	}
	public Double getDistance() {
		return distance;
	}
	public void setDistance(Double distance) {
		this.distance = distance;
	}
	public Double getAmount() {
		return amount;
	}
	public void setAmount(Double amount) {
		this.amount = amount;
	}
	public ScheduleBean getScheduleBean() {
		return scheduleBean;
	}
	public void setScheduleBean(ScheduleBean scheduleBean) {
		this.scheduleBean = scheduleBean;
	}
	public DailyScheduleBean() {
		
	}
	public DailyScheduleBean(Integer sch_dno, Integer sch_Pla1, ScheduleBean scheduleBean) {
		super();
		this.sch_dno = sch_dno;
		this.sch_Pla1 = sch_Pla1;
		this.scheduleBean = scheduleBean;
	}
	
	
}
