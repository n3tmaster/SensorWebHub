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
public enum MacroType {
    MOBILE ("M"),
    FIXED ("T"),
    EDDY ("E");
    
    private final String thisType;

    MacroType(String thisType){
        this.thisType = thisType;
    }

    public static MacroType getMOBILE() {
        return MOBILE;
    }

    public static MacroType getFIXED() {
        return FIXED;
    }

    public static MacroType getEDDY() {
        return EDDY;
    }
    
    public String getThisType() {
        return thisType;
    }
    
    
    
}
