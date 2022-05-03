/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.demo.dao;

import com.example.demo.model.Vehicle;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


public interface DaoRepository extends JpaRepository<Vehicle, Long> {

//    List<User> findByAname(String aname);

	@Query("from Vehicle where regId=?1 and mall_id=?2")
	Vehicle findByRegIdAndMallId(String regId, String mallId);

	@Query("from Vehicle where mall_id = ?1")
	public List<Vehicle> findAllByMallId(String mallId);

}
