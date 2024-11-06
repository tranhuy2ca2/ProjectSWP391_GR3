/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAO.AuctionDAO;
import DAO.LandLotsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.List;
import model.Auction;
import model.LandLots;

/**
 *
 * @author Asus
 */
@WebServlet(name="PostManagement", urlPatterns={"/PostManagement"})
public class PostManagement extends HttpServlet {
    private AuctionDAO auctionDAO;

    @Override
    public void init() {
        auctionDAO = new AuctionDAO();  // Initialize DAO
    }
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PostManagement</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PostManagement at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        LandLotsDAO lldao = new LandLotsDAO();
        List<LandLots> landLotses = lldao.getAllLandLotsDetail();
        
        request.setAttribute("landLotses", landLotses);
        request.getRequestDispatcher("list_post.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        LandLotsDAO lldao = new LandLotsDAO();
        AuctionDAO adao = new AuctionDAO();
        try{
                    String  action = request.getParameter("action");
                    int landLotsID = Integer.parseInt(request.getParameter("landLotsID"));
                    if(action.equals("accept")){
                         String timeCre = request.getParameter("timeCre");
                        //change status landlot
                        lldao.updateStatusLandLots(landLotsID, "Available");

                        LandLots landLots = lldao.getLandLotsDetailByID(landLotsID);
                        //insert in to aution
                        Auction auction = new Auction();
                        auction.setLandLotID(landLotsID);
                        auction.setAuctionnerid("1");
                         Timestamp timeCreate = new Timestamp(landLots.getCreatedAt().getTime());
                        auction.setStartTime(timeCreate);
                        //end sau 5 ngay
                        Calendar calendar = Calendar.getInstance();
                        calendar.setTimeInMillis(timeCreate.getTime()); 
                        calendar.add(Calendar.DAY_OF_MONTH, 5); 
                        Timestamp endTime = new Timestamp(calendar.getTimeInMillis());
                        auction.setEndTime(endTime);
                        auction.setStatus("Ongoing");
                        adao.createAuction(auction);
                    }else if(action.equals("reject")){
                          lldao.updateStatusLandLots(landLotsID, "Reject");
                    }
                    
                  
        }catch(Exception e){
            System.out.println(e.toString());
        }

        List<LandLots> landLotses = lldao.getAllLandLotsDetail();
        
        request.setAttribute("landLotses", landLotses);
        request.getRequestDispatcher("list_post.jsp").forward(request, response);
         
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
