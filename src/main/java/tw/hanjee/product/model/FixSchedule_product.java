package tw.hanjee.product.model;

import java.sql.Blob;
import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "fixSchedule_product")
public class FixSchedule_product {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer fixSch_no;
	private String fixSch_name;
	private Timestamp fixSch_start;
	private Timestamp fixSch_end;
	private Integer fixSch_available;
	private Integer fixSch_total;
	private Double fixSch_amount;
	private Double fixSch_discount;
	private String fixSch_img;
	private Integer fixSch_pub;
	private String fixSch_description;
	
	public FixSchedule_product() {
	}
	public Integer getFixSch_no() {
		return fixSch_no;
	}
	public void setFixSch_no(Integer fixSch_no) {
		this.fixSch_no = fixSch_no;
	}
	public String getFixSch_name() {
		return fixSch_name;
	}
	public void setFixSch_name(String fixSch_name) {
		this.fixSch_name = fixSch_name;
	}
	public Timestamp getFixSch_start() {
		return fixSch_start;
	}
	public void setFixSch_start(Timestamp fixSch_start) {
		this.fixSch_start = fixSch_start;
	}
	public Timestamp getFixSch_end() {
		return fixSch_end;
	}
	public void setFixSch_end(Timestamp fixSch_end) {
		this.fixSch_end = fixSch_end;
	}
	public Integer getFixSch_available() {
		return fixSch_available;
	}
	public void setFixSch_available(Integer fixSch_available) {
		this.fixSch_available = fixSch_available;
	}
	public Integer getFixSch_total() {
		return fixSch_total;
	}
	public void setFixSch_total(Integer fixSch_total) {
		this.fixSch_total = fixSch_total;
	}
	public Double getFixSch_amount() {
		return fixSch_amount;
	}
	public void setFixSch_amount(Double fixSch_amount) {
		this.fixSch_amount = fixSch_amount;
	}
	public Double getFixSch_discount() {
		return fixSch_discount;
	}
	public void setFixSch_discount(Double fixSch_discount) {
		this.fixSch_discount = fixSch_discount;
	}
	public String getFixSch_img() {
		return fixSch_img;
	}
	public void setFixSch_img(String fixSch_img) {
		this.fixSch_img = fixSch_img;
	}
	public Integer getFixSch_pub() {
		return fixSch_pub;
	}
	public void setFixSch_pub(Integer fixSch_pub) {
		this.fixSch_pub = fixSch_pub;
	}
	public String getFixSch_description() {
		return fixSch_description;
	}
	public void setFixSch_description(String fixSch_description) {
		this.fixSch_description = fixSch_description;
	}
	
	
	
	
}
