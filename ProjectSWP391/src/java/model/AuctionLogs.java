/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author FPTSHOP
 */
public class AuctionLogs {
    private int LogID, AuctionID, UserID;
    private String Action;
    private Date LogTime;

    public AuctionLogs() {
    }

    public AuctionLogs(int LogID, int AuctionID, int UserID, String Action, Date LogTime) {
        this.LogID = LogID;
        this.AuctionID = AuctionID;
        this.UserID = UserID;
        this.Action = Action;
        this.LogTime = LogTime;
    }

    public int getLogID() {
        return LogID;
    }

    public void setLogID(int LogID) {
        this.LogID = LogID;
    }

    public int getAuctionID() {
        return AuctionID;
    }

    public void setAuctionID(int AuctionID) {
        this.AuctionID = AuctionID;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public String getAction() {
        return Action;
    }

    public void setAction(String Action) {
        this.Action = Action;
    }

    public Date getLogTime() {
        return LogTime;
    }

    public void setLogTime(Date LogTime) {
        this.LogTime = LogTime;
    }
    
}
