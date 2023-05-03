package com.trips.mapper.member;

import com.trips.domain.member.MemberDto;

public interface MemberMapper {

	int insert(MemberDto member);

	MemberDto selectById(String id);
	
	MemberDto selectByEmail(String email);
}