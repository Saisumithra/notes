package com.example.demo.dao;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.model.User;


public interface daoUserRepository extends JpaRepository<User, Long> {


	
	
	List<User> findByRole(String role);
	User findByEmail(String email);

}
