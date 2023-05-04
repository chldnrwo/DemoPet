package com.trips.security;

import java.util.ArrayList;
//import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import com.trips.domain.jjhMember.jjhMemberDto;
import com.trips.domain.member.MemberDtoAddRole;
import com.trips.mapper.jjhMember.jjhMemberMapper;
import com.trips.mapper.member.MemberMapper;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class CustomUserDetailsService implements UserDetailsService {
	
	//@Autowired 
	private final PasswordEncoder passwordEncoder;
	 
	//@Autowired
	private final MemberMapper mapper;
	

	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		
		MemberDtoAddRole member = mapper.selectByEmail(email);

		if (member == null)	return null;
		
		List<SimpleGrantedAuthority> list = new ArrayList<>();
		if(member.getUser_role()!=null) {
			list.add(new SimpleGrantedAuthority(member.getUser_role()));
		}	
		User user = new User(member.getEmail(), member.getPassword(),list);
		 
		return user;
	}

}
