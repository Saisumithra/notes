package com.example.demo.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/*import lombok.Data;
import lombok.ToString;*/


@Entity
@Table(name = "checkInAndCheckout")
public class CheckInAndCheckOut {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String vehicleRegId;
	private String checkin_dt;
	private String checkout_dt;
	private String mallId;
	private int price;
	private int totalTime;
	private int parkingLevel;
	private int slot;

	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getVehicleRegId() {
		return vehicleRegId;
	}
	public void setVehicleRegId(String vehicleRegId) {
		this.vehicleRegId = vehicleRegId;
	}
	public String getCheckin_dt() {
		return checkin_dt;
	}
	public void setCheckin_dt(String checkin_dt) {
		this.checkin_dt = checkin_dt;
	}
	
	
	public String getCheckout_dt() {
		return checkout_dt;
	}
	public void setCheckout_dt(String checkout_dt) {
		this.checkout_dt = checkout_dt;
	}
	
	public String getMallId() {
		return mallId;
	}
	public void setMallId(String mallId) {
		this.mallId = mallId;
	}
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getTotalTime() {
		return totalTime;
	}
	public void setTotalTime(int totalTime) {
		this.totalTime = totalTime;
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
		return "CheckInAndCheckOut [id=" + id + ", vehicleRegId=" + vehicleRegId + ", checkin_dt=" + checkin_dt
				+ ", checkout_dt=" + checkout_dt + ", mallId=" + mallId + ", price=" + price + ", totalTime="
				+ totalTime + ", parkingLevel=" + parkingLevel + ", slot=" + slot + "]";
	}

	
	
	
	
	
}
