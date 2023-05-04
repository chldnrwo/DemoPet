package com.trips.mapper.member;

import com.trips.domain.member.MemberDto;
import com.trips.domain.member.MemberDtoAddRole;

public interface MemberMapper {

	int insert(MemberDto member);
	
	MemberDtoAddRole selectByEmail(String email);

	MemberDtoAddRole selectByNickName(String nickName);
}