/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author sio2
 */
public class Concert {
    
    private String dateConcert;
    private LieuConcert lieuConcertId;
    private Groupe GroupeConcertId;

    public Concert() {
    }

    public Concert(String dateConcert, LieuConcert lieuConcertId, Groupe GroupeConcertId) {
        this.dateConcert = dateConcert;
        this.lieuConcertId = lieuConcertId;
        this.GroupeConcertId = GroupeConcertId;
    }

    public String getDateConcert() {
        return dateConcert;
    }

    public void setDateConcert(String dateConcert) {
        this.dateConcert = dateConcert;
    }

    public LieuConcert getLieuConcertId() {
        return lieuConcertId;
    }

    public void setLieuConcertId(LieuConcert lieuConcertId) {
        this.lieuConcertId = lieuConcertId;
    }

    public Groupe getGroupeConcertId() {
        return GroupeConcertId;
    }

    public void setGroupeConcertId(Groupe GroupeConcertId) {
        this.GroupeConcertId = GroupeConcertId;
    }

  
    
    
    
    
}
