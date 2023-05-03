package com.trips.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.trips.domain.member.MemberDto;
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
		
		return memberMapper.insert(member);
	}
	
	public MemberDto getById(String id) {
		// TODO Auto-generated method stub
		return memberMapper.selectById(id);
	}
	
	public MemberDto getByEmail(String email) {
		// TODO Auto-generated method stub
		return memberMapper.selectByEmail(email);
	}
}