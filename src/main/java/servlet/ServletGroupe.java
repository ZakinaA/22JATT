/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import dao.DaoAdmin;
import dao.DaoDispositif;
import dao.DaoGroupe;
import dao.Utilitaire;
import form.FormGroupe;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Dispositif;
import model.Genre;
import model.Groupe;
import model.Membre;
import model.Titre;

/**
 *
 * @author Zakina
 */
public class ServletGroupe extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * 
     *  Connection connection ;
    static PreparedStatement requete=null;
    static ResultSet rs=null;

     */
    
    Connection connection ;
    static PreparedStatement requete=null;
    static ResultSet rs=null;
    
     @Override
    public void init()
    {
        
        ServletContext servletContext=getServletContext();
        connection=(Connection)servletContext.getAttribute("connection");
        
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletGroupe</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletGroupe at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         // récupération de l url saisie dans le navigateur
        String url = request.getRequestURI();
        
        System.out.println("servlergroupe url="+url);

        //Affichage de tous les groupes (en indiquant le libellé du genre musical)
        if(url.equals("/normanzik/ServletGroupe/lister")){
            ArrayList<Groupe> lesGroupes = DaoGroupe.getLesGroupes(connection);
            request.setAttribute("pLesGroupes", lesGroupes);
            this.getServletContext().getRequestDispatcher("/view/groupe/lister.jsp" ).forward( request, response );
        }

        // Affichage du groupe selectionné (depuis la fonctionnalité lister)
        if(url.equals("/normanzik/ServletGroupe/consulter")){

            int idGroupe = Integer.parseInt(request.getParameter("idGroupe"));
            Groupe leGroupe = DaoGroupe.getLeGroupe(connection, idGroupe);
            request.setAttribute("pGroupe", leGroupe);
            
            Membre leMembreContact = DaoGroupe.getLeMembreContact(connection, idGroupe);
            request.setAttribute("pMembreContact", leMembreContact);
            
            ArrayList<Membre> lesMembres = DaoGroupe.getLesMembresGroupe(connection, idGroupe);
            request.setAttribute("pMembreGroupe", lesMembres);
            
            ArrayList<Titre> lesTitres = DaoGroupe.getLesTitresDuGroupe(connection, idGroupe);
            request.setAttribute("pTitreGroupe", lesTitres);
            this.getServletContext().getRequestDispatcher("/view/groupe/consulter.jsp" ).forward( request, response );
        }

        if(url.equals("/normanzik/ServletGroupe/ajouter"))
        {
            ArrayList<Genre> lesGenres = DaoAdmin.getLesGenres(connection);
            request.setAttribute("pLesGenres", lesGenres);
            
            ArrayList<Dispositif> lesDispositifsForm = DaoDispositif.getLesDispositifs(connection);
            request.setAttribute("pLesDispositifsForm", lesDispositifsForm);
            this.getServletContext().getRequestDispatcher("/view/groupe/ajouter.jsp" ).forward( request, response );
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        FormGroupe form = new FormGroupe();

        /* Appel au traitement et à la validation de la requête, et récupération de l'objet en résultant */
        Groupe leGroupeSaisi = form.ajouterGroupe(request);

        /* Stockage du formulaire et de l'objet dans l'objet request */
        request.setAttribute( "form", form );
        request.setAttribute( "pGroupe", leGroupeSaisi );

        if (form.getErreurs().isEmpty()){
            // Il n'y a pas eu d'erreurs de saisie, donc on renvoie la vue affichant les infos du groupe
            Groupe groupeAjoute = DaoGroupe.ajouterGroupe(connection, leGroupeSaisi);

            if (groupeAjoute != null ){
                request.setAttribute("pGroupe", groupeAjoute);
                
                Membre leMembreContact = DaoGroupe.getLeMembreContact(connection, groupeAjoute.getId());
                request.setAttribute("pMembreContact", leMembreContact);
                
                ArrayList<Membre> lesMembres = DaoGroupe.getLesMembresGroupe(connection, groupeAjoute.getId());
                request.setAttribute("pMembreGroupe", lesMembres);
            
                ArrayList<Titre> lesTitres = DaoGroupe.getLesTitresDuGroupe(connection, groupeAjoute.getId());
                request.setAttribute("pTitreGroupe", lesTitres);
                
                this.getServletContext().getRequestDispatcher("/view/groupe/consulter.jsp" ).forward( request, response );
            }
            else
            {
                // Cas où l'insertion en bdd a échoué
                //On renvoie vers le formulaire
                ArrayList<Genre> lesGenres = DaoAdmin.getLesGenres(connection);
                request.setAttribute("pLesGenres", lesGenres);
                System.out.println("le groupe est null en bdd- echec en bdd");
                this.getServletContext().getRequestDispatcher("/view/groupe/ajouter.jsp" ).forward( request, response );
            }
        }
        else
        {

            // il y a des erreurs de saisie. On réaffiche le formulaire avec des messages d'erreurs
            ArrayList<Genre> lesGenres = DaoAdmin.getLesGenres(connection);
            request.setAttribute("pLesGenres", lesGenres);
            this.getServletContext().getRequestDispatcher("/view/groupe/ajouter.jsp" ).forward( request, response );
        }
    }

    //fermeture des ressources
    public void destroy(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
    {
        try
        {
            //fermeture
            System.out.println("Connexion fermée");
        }
        catch (Exception e)
        {
            e.printStackTrace();
            System.out.println("Erreur lors de l’établissement de la connexion");
        }
        finally
        {
            //Utilitaire.fermerConnexion(rs);
            //Utilitaire.fermerConnexion(requete);
            Utilitaire.fermerConnexion(connection);
        }
    }
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
