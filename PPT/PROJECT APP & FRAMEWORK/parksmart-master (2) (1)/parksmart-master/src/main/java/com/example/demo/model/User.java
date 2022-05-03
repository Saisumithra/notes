/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.demo.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.sun.xml.txw2.annotation.XmlCDATA;

/**
 *
 * @author AnilkumarMuddala
 */
@Entity
@Table(name = "users")

public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long empid;
	private String firstname;
	private String lastname;
	private String email;
	private String password;
	private Long contactnumber;
	private String mall_id;
	private String role;
	
	@Override
	public String toString() {
		return "User [empid=" + empid + ", firstname=" + firstname + ", lastname=" + lastname + ", email=" + email
				+ ", password=" + password + ", contactnumber=" + contactnumber + ", mall_id=" + mall_id + ", role="
				+ role + "]";
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Long getEmpid() {
		return empid;
	}
	public void setEmpid(Long empid) {
		this.empid = empid;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public Long getContactnumber() {
		return contactnumber;
	}
	public void setContactnumber(Long contactnumber) {
		this.contactnumber = contactnumber;
	}
	public String getMall_id() {
		return mall_id;
	}
	public void setMall_id(String mall_id) {
		
		this.mall_id = mall_id;
	}


}
