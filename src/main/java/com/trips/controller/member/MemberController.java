package com.trips.controller.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.trips.domain.member.MemberDto;
import com.trips.domain.member.MemberDtoAddRole;
import com.trips.domain.member.PetDto;
import com.trips.service.member.MemberService;


@Controller
@RequestMapping("member")
public class MemberController {

	@Autowired
	private MemberService service;
	
	@PostMapping("petProfile")
	public String signup(
			PetDto pet,
			MultipartFile file,
			RedirectAttributes rttr
			) {
		
		int cnt = service.insertPet(pet, file);
		return "redirect:/member/mypage";
	}
	
	@GetMapping("petProfile")
	public void petProfile(
			@AuthenticationPrincipal User user,
			Model model
			) {
		MemberDtoAddRole m = service.getByEmail(user.getUsername());
		model.addAttribute("member", m);
	}
	
	@PostMapping("profile")
	public String profile2(
			MemberDtoAddRole member,
			MultipartFile file,
			RedirectAttributes rttr
			) {
		//버킷에 있는 기존 이미지 삭제
		//새로운 이미지 업데이트
		System.out.println(member);
		int cnt = service.updateProfile(member, file, member.getUser_profile());
		return "redirect:/member/profile";
	}
	
	@GetMapping("profile")
	public void profile(
			@AuthenticationPrincipal User user,
			Model model
			) {
		MemberDtoAddRole m = service.getByEmail(user.getUsername());
		model.addAttribute("member", m);
	}
	
	@GetMapping("update")
	public void update(
			@AuthenticationPrincipal User user,
			Model model
			) {
		MemberDtoAddRole m = service.getByEmail(user.getUsername());
		model.addAttribute("member", m);
	}
	
	@PostMapping("update")
	public String update(MemberDtoAddRole member, RedirectAttributes rttr) {
		int cnt = service.update(member);
		System.out.println(cnt);
		//가입 잘되면 
		rttr.addFlashAttribute("message", "회원가입 되었습니다."); 
		return "redirect:/member/mypage";

	}
	
	@PostMapping("remove")
	public String remove(String id, 
			HttpServletRequest request)
			throws Exception {
		System.out.println(id);
		int cnt = service.remove(id);
		request.logout();

		return "redirect:/main2";
	}
	
	@GetMapping("mypage")
	public void mypage(
			@AuthenticationPrincipal User user,
			Model model
			) {
		MemberDtoAddRole m = service.getByEmail(user.getUsername());
		List<PetDto> pet = service.getPetListById(m.getUser_id());
		
		model.addAttribute("member", m);
		model.addAttribute("pet", pet);
		
	}
	
	@GetMapping("sample")
	public void sample() {
		
	}
	
	@GetMapping("jusoPopup")
	public void jusoPopup() {
		
	}
	@PostMapping("jusoPopup")
	public void jusoPopup2() {
		
	}
	
	@GetMapping("index")
	public void index() {
		
	}
	
	@GetMapping("login")
	public void login() {

	}
	
	
	@GetMapping("signup")
	public void signup() {
		
	}
	
	
	@PostMapping("signup")
	public String signup(MemberDto member, RedirectAttributes rttr) {
		System.out.println(member);
		  
		int cnt = service.insert(member);
		  
		//가입 잘되면 
		rttr.addFlashAttribute("message", "회원가입 되었습니다."); 
		return "redirect:/member/login";

	}
	
	// 이메일 중복 확인
	@PostMapping("existEmail")
	@ResponseBody
	public Map<String, Object> existEmail(@RequestBody Map<String, String> req) {

		Map<String, Object> map = new HashMap<>();

		MemberDtoAddRole member = service.getByEmail(req.get("email"));

		if (member == null) {
			map.put("status", "not exist");
			map.put("message", "사용가능한 이메일입니다.");
		} else {
			map.put("status", "exist");
			map.put("message", "이미 존재하는 이메일입니다.");
		}

		return map;
	}
	@PostMapping("existNickName")
	@ResponseBody
	public Map<String, Object> existNickName(@RequestBody Map<String, String> req) {

		Map<String, Object> map = new HashMap<>();

		MemberDtoAddRole member = service.getByNickName(req.get("nickName"));
		System.out.println(req.get("nickName"));
		System.out.println(member);
		
		if (member == null) {
			map.put("status", "not exist");
			map.put("message", "사용가능한 닉네임입니다.");
		} else {
			map.put("status", "exist");
			map.put("message", "이미 존재하는 닉네임입니다.");
		}

		return map;
	}
	@PostMapping("existNickName2")
	@ResponseBody
	public Map<String, Object> existNickName2(@RequestBody Map<String, String> req) {

		Map<String, Object> map = new HashMap<>();

		MemberDtoAddRole member = service.getByNickName(req.get("nickName"));
		System.out.println(req.get("nickName"));
		System.out.println(member);
		
		if (member == null) {
			map.put("status", "not exist");
			map.put("message", "사용가능한 닉네임입니다.");
		} else if(req.get("nickName").equals(member.getNickname())) {
			map.put("status", "not exist");
			map.put("message", "기존 닉네임으로 사용가능합니다.");
		} else {
			map.put("status", "exist");
			map.put("message", "이미 존재하는 닉네임입니다.");
		}

		return map;
	}
	
	
	@GetMapping("accessDenied")
	public void accesDenied() {
		
	}
}
