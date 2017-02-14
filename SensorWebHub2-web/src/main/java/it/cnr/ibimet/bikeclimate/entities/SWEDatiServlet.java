package it.cnr.ibimet.bikeclimate.entities;


import it.cnr.ibimet.bikeclimate.dbutils.TDBManager;
import it.lr.libs.DBManager.ParameterType;

import java.sql.SQLException;
import java.util.Calendar;
import java.util.GregorianCalendar;

public class SWEDatiServlet {
private GregorianCalendar dataDato;
private String dataDatoStr;
private int id_mobile_station;
private String nome_mobile_station;
private double tair_ext; 
private double hum_ext;
private double t_flux_out_h2o;
private double t_flux_ret_h2o;
private double h20_flux;
private double boiler_room_counter;
private int ash_chamber_counter;
private double energy_consuption;
private double woodchips;
private SWE swe;
private TDBManager tdbm;

public SWEDatiServlet(){
	super();
	this.tdbm=null;
}

public SWEDatiServlet(TDBManager tdbm){
	this();
	this.tdbm=tdbm;

}

public SWEDatiServlet(int anno, int mese, int giorno, int ora, int minuti,
int id_mobile_station,
double tair_ext,
double hum_ext,
double  t_flux_out_h2o,
double t_flux_ret_h2o,
double  h20_flux,
int  boiler_room_counter,
int  ash_chamber_counter,
double  energy_consuption,
double  woodchips, TDBManager tdbm){
    this(tdbm);

    String meseStr, giornoStr, oraStr, minutiStr;

    if(mese<10)
            meseStr="0"+mese;
    else
            meseStr=""+mese;

    if(giorno<10)
            giornoStr="0"+giorno;
    else
            giornoStr=""+giorno;

    if(ora<10)
            oraStr="0"+ora;
    else
            oraStr=""+ora;

    if(minuti<10)
            minutiStr="0"+minuti;
    else
            minutiStr=""+minuti;

    this.dataDatoStr=anno+"-"+meseStr+"-"+giornoStr+" "+oraStr+":"+minutiStr;
    this.id_mobile_station=id_mobile_station;

    this.tair_ext=tair_ext;
    this.hum_ext=hum_ext;
    this.t_flux_out_h2o=t_flux_out_h2o;
    this.t_flux_ret_h2o=t_flux_ret_h2o;
    this. h20_flux=h20_flux;
    this.boiler_room_counter=boiler_room_counter;
    this.ash_chamber_counter=ash_chamber_counter;
    this.energy_consuption=energy_consuption;
    this.woodchips=woodchips;


    this.dataDato = new GregorianCalendar();
    this.dataDato.set(Calendar.YEAR,anno);
    this.dataDato.set(Calendar.MONTH, mese);
    this.dataDato.set(Calendar.DAY_OF_MONTH, giorno);
    this.dataDato.set(Calendar.HOUR_OF_DAY, ora);
    this.dataDato.set(Calendar.MINUTE,minuti);




}

public String getNome_mobile_station() {
	return nome_mobile_station;
}

public void setNome_mobile_station(String nome_mobile_station) throws SQLException {
    this.nome_mobile_station = nome_mobile_station;

    if(this.tdbm != null){
            System.out.println("BikeDataServlet - tdbm is null");
            this.swe=new SWE(this.tdbm, nome_mobile_station);

            this.id_mobile_station=this.swe.getId_swe();

    }
}

public void calcolaID() throws SQLException{
	this.swe=new SWE(this.tdbm, this.nome_mobile_station);

	this.id_mobile_station=this.swe.getId_swe();
}

    public String getDataDatoStr() {
        return dataDatoStr;
    }

    public void setDataDatoStr(String dataDatoStr) {
        this.dataDatoStr = dataDatoStr;
    }

    public double getTair_ext() {
        return tair_ext;
    }

    public void setTair_ext(double tair_ext) {
        this.tair_ext = tair_ext;
    }

    public double getHum_ext() {
        return hum_ext;
    }

    public void setHum_ext(double hum_ext) {
        this.hum_ext = hum_ext;
    }

    public double getT_flux_out_h2o() {
        return t_flux_out_h2o;
    }

    public void setT_flux_out_h2o(double t_flux_out_h2o) {
        this.t_flux_out_h2o = t_flux_out_h2o;
    }

    public double getT_flux_ret_h2o() {
        return t_flux_ret_h2o;
    }

    public void setT_flux_ret_h2o(double t_flux_ret_h2o) {
        this.t_flux_ret_h2o = t_flux_ret_h2o;
    }

    public double getH20_flux() {
        return h20_flux;
    }

    public void setH20_flux(double h20_flux) {
        this.h20_flux = h20_flux;
    }

    public double getBoiler_room_counter() {
        return boiler_room_counter;
    }

    public void setBoiler_room_counter(double boiler_room_counter) {
        this.boiler_room_counter = boiler_room_counter;
    }

    public double getAsh_chamber_counter() {
        return ash_chamber_counter;
    }

    public void setAsh_chamber_counter(int ash_chamber_counter) {
        this.ash_chamber_counter = ash_chamber_counter;
    }

    public double getEnergy_consuption() {
        return energy_consuption;
    }

    public void setEnergy_consuption(double energy_consuption) {
        this.energy_consuption = energy_consuption;
    }

    public double getWoodchips() {
        return woodchips;
    }

    public void setWoodchips(double woodchips) {
        this.woodchips = woodchips;
    }

    public SWE getSwe() {
        return swe;
    }

    public void setSwe(SWE swe) {
        this.swe = swe;
    }

public TDBManager getTdbm() {
	return tdbm;
}

public void setTdbm(TDBManager tdbm) {
	this.tdbm = tdbm;
}

public void insertDato() throws SQLException{
	
	
	
	String sqlString = "insert into dati_swe (data, id_mobile_station, tair_ext, "+
					"hum_ext, t_flux_out_h2o, t_flux_ret_h2o, " +
                                        "h20_flux, boiler_room_counter,ash_chamber_counter, " +
                                        "energy_consuption,woodchips) "+
					"values "+
					"(?,?,?,"+  
					"?,?,?,"+
                                        "?,?,?,"+
                                        "?,?)";

	tdbm.setPreparedStatementRef(sqlString);
	
	tdbm.setParameter(ParameterType.DATE, this.dataDato, 1);
	tdbm.setParameter(ParameterType.INT, ""+this.id_mobile_station, 2);
	tdbm.setParameter(ParameterType.DOUBLE, ""+this.tair_ext, 3);
	tdbm.setParameter(ParameterType.DOUBLE, ""+this.hum_ext, 4);
	tdbm.setParameter(ParameterType.DOUBLE, ""+this.t_flux_out_h2o, 5);
	tdbm.setParameter(ParameterType.DOUBLE, ""+this.t_flux_ret_h2o, 6);
	tdbm.setParameter(ParameterType.DOUBLE, ""+this.h20_flux, 7);
	tdbm.setParameter(ParameterType.DOUBLE, ""+this.boiler_room_counter, 8);
        tdbm.setParameter(ParameterType.INT, ""+this.ash_chamber_counter, 9);
        tdbm.setParameter(ParameterType.DOUBLE, ""+this.energy_consuption, 10);
        tdbm.setParameter(ParameterType.DOUBLE, ""+this.woodchips, 11);
        
	tdbm.performInsert();
	
}



public GregorianCalendar getDataDato() {
	return dataDato;
}

public void setDataDato(GregorianCalendar dataDato) {
	this.dataDato = dataDato;
}

public int getId_mobile_station() {
	return id_mobile_station;
}

public void setId_mobile_station(int id_mobile_station) {
	this.id_mobile_station = id_mobile_station;
}

	
	
}
