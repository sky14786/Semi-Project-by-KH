package com.truckta.mypage.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

public class MyPageScheduleDao {
	Properties prop = new Properties();

	public MyPageScheduleDao() {
		String path = getClass().getResource("/").getPath() + "sql/boardmatching/boardmatching-query.properties";
		try {
			prop.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}







