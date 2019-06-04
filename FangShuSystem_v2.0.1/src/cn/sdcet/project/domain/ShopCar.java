package cn.sdcet.project.domain;

public class ShopCar {
	private int id;
	private Users user;
	private House house;
	
	public ShopCar(){
		
	}

	public ShopCar(int id, Users user, House house , int check) {
		this.id = id;
		this.user = user;
		this.house = house;
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public House getHouse() {
		return house;
	}

	public void setHouse(House house) {
		this.house = house;
	}
	


}
