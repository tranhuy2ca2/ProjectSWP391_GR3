/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.LandLotsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import model.Customer;
import model.LandLots;
import model.ZoningTypes;

/**
 *
 * @author TTT
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 100) // 100MB
public class UpdateLandLot extends HttpServlet {

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
            out.println("<title>Servlet UpdateLandLot</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateLandLot at " + request.getContextPath() + "</h1>");
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
                request.getRequestDispatcher("UpdateLandLot.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("sign_in.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.getRequestDispatcher("sign_in.jsp").forward(request, response);
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
    public static final String UPLOAD_DIR = "images";
    public String dbFileName = "";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        LandLotsDAO landdao = new LandLotsDAO();
        HttpSession ses = request.getSession();
        Customer u = (Customer) ses.getAttribute("user");

        try {
            int landlotID = Integer.parseInt(request.getParameter("landlotid"));
            String landlotname = request.getParameter("title");
            String location = request.getParameter("location");
            String area = request.getParameter("area");
            String startprice = request.getParameter("startprice");
            String publishdate = request.getParameter("publishdate");
            List<String> zoningtypeID = Arrays.asList(request.getParameterValues("zoningtype"));
            String detail = request.getParameter("detail");

            // Lấy các URL ảnh hiện tại từ database
            List<String> existingImageURLs = landdao.getImageLandByID(landlotID);
            List<String> updatedImageURLs = new ArrayList<>(existingImageURLs);

            Collection<Part> parts = request.getParts(); // Lấy tất cả các phần tải lên
            String applicationPath = getServletContext().getRealPath("") + "../../web/";
            String uploadPath = applicationPath + UPLOAD_DIR;

            File fileUploadDirectory = new File(uploadPath);
            if (!fileUploadDirectory.exists()) {
                fileUploadDirectory.mkdirs(); // Tạo thư mục nếu chưa tồn tại
            }

            // Kiểm tra từng ảnh trong phần tải lên
            int index = 0; // Biến đếm để xác định vị trí của ảnh hiện tại
            for (Part part : parts) {
                if (part.getName().equals("file") && part.getContentType() != null && part.getSubmittedFileName() 
                        != null && !part.getSubmittedFileName().isEmpty()) {
                    String fileName = extractFileName(part);
                    String savePath = uploadPath + File.separator + fileName;
                    part.write(savePath); // Lưu file

                    // Cập nhật URL mới vào danh sách, thay thế ảnh cũ
                    if (index < updatedImageURLs.size()) {
                        updatedImageURLs.set(index, UPLOAD_DIR + "/" + fileName);
                    } else {
                        updatedImageURLs.add(UPLOAD_DIR + "/" + fileName);
                    }
                    index++;
                }
            }

            // Update database record with new details
            landdao.UpdateLand(landlotID, landlotname, location, area, detail, startprice, publishdate, zoningtypeID, updatedImageURLs);

            request.getSession().setAttribute("successMessage", "Cập nhật tin thành công.");
            response.sendRedirect("managemylandlot");
        } catch (Exception e) {
            e.printStackTrace();
            request.getRequestDispatcher("sign_in.jsp").forward(request, response);
        }
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1); // Loại bỏ ký tự trích dẫn
            }
        }
        return "";
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
