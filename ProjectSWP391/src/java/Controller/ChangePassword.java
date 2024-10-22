package Controller;

import DAO.CustomerDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import model.Customer;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

public class ChangePassword extends HttpServlet {
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
            out.println("<title>Servlet FinalPay</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePassword at " + request.getContextPath () + "</h1>");
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
        processRequest(request, response);
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

        CustomerDAO dao = new CustomerDAO();
        HttpSession ses = request.getSession();
        Customer u = (Customer) ses.getAttribute("user");
        int userID = u.getUserID();
        String oldpassword = u.getPassword(); // Already MD5 hashed
        String oldpass = request.getParameter("oldpass");
        String newpass = request.getParameter("newpass");
        String confirm = request.getParameter("confirm");

        // Regular expression for the new password
        String passwordPattern = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$";

        try {
            // Hash the oldpass input using MD5 before comparing
            String oldpassMd5 = md5Hash(oldpass);

            if (oldpassMd5.equals(oldpassword) && !oldpass.isEmpty()) {
                if (confirm.equals(newpass) && newpass != null) {
                    // Validate the new password format
                    Pattern pattern = Pattern.compile(passwordPattern);
                    Matcher matcher = pattern.matcher(newpass);

                    if (matcher.matches()) {
                        // Hash the new password before saving it
                        String newpassMd5 = md5Hash(newpass);
                        boolean passwordChanged = dao.ChangePassword(userID, newpassMd5);
                        if (passwordChanged) {
                            Customer user = dao.getAccountByID(userID);
                            request.getSession().setAttribute("user", user);
                            request.getSession().setAttribute("successMessage", "Đổi mật khẩu thành công.");
                            response.sendRedirect("profile?uID=" + userID);
                        } else {
                            request.getSession().setAttribute("successMessage", "Đổi mật khẩu thất bại !!");
                            response.sendRedirect("profile?uID=" + userID);
                        }
                    } else {
                        request.getSession().setAttribute("successMessage", "Mật khẩu mới không hợp lệ. "
                                + "Vui lòng nhập ít nhất 1 chữ thường, 1 chữ hoa, 1 số và 1 ký tự đặc biệt.");
                        response.sendRedirect("profile?uID=" + userID);
                    }
                } else {
                    request.getSession().setAttribute("successMessage", "Mật khẩu xác nhận không khớp với mật khẩu mới.");
                    response.sendRedirect("profile?uID=" + userID);
                }
            } else {
                request.getSession().setAttribute("successMessage", "Sai mật khẩu cũ.");
                response.sendRedirect("profile?uID=" + userID);
            }
        } catch (Exception e) {
            request.getRequestDispatcher("sign_in.jsp").forward(request, response);
        }
    }

    // MD5 hashing function
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

    @Override
    public String getServletInfo() {
        return "Change password servlet";
    }
}
