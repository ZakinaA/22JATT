/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import dao.DaoConcert;
import dao.DaoGroupe;
import dao.DaoLieuConcert;
import dao.Utilitaire;
import form.formLieuConcert;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Concert;
import model.Groupe;
import model.LieuConcert;
import static test.ConnexionBdd.connection;

/**
 *
 * @author sio2
 */
@WebServlet(name = "ServletLieuConcert", urlPatterns = {"/ServletLieuConcert"})
public class ServletLieuConcert extends HttpServlet {
    
    Connection connection ;
    static PreparedStatement requete=null;
    static ResultSet rs=null;
    
    @Override
    public void init()
    {
        
        ServletContext servletContext=getServletContext();
        connection=(Connection)servletContext.getAttribute("connection");        
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletLieuConcert</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletLieuConcert at " + request.getContextPath() + "</h1>");
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
      
        
        String url = request.getRequestURI(); 

        //Affichage de tous les groupes (en indiquant le libellé du genre musical)
        if(url.equals(getServletContext().getContextPath()+"/ServletLieuConcert/ajouter")){            
            this.getServletContext().getRequestDispatcher("/view/lieuconcert/ajouter.jsp" ).forward( request, response );
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
            formLieuConcert form = new formLieuConcert();
        
        LieuConcert leLieuConcertSaisi = form.ajouterLieuConcert(request);
        request.setAttribute( "form", form );
        request.setAttribute( "pLieuConcert", leLieuConcertSaisi );
        
        if (form.getErreurs().isEmpty()){
            System.out.println("insert 1");
            // Il n'y a pas eu d'erreurs de saisie, donc on renvoie la vue affichant les infos du groupe
            LieuConcert lieuConcertAjoute = DaoLieuConcert.ajouterLieuConcert(connection, leLieuConcertSaisi);

            if (lieuConcertAjoute != null ){
                ArrayList<Concert> lesConcert = DaoConcert.getLesConcerts(connection);
                request.setAttribute("pLesConcerts", lesConcert);

                ArrayList<Groupe> lesGroupes = DaoGroupe.getLesGroupes(connection);
                request.setAttribute("pLesGroupes", lesGroupes);

                ArrayList<LieuConcert> lesLieuConcerts = DaoLieuConcert.getLesLieuConcerts(connection);
                request.setAttribute("pLesLieuConcerts", lesLieuConcerts);
                this.getServletContext().getRequestDispatcher("/view/concert/ajouter.jsp" ).forward( request, response );
            } 
            else
            {
                
                this.getServletContext().getRequestDispatcher("/view/lieuconcert/ajouter.jsp").forward( request, response );
            }
    }
   }
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
    }// </editor-f
}
