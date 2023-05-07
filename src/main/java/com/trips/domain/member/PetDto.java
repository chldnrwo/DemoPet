package com.trips.domain.member;

import java.sql.Date;

import lombok.Data;

@Data
public class PetDto {
	private Long pet_id;
	private Long user_id;
	private Date birth;
	private String breed;
	private String name;
	private boolean neutering;
	private String pet_gender;
	private String size_type;
	private String pet_profile;
}
