/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.demo.services;

import com.example.demo.dao.CheckInAndCheckOutRepo;
import com.example.demo.dao.DaoRepository;
import com.example.demo.dao.MallDaoRepo;
import com.example.demo.dao.PriceDaoRepo;
import com.example.demo.dao.daoUserRepository;
import com.example.demo.model.CheckInAndCheckOut;
import com.example.demo.model.Mall;
import com.example.demo.model.User;
import com.example.demo.model.Vehicle;
import com.example.demo.model.VehiclePrice;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Service;

/**
 *
 * @author Sumithra
 */
@Service
public class DemoServiceImplementation implements DemoService {

	@Autowired
	DaoRepository repo;
	@Autowired
	daoUserRepository userRepo;
	
	@Autowired
	MallDaoRepo mallRepo;
	
	@Autowired
	PriceDaoRepo priceDaoRepo;
	
	@Autowired
	CheckInAndCheckOutRepo checkinandcheckoutrepo;
	


	
	
	

	@Override
	public Vehicle registerVehicle(Vehicle vehicle) {
		return repo.save(vehicle);
	}


	
	@Override
	public User addAdmin(User user) {
		return userRepo.save(user);
	}

	@Override
	public String checkUser(String email, String password, String role) {

		User user = userRepo.findByEmail(email);
		if (user == null || !user.getRole().equals(role)) {
			return "User does not exist.*";
		}
		if (!user.getPassword().equals(password)) {
			return "Password worng.*";
		}
		return "true";

	}

	
	
	 @EventListener
	    public  void appReady(ApplicationReadyEvent event) {
	    	User user = new User();
	    	user.setEmail("superadmin@admin.in");
	    	user.setPassword("superadmin");
	    	user.setRole("superadmin");
	    	if(!checkUser(user.getEmail(), user.getPassword(), user.getRole()).equals("true")){
	    		userRepo.save(user);
	    	}
	    }
	 
	@Override
	public Mall saveMallRegistration(Mall mall) {
		return mallRepo.save(mall);
	}
	
	@Override
	public VehiclePrice priceUpdation(VehiclePrice vehiclePrice) {
		return priceDaoRepo.save(vehiclePrice);
	}

	@Override
	public List<Mall> getAllMallDeatails() {
		
		return mallRepo.findAll();
	}


	@Override
	public List<User> getUsersByRole(String role) {
		return  userRepo.findByRole(role);
	}
	

	@Override
	public VehiclePrice findByVehicleName(String vehicleName) {
		return  priceDaoRepo.findByVehicleName(vehicleName);
	}
	
	@Override
	public VehiclePrice getPriceOfVehicle(String vehicleName) {
		return  priceDaoRepo.getPriceOfVehicle(vehicleName);
	}

	@Override
	public CheckInAndCheckOut checkInVehicle(CheckInAndCheckOut ci) {
		return  checkinandcheckoutrepo.save(ci);
	}

	@Override
	public CheckInAndCheckOut checkOutVehicle(CheckInAndCheckOut co) {
		return  checkinandcheckoutrepo.save(co);
	}

	@Override
	public CheckInAndCheckOut getCheckInDetailsByRegId(String regId) {
		return  checkinandcheckoutrepo.findByVehicleRegId(regId);
	}

	@Override
	public List<CheckInAndCheckOut> getAllReports(String mallId) {
		return checkinandcheckoutrepo.findAllByMallId(mallId);
	}

	@Override
	public User getUserByEmail(String email) {
		return userRepo.findByEmail(email);
	}

	@Override
	public List<Vehicle> getAllVehicles(String mallId) {
		return repo.findAllByMallId(mallId);
	}

	@Override
	public Vehicle getVehicleByRegId(String regId, String mallId) {
		return repo.findByRegIdAndMallId(regId, mallId);
	}



	@Override
	public Mall getMallBymallId(Long mallId) {
		return mallRepo.findByMallId(mallId);
	}

	@Override
	public CheckInAndCheckOut getParkingLevelAndSlot(int parkingLevel, int slot) {
		return checkinandcheckoutrepo.getParkingLevelAndSlot(parkingLevel,slot);
	}

}
