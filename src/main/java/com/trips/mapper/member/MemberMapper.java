package com.trips.mapper.member;

import java.util.List;

import com.trips.domain.member.MemberDto;
import com.trips.domain.member.MemberDtoAddRole;
import com.trips.domain.member.PetDto;

public interface MemberMapper {

	int insert(MemberDto member);
	
	MemberDtoAddRole selectByEmail(String email);

	MemberDtoAddRole selectByNickName(String nickName);

	int deleteById(String id);

	List<PetDto> getPetListById(Long user_id);

	int update(MemberDtoAddRole member);
}