package tw.hanjee.order.model;

import java.util.ArrayList;

import tw.hanjee.product.model.shoppingcart;

public class OrderDetail {
	private String recipient;
	private String recipient_phone;
	private String recipient_address;
	private String iv_number;
	private ArrayList<shoppingcart> products;

	public OrderDetail() {

	}

	public String getRecipient() {
		return recipient;
	}

	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}

	public String getRecipient_phone() {
		return recipient_phone;
	}

	public void setRecipient_phone(String recipient_phone) {
		this.recipient_phone = recipient_phone;
	}

	public String getRecipient_address() {
		return recipient_address;
	}

	public void setRecipient_address(String recipient_address) {
		this.recipient_address = recipient_address;
	}

	public ArrayList<shoppingcart> getProducts() {
		return products;
	}

	public void setProducts(ArrayList<shoppingcart> products) {
		this.products = products;
	}

	public String getIv_number() {
		return iv_number;
	}

	public void setIv_number(String iv_number) {
		this.iv_number = iv_number;
	}

}
