package jdbc;

public class GoodsDO {

	String prod_no;
	String prod_name;
	String prod_content;
	Integer onhand_qty;
	Integer prod_price;
	Integer off_price;
	String prod_category;
	String useyn;

	public String getProd_no() {
		return prod_no;
	}

	public void setProd_no(String prod_no) {
		this.prod_no = prod_no;
	}

	public String getProd_name() {
		return prod_name;
	}

	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}

	public String getProd_content() {
		return prod_content;
	}

	public void setProd_content(String prod_content) {
		this.prod_content = prod_content;
	}

	public Integer getOnhand_qty() {
		return onhand_qty;
	}

	public void setOnhand_qty(Integer onhand_qty) {
		this.onhand_qty = onhand_qty;
	}

	public Integer getProd_price() {
		return prod_price;
	}

	public void setProd_price(Integer prod_price) {
		this.prod_price = prod_price;
	}

	public Integer getOff_price() {
		return off_price;
	}

	public void setOff_price(Integer off_price) {
		this.off_price = off_price;
	}

	public String getProd_category() {
		return prod_category;
	}

	public void setProd_category(String prod_category) {
		this.prod_category = prod_category;
	}

	public String getUseyn() {
		return useyn;
	}

	public void setUseyn(String useyn) {
		this.useyn = useyn;
	}

}
