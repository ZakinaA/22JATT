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
    private Groupe groupeID;

    public Concert() {
    }

    public Concert(String dateConcert, Concert lieuConcertId, Groupe groupeID) {
        this.dateConcert = dateConcert;
        this.lieuConcertId = lieuConcertId;
        this.groupeID = groupeID;
    }

    public String getDateConcert() {
        return dateConcert;
    }

    public void setDateConcert(String dateConcert) {
        this.dateConcert = dateConcert;
    }

    public Concert getLieuConcertId() {
        return lieuConcertId;
    }

    public void setLieuConcertId(Concert lieuConcertId) {
        this.lieuConcertId = lieuConcertId;
    }

    public Groupe getGroupeID() {
        return groupeID;
    }

    public void setGroupeID(Groupe groupeID) {
        this.groupeID = groupeID;
    }

   
    

    
    
    
}
