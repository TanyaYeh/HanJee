package tw.hanjee.insurance.insDao;

import java.util.List;

import tw.hanjee.insurance.insModel.InsLocationFee;

public interface IFinsLocationFeeDao {
	
	List<InsLocationFee> getAllLocation();
	
	InsLocationFee getInsLocationFee(int id);

}
