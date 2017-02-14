/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.cnr.ibimet.bikeclimate.entities;

import java.util.Calendar;
import java.util.GregorianCalendar;

/**
 *
 * @author lerocchi
 */
public class SWEData {
    
    private static final String NO_DATA = "NO DATA";
    private GregorianCalendar gc;
    private String dataStr;
    private String ora;
    private byte[] the_geom;
    private double tair_ext;
    private double hum_ext;
    private double t_flux_out_h2o; 
    private double t_flux_ret_h2o;
    private double h20_flux; 
    private double boiler_room_counter; 
    private int ash_chamber_counter; 
    private double energy_consuption; 
    private double woodchips; 
    




    public SWEData(){
            super();
    }

    public SWEData(GregorianCalendar gc, double tair_ext, double hum_ext, double t_flux_out_h2o, 
            double t_flux_ret_h2o, double h20_flux,double boiler_room_counter, int ash_chamber_counter,
            double energy_consuption, double woodchips){
            this();
        this.tair_ext=tair_ext;
        this.hum_ext=hum_ext;
        this.t_flux_out_h2o=t_flux_out_h2o; 
        this.t_flux_ret_h2o=t_flux_ret_h2o;
        this.h20_flux=h20_flux; 
        this.boiler_room_counter=boiler_room_counter; 
        this.ash_chamber_counter=ash_chamber_counter; 
        this.energy_consuption=energy_consuption; 
        this.woodchips=woodchips; 
            String a1, b1;
            if(gc.get(Calendar.MINUTE)<10)
                    a1="0"+gc.get(Calendar.MINUTE);
            else
                    a1=""+gc.get(Calendar.MINUTE);

            if(gc.get(Calendar.HOUR_OF_DAY)<10)
                    b1="0"+gc.get(Calendar.HOUR_OF_DAY);
            else
                    b1=""+gc.get(Calendar.HOUR_OF_DAY);

            this.ora=b1+":"+a1;


            if(gc.get(Calendar.DAY_OF_MONTH)<10)
                    a1="0"+gc.get(Calendar.DAY_OF_MONTH);
            else
                    a1=""+gc.get(Calendar.DAY_OF_MONTH);

            if((gc.get(Calendar.MONTH)+1)<10)
                    b1="0"+(gc.get(Calendar.MONTH)+1);
            else
                    b1=""+(gc.get(Calendar.MONTH)+1);

            this.dataStr=a1+"-"+b1+"-"+gc.get(Calendar.YEAR);



    }

    public SWEData(GregorianCalendar gc, double tair_ext, double hum_ext, double t_flux_out_h2o, 
            double t_flux_ret_h2o, double h20_flux,double boiler_room_counter, int ash_chamber_counter,
            double energy_consuption, double woodchips,
                    byte[] the_geom
                    ){

            this(gc, 
                    tair_ext, 
                    hum_ext, 
                    t_flux_out_h2o, 
                    t_flux_ret_h2o, 
                    h20_flux,
                    boiler_room_counter, 
                    ash_chamber_counter,
                    energy_consuption,
                    woodchips);


        
            this.the_geom=the_geom;
      
    }

   
	
}
