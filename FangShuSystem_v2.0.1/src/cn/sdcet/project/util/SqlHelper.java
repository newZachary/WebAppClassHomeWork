package cn.sdcet.project.util;

import java.sql.*;
import java.util.*;


public class SqlHelper {

	private static Connection conn = null;
	private static ResultSet resultset=null;
	private static PreparedStatement pStatement=null;

	private static final String duixiang = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private static final String dizhi = "jdbc:sqlserver://localhost:1433;databaseName=Villa";
	private static final String user = "sa";
	private static final String pass = "19960822";

	/**
	 * ������
	 * @return
	 */
	private static Connection getConnection(){
		try
		{
			//���ݿ�����
			Class.forName(duixiang);
			//���ݿ�Ķ�������
			return DriverManager.getConnection(dizhi,user,pass);
		}catch(Exception e){
			e.printStackTrace();
			throw new RuntimeException("�������ݿ�ʧ��");
		}
	}

	/***
	 * �ر�����
	 */
	public static void closeConnection(){
		try {
			if(resultset!=null){
				resultset.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("ResultSet�ر�ʧ��");
		}finally{
			resultset=null;
			try{
				if(pStatement!=null){
					pStatement.close();
				}
			}catch(Exception e){
				e.printStackTrace();
				throw new RuntimeException("PreparedStatement�ر�ʧ��");
			}finally{
				pStatement=null;
				try {
					if(conn!=null){
						conn.close();
					}
				} catch (SQLException e) {
					e.printStackTrace();
					throw new RuntimeException("Connection�ر�ʧ��");
				}finally{
					conn=null;
				}//finally conn end
			}//finally pStatement end
		}//finally resultset end
	} //method end

	/**
	 * ��ɶ����ݿ����ɾ�Ĳ���
	 * @param sql���
	 * @param �����ռλ����List����
	 * @return SQL���ִ�гɹ�����true,���򷵻�false
	 * @throws SQLException
	 */
	public static boolean Execute(String sql,List<Object>params) 
	{
		int result = -1;//����Ϊ
		try {
			conn=getConnection();
			pStatement = conn.prepareStatement(sql);
			//���ռλ��
			int index = 1; //�ӵ�һ����ʼ���
			if(params != null && !params.isEmpty())
			{
				for(int i = 0;i<params.size();i++)
				{
					pStatement.setObject(index++,params.get(i));//���ռλ��
				}
			}
			result = pStatement.executeUpdate();//ִ�гɹ������ش���0����
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			closeConnection();
		}	
		return  result>-1 ? true : false;
	}

	
	    



	/**
	 * ���ݿ��ѯ���������ص�����¼
	 * @param sql
	 * @param params
	 * @param sql���
	 * @param �����ռλ��
	 * @return ����Map�������ͣ�������ѯ�Ľ��
	 * @throws SQLException
	 */
	public static Map<String,Object> returnSimpleResult(String sql,List<Object> params)
	{
		Map<String, Object> map = new HashMap<String, Object>();
		int index = 1;//��1��ʼ����ռλ��
		try {
			conn=getConnection();
			//System.out.print("���ӳɹ�");
			pStatement = conn.prepareStatement(sql);
			if(params != null && !params.isEmpty()) /*�жϲ����Ƿ�Ϊ��*/
			{ 
				for(int i = 0;i<params.size();i++) /*ѭ�����ռλ��*/
				{
					//System.out.println(conn);
					pStatement.setString(index++, params.get(i).toString());
				}
			}
			//resultset = pStatement.executeQuery(sql);
			resultset = pStatement.executeQuery();
			/*  ����ѯ�����װ��map����*/
			ResultSetMetaData metaDate = resultset.getMetaData();//��ȡresultSet�е���Ϣ
			int columnLength = metaDate.getColumnCount();//����еĳ���
			while(resultset.next())
			{
				for(int i = 0;i<columnLength;i++)
				{
					String metaDateKey = metaDate.getColumnName(i+1);//�������
					Object resultsetValue = resultset.getObject(metaDateKey);//ͨ���������ֵ

					if(resultsetValue == null)
					{
						resultsetValue = "";//ת��String����
					}
					map.put(metaDateKey, resultsetValue);//��ӵ�map���ϣ����ϴ�����Ϊ�˽������ݿⷵ�ص�ֵת����map��key��value��
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeConnection();
		}
		return map;
	}
	
	/**
	 * ��ѯ���ݿ⣬���ض�����¼
	 * @param sql
	 * @param params
	 * @param sql���
	 * @param ռλ��
	 * @return list���ϣ�������ѯ�Ľ��
	 * @throws SQLException 
	 */
	public static List<Map<String,Object>> returnMultipleResult(String sql,List<Object> params) 
	{
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		//���ռλ��
		int index = 1;
		try {
			conn=getConnection();
			pStatement = conn.prepareStatement(sql);
		
		if(params != null && !params.isEmpty())
		{
			for(int i = 0;i<params.size();i++)
			{
				pStatement.setObject(index++, params.get(i));
			}
		}
		//ִ��SQL���
		resultset = pStatement.executeQuery();
		//��װresultset��map����
		ResultSetMetaData metaDate = resultset.getMetaData();//��ȡ����Ϣ,����metaDate
		int columnlength = metaDate.getColumnCount();
		while(resultset.next())
		{
			Map<String, Object> map = new HashMap<String, Object>();
			for(int i = 0;i<columnlength;i++)
			{
				String metaDateKey = metaDate.getColumnName(i+1);//��ȡ����
				Object resultsetValue = resultset.getObject(metaDateKey);
				if(resultsetValue == null)
				{
					resultsetValue = "";
				}
				map.put(metaDateKey, resultsetValue);
			}
			list.add(map);
		}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeConnection();	
		}
		return list;
	}

}


