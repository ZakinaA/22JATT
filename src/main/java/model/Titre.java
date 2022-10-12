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
public class Titre {
    
    private int id;
    private String intitule;
    private String duree;
    private String lienURL;

    public Titre() {
    }

    public Titre(int id, String intitule, String duree, String lienURL) {
        this.id = id;
        this.intitule = intitule;
        this.duree = duree;
        this.lienURL = lienURL;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getIntitule() {
        return intitule;
    }

    public void setIntitule(String intitule) {
        this.intitule = intitule;
    }

    public String getDuree() {
        return duree;
    }

    public void setDuree(String duree) {
        this.duree = duree;
    }

    public String getLienURL() {
        return lienURL;
    }

    public void setLienURL(String lienURL) {
        this.lienURL = lienURL;
    }
    
    
    
    
    
 
}
