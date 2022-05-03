/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.demo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import org.springframework.boot.autoconfigure.domain.EntityScan;

/**
 *
 * @author Sumithra
 */

public class Alien {
  
    private int aid;
    private String aname;
    private String alanguage;

    public int getAid() {
        return aid;
    }

    public void setAid(int aid) {
        this.aid = aid;
    }

    public String getAname() {
        return aname;
    }

    public void setAname(String aname) {
        this.aname = aname;
    }

    public String getAlanguage() {
        return alanguage;
    }

    public void setAlanguage(String alanguage) {
        this.alanguage = alanguage;
    }

    @Override
    public String toString() {
        return "Alien{" + "aid=" + aid + ", aname=" + aname + ", alanguage=" + alanguage + '}';
    }
    
    
}
