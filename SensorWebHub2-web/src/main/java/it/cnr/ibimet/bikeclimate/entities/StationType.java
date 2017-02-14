/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.cnr.ibimet.bikeclimate.entities;

/**
 *
 * @author lerocchi
 */
public enum StationType {
    BIKE ("bike"),
    GARBAGE ("garbage"),
    BUS ("bus"),
    POLICE ("police"),
    JEEP ("jeep"),
    COVARIANCE ("covariance"),
    STATION ("station"),
    TOTEM ("totem"),
    TAXI ("taxi"),
    WATCH ("watch"),
    TRAM ("tram"),
    PHOTOVOLTAIC ("photovoltaic");
    
    private String thisType;

    StationType(String thisType){
        this.thisType = thisType;
    }

    public static StationType getBIKE() {
        return BIKE;
    }

    public static StationType getGARBAGE() {
        return GARBAGE;
    }

    public static StationType getBUS() {
        return BUS;
    }

    public static StationType getPOLICE() {
        return POLICE;
    }

    public static StationType getJEEP() {
        return JEEP;
    }

    public static StationType getCOVARIANCE() {
        return COVARIANCE;
    }

    public static StationType getSTATION() {
        return STATION;
    }

    public static StationType getTOTEM() {
        return TOTEM;
    }

    public static StationType getTAXI() {
        return TAXI;
    }

    public static StationType getWATCH() {
        return WATCH;
    }

    public static StationType getTRAM() {
        return TRAM;
    }

    public static StationType getPHOTOVOLTAIC() {
        return PHOTOVOLTAIC;
    }
    
    public String getThisType() {
        return thisType;
    }
}
