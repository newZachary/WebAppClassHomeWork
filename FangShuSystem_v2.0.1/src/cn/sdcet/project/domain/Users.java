package cn.sdcet.project.domain;

import org.apache.commons.codec.digest.DigestUtils;

public class Users {
	private int id;
	private String loginid;
	private String pwd;
	
	public Users(){
		
	}

	public Users(int id, String loginid, String pwd) {
		this.id = id;
		this.loginid = loginid;
		this.pwd = pwd;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLoginid() {
		return loginid;
	}

	public void setLoginid(String loginid) {
		this.loginid = loginid;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		pwd=DigestUtils.md5Hex("villa"+pwd+"villa");
		this.pwd = pwd;
	}
	
	

}
