package cn.sdcet.project.service;
import cn.sdcet.project.dao.ConfDao;
import cn.sdcet.project.dao.jdbc.ConfDaoImpl;;;
public class ConfService {

	public void updVisitCount() {
		ConfDao conf=new ConfDaoImpl();
		conf.updVisitCount();
	}
	public int getVisitCountOfToday() {
		ConfDao conf=new ConfDaoImpl();
		return conf.getVisitCountOfToday();
	}
}
