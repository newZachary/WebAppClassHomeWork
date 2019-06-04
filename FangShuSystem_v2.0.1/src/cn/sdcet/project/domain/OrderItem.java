package cn.sdcet.project.domain;

public class OrderItem {

	private int id;
	private House house;
	private Users user;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public House getHouse() {
		return house;
	}
	public void setHouse(House house) {
		this.house = house;
	}
	public Users getUser() {
		return user;
	}
	public void setUser(Users user) {
		this.user = user;
	}
	public OrderItem(int id, House house, Users user) {
		super();
		this.id = id;
		this.house = house;
		this.user = user;
	}
	public OrderItem() {
		
	}
	
}
