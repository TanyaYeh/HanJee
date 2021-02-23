package tw.hanjee.order.model;

import java.sql.Timestamp;


import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import tw.hanjee.model.ManagerBean;
import tw.hanjee.model.MemberBean;
import tw.hanjee.schedule.model.ScheduleBean;

@Entity
@Table(name = "orderMain")
public class OrderMain {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer ord_no;
	private String ord_id;
	private Integer member_id;
	private Timestamp ord_date;
	private String recipient;
	private String recipient_phone;
	private String recipient_address;
	private Integer manager_id;
	private Double ord_discount;
	private Double total_amount;
	private Integer iv_no;
	private Timestamp update_time;
	private String order_status;
	private String payment_status;
	private String note;
	private Integer isDelete;

	public OrderMain() {
		
	}

	public Integer getOrd_no() {
		return ord_no;
	}

	public void setOrd_no(Integer ord_no) {
		this.ord_no = ord_no;
	}

	public Integer getMember_id() {
		return member_id;
	}

	public void setMember_id(Integer member_id) {
		this.member_id = member_id;
	}

	public Timestamp getOrd_date() {
		return ord_date;
	}

	public void setOrd_date(Timestamp ord_date) {
		this.ord_date = ord_date;
	}

	public Integer getManager_id() {
		return manager_id;
	}

	public void setManager_id(Integer manager_id) {
		this.manager_id = manager_id;
	}

	public Double getOrd_discount() {
		return ord_discount;
	}

	public void setOrd_discount(Double ord_discount) {
		this.ord_discount = ord_discount;
	}

	public Double getTotal_amount() {
		return total_amount;
	}

	public void setTotal_amount(Double total_amount) {
		this.total_amount = total_amount;
	}

	public Integer getIv_no() {
		return iv_no;
	}

	public void setIv_no(Integer iv_no) {
		this.iv_no = iv_no;
	}

	public Timestamp getUpdate_time() {
		return update_time;
	}

	public void setUpdate_time(Timestamp update_time) {
		this.update_time = update_time;
	}

	public String getOrder_status() {
		return order_status;
	}

	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}

	public String getPayment_status() {
		return payment_status;
	}

	public void setPayment_status(String payment_status) {
		this.payment_status = payment_status;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getRecipient() {
		return recipient;
	}

	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}

	public String getRecipient_phone() {
		return recipient_phone;
	}

	public void setRecipient_phone(String recipient_phone) {
		this.recipient_phone = recipient_phone;
	}

	public String getRecipient_address() {
		return recipient_address;
	}

	public void setRecipient_address(String recipient_address) {
		this.recipient_address = recipient_address;
	}

	public String getOrd_id() {
		return ord_id;
	}

	public void setOrd_id(String ord_id) {
		this.ord_id = ord_id;
	}

	public Integer getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}

	

}
