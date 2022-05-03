package com.example.demo.dao;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.demo.model.Mall;



public interface MallDaoRepo extends JpaRepository<Mall, Long> {

	
	@Query("from Mall where mall_id =?1")
	Mall findByMallId(Long mallId);


}
