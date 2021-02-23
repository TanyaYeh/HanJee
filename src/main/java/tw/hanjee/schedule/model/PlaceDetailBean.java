package tw.hanjee.schedule.model;

import java.sql.Blob;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

@Entity
@Table(name = "placeDetail")
public class PlaceDetailBean {
	
	@Id
	@GeneratedValue(generator = "generator")
	@GenericGenerator(name = "generator", strategy = "foreign", parameters = @Parameter(name = "property", value = "place"))
	private Integer pla_no;
	private String pla_des;
	private Double pla_lan;
	private Double pla_lnt;
	private Blob pla_img;
	@OneToOne(fetch = FetchType.LAZY)
	@PrimaryKeyJoinColumn
	private PlaceBean placeBean;
	
	
	
	public PlaceDetailBean() {
		
	}
	public PlaceDetailBean(String pla_des, Double pla_lan, Double pla_lnt, Blob pla_img) {
		super();
		this.pla_des = pla_des;
		this.pla_lan = pla_lan;
		this.pla_lnt = pla_lnt;
		this.pla_img = pla_img;
	}
	public Integer getPla_no() {
		return pla_no;
	}
	public void setPla_no(Integer pla_no) {
		this.pla_no = pla_no;
	}
	public String getPla_des() {
		return pla_des;
	}
	public void setPla_des(String pla_des) {
		this.pla_des = pla_des;
	}
	public Double getPla_lan() {
		return pla_lan;
	}
	public void setPla_lan(Double pla_lan) {
		this.pla_lan = pla_lan;
	}
	public Double getPla_lnt() {
		return pla_lnt;
	}
	public void setPla_lnt(Double pla_lnt) {
		this.pla_lnt = pla_lnt;
	}
	public Blob getPla_img() {
		return pla_img;
	}
	public void setPla_img(Blob pla_img) {
		this.pla_img = pla_img;
	}
	public PlaceBean getPlaceBean() {
		return placeBean;
	}
	public void setPlaceBean(PlaceBean placeBean) {
		this.placeBean = placeBean;
	}
	@Override
	public String toString() {
		return "PlaceDetailBean [pla_des=" + pla_des + "]";
	}
	
	
}
