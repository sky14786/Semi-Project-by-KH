package com.truckta.model.vo;

import java.util.Date;

public class Notice {
	
	/* 트럭타 화물 요청 게시글 모델 */
//	  notice_num number PRIMARY KEY,
//    client_id VARCHAR2(30),
//    title VARCHAR2(50) not null,
//    start_addr VARCHAR2(50) not null,
//    end_addr VARCHAR2(50) not null,
//    etc VARCHAR2(2000),
//    stuff_size VARCHAR2(15) default ('0x0x0'),
//    memo varchar2(80),
//    here_date DATE default sysdate,
//    notice_state number default (1),
//    notice_count number,
//    pic1 VARCHAR2(50),
//    pic2 VARCHAR2(50),
//    pic3 VARCHAR2(50),
//    pic4 VARCHAR2(50),
//    pic5 VARCHAR2(50)
	
	private int noticeNum;
	private String clientId;
	private String title;
	private String startAddr;
	private String endAddr;
	private String etc;
	private String stuffSize;
	private String memo;
	private Date hereDate;
	private int noticeState;
	private int noticeCount;
	private String pic1;
	private String pic2;
	private String pic3;
	private String pic4;
	private String pic5;
	
	public Notice() {
		// TODO Auto-generated constructor stub
	}

	
	

}
