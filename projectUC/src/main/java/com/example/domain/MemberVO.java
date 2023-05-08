package com.example.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {

	private String id;
	private String m_name;
	private String password;
	private String gender;
	private String phone;
	private String region;
	private String email;
	private String author;
	private Date regdate;
	private Long report_num;
}