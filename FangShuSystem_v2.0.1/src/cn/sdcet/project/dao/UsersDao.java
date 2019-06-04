package cn.sdcet.project.dao;


import cn.sdcet.project.domain.*;

public interface UsersDao {
	
	/**
	 * 检测登陆
	 * @return 是否用户登录名和密码是否匹配
	 */
	public boolean CheckPwdAndLoginId(Users user);
	
	/**
	 * 检测是否该用户名是否存在
	 * @param loginId 新用户输入的用户名是否存在
	 * @return 存在返回真
	 */
	public boolean isExist(String loginId);
	
	/**
	 * 修改用户密码
	 * @param user
	 * @return 是否修改成功
	 */
	public  boolean updPWD(Users user);
	
	
	/**
	 * 添加一个用户
	 * @return  该用户编号
	 */
	public boolean insertUser(Users user);
	
	/**
	 * 获取刚刚插入的用户的编号（id）
	 * @param loginid 用户登录名
	 * @return 用户编号（id）
	 */
	public int getNewUserId(String loginid);
	
}
