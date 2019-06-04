package cn.sdcet.project.domain;

public class UserInfo {
	private int id;
	private Users user;
	private int gender;
	private String head;
	private String name;
	private String contact;
	private String cardid;
	private String email;
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
		
	}

	public UserInfo(){
		
	}

	public UserInfo(int id, Users user, int gender, String head, String name,String email,
			String contact, String cardid) {
		this.id = id;
		this.user = user;
		this.gender = gender;
		this.head = head;
		this.name = name;
		this.contact = contact;
		this.cardid = cardid;
		this.email=email;
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

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getHead() {
		return head;
	}

	public void setHead(String head) {
		this.head = head;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getCardid() {
		return cardid;
	}

	public void setCardid(String cardid) {
		this.cardid = cardid;
	}
	
	

}
