package tw.hanjee.order.dao;

import java.util.List;

import tw.hanjee.order.model.Iv;

public interface IvDao {
	public void insertIv(Iv iv);
	public List<Iv> selectByIvNumber(String iv_number);
	public List<Iv> selectByIvNO(Integer iv_no);
	public void updatePro_no(Integer iv_no,Integer ord_no);
}
