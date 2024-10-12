package model;
public class ZoningTypes {
    private int zoningID;
    private String zoningCode;
    private String zoningDescription;

    public ZoningTypes() {
    }

    public ZoningTypes(int zoningID, String zoningCode, String zoningDescription) {
        this.zoningID = zoningID;
        this.zoningCode = zoningCode;
        this.zoningDescription = zoningDescription;
    }

    public int getZoningID() {
        return zoningID;
    }

    public void setZoningID(int zoningID) {
        this.zoningID = zoningID;
    }

    public String getZoningCode() {
        return zoningCode;
    }

    public void setZoningCode(String zoningCode) {
        this.zoningCode = zoningCode;
    }

    public String getZoningDescription() {
        return zoningDescription;
    }

    public void setZoningDescription(String zoningDescription) {
        this.zoningDescription = zoningDescription;
    }

    @Override
    public String toString() {
        return "ZoningTypes{" + "zoningID=" + zoningID + ", zoningCode=" + zoningCode + ", zoningDescription=" + zoningDescription + '}';
    }
}
