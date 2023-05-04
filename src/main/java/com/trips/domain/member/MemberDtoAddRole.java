package com.trips.domain.member;

import java.sql.Date;

import lombok.Data;

@Data
public class MemberDtoAddRole {
	private String email;
	private String nickname;
	private String password;
	private String user_name;
	private String gender;
	private String phone;
	private Date birth;
	private String city;
	private String location;
	private String user_role;
}