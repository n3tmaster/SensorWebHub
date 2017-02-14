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
public class FotovoltaicData {
    
    private static final String NO_DATA = "NO DATA";
    private GregorianCalendar gc;
    private String dataStr;
    private String ora;
    private byte[] the_geom;
    

 private double  upv_lst; // double precision, -- PV generator voltage
private  double pac; // precision, -- present output power
private double  uac; // double precision, -- grid voltage
private double  upv_soll; // double precision, -- PV nominal voltage
private double  fac; // double precision, -- Grid frequency
private double  zac; // double precision, -- grid impedence
private double  riso; // double precision, -- insulation resistance of pv plant before the connection to the grid
private double  uac_srr; // double precision,
private double  fac_srr; // double precision,
private  double zac_srr; // double precision,
private double  lzac; // double precision,
private double  lpv; // double precision, -- continous current
private double  netz_ein ; //double precision, -- total number of connections to the grid
private double  event_cnt; // double precision, -- 
private double  serial_nummer; // double precision, -- serial number of the sunny boy
private double  tkk_max; // double precision,
private double  upv_max; // double precision,
private double  e_total; // double precision, -- total power fed to the grid acccumulated from the day  of installation
 private double h_total; // double precision, -- total sum of operating hours in feeding operation
private double  h_on; // double precision, -- total sum of operating hours
  
private String  status; // character varying,
private String  fehler; // character varying,
private double  dzac; // double precision,
private double  iac_ist; // double precision,
private  double iac_soll;



    public FotovoltaicData(){
            super();
    }

    public FotovoltaicData(GregorianCalendar gc,  double  upv_lst,double pac,double  uac,
            double upv_soll,double  fac,double  zac,double  riso,double  uac_srr,double  fac_srr,
            double zac_srr,double  lzac,double  lpv,double  netz_ein,double  event_cnt,
            double  serial_nummer,double tkk_max,double upv_max,double e_total,
            double h_total,double h_on,String  status,String  fehler,double  dzac,double  iac_ist,
            double iac_soll){
            this();

            
          

    this.upv_lst= upv_lst; // double precision, -- PV generator voltage
    this.pac=pac; // precision, -- present output power
    this.uac=uac; // double precision, -- grid voltage
    this.upv_soll=upv_soll; // double precision, -- PV nominal voltage
    this.fac=fac; // double precision, -- Grid frequency
    this.zac=zac; // double precision, -- grid impedence
    this.riso=riso; // double precision, -- insulation resistance of pv plant before the connection to the grid
    this.uac_srr=uac_srr; // double precision,
    this.fac_srr=fac_srr; // double precision,
    this.zac_srr=zac_srr; // double precision,
    this.lzac=lzac; // double precision,
    this.lpv=lpv; // double precision, -- continous current
    this.netz_ein=netz_ein ; //double precision, -- total number of connections to the grid
    this.event_cnt=event_cnt; // double precision, -- 
    this.serial_nummer=serial_nummer; // double precision, -- serial number of the sunny boy
    this.tkk_max=tkk_max; // double precision,
    this.upv_max=upv_max; // double precision,
    this.e_total=e_total; // double precision, -- total power fed to the grid acccumulated from the day  of installation
    this.h_total=h_total; // double precision, -- total sum of operating hours in feeding operation
    this.h_on=h_on; // double precision, -- total sum of operating hours
    this.status=status; // character varying,
    this.fehler=fehler; // character varying,
    this.dzac=dzac; // double precision,
    this.iac_ist=iac_ist; // double precision,
    this.iac_soll=iac_soll;

            


    this.gc=gc;

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

    public FotovoltaicData(GregorianCalendar gc,  double  upv_lst,double pac,double  uac,
            double upv_soll,double  fac,double  zac,double  riso,double  uac_srr,double  fac_srr,
            double zac_srr,double  lzac,double  lpv,double  netz_ein,double  event_cnt,
            double  serial_nummer,double tkk_max,double upv_max,double e_total,
            double h_total,double h_on,String  status,String  fehler,double  dzac,double  iac_ist,
            double iac_soll,
                    byte[] the_geom
                    ){

            this( gc,    upv_lst, pac,  uac,
             upv_soll,  fac,  zac,  riso,  uac_srr,  fac_srr,
             zac_srr,  lzac,  lpv,  netz_ein,  event_cnt,
              serial_nummer, tkk_max, upv_max, e_total,
             h_total, h_on,  status,  fehler,  dzac,  iac_ist,
             iac_soll);


        
            this.the_geom=the_geom;
      
    }

   
	
}
