package com.trips.service.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.trips.domain.member.MemberDto;
import com.trips.domain.member.MemberDtoAddRole;
import com.trips.domain.member.PetDto;
import com.trips.mapper.member.MemberMapper;


@Service
@Transactional
public class MemberService {

	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	
	public int insert(MemberDto member) {
		
		String pw = member.getPassword();
		member.setPassword(passwordEncoder.encode(pw));
		System.out.println("service : "+member);
		return memberMapper.insert(member);
	}
	
	public MemberDtoAddRole getByEmail(String email) {
		// TODO Auto-generated method stub
		return memberMapper.selectByEmail(email);
	}

	public MemberDtoAddRole getByNickName(String nickName) {
		// TODO Auto-generated method stub
		return memberMapper.selectByNickName(nickName);
	}

	public int remove(String id) {
		// TODO Auto-generated method stub
		return memberMapper.deleteById(id);
	}

	public List<PetDto> getPetListById(Long user_id) {
		// TODO Auto-generated method stub
		return memberMapper.getPetListById(user_id);
	}
}