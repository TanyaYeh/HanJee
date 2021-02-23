package tw.hanjee.insurance.insDao;

import tw.hanjee.insurance.insModel.InsProfiles;

public interface IFinsProfileDao {
	
	void add(InsProfiles insp);
	
	void update(InsProfiles insp);
	
	void delete(int insId);
	
	InsProfiles query(int insId);
	
	int countA();
	
	int countB();
	
	int countC();
	
	int countM();
	
	int countF();
}
