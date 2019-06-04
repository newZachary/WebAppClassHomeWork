package cn.sdcet.project.domain;

public class House {
	private int id;
	private String h_address;
	private int area;
	private double price;
	private String housetype;
	private String name; 
	private String onePicAdd;
	private String flag;
	private int fineFlag;
	private double visitCount;
	private double orderCount;
	
	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getOnePicAdd() {
		return onePicAdd;
	}

	public void setOnePicAdd(String onePicAdd) {
		this.onePicAdd = onePicAdd;
	}

	public House(){
		
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getH_address() {
		return h_address;
	}

	public void setH_address(String h_address) {
		this.h_address = h_address;
	}

	

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getHousetype() {
		return housetype;
	}

	public void setHousetype(String housetype) {
		this.housetype = housetype;
	}

	public int getArea() {
		return area;
	}

	public void setArea(int area) {
		this.area = area;
	}
	public int getFineFlag() {
		return fineFlag;
	}

	public void setFineFlag(int fineFlag) {
		this.fineFlag = fineFlag;
	}

	public double getVisitCount() {
		return visitCount;
	}

	public void setVisitCount(double visitCount) {
		this.visitCount = visitCount;
	}

	public double getOrderCount() {
		return orderCount;
	}

	public void setOrderCount(double orderCount) {
		this.orderCount = orderCount;
	}
	public House(int id, String h_address, int area, double price,
			String housetype, String name,String flag) {
		super();
		this.id = id;
		this.h_address = h_address;
		this.area = area;
		this.price = price;
		this.housetype = housetype;
		this.name = name;
		this.flag=flag;
	}


}
