package cn.sdcet.project.domain;

public class Picture {
	private int id;
	private House houseid;
	private String picaddress;
	
	public Picture(){
		
	}

	public Picture(int id, House houseid, String picaddress) {
		this.id = id;
		this.houseid = houseid;
		this.picaddress = picaddress;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public House getHouseId() {
		return houseid;
	}

	public void setHouseId(House houseId) {
		this.houseid = houseId;
	}

	public String getPicaddress() {
		return picaddress;
	}

	public void setPicaddress(String picaddress) {
		this.picaddress = picaddress;
	}
	
	

}
