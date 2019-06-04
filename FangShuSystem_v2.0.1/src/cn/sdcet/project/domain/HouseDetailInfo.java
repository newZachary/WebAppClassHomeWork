package cn.sdcet.project.domain;

import java.util.List;

public class HouseDetailInfo {
	private int id;
	private String h_addressdel;
	private double fristpay;
	private UserInfo agent;
	private String time;
	private House house;
	private List<String> pictures;
	public List<String> getPictures() {
		return pictures;
	}
	
	public void setPictures(List<String> pictures) {
		this.pictures = pictures;
	}
	public HouseDetailInfo() {
		super();
	}
	public HouseDetailInfo(int id, String h_addressdel, double fristpay,
			UserInfo agent, String time, House house, String corepoint,
			String describe, String resfac, String serviceintro,
			String decdeg) {
		super();
		this.id = id;
		this.h_addressdel = h_addressdel;
		this.fristpay = fristpay;
		this.agent = agent;
		this.time = time;
		this.house = house;
		this.corepoint = corepoint;
		this.describe = describe;
		this.resfac = resfac;
		this.serviceintro = serviceintro;
		this.decdeg = decdeg;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getH_addressdel() {
		return h_addressdel;
	}
	public void setH_addressdel(String h_addressdel) {
		this.h_addressdel = h_addressdel;
	}
	public double getFristpay() {
		return fristpay;
	}
	public void setFristpay(double fristpay) {
		this.fristpay = fristpay;
	}
	public UserInfo getAgent() {
		return agent;
	}
	public void setAgent(UserInfo agent) {
		this.agent = agent;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public House getHouse() {
		return house;
	}
	public void setHouse(House house) {
		this.house = house;
	}
	public String getCorepoint() {
		return corepoint;
	}
	public void setCorepoint(String corepoint) {
		this.corepoint = corepoint;
	}
	public String getDescribe() {
		return describe;
	}
	public void setDescribe(String describe) {
		this.describe = describe;
	}
	public String getResfac() {
		return resfac;
	}
	public void setResfac(String resfac) {
		this.resfac = resfac;
	}
	public String getServiceintro() {
		return serviceintro;
	}
	public void setServiceintro(String serviceintro) {
		this.serviceintro = serviceintro;
	}
	public String getDecdeg() {
		return decdeg;
	}
	public void setDecdeg(String decdeg) {
		this.decdeg = decdeg;
	}
	private String corepoint;
	private String describe;
	private String resfac;
	private String serviceintro;
	private String decdeg;
}
