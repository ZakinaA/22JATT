/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Instrument;
import model.Membre;

/**
 *
 * @author sio2
 */
public class DaoInstrument {
    Connection connection=null;
    static PreparedStatement requete=null;
    static ResultSet rs=null;
    
    public static Instrument getInstrument(Connection connection, int instrumentID){

        Instrument leInstrument = new Instrument();
        try
        {
            //preparation de la requete
            requete=connection.prepareStatement("select libelle,id from instrument where id = ?");
            requete.setInt(1, instrumentID);
            //System.out.println("Requete" + requete);

            //executer la requete
            rs=requete.executeQuery();

            //On hydrate l'objet métier Groupe et sa relation Genre avec les résultats de la requête
            if ( rs.next() ) {
                leInstrument.setLibelle(rs.getString("libelle"));
                leInstrument.setId(rs.getInt("id"));
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        
      return leInstrument;
    }
    
    public static ArrayList<Instrument> getLesInstruments(Connection connection){
        ArrayList<Instrument> lesInstruments = new  ArrayList<Instrument>();
        try
        {
            //preparation de la requete
            requete=connection.prepareStatement("select libelle,id from instrument");
            //System.out.println("Requete" + requete);

            //executer la requete
            rs=requete.executeQuery();

            //On hydrate l'objet métier Groupe et sa relation Genre avec les résultats de la requête
            while ( rs.next() ) {
                Instrument unInstrument = new Instrument(); 
                unInstrument.setLibelle(rs.getString("libelle"));
                unInstrument.setId(rs.getInt("id"));
                lesInstruments.add(unInstrument);
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        
      return lesInstruments;
    }
    
    public static ArrayList<Membre> getLesMembresInstrumentPrincipal(Connection connection, int instrumentID){
        ArrayList<Membre> lesMembres = new  ArrayList<Membre>();
        try
        {
            requete=connection.prepareStatement("select id, nom, prenom  from  membre  WHERE instrumentPrincipalID = ?");
            requete.setInt(1, instrumentID);
            rs=requete.executeQuery();
            
            while ( rs.next() ) {
                Membre unMembre = new Membre();
                unMembre.setId(rs.getInt("id"));
                unMembre.setPrenom(rs.getString("prenom"));
                unMembre.setNom(rs.getString("nom"));
                lesMembres.add(unMembre);
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return lesMembres;
    }
}
