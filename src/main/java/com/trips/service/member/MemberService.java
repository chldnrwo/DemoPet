package com.trips.service.member;

import java.sql.Date;
import java.time.LocalDate;
import java.time.Period;
import java.time.ZoneId;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.trips.domain.member.MemberDto;
import com.trips.domain.member.MemberDtoAddRole;
import com.trips.domain.member.PetDto;
import com.trips.mapper.member.MemberMapper;

import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.DeleteObjectRequest;
import software.amazon.awssdk.services.s3.model.ObjectCannedACL;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;


@Service
@Transactional
public class MemberService {

	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private S3Client s3Client;

	@Value("${aws.s3.bucket}")
	private String bucketName;
	
	
	public int insert(MemberDto member) {
		
		String pw = member.getPassword();
		member.setPassword(passwordEncoder.encode(pw));
		
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
		
		List<PetDto> petList = memberMapper.getPetListById(user_id); 
		for(PetDto p : petList) {
			LocalDate birth = p.getBirth().toLocalDate();
			LocalDate now = LocalDate.now();
			
			Period period = Period.between(birth, now);
			p.setAge(period.getYears());
		}
		
		return petList;
	}

	public int update(MemberDtoAddRole member) {
		String pw = member.getPassword();
		member.setPassword(passwordEncoder.encode(pw));
		
		return memberMapper.update(member);
	}
	private void uploadFile(MultipartFile file, String folder) {
		try {
			// S3에 파일 저장
			// 키 생성
			String key = folder + file.getOriginalFilename();

			// putObjectRequest
			PutObjectRequest putObjectRequest = PutObjectRequest.builder().bucket(bucketName).key(key)
					.acl(ObjectCannedACL.PUBLIC_READ).build();

			// requestBody
			RequestBody requestBody = RequestBody.fromInputStream(file.getInputStream(), file.getSize());

			// object(파일) 올리기
			s3Client.putObject(putObjectRequest, requestBody);

		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
	public int updateProfile(MemberDtoAddRole member, MultipartFile file, String legacyFileName) {
		if (file != null && file.getSize() > 0) {
			member.setUser_profile(file.getOriginalFilename());
			uploadFile(file, "moigae/mypage/"+member.getUser_id()+ "/");
			deleteFile(member.getUser_id(), legacyFileName);
		}
		return memberMapper.updateProfile(member);
	}
	
	private void deleteFile(Long id, String fileName) {
		String key = "moigae/mypage/" + id + "/" + fileName;
		DeleteObjectRequest deleteObjectRequest = DeleteObjectRequest.builder()
				.bucket(bucketName)
				.key(key)
				.build();
		s3Client.deleteObject(deleteObjectRequest);
	}

	public int insertPet(PetDto pet, MultipartFile file) {
		if (file != null && file.getSize() > 0) {
			pet.setPet_profile(file.getOriginalFilename());
			uploadFile(file, "moigae/mypage/"+pet.getUser_id()+ "/");
		}
		return memberMapper.insertPet(pet);
	}
}