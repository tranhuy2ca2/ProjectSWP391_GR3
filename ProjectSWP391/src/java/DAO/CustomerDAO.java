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

    public Customer login(String username, String password) {
        String sql = "select * from [Users] where [userName] = ? and [password] = ?;";
        Customer cus = null;
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while (rs.next()) {
                cus = new Customer(rs.getInt(1),
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
                       select*from [Users] u join Roles ur
                       on u.[role] = ur.RoleID
                       join Wallet w on u.userID = w.UserID
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
                        rs.getString(11),
                        rs.getInt(14)
                );
            }
        } catch (Exception e) {

        }
        return null;
    }

    public Customer getUserDetailByEmail(String email) {
        String query = """
                       select*from [Users] u join Roles ur on
                       u.[role] = ur.RoleID
                       where u.email = ?""";
        try {
            ps = con.prepareStatement(query);
            ps.setString(1, email);
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
                        rs.getString(11)
                );
            }
        } catch (Exception e) {

        }
        return null;
    }

    public boolean UpdateUser(int uID, String fullName, String email, String phone, String address) {
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

    public boolean signup(Customer customer) {
        String sql = "INSERT INTO [Users] ([userName], [password], [fullName], [Email], [phone], [role], [address], [createdAt]) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, GETDATE())";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, customer.getUserName());
            ps.setString(2, customer.getPassword());
            ps.setString(3, customer.getFullName());
            ps.setString(4, customer.getEmail());
            ps.setString(5, customer.getPhone());
            ps.setString(6, customer.getRole());
            ps.setString(7, customer.getAddress());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Lỗi trong quá trình đăng ký: " + e.getMessage());
        }
        return false;

    }

    public boolean checkCustomerExist(String email) {
        String sql = "SELECT * FROM [Users] WHERE [Email] = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            return rs.next(); // returns true if a user exists with this email
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean UpdatePassword(int uID, String password) {
        String query = """
                       update [Users]
                       set [password] = ?
                       where userID = ?""";

        try {
            ps = con.prepareStatement(query);
            ps.setString(1, password);
            ps.setInt(2, uID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return true;
    }

    public Customer getAccountByID(int id) {
        String query = """
                       select * from [Users]
                       where userID = ?""";
        try {
            ps = con.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Customer(rs.getInt(1),
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
        return null;
    }

    public boolean ChangePassword(int user_id, String user_pass) {
        String sql = """
                     update [Users] set [password] = ?
                     where [userID] = ?""";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, user_pass);
            ps.setInt(2, user_id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return true;
    }

    public static void main(String[] args) {
        CustomerDAO dao = new CustomerDAO();
        System.out.println(dao.getUserDetailByEmail("tranhuy2ca2@gmail.com"));
    }
}
