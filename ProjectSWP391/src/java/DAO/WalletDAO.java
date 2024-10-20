/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DAL.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import model.Customer;
import model.Transaction;

/**
 *
 * @author TTT
 */
public class WalletDAO {

    private Connection con;
    PreparedStatement ps;
    ResultSet rs;
    private List<Customer> user;
    private String status = "ok";

    public WalletDAO() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception e) {
            status = "Error at connection" + e.getMessage();
        }
    }

    public boolean updateTransaction(long amount, int userID) {
        String sql = "UPDATE [Wallet] SET [MoneyWallet] = [MoneyWallet] + ? "
                + "WHERE UserID = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setLong(1, amount);
            ps.setInt(2, userID);
            ps.executeUpdate();
            // Đóng PreparedStatement sau khi thực hiện
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }

    public void insertTransactionHistory(int userID, long amount, int transactionType, String datetime) {
        String sql = "INSERT INTO TransactionHistory (UserID, Amount, TransactionType, Date) VALUES (?, ?, ?, ?)";
        try {
            // Tạo một PreparedStatement
            PreparedStatement ps = con.prepareStatement(sql);
            // Thiết lập các tham số trong câu lệnh SQL
            ps.setInt(1, userID);
            ps.setLong(2, amount);
            ps.setInt(3, transactionType);
            ps.setString(4, datetime);
            // Thực thi câu lệnh Insert
            ps.executeUpdate();
            // Đóng PreparedStatement sau khi thực hiện
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Transaction> ListTransactionByUserID(int userID) {

        List<Transaction> transaction = new ArrayList<>();
        String sql = """
                     select tr.*, u.userName, tt.TransactionTypeID, tt.TransactionTypeName from TransactionHistory tr join Users u
                     on tr.UserID = u.userID
                     join TransactionType tt on tr.TransactionType = tt.TransactionTypeID
                     where tr.UserID = ?""";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, userID);
            rs = ps.executeQuery();
            while (rs.next()) {
                transaction.add(new Transaction(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getTimestamp(5).toLocalDateTime(),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getString(8)
                ));
            }
        } catch (Exception e) {
            System.out.println("bug" + e);
        }
        return transaction;
    }
    
    public boolean WithdrawMoney(long amount, int userID) {
        String sql = "SELECT MoneyWallet FROM [Wallet] WHERE userID = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, userID);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                long currentBalance = rs.getLong("MoneyWallet");
                if (currentBalance >= amount) {
                    // Nếu số dư đủ, thực hiện trừ tiền
                    sql = "UPDATE [Wallet] SET [MoneyWallet] = [MoneyWallet] - ? WHERE userID = ?";
                    ps = con.prepareStatement(sql);
                    ps.setLong(1, amount);
                    ps.setInt(2, userID);
                    ps.executeUpdate();
                    // Đóng PreparedStatement sau khi thực hiện
                    ps.close();
                } else {
                    amount = 0;
                }
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }

    public static void main(String[] args) {
        WalletDAO dao = new WalletDAO();
        System.out.println();
    }
}
