/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.CustomerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import model.Customer;

/**
 *
 * @author Administrator
 */
public class UserManagement extends HttpServlet {

    private CustomerDAO userDAO;

    @Override
    public void init() {
        userDAO = new CustomerDAO();  // Initialize DAO
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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UserManagement</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserManagement at " + request.getContextPath() + "</h1>");
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
        // Lấy danh sách người dùng từ DAO
        List<Customer> users = userDAO.getAllUsers();

        // Gán danh sách vào attribute của request
        request.setAttribute("usersr", users);
        request.getRequestDispatcher("list_user.jsp").forward(request, response);
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
    String action = request.getParameter("action");

    if ("edit".equals(action)) {
        // Lấy tất cả các tham số
        int userID = Integer.parseInt(request.getParameter("userID"));
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String role = request.getParameter("role");
        String address = request.getParameter("address");
String passwordmd5 = md5Hash(password);

        // Nếu mật khẩu không được nhập, lấy mật khẩu hiện tại từ cơ sở dữ liệu
        if (password == null || password.isEmpty()) {
            Customer currentUser = userDAO.getUserById(userID);  // Phương thức getUserById cần được thêm vào DAO
            if (currentUser != null) {
                password = currentUser.getPassword();  // Lấy mật khẩu hiện tại
            }
        }

        // Tạo đối tượng Customer với các tham số đã lấy được
        Customer user = new Customer(userID, userName, passwordmd5, fullName, email, phone, role, address, null);

        boolean success = userDAO.updateUser(user); // Gọi DAO để cập nhật

        if (success) {
            request.setAttribute("message", "Người dùng đã được cập nhật thành công!");
        } else {
            request.setAttribute("message", "Có lỗi xảy ra khi cập nhật người dùng!");
        }

        // Tải lại danh sách người dùng
        List<Customer> users = userDAO.getAllUsers();
        request.setAttribute("usersr", users);
        request.getRequestDispatcher("list_user.jsp").forward(request, response);

   

     } else if ("delete".equals(action)) {
        // Process delete action
        int userID = Integer.parseInt(request.getParameter("userID"));
        boolean success = userDAO.deleteUser(userID);

        if (success) {
            request.setAttribute("message", "Người dùng đã được xóa thành công!");
        } else {
            request.setAttribute("message", "Có lỗi xảy ra khi xóa người dùng!");
        }

        // Reload user list
        List<Customer> users = userDAO.getAllUsers();
        request.setAttribute("usersr", users);
        request.getRequestDispatcher("list_user.jsp").forward(request, response);
           } else if ("add".equals(action)) {
    // Logic to add a new user
    String userName = request.getParameter("userName");
    String password = request.getParameter("password"); // Lấy giá trị mật khẩu từ form
    String fullName = request.getParameter("fullName");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String role = request.getParameter("role");
    String address = request.getParameter("address");
String passwordmd5 = md5Hash(password);
    // Tạo đối tượng Customer với các tham số
    Customer newUser = new Customer(0, userName, passwordmd5, fullName, email, phone, role, address, null);

    boolean success = userDAO.addUser(newUser); // Gọi DAO để thêm người dùng

    if (success) {
        request.setAttribute("message", "Người dùng đã được thêm thành công!");
    } else {
        request.setAttribute("message", "Có lỗi xảy ra khi thêm người dùng!");
    }

    // Tải lại danh sách người dùng
    List<Customer> users = userDAO.getAllUsers();
    request.setAttribute("usersr", users);
    request.getRequestDispatcher("list_user.jsp").forward(request, response);
}

    
    }
 public String md5Hash(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest(input.getBytes());

            // Chuyển byte array thành dạng hex string
            StringBuilder hexString = new StringBuilder();
            for (byte b : messageDigest) {
                hexString.append(String.format("%02x", b));
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
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
