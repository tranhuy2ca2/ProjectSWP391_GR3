package DAO;
import DAL.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import model.Customer;

public class CustomerDAO {
    
    private Connection con;
    PreparedStatement ps;
    ResultSet rs;
    private List<Customer> user;
    private String status = "ok";
    
    public CustomerDAO() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception e) {
            status = "Error at connection" + e.getMessage();
        }
    }
    
    public Customer login(String username, String password){
        String sql = "select * from [Users] where [userName] = ? and [password] = ?;";
        Customer cus = null;
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while (rs.next()) {
                cus = new Customer(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getDate(9));
            }
        } catch (Exception e) {
        }
        return cus;
    }
    
    public void logout() {
        user = null;
    }
    
    public Customer getUserDetailByUserID(int id) {
        String query = """
                       select*from [Users] u join UserRoles ur
                       on u.userID = ur.UserID
                       join Roles r on ur.RoleID = r.RoleID
                       where u.userID = ?""";
        try {
            ps = con.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Customer(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getDate(9),
                        rs.getString(13)
                );
            }
        } catch (Exception e) {

        }
        return null;
    }
    
    public boolean UpdateUser(int uID,String fullName, String email, String phone, String address) {
        String query = """
                       update [Users]
                       set [fullName] = ?,
                       [email] = ?
                       ,[phone] = ?
                       ,[address] = ?
                       where userID = ?""";

        try {
            ps = con.prepareStatement(query);
            ps.setString(1, fullName);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, address);
            ps.setInt(5, uID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return true;
    }
    
    public static void main(String[] args) {
        CustomerDAO dao = new CustomerDAO();
        if(dao.login("admin","123") != null){
           System.out.println("Success"); 
        }else{
            System.out.println("Fail"); 
        }
        
    }
}
