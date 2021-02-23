package tw.hanjee.insurance.insModel;

import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "insLocationFee")
public class InsLocationFee {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String location;
	private int feePerDay;
	@OneToMany(mappedBy = "insLF")
	private Set<InsProfiles> insp = new LinkedHashSet<>();

	// constructors
	public InsLocationFee() {
	}

	public InsLocationFee(String location) {
		this.location = location;
	}

	public InsLocationFee(String location, int feePerDay) {
		this.location = location;
		this.feePerDay = feePerDay;
	}

	public InsLocationFee(int id, String location, int feePerDay) {
		this.id = id;
		this.location = location;
		this.feePerDay = feePerDay;
	}

	// Get and Set Method
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public int getFeePerDay() {
		return feePerDay;
	}

	public void setFeePerDay(int feePerDay) {
		this.feePerDay = feePerDay;
	}

}
