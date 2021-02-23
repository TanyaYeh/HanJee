package tw.hanjee.order.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "iv")
public class Iv {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer iv_no;
	private String iv_number;
	private Integer ord_no;
	private Boolean iv_status;
	private Double iv_tax;
	private Double iv_amount;
	private Integer iv_month;


	public Iv() {
	
	}

	public Integer getIv_no() {
		return iv_no;
	}

	public void setIv_no(Integer iv_no) {
		this.iv_no = iv_no;
	}

	public Integer getOrd_no() {
		return ord_no;
	}

	public void setOrd_no(Integer ord_no) {
		this.ord_no = ord_no;
	}

	public Boolean getIv_status() {
		return iv_status;
	}

	public void setIv_status(Boolean iv_status) {
		this.iv_status = iv_status;
	}

	public Double getIv_tax() {
		return iv_tax;
	}

	public void setIv_tax(Double iv_tax) {
		this.iv_tax = iv_tax;
	}

	public Double getIv_amount() {
		return iv_amount;
	}

	public void setIv_amount(Double iv_amount) {
		this.iv_amount = iv_amount;
	}

	public Integer getIv_month() {
		return iv_month;
	}

	public void setIv_month(Integer iv_month) {
		this.iv_month = iv_month;
	}



	public String getIv_number() {
		return iv_number;
	}

	public void setIv_number(String iv_number) {
		this.iv_number = iv_number;
	}

	

}
