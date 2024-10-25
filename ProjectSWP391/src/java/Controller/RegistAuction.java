/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DBContext;
import DAO.AuctionLogsDAO;
import DAO.CustomerDAO;
import DAO.LandLotsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Customer;
import model.LandLots;
import model.ZoningTypes;

/**
 *
 * @author FPTSHOP
 */
public class RegistAuction extends HttpServlet {

    private static final long serialVersionUID = 1L;

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
        String landLotsID = request.getParameter("pid");
           LandLotsDAO landLotsDAO = new LandLotsDAO();
           LandLots landLots = landLotsDAO.getLandLotsDetailByID(0);
           request.setAttribute("b", landLots);
           request.getRequestDispatcher("RegistAuction.jsp").forward(request, response);
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
        // Lấy dữ liệu từ form đăng ký
        int landLotId = Integer.parseInt(request.getParameter("landLotId"));
        boolean agreeRules = request.getParameter("agreeRules") != null;
        boolean waiveInterest = request.getParameter("waiveInterest") != null;
        boolean understandAsset = request.getParameter("understandAsset") != null;

        // Thực hiện xử lý thông tin đăng ký (lưu vào database hoặc các xử lý khác)
        try {
            // Gọi hàm DAO để lưu đăng ký
            AuctionLogsDAO auctionDAO = new AuctionLogsDAO();
            auctionDAO.getAllLogs();

            // Chuyển hướng đến trang chi tiết với thông báo thành công
            response.sendRedirect("land-detail?id=" + landLotId + "&success=true");
        } catch (SQLException ex) {
            // Xử lý lỗi SQL (ví dụ khi lưu đăng ký không thành công)
            ex.printStackTrace();
            response.sendRedirect("land-detail?id=" + landLotId + "&error=true");
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
