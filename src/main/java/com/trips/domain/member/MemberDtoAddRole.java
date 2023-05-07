package com.trips.domain.member;

import java.sql.Date;

import lombok.Data;

@Data
public class MemberDtoAddRole {
	private Long user_id;
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
	private String self_introduction;
	private String user_profile;
}