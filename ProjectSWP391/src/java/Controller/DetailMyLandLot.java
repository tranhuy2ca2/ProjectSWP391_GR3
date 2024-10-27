/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.LandLotsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Customer;
import model.LandLots;
import model.ZoningTypes;

/**
 *
 * @author TTT
 */
public class DetailMyLandLot extends HttpServlet {
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
>>>>>>> c9d3fa424a393ea0d7225f4530b57c1e111e0cb7
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
            out.println("<title>Servlet DetailMyLandLot</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DetailMyLandLot at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        //processRequest(request, response);
        try {
            LandLotsDAO landdao = new LandLotsDAO();
            HttpSession ses = request.getSession();
            int landlotid = Integer.parseInt(request.getParameter("landlotid"));
            List<ZoningTypes> zoningtype = landdao.LoadAllZoningType();
            LandLots b = landdao.getLandLotsDetailByID(landlotid);
            Customer u = (Customer) ses.getAttribute("user");
            if (u != null) {
                request.setAttribute("listzoning", zoningtype);
                request.setAttribute("b", b);
                request.getRequestDispatcher("DetailMyLandLot.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("sign_in.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.getRequestDispatcher("sign_in.jsp").forward(request, response);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

