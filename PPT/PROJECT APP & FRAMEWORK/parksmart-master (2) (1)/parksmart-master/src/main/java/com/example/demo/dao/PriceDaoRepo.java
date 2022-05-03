package com.example.demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.demo.model.VehiclePrice;

public interface PriceDaoRepo extends JpaRepository<VehiclePrice, Long>{
	
	public VehiclePrice findByVehicleName(String vehicleName);
	
	@Query("from VehiclePrice where  vehicle_name = ?1")
	public VehiclePrice getPriceOfVehicle(String vehicleName);

}
