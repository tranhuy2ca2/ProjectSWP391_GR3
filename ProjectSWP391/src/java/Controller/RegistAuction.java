/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.AuctionDAO;
import DAO.BidsDAO;
import DAO.LandLotsDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import model.Auction;
import model.Bids;
import model.LandLots;

/**
 *
 * @author FPTSHOP
 */
public class RegistAuction extends HttpServlet {

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
        String landlotid = request.getParameter("landlotid");
        LandLotsDAO lldao = new LandLotsDAO();
        LandLots landlots = lldao.getLandLotsDetailByID( Integer.parseInt(landlotid) );
        
        request.setAttribute("landlots", landlots);
        request.getRequestDispatcher("RegistAuction.jsp").forward(request, response);
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
        String landlotid = request.getParameter("landLotId");
        LandLotsDAO lldao = new LandLotsDAO();
        AuctionDAO adao = new AuctionDAO();
        
        try{
            LandLots landlots = lldao.getLandLotsDetailByID( Integer.parseInt(landlotid) );
            BidsDAO bidsdao = new BidsDAO();
            Auction a =adao.getAuctionByLandLotId(landlots.getLandLotsID());
            Bids b = new Bids();
            b.setAuctionID(a.getAuctionID());
            b.setBidAmount(BigDecimal.valueOf(1000000));
            //bidsdao.InsertBids(b);
            
            response.sendRedirect("Auction?landlots=" + landlots);
        }catch( Exception e){
            response.sendRedirect("homepage");
            return;
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
