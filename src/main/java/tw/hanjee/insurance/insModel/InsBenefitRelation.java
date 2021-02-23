package tw.hanjee.insurance.insModel;

import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="insBenefitRelation")
public class InsBenefitRelation {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String relation;
	
	@OneToMany(mappedBy = "insBR")
	private Set<InsProfiles> insp = new LinkedHashSet<>();
	
	
	
	
	//constructors
	public InsBenefitRelation() {
	}
	public InsBenefitRelation(String relation) {
		this.relation = relation;
	}
	public InsBenefitRelation(int id, String relation) {
		this.id = id;
		this.relation = relation;
	}
	//Get and Set Method
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRelation() {
		return relation;
	}
	public void setRelation(String relation) {
		this.relation = relation;
	}
	
	
	

	
}
