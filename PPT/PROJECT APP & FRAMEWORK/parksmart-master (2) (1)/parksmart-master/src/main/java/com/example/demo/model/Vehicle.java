package com.example.demo.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "vehicles")

public class Vehicle {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long vehicle_id;
	private String regId;
	private String vehicle_type;
	private String model;
	private String owner_name;
	private String age;
	private String contact;
	private int status;
	private String register_dt;
	private String mall_id;
	@Transient
	private int parkingLevel;
	@Transient
	private int slot;
	
	

	public Long getVehicle_id() {
		return vehicle_id;
	}

	public void setVehicle_id(Long vehicle_id) {
		this.vehicle_id = vehicle_id;
	}

	

	public String getRegId() {
		return regId;
	}

	public void setRegId(String regId) {
		this.regId = regId;
	}

	public String getVehicle_type() {
		return vehicle_type;
	}

	public void setVehicle_type(String vehicle_type) {
		this.vehicle_type = vehicle_type;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getOwner_name() {
		return owner_name;
	}

	public void setOwner_name(String owner_name) {
		this.owner_name = owner_name;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}
	

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	

	public String getRegister_dt() {
		return register_dt;
	}

	public void setRegister_dt(String register_dt) {
		this.register_dt = register_dt;
	}
	

	public String getMall_id() {
		return mall_id;
	}

	public void setMall_id(String mall_id) {
		this.mall_id = mall_id;
	}

	public int getParkingLevel() {
		return parkingLevel;
	}

	public void setParkingLevel(int parkingLevel) {
		this.parkingLevel = parkingLevel;
	}

	public int getSlot() {
		return slot;
	}

	public void setSlot(int slot) {
		this.slot = slot;
	}

	@Override
	public String toString() {
		return "Vehicle [vehicle_id=" + vehicle_id + ", regId=" + regId + ", vehicle_type=" + vehicle_type + ", model="
				+ model + ", owner_name=" + owner_name + ", age=" + age + ", contact=" + contact + ", status=" + status
				+ ", register_dt=" + register_dt + ", mall_id=" + mall_id + ", parkingLevel=" + parkingLevel + ", slot="
				+ slot + "]";
	}

	



}
