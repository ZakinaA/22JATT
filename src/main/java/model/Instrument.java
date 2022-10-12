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
public class Instrument {
    private ArrayList<Membre> lesMembres; // Liste les membres ayant cette instrument pour instrument principal
    private int id; 
    private String libelle;    
    
    public Instrument() {}
    
    public Instrument(int id, String libelle, ArrayList<Membre> lesMembres) {
        this.id = id;
        this.libelle = libelle;
        this.lesMembres = lesMembres;
    }        
    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public String getLibelle() {
        return libelle;
    }    
    
    public void setLibelle(String libelle) {
        this.libelle = libelle; 
    }    

   
    public ArrayList<Membre> getLesMembres() {
        return lesMembres;
    }
    
    public void setLesMembres(ArrayList<Membre> lesMembres) {
        this.lesMembres = lesMembres;  
    }
    
    
     public void addLesMembres(Membre unMembre) {
        if(lesMembres == null){
            lesMembres = new ArrayList<>();            
        }
        
        lesMembres.add(unMembre);
    }
}
