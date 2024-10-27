/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author TTT
 */
public class Wallet {
    private int walletID;
    private int userID;
    private int money;

    public Wallet() {
    }

    public Wallet(int walletID, int userID, int money) {
        this.walletID = walletID;
        this.userID = userID;
        this.money = money;
    }
    

    public int getWalletID() {
        return walletID;
    }

    public void setWalletID(int walletID) {
        this.walletID = walletID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getMoney() {
        return money;
    }

    public void setMoney(int money) {
        this.money = money;
    }

    @Override
    public String toString() {
        return "Wallet{" + "walletID=" + walletID + ", userID=" + userID + ", money=" + money + '}';
    }
    
}
