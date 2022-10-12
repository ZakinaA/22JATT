/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Membre;

/**
 *
 * @author sio2
 */
public class DaoMembre {
    Connection connection=null;
    static PreparedStatement requete=null;
    static ResultSet rs=null;   
    static PreparedStatement requeteStatut=null;
    
    
    public static Membre ajouterMembre(Connection connection, Membre unMembre){
        int idGenere = -1;
        try
            {
            //preparation de la requete
            // gpe_id (clé primaire de la table groupe) est en auto_increment,donc on ne renseigne pas cette valeur
            // le paramètre RETURN_GENERATED_KEYS est ajouté à la requête afin de pouvoir récupérer l'id généré par la bdd (voir ci-dessous)
            // supprimer ce paramètre en cas de requête sans auto_increment.
            requete=connection.prepareStatement("INSERT INTO membre ( nom, prenom, instrumentPrincipalID, statutID)\n" +
                    "VALUES (?,?,?, ?)", requete.RETURN_GENERATED_KEYS );
            requete.setString(1, unMembre.getNom());
            requete.setString(2, unMembre.getPrenom());
            requete.setInt(3, unMembre.getInstrumentPrincipal().getId());
            requete.setInt(4, unMembre.getStatutMembre().getId());

            System.out.println("requeteInsertion=" + requete);
            /* Exécution de la requête */
            int resultatRequete = requete.executeUpdate();
            System.out.println("resultatrequete=" + resultatRequete);

            // Récupération de id auto-généré par la bdd dans la table groupe
            rs = requete.getGeneratedKeys();
            if ( rs.next() ) {
                idGenere = rs.getInt( 1 );
                unMembre.setId(idGenere);               

            }

            // si le résultat de la requete est différent de 1, c'est que la requête a échoué.
            // Dans ce cas, on remet l'objet groupe à null
            if (resultatRequete != 1){
                unMembre= null;
            }

        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
            unMembre= null;
        }
        return unMembre ;
    }
    
    public static Membre getLeMembre(Connection connection, int idMembre){

        Membre leMembre = new Membre();
        try
        {
            //preparation de la requete
            requete=connection.prepareStatement("select nom,prenom, instrumentPrincipalID from membre where membre.id = ?");
            requete.setInt(1, idMembre);
            //System.out.println("Requete" + requete);

            //executer la requete
            rs=requete.executeQuery();

            //On hydrate l'objet métier Groupe et sa relation Genre avec les résultats de la requête
            if ( rs.next() ) {
                leMembre.setNom(rs.getString("nom"));
                leMembre.setPrenom(rs.getString("prenom"));
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return leMembre ;
    }    
}
