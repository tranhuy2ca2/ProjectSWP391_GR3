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
import jakarta.servlet.http.HttpSession;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import model.Customer;

/**
 *
 * @author Administator
 */
public class Signup extends HttpServlet {

    CustomerDAO cud = new CustomerDAO();

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
            out.println("<title>Servlet Signup</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Signup at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("sign_up.jsp").forward(request, response);

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
         HttpSession session = request.getSession();

        // Collect input
        String username = request.getParameter("username");
        String fullname = request.getParameter("fullname");
        String password = request.getParameter("password");
        String repassword = request.getParameter("repassword");
        String email = request.getParameter("Email");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");

        String err = "";

        // Validate inputs
        if (username.length() < 5) {
            err = "Tên đăng nhập phải có ít nhất 5 kí tự.";
        } else if (cud.checkUsernameExist(username)) {
            err = "Tên đăng nhập này đã tồn tại, vui lòng chọn tên khác.";
        } else if (!isValidStringEmail(email)) {
            err = "Email không đúng định dạng";
        } else if (!password.equals(repassword)) {
            err = "Mật khẩu không trùng khớp";
        } else if (!isValidString(password)) {
            err = "Mật khẩu phải từ 8 đến 20 kí tự, bao gồm ít nhất chữ cái thường, chữ hoa và số.";
        } else if (!isValidPhoneNumber(phone)) {
            err = "Số điện thoại không hợp lệ, phải là 10 chữ số và bắt đầu bằng số 0.";
        } else if (cud.checkCustomerExist(email)) {
            err = "Email này đã tồn tại, vui lòng nhập email khác.";
        } else {
            String passwordMd5 = md5Hash(password);
            // Mặc định role là 2 (khách hàng)
            int role = 2; // Default role for customer

            Customer newCustomer = new Customer(0, username, passwordMd5, fullname, email, phone, String.valueOf(role), address, null, null);

            // Call the signup method in DAO to save the user
            boolean success = cud.signup(newCustomer);

            if (success) {
                session.setAttribute("signupSuccess", "Đăng kí thành công! Bạn có thể đăng nhập ngay.");
                response.sendRedirect("sign_in.jsp");
                return;
            } else {
                err = "Đăng ký thất bại, vui lòng thử lại!";
            }
        }

        // Set error message and return to sign-up page
        request.setAttribute("username", username);
        request.setAttribute("fullname", fullname);
        request.setAttribute("email", email);
        request.setAttribute("err", err);
        request.getRequestDispatcher("sign_up.jsp").forward(request, response);
    }

    public String md5Hash(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest(input.getBytes());

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

    // kiểm tra email hợp lệ
    public boolean isValidStringEmail(String str) {
        // Sử dụng biểu thức chính quy để kiểm tra chuỗi
        Pattern pattern = Pattern.compile("^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$");
        Matcher matcher = pattern.matcher(str);
        return matcher.matches();
    }

    public boolean isValidStringUserName(String str) {
        // Biểu thức chính quy để kiểm tra username từ 5 đến 15 ký tự
        Pattern pattern = Pattern.compile("^[A-Za-z0-9]{5,15}$");
        Matcher matcher = pattern.matcher(str);
        return matcher.matches();
    }

    // kiểm tra mật khẩu hợp lệ
    public boolean isValidString(String str) {
        // Sử dụng biểu thức chính quy để kiểm tra chuỗi
        Pattern pattern = Pattern.compile("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).{8,20}$");
        Matcher matcher = pattern.matcher(str);
        return matcher.matches();
    }
    // kiem tra sdt

    public boolean isValidPhoneNumber(String phone) {
        // Biểu thức chính quy để kiểm tra số điện thoại bắt đầu bằng 0 và có đúng 10 chữ số
        Pattern pattern = Pattern.compile("^0\\d{9}$");
        Matcher matcher = pattern.matcher(phone);
        return matcher.matches();
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
