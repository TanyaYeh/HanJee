package tw.hanjee.insurance.insDao;

import java.util.List;

import tw.hanjee.insurance.insModel.InsBenefitRelation;

public interface IFinsBenefitRelationDao {

	List<InsBenefitRelation> getAllRelation();
	
	InsBenefitRelation getInsBenefitRelation(int id);
}
