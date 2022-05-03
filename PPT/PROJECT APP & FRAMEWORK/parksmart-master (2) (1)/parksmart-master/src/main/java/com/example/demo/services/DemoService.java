/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.demo.services;

import com.example.demo.model.CheckInAndCheckOut;
import com.example.demo.model.Mall;
import com.example.demo.model.User;
import com.example.demo.model.Vehicle;
import com.example.demo.model.VehiclePrice;

import java.util.List;

/**
 *
 * @author AnilkumarMuddala
 */
public interface DemoService {
    
//	public List<User> getUsers();
//	public Optional<User> getUserById(Long id);
//	public User saveOrUpdate(User user);
	public Vehicle registerVehicle(Vehicle vehicle);
	public Vehicle getVehicleByRegId(String regId,String mallId);
	public List<Vehicle>getAllVehicles(String mallId);
	public List<User>getUsersByRole(String role);
	public Mall saveMallRegistration(Mall mall);
	public List<Mall> getAllMallDeatails();
	public String checkUser(String email,String Password,String role);
	public User addAdmin(User user);
	public VehiclePrice priceUpdation(VehiclePrice vehiclePrice);
	public VehiclePrice findByVehicleName(String vehicleName);
	public VehiclePrice getPriceOfVehicle(String vehicleName);
	public CheckInAndCheckOut checkInVehicle(CheckInAndCheckOut ci);
	public CheckInAndCheckOut checkOutVehicle(CheckInAndCheckOut co);
	public CheckInAndCheckOut getCheckInDetailsByRegId(String regId);
	public List<CheckInAndCheckOut> getAllReports(String mallId);
	public User getUserByEmail(String email);
	public Mall getMallBymallId(Long mallId);
	public CheckInAndCheckOut  getParkingLevelAndSlot(int parkingLevel,int slot);
	
//	public void deleteUserById(Long id);
}
