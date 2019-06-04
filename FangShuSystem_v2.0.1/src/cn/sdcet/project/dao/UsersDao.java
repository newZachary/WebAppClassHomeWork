package cn.sdcet.project.dao;


import cn.sdcet.project.domain.*;

public interface UsersDao {
	
	/**
	 * ����½
	 * @return �Ƿ��û���¼���������Ƿ�ƥ��
	 */
	public boolean CheckPwdAndLoginId(Users user);
	
	/**
	 * ����Ƿ���û����Ƿ����
	 * @param loginId ���û�������û����Ƿ����
	 * @return ���ڷ�����
	 */
	public boolean isExist(String loginId);
	
	/**
	 * �޸��û�����
	 * @param user
	 * @return �Ƿ��޸ĳɹ�
	 */
	public  boolean updPWD(Users user);
	
	
	/**
	 * ���һ���û�
	 * @return  ���û����
	 */
	public boolean insertUser(Users user);
	
	/**
	 * ��ȡ�ող�����û��ı�ţ�id��
	 * @param loginid �û���¼��
	 * @return �û���ţ�id��
	 */
	public int getNewUserId(String loginid);
	
}
