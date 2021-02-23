package tw.hanjee.insurance.insService.imp;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.hanjee.insurance.insDao.imp.InsBenefitRelationDao;
import tw.hanjee.insurance.insDao.imp.InsLocationFeeDao;
import tw.hanjee.insurance.insDao.imp.InsProfileDao;
import tw.hanjee.insurance.insModel.InsBenefitRelation;
import tw.hanjee.insurance.insModel.InsLocationFee;
import tw.hanjee.insurance.insModel.InsProfiles;
import tw.hanjee.insurance.insService.IFinsService;

@Transactional
@Service
public class insService implements IFinsService {

	@Autowired
	InsProfileDao insProfilesDao;
	@Autowired
	InsLocationFeeDao insLocationFeeDao;
	@Autowired
	InsBenefitRelationDao insBenefitRelationDao;

	@Override
	public void add(InsProfiles insp) {
		insProfilesDao.add(insp);
	}

	@Override
	public void update(InsProfiles insp) {
		insProfilesDao.update(insp);
	}

	@Override
	public void delete(int insId) {
		insProfilesDao.delete(insId);
	}

	@Override
	public InsProfiles query(int insId) {
		return insProfilesDao.query(insId);
	}

	//

	@Override
	public List<InsLocationFee> getAllLocationList() {
		return insLocationFeeDao.getAllLocation();
	}

	@Override
	public List<InsBenefitRelation> getAllRelationList() {
		return insBenefitRelationDao.getAllRelation();
	}

	@Override
	public InsBenefitRelation getInsBenefitRelation(int id) {
		return insBenefitRelationDao.getInsBenefitRelation(id);
	}

	@Override
	public InsLocationFee getInsLocationFee(int id) {
		return insLocationFeeDao.getInsLocationFee(id);
	}

	@Override
	public int countA() {
		return insProfilesDao.countA();

	}

	@Override
	public int countB() {
		return insProfilesDao.countB();
	}

	@Override
	public int countC() {
		return insProfilesDao.countC();
	}

	@Override
	public int countM() {
		return insProfilesDao.countM();
	}

	@Override
	public int countF() {
		return insProfilesDao.countF();
	}
}
