package cn.sdcet.project.domain;

public class AgentInfo {
	
	private int id;
	private Users agentId;
	private String head;
	private int thumbCount;
	private int houseCount;
	private String name;
	private String contact;
	
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getHouseCount() {
		return houseCount;
	}
	public void setHouseCount(int houseCount) {
		this.houseCount = houseCount;
	}
	public String getHead() {
		return head;
	}
	public void setHead(String head) {
		this.head = head;
	}

	
	public int getThumbCount() {
		return thumbCount;
	}
	public void setThumbCount(int thumbCount) {
		this.thumbCount = thumbCount;
	}

	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	
	public Users getAgentId() {
		return agentId;
	}
	public void setAgentId(Users agentId) {
		this.agentId = agentId;
	}
	
	
	public AgentInfo(){
			
	}
	public AgentInfo(int id, Users agentId) {
		this.id = id;
		this.agentId = agentId;
	}

}
