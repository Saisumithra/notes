package com.example.demo.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.demo.model.CheckInAndCheckOut;

public interface CheckInAndCheckOutRepo extends JpaRepository<CheckInAndCheckOut, Long> {
	
	@Query("from CheckInAndCheckOut where  checkout_dt IS  NULL AND  vehicleRegId=?1")
	public CheckInAndCheckOut findByVehicleRegId(String regId);
	
	@Query("from CheckInAndCheckOut where mallId=?1")
	public List<CheckInAndCheckOut> findAllByMallId(String mallId);

	@Query("from CheckInAndCheckOut where parkingLevel=?1 and slot=?2")
	public CheckInAndCheckOut getParkingLevelAndSlot(int parkingLevel, int slot);
}
 