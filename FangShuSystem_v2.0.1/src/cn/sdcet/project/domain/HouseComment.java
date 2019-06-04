package cn.sdcet.project.domain;

import java.util.Date;

public class HouseComment {
private int id;
private House house;
private Users user;
private String comment;
private Date time;
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
public String getComment() {
	return comment;
}
public void setComment(String comment) {
	this.comment = comment;
}
public Date getTime() {
	return time;
}
public void setTime(Date time) {
	this.time = time;
}
public HouseComment(int id, House house, Users user, String comment, Date time) {
	super();
	this.id = id;
	this.house = house;
	this.user = user;
	this.comment = comment;
	this.time = time;
}
public HouseComment() {
	
}

}
