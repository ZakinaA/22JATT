/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author sio2
 */
public class Festival {
    private int id;
    private String nom;
    private String dateDebutFestival;
    private String dateFinFestival;
    private Groupe teteAffiche;
    private String teteAfficheDate;



    public Festival() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getDateDebutFestival() {
        return dateDebutFestival;
    }

    public void setDateDebutFestival(String dateDebutFestival) {
        this.dateDebutFestival = dateDebutFestival;
    }

    public String getDateFinFestival() {
        return dateFinFestival;
    }

    public void setDateFinFestival(String dateFinFestival) {
        this.dateFinFestival = dateFinFestival;
    }
    
    public Groupe getTeteAffiche() {
        return teteAffiche;
    }

    public void setTeteAffiche(Groupe teteAffiche) {
        this.teteAffiche = teteAffiche;
    }
    
    
    public String getTeteAfficheDate() {
        return teteAfficheDate;
    }

    public void setTeteAfficheDate(String teteAfficheDate) {
        this.teteAfficheDate = teteAfficheDate;
    }


    
}
