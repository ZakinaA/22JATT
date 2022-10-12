/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author Zakina
 */
public class Genre {
    private int id ;
    private String libelle ;
    private ArrayList<Groupe> lesGroupes ;

    public Genre() {
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

    public ArrayList<Groupe> getLesGroupes() {
        return lesGroupes;
    }

    public void setLesGroupes(ArrayList<Groupe> lesGroupes) {
        this.lesGroupes = lesGroupes;
    }
    
    public void addUngroupe(Groupe unGroupe){
        if (lesGroupes == null){
            lesGroupes = new ArrayList<>();
        }
        lesGroupes.add(unGroupe);
    }
    
    
}
