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
        List<Customer> users = userDAO.getAllUsers();
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
            int loggedInUserID = (int) request.getSession().getAttribute("loggedInUserID"); // Assuming the logged-in user's ID is stored in the session

            if (userID == loggedInUserID) {
                request.setAttribute("message", "Bạn không thể xóa tài khoản của chính mình!");
            } else {
                boolean success = userDAO.deleteUser(userID);

                if (success) {
                    request.setAttribute("message", "Người dùng đã được xóa thành công!");
                } else {
                    request.setAttribute("message", "Có lỗi xảy ra khi xóa người dùng!");
                }
            }

            // Reload user list
            List<Customer> users = userDAO.getAllUsers();
            request.setAttribute("users", users);
            request.getRequestDispatcher("list_user.jsp").forward(request, response);
        } else if ("add".equals(action)) {
            // Retrieve input parameters
            String userName = request.getParameter("userName");
            String password = request.getParameter("password");
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String role = request.getParameter("role");
            String address = request.getParameter("address");

            // Validate username length
            if (userName.length() < 5) {
                request.setAttribute("message", "Tên người dùng phải có ít nhất 5 kí tự!");
            } // Check if username or email already exists
            else if (userDAO.checkUsernameExist(userName)) {
                request.setAttribute("message", "Tên người dùng đã tồn tại!");
            } else if (userDAO.checkCustomerExist(email)) {
                request.setAttribute("message", "Email đã tồn tại!");
            } // Validate password strength
            else if (!isValidPassword(password)) {
                request.setAttribute("message", "Mật khẩu phải có từ 8 đến 20 kí tự, bao gồm ít nhất một chữ cái thường, một chữ hoa và một số.");
            } else {
                // Encrypt the password
                String passwordmd5 = md5Hash(password);

                // Create a new Customer object
                Customer newUser = new Customer(0, userName, passwordmd5, fullName, email, phone, role, address, null);

                // Call DAO to add the new user
                boolean success = userDAO.addUser(newUser);

                // Set the success or failure message
                if (success) {
                    request.setAttribute("message", "Người dùng đã được thêm thành công!");
                } else {
                    request.setAttribute("message", "Có lỗi xảy ra khi thêm người dùng!");
                }
            }

            // Reload the list of users
            List<Customer> users = userDAO.getAllUsers();
            request.setAttribute("usersr", users);
            request.getRequestDispatcher("list_user.jsp").forward(request, response);
        }
    }

    private boolean isValidPassword(String password) {
        return password.length() >= 8 && password.length() <= 20
                && password.matches(".*[a-z].*")
                && // at least one lowercase letter
                password.matches(".*[A-Z].*")
                && // at least one uppercase letter
                password.matches(".*\\d.*");      // at least one digit
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
