package tw.hanjee.schedule.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "Place")
public class PlaceBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer pla_no;
	private String pla_name;

	@Transient
	private Integer city_no;
	@JsonIgnore
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "city_no")
	private CityBean cityBean;

	@JsonIgnore
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "sch_no")
	private ScheduleBean sBBean;

	@JsonIgnore
	@OneToOne(fetch = FetchType.LAZY, mappedBy = "placeBean", cascade = CascadeType.ALL)
	private PlaceDetailBean placeDetailBean;

	public PlaceBean(String pla_name, CityBean cityBean, PlaceDetailBean placeDetailBean) {
		super();
		this.pla_name = pla_name;
		this.cityBean = cityBean;
		this.placeDetailBean = placeDetailBean;
	}

	public Integer getPla_no() {
		return pla_no;
	}

	public void setPla_no(Integer pla_no) {
		this.pla_no = pla_no;
	}

	public String getPla_name() {
		return pla_name;
	}

	public void setPla_name(String pla_name) {
		this.pla_name = pla_name;
	}

	public Integer getCity_no() {
		return city_no;
	}

	public void setCity_no(Integer city_no) {
		this.city_no = city_no;
	}

	public CityBean getCityBean() {
		return cityBean;
	}

	public void setCityBean(CityBean cityBean) {
		this.cityBean = cityBean;
	}

	public PlaceDetailBean getPlaceDetailBean() {
		return placeDetailBean;
	}

	public void setPlaceDetailBean(PlaceDetailBean placeDetailBean) {
		this.placeDetailBean = placeDetailBean;
	}

	public PlaceBean() {

	}

}
