package it.cnr.ibimet.swhservices.entities;


import it.cnr.ibimet.dbutils.TDBManager;
import it.lr.libs.DBManager.ParameterType;

import java.sql.SQLException;
import java.util.Calendar;
import java.util.GregorianCalendar;

public class EddyDataServlet {
private GregorianCalendar dataDato;
private String dataDatoStr;
private int id_mobile_station;

private double tair;
private double co2;
private double h2o;
private double ustar;
private double co2_flux;
private double h2o_flux;
private double le;
private double hx;
private double tau;

private int pacchetti;
private double wind;
private double wind_ang;
private int analog_3;
private int analog_4;
private String nome_mobile_station;
private Bike questaBike;
private TDBManager tdbm;



public EddyDataServlet(){
	super();
}



public EddyDataServlet(TDBManager tdbm){
	this();
	this.tdbm=tdbm;

}



public EddyDataServlet(int anno, int mese, int giorno, int ora, int minuti,
 int id_mobile_station,
 int pacchetti,
 double co2_flux,
 double hx,
 double le,
 double ustar,
 double co2,
 double wind,
 double wind_ang,
 double tair,
 int analog_3,
 int analog_4,
 TDBManager tdbm){

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
	this.co2=co2;
	this.tair=tair;
	this.pacchetti=pacchetti;
	this.co2_flux=co2_flux;
	this.hx=hx;
	this.le=le;
	this.ustar=ustar;
	this.wind=wind;
	this.wind_ang=wind_ang;
	this.analog_3=analog_3;
	this.analog_4=analog_4;


	this.dataDato = new GregorianCalendar();
	this.dataDato.set(Calendar.YEAR,anno);
	this.dataDato.set(Calendar.MONTH, mese);
	this.dataDato.set(Calendar.DAY_OF_MONTH, giorno);
	this.dataDato.set(Calendar.HOUR_OF_DAY, ora);
	this.dataDato.set(Calendar.MINUTE,minuti);




}



public EddyDataServlet(int anno, int mese, int giorno, int ora, int minuti,
		 int id_mobile_station,
		 double tair,
		 double co2,
		 double h2o,
		 double ustar,
		 double co2_flux,
		 double h2o_flux,
		 double le,
		 double hx,
		 double tau,

		 int pacchetti,
		 double wind,
		 double wind_ang,
		 int analog_3,
		 int analog_4,
		 TDBManager tdbm){

			this(anno, mese, giorno, ora, minuti,
					  id_mobile_station,
					  pacchetti,
					  co2_flux,
					  hx,
					  le,
					  ustar,
					  co2,
					  wind,
					  wind_ang,
					  tair,
					  analog_3,
					  analog_4,
					  tdbm);



			this.h2o=h2o;
			this.h2o_flux=h2o_flux;
			this.tau=tau;


		}

public double getH2o() {
	return h2o;
}

public void setH2o(double h2o) {
	this.h2o = h2o;
}

public double getH2o_flux() {
	return h2o_flux;
}

public void setH2o_flux(double h2o_flux) {
	this.h2o_flux = h2o_flux;
}

public double getTau() {
	return tau;
}

public void setTau(double tau) {
	this.tau = tau;
}

public String getDataDatoStr() {
	return dataDatoStr;
}

public void setDataDatoStr(String dataDatoStr) {
	this.dataDatoStr = dataDatoStr;
}

public double getCo2() {
	return co2;
}

public void setCo2(double co2) {
	this.co2 = co2;
}

public int getPacchetti() {
	return pacchetti;
}

public void setPacchetti(int pacchetti) {
	this.pacchetti = pacchetti;
}

public double getCo2_flux() {
	return co2_flux;
}

public void setCo2_flux(double co2_flux) {
	this.co2_flux = co2_flux;
}

public double getHx() {
	return hx;
}

public void setHx(double hx) {
	this.hx = hx;
}

public double getLe() {
	return le;
}

public void setLe(double le) {
	this.le = le;
}

public double getUstar() {
	return ustar;
}

public void setUstar(double ustar) {
	this.ustar = ustar;
}

public double getWind() {
	return wind;
}

public void setWind(double wind) {
	this.wind = wind;
}

public double getWind_ang() {
	return wind_ang;
}

public void setWind_ang(double wind_ang) {
	this.wind_ang = wind_ang;
}

public int getAnalog_3() {
	return analog_3;
}

public void setAnalog_3(int analog_3) {
	this.analog_3 = analog_3;
}

public int getAnalog_4() {
	return analog_4;
}

public void setAnalog_4(int analog_4) {
	this.analog_4 = analog_4;
}

public Bike getQuestaBike() {
	return questaBike;
}

public void setQuestaBike(Bike questaBike) {
	this.questaBike = questaBike;
}

public String getNome_mobile_station() {
	return nome_mobile_station;
}

public void setNome_mobile_station(String nome_mobile_station) throws SQLException {
	this.nome_mobile_station = nome_mobile_station;

	this.questaBike=new Bike(this.tdbm, nome_mobile_station);

	this.id_mobile_station=this.questaBike.getId_bike_sensor();

}

public TDBManager getTdbm() {
	return tdbm;
}

public void setTdbm(TDBManager tdbm) {
	this.tdbm = tdbm;
}

public void insertDato() throws SQLException{
	
	
	
	String sqlString = "insert into dati_eddy (data, id_mobile_station, pacchetti, "+
					"co2_flux,hx,le,ustar,co2,wind,wind_ang,tair,analog_3,analog_4,tau,h2o,h2o_flux) "+
					"values "+
					"(?,?,?,?,"+  
					"?,?,?,?,"+
					"?,?,?,?,?,?,?,?)";
					
		tdbm.setPreparedStatementRef(sqlString);
	
	tdbm.setParameter(ParameterType.DATE, this.dataDato, 1);
	tdbm.setParameter(ParameterType.INT, ""+this.id_mobile_station, 2);
	tdbm.setParameter(ParameterType.INT, ""+this.pacchetti, 3);
	tdbm.setParameter(ParameterType.DOUBLE, ""+this.co2_flux, 4);
	tdbm.setParameter(ParameterType.DOUBLE, ""+this.hx, 5);
	tdbm.setParameter(ParameterType.DOUBLE, ""+this.le, 6);
	tdbm.setParameter(ParameterType.DOUBLE, ""+this.ustar, 7);
	tdbm.setParameter(ParameterType.DOUBLE, ""+this.co2, 8);
	tdbm.setParameter(ParameterType.DOUBLE, ""+this.wind, 9);
	tdbm.setParameter(ParameterType.DOUBLE, ""+this.wind_ang, 10);
	tdbm.setParameter(ParameterType.DOUBLE, ""+this.tair, 11);

	tdbm.setParameter(ParameterType.INT, ""+this.analog_3, 12);
	tdbm.setParameter(ParameterType.INT, ""+this.analog_4, 13);
	tdbm.setParameter(ParameterType.DOUBLE, ""+this.tau, 14);
	tdbm.setParameter(ParameterType.DOUBLE, ""+this.h2o, 15);
	tdbm.setParameter(ParameterType.DOUBLE, ""+this.h2o_flux, 16);
	
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


public double getTair() {
	return tair;
}

public void setTair(double tair) {
	this.tair = tair;
}


	
	
}
