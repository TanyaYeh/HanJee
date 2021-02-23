package tw.hanjee.product.model;
import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ticket_product")
public class Ticket_product {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer pro_no;
	private String pro_name;
	private String pro_cat;
	private String pro_start;
	private String pro_end;
	private Timestamp pro_date;
	private Double pro_amount;
	private Double pro_discount;
	private Integer pro_sto;
	private Integer pro_pub;
	//因為使用者不需要在車票裡去找哪張訂單訂的,故不寫入
//	@Transient
//    private Integer order_info_no;
	//因為使用者不需要在車票裡去找哪張訂單訂的,故不寫入
//	@OneToOne 
//	@JoinColumn(name = "order_info_no")
//	private Order_info order_info;
	
	public Ticket_product() {
		
	}
	

	public Ticket_product(String pro_name, String pro_cat, String pro_start, String pro_end, Timestamp pro_date,
			Double pro_amount, Double pro_discount, Integer pro_sto, Integer pro_pub) {

		this.pro_name = pro_name;
		this.pro_cat = pro_cat;
		this.pro_start = pro_start;
		this.pro_end = pro_end;
		this.pro_date = pro_date;
		this.pro_amount = pro_amount;
		this.pro_discount = pro_discount;
		this.pro_sto = pro_sto;
		this.pro_pub = pro_pub;
	}


	public Integer getPro_no() {
		return pro_no;
	}

	public void setPro_no(Integer pro_no) {
		this.pro_no = pro_no;
	}

	public String getPro_name() {
		return pro_name;
	}

	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}

	public String getPro_cat() {
		return pro_cat;
	}

	public void setPro_cat(String pro_cat) {
		this.pro_cat = pro_cat;
	}

	public String getPro_start() {
		return pro_start;
	}

	public void setPro_start(String pro_start) {
		this.pro_start = pro_start;
	}

	public String getPro_end() {
		return pro_end;
	}

	public void setPro_end(String pro_end) {
		this.pro_end = pro_end;
	}

	public Timestamp getPro_date() {
		return pro_date;
	}

	public void setPro_date(Timestamp pro_date) {
		this.pro_date = pro_date;
	}

	public Double getPro_amount() {
		return pro_amount;
	}

	public void setPro_amount(Double pro_amount) {
		this.pro_amount = pro_amount;
	}

	public Double getPro_discount() {
		return pro_discount;
	}

	public void setPro_discount(Double pro_discount) {
		this.pro_discount = pro_discount;
	}

	public Integer getPro_sto() {
		return pro_sto;
	}

	public void setPro_sto(Integer pro_sto) {
		this.pro_sto = pro_sto;
	}

	public Integer getPro_pub() {
		return pro_pub;
	}

	public void setPro_pub(Integer pro_pub) {
		this.pro_pub = pro_pub;
	}

//	public Integer getOrder_info_no() {
//		return order_info_no;
//	}
//
//	public void setOrder_info_no(Integer order_info_no) {
//		this.order_info_no = order_info_no;
//	}
//
//	public Order_info getOrder_info() {
//		return order_info;
//	}
//
//	public void setOrder_info(Order_info order_info) {
//		this.order_info = order_info;
//	}

	


	

	
}
