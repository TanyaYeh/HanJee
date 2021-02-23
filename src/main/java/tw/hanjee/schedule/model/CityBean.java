package tw.hanjee.schedule.model;

import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "City")
public class CityBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer city_no;
	private String city_name;
	private Integer area_no;
	@OneToMany(mappedBy = "cityBean",fetch = FetchType.EAGER,cascade = CascadeType.ALL)
	private Set<PlaceBean> place= new LinkedHashSet<PlaceBean>();
	
	
	public CityBean() {
	
	}
	public CityBean(String city_name, Integer area_no, Set<PlaceBean> place) {
		super();
		this.city_name = city_name;
		this.area_no = area_no;
		this.place = place;
	}
	public CityBean(Integer city_no, String city_name, Integer area_no, Set<PlaceBean> place) {
		super();
		this.city_no = city_no;
		this.city_name = city_name;
		this.area_no = area_no;
		this.place = place;
	}
	public Integer getCity_no() {
		return city_no;
	}
	public void setCity_no(Integer city_no) {
		this.city_no = city_no;
	}
	public String getCity_name() {
		return city_name;
	}
	public void setCity_name(String city_name) {
		this.city_name = city_name;
	}
	public Integer getArea_no() {
		return area_no;
	}
	public void setArea_no(Integer area_no) {
		this.area_no = area_no;
	}
	public Set<PlaceBean> getPlace() {
		return place;
	}
	public void setPlace(Set<PlaceBean> place) {
		this.place = place;
	}
	
}
