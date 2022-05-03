package com.example.demo.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;





@Entity
@Table(name = "Mall")
public class Mall {
	
	
	@Id
	 @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long mall_id;
	private String mall_name;
	private String mall_registration_number;
	private int parking_level;
	private int slot;
	private String address;
	private String contact;
	/**
	 * @return the mall_id
	 */
	public Long getMall_id() {
		return mall_id;
	}
	/**
	 * @param mall_id the mall_id to set
	 */
	public void setMall_id(Long mall_id) {
		this.mall_id = mall_id;
	}
	/**
	 * @return the mall_registration_number
	 */
	public String getMall_registration_number() {
		return mall_registration_number;
	}
	/**
	 * @param mall_registration_number the mall_registration_number to set
	 */
	public void setMall_registration_number(String mall_registration_number) {
		this.mall_registration_number = mall_registration_number;
	}

	public String getContact() {
		return contact;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	/**
	 * @param contact the contact to set
	 */
	public void setContact(String contact) {
		this.contact = contact;
	}
	
	/**
	 * @return the mall_name
	 */
	public String getMall_name() {
		return mall_name;
	}
	/**
	 * @param mall_name the mall_name to set
	 */
	public void setMall_name(String mall_name) {
		this.mall_name = mall_name;
	}
	
	public int getParking_level() {
		return parking_level;
	}
	public void setParking_level(int parking_level) {
		this.parking_level = parking_level;
	}
	public int getSlot() {
		return slot;
	}
	public void setSlot(int slot) {
		this.slot = slot;
	}
	
	@Override
	public String toString() {
		return "Mall [mall_id=" + mall_id + ", mall_name=" + mall_name + ", mall_registration_number="
				+ mall_registration_number + ", parking_level=" + parking_level + ", slot=" + slot + ", address="
				+ address + ", contact=" + contact + "]";
	}
	
	
}
