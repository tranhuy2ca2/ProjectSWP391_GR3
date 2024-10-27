/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDateTime;

/**
 *
 * @author TTT
 */
public class Transaction {
    private int transactionID;
    private int userID;
    private int money;
    private LocalDateTime publishdate;
    private String userName;
    private int transactiontypeID;
    private String transactiontypeName;

    public Transaction() {
    }

    public Transaction(int transactionID, int userID, int money, LocalDateTime publishdate, String userName, 
            int transactiontypeID, String transactiontypeName) {
        this.transactionID = transactionID;
        this.userID = userID;
        this.money = money;
        this.publishdate = publishdate;
        this.userName = userName;
        this.transactiontypeID = transactiontypeID;
        this.transactiontypeName = transactiontypeName;
    }


    public int getTransactionID() {
        return transactionID;
    }

    public void setTransactionID(int transactionID) {
        this.transactionID = transactionID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getMoney() {
        return money;
    }

    public void setMoney(int money) {
        this.money = money;
    }

    public LocalDateTime getPublishdate() {
        return publishdate;
    }

    public void setPublishdate(LocalDateTime publishdate) {
        this.publishdate = publishdate;
    }


    public int getTransactiontypeID() {
        return transactiontypeID;
    }

    public void setTransactiontypeID(int transactiontypeID) {
        this.transactiontypeID = transactiontypeID;
    }

    public String getTransactiontypeName() {
        return transactiontypeName;
    }

    public void setTransactiontypeName(String transactiontypeName) {
        this.transactiontypeName = transactiontypeName;
    }

    @Override
    public String toString() {
        return "Transaction{" + "transactionID=" + transactionID + ", userID=" + userID + ", userName=" + userName + ", "
                + "money=" + money + ", publishdate=" + publishdate + ", transactiontypeID=" + transactiontypeID + ", "
                + "transactiontypeName=" + transactiontypeName + '}';
    }

}
