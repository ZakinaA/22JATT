/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import dao.DaoFestival;
import dao.DaoGroupe;
import dao.DaoParticiper_Festival;
import dao.Utilitaire;
import form.FormFestival;
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
import model.Festival;
import model.Groupe;
import model.Participer_Festival;

/**
 *
 * @author ThomasGlbrt
 */
public class ServletFestival extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
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
            out.println("<title>Servlet ServletFestival</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletFestival at " + request.getContextPath() + "</h1>");
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
        
        System.out.println("servlerfestival url="+url);
        
        if(url.equals("/normanzik/ServletFestival/lister")){
            ArrayList<Festival> lesFestivals = DaoFestival.getLesFestivals(connection);
            request.setAttribute("pLesFestivals", lesFestivals);
            this.getServletContext().getRequestDispatcher("/view/festival/lister.jsp" ).forward( request, response );
        }
        
        if(url.equals("/normanzik/ServletFestival/consulter")){

            int idFestival = Integer.parseInt(request.getParameter("idFestival"));
            Festival leFestival = DaoFestival.getLeFestival(connection, idFestival);
            request.setAttribute("pFestival", leFestival);
            
            ArrayList<Groupe> lesGroupes = DaoGroupe.getLesGroupes(connection);
            request.setAttribute("pGroupes", lesGroupes);
            
            Participer_Festival uneParticipation = new Participer_Festival();
            request.setAttribute("pParticiper_Festival", uneParticipation);
            
            /*Festival teteAffiche = DaoFestival.getLaTeteAffiche(connection, idFestival);
            request.setAttribute("pTeteAffiche", teteAffiche);*/
            
            Participer_Festival teteAffiche = DaoParticiper_Festival.getLaTeteAffiche(connection, idFestival);
            request.setAttribute("pTeteAffiche", teteAffiche);
            
            this.getServletContext().getRequestDispatcher("/view/festival/consulter.jsp" ).forward( request, response );
        }
        
        if(url.equals("/normanzik/ServletGroupe/ajouter"))
        {
            ArrayList<Groupe> lesGroupes = DaoGroupe.getLesGroupes(connection);
            request.setAttribute("pLesGroupes", lesGroupes);
            
            this.getServletContext().getRequestDispatcher("/view/festival/ajouter.jsp" ).forward( request, response );
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
        
        FormFestival form = new FormFestival();
        
        Festival leFestivalSaisi = form.ajouterFestival(request);
        
        request.setAttribute( "form", form );
        request.setAttribute( "pFestival", leFestivalSaisi );
        
        if (form.getErreurs().isEmpty()){
            Festival festivalAjoute = DaoFestival.ajouterFestival(connection, leFestivalSaisi);
            
            if (festivalAjoute != null ){
                request.setAttribute("pFestival", festivalAjoute);
            
                ArrayList<Groupe> lesGroupes = DaoGroupe.getLesGroupes(connection);
                request.setAttribute("pGroupes", lesGroupes);

                Participer_Festival uneParticipation = new Participer_Festival();
                request.setAttribute("pParticiper_Festival", uneParticipation);

                Participer_Festival teteAffiche = DaoParticiper_Festival.getLaTeteAffiche(connection, festivalAjoute.getId());
                request.setAttribute("pTeteAffiche", teteAffiche);

                this.getServletContext().getRequestDispatcher("/view/festival/consulter.jsp" ).forward( request, response );
            }
            else
            {
                // Cas où l'insertion en bdd a échoué
                //On renvoie vers le formulaire
                ArrayList<Groupe> lesGroupes = DaoGroupe.getLesGroupes(connection);
                request.setAttribute("pLesGroupes", lesGroupes);
                this.getServletContext().getRequestDispatcher("/view/festival/ajouter.jsp" ).forward( request, response );
            }
        }
        else
        {
            // il y a des erreurs de saisie. On réaffiche le formulaire avec des messages d'erreurs
            ArrayList<Groupe> lesGroupes = DaoGroupe.getLesGroupes(connection);
            request.setAttribute("pLesGroupes", lesGroupes);
            this.getServletContext().getRequestDispatcher("/view/festival/ajouter.jsp" ).forward( request, response );
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
    }// </editor-fold>

}
