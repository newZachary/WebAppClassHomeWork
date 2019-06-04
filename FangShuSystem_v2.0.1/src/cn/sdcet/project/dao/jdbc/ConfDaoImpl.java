package cn.sdcet.project.dao.jdbc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.sdcet.project.dao.ConfDao;
import cn.sdcet.project.domain.HouseDetailInfo;
import cn.sdcet.project.util.SqlHelper;

public class ConfDaoImpl implements ConfDao {

	public void updVisitCount() {
		// TODO Auto-generated method stub
		
			// TODO Auto-generated method stub
			String sql="update visitRecord set visitnum=visitnum+1 where dates=CONVERT(varchar(10), GETDATE(), 23);";
			if(!SqlHelper.Execute(sql, null))
			{
				System.out.print("ÐÞ¸ÄÊ§°Ü");
			}
			
			
			
		}

		@Override
		public int getVisitCountOfToday() {
			// TODO Auto-generated method stub
			String sql="select VISITNUM from visitRecord  where dates=CONVERT(varchar(10), GETDATE(), 23);";
			Map<String, Object> map = new HashMap<String, Object>(); 
			map=SqlHelper.returnSimpleResult(sql, null);
			if(map.size()>0){
				return Integer.parseInt( map.get("VISITNUM").toString());
			}
			return 0;
		}
	}


