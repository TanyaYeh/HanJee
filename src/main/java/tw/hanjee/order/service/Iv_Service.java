package tw.hanjee.order.service;

import java.util.List;

import tw.hanjee.order.model.Iv;

public interface Iv_Service {
	public void insertIv(Iv iv);
	public List<Iv> selectByIvNumber(String iv_number);
	public List<Iv> selectByIvNO(Integer iv_no);
	public void updatePro_no(Integer iv_no,Integer ord_no);

}
