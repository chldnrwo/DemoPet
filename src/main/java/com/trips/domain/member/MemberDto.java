package com.trips.domain.member;

import java.sql.Date;

import lombok.Data;

@Data
public class MemberDto {
	private String email;
	private String nickname;
	private String password;
	private String name;
	private String gender;
	private String phone;
	private Date birth;
	private String city;
}