package tw.hanjee.product.model;

public class shoppingcart {

	private String id;
	private Integer no;
	private String type;
	private String name;
	private Integer ord_qui;
	private Double pro_amount;

	public shoppingcart() {
	}

	///產品編號
	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
	}

	public Integer getOrd_qui() {
		return ord_qui;
	}

	public void setOrd_qui(Integer ord_qui) {
		this.ord_qui = ord_qui;
	}

	public Double getPro_amount() {
		return pro_amount;
	}

	public void setPro_amount(Double pro_amount) {
		this.pro_amount = pro_amount;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}
