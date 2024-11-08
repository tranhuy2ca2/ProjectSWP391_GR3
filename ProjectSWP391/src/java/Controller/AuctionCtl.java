/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAO.AuctionDAO;
import DAO.BidsDAO;
import DAO.LandLotsDAO;
import DAO.WalletDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.math.BigDecimal;
import javax.xml.bind.Validator;
import model.*;

/**
 *
 * @author Asus
 */
@WebServlet(name="Auction", urlPatterns={"/Auction"})
public class AuctionCtl extends HttpServlet {
   
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
            out.println("<title>Servlet Auction</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Auction at " + request.getContextPath () + "</h1>");
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
       String landlotid = request.getParameter("landLotId");
        LandLotsDAO lldao = new LandLotsDAO();
         AuctionDAO adao = new AuctionDAO();
         BidsDAO bdao = new BidsDAO();
         WalletDAO walletDAO = new WalletDAO();
         HttpSession session = request.getSession();
       try{
          LandLots landlots = lldao.getLandLotsDetailByID( Integer.parseInt(landlotid) );
          Auction auction =  adao.getAuctionByLandLotId(landlots.getLandLotsID());
           
           Customer cus =(Customer) session.getAttribute("user");
          Bids MyMaxbids = bdao.getLastMyBids(cus.getUserID());
          BigDecimal maxAuction = bdao.getMaxBids(auction.getAuctionID());
           int balance = walletDAO.getBalance(cus.getUserID());
        
         request.setAttribute("balance", balance);
          request.setAttribute("mymaxbids", MyMaxbids.getBidAmount());
          request.setAttribute("maxAuction", maxAuction);
          request.setAttribute("auction", auction);
         request.setAttribute("landlots", landlots);
         request.getRequestDispatcher("Auction.jsp").forward(request, response);
        }catch( Exception e){
            System.out.println(e);
        }
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
       BidsDAO bdao = new BidsDAO();
       WalletDAO walletDAO = new WalletDAO();
       HttpSession session = request.getSession();
       String auctionId = request.getParameter("auctionId");
       String bidAmount = request.getParameter("bidAmount");
       String landLotsID = request.getParameter("landLotsID");
       
        try{
           Customer cus =(Customer) session.getAttribute("user");
        int balance = walletDAO.getBalance(cus.getUserID());
        
        walletDAO.updateBalance(cus.getUserID(), balance- Integer.parseInt(bidAmount));
         Bids b = new Bids();
         b.setAuctionID(Integer.parseInt(auctionId));
         b.setBidderID(cus.getUserID());
         b.setBidAmount(BigDecimal.valueOf(Integer.parseInt(bidAmount)) );
         bdao.InsertBids(b);
        }catch( Exception e){
            System.out.println(e);
        }
       
       response.sendRedirect("Auction?landLotId=" + landLotsID);
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
