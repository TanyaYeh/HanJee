package tw.hanjee.insurance.insService;

import java.util.List;

import tw.hanjee.insurance.insModel.InsBenefitRelation;
import tw.hanjee.insurance.insModel.InsLocationFee;
import tw.hanjee.insurance.insModel.InsProfiles;

public interface IFinsService {
	//insProfiles
	public void add(InsProfiles insp);
	public void update(InsProfiles insp);
	public void delete(int insId);
	public InsProfiles query(int insId);
	public int countA();
	public int countB();
	public int countC();
	public int countM();
	public int countF();
	
	//insLocationFee
	public List<InsLocationFee> getAllLocationList();
	public InsBenefitRelation getInsBenefitRelation(int id);
	
	//insBenefitRelation
	public List<InsBenefitRelation> getAllRelationList();
	public InsLocationFee getInsLocationFee(int id);
	
	
	
}
