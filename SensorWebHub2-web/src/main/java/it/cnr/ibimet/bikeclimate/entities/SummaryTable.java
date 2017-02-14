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
public class SummaryTable {
    //TODO: aggiungere riferimento a immagini
    public static final String X="blank.png";
    public static final String O="pallino.png";
    
    private String sigla;
    
    private String valore_agrometeo, valore_climaurbano, valore_indoor, valore_clima, valore_energy;

    public SummaryTable(String sigla){
        this.sigla=sigla;
        this.valore_agrometeo=X;
        this.valore_climaurbano=X;
        this.valore_clima=X;
        this.valore_energy=X;
        this.valore_indoor=X;
    }

    public SummaryTable(String sigla,
                String valore_agrometeo,
                String valore_climaurbano,
                String valore_indoor,
                String valore_clima,
                String valore_energy){
        this(sigla);
        this.valore_agrometeo=valore_agrometeo;
        this.valore_climaurbano=valore_climaurbano;
        this.valore_clima=valore_clima;
        this.valore_energy=valore_energy;
        this.valore_indoor=valore_indoor;
    }

    public String getSigla() {
        return sigla;
    }

    public void setSigla(String sigla) {
        this.sigla = sigla;
    }

    public String getValore_agrometeo() {
        return valore_agrometeo;
    }

    public void setValore_agrometeo(String valore_agrometeo) {
        this.valore_agrometeo = valore_agrometeo;
    }

    public String getValore_climaurbano() {
        return valore_climaurbano;
    }

    public void setValore_climaurbano(String valore_climaurbano) {
        this.valore_climaurbano = valore_climaurbano;
    }

    public String getValore_indoor() {
        return valore_indoor;
    }

    public void setValore_indoor(String valore_indoor) {
        this.valore_indoor = valore_indoor;
    }

    public String getValore_clima() {
        return valore_clima;
    }

    public void setValore_clima(String valore_clima) {
        this.valore_clima = valore_clima;
    }
    
    public String getValore_energy() {
        return valore_energy;
    }
    
    public void setValore_energy(String valore_energy) {
        this.valore_energy = valore_energy;
    }

    
}
