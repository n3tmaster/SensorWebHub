package it.cnr.ibimet.bikeclimate.entities;


import it.cnr.ibimet.bikeclimate.dbutils.TDBManager;
import it.lr.libs.DBManager.ParameterType;

import java.sql.SQLException;
import java.util.Calendar;
import java.util.GregorianCalendar;

public class BikeDataServlet {
private GregorianCalendar dataDato;
private String dataDatoStr;
private int id_mobile_station;
private int co2;
private double tair;
private double rad;
private double noise;
private String gpsstring;
private double utc;
private double longitudine;
private double latitudine;
private String nome_mobile_station;

private Bike questaBike;
private TDBManager tdbm;

public BikeDataServlet(){
	super();
	this.tdbm=null;
}

public BikeDataServlet(TDBManager tdbm){
	this();
	this.tdbm=tdbm;

}

public BikeDataServlet(int anno, int mese, int giorno, int ora, int minuti,
 int id_mobile_station,
 int co2,
 double tair,
 double rad,
 double noise,
 String gpsstring,
 double utc,
 String longitudine,
 String latitudine, TDBManager tdbm){
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

	this.rad=rad;
	this.noise=noise;
	this.gpsstring=gpsstring;
	this.utc=utc;

	String datoStr=longitudine;
	int datoInt=Integer.parseInt(datoStr.substring(0,3));
	double datoDouble = Double.parseDouble(datoStr.substring(3));
	datoDouble=datoDouble/60;


	this.longitudine=datoInt+datoDouble;


	datoStr=latitudine;

	datoInt=Integer.parseInt(datoStr.substring(0,2));
	datoDouble = Double.parseDouble(datoStr.substring(2));
	datoDouble=datoDouble/60;

	this.latitudine=datoInt+datoDouble;

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
		this.questaBike=new Bike(this.tdbm, nome_mobile_station);

		this.id_mobile_station=this.questaBike.getId_bike_sensor();
	}
}

public void calcolaID() throws SQLException{
	this.questaBike=new Bike(this.tdbm, this.nome_mobile_station);

	this.id_mobile_station=this.questaBike.getId_bike_sensor();
}

public TDBManager getTdbm() {
	return tdbm;
}

public void setTdbm(TDBManager tdbm) {
	this.tdbm = tdbm;
}

public void insertDato() throws SQLException{
	
	
	
	String sqlString = "insert into dati (data, id_mobile_station, co2, "+
					"tair, rad, noise, gpsstring, the_geom,utc) "+
					"values "+
					"(?,?,?,"+  
					"?,?,?,?,"+
					"ST_GeomFromText('POINT("+ this.longitudine+" "+ this.latitudine+")',4326),?)";
	System.out.println("POINT("+ this.longitudine+" "+ this.latitudine+")");
	tdbm.setPreparedStatementRef(sqlString);
	
	tdbm.setParameter(ParameterType.DATE, this.dataDato, 1);
	tdbm.setParameter(ParameterType.INT, ""+this.id_mobile_station, 2);
	tdbm.setParameter(ParameterType.INT, ""+this.co2, 3);
	tdbm.setParameter(ParameterType.DOUBLE, ""+this.tair, 4);
	tdbm.setParameter(ParameterType.DOUBLE, ""+this.rad, 5);
	tdbm.setParameter(ParameterType.DOUBLE, ""+this.noise, 6);
	tdbm.setParameter(ParameterType.STRING, this.gpsstring, 7);
	tdbm.setParameter(ParameterType.DOUBLE, ""+this.utc, 8);
	tdbm.performInsert();
	
}

public void insertDatoNoGeo() throws SQLException{
	
	
	
	String sqlString = "insert into dati_no_geo (data, id_mobile_station, co2, "+
					"tair, rad, noise) "+
					"values "+
					"(?,?,?,"+  
					"?,?,?)";
	
	tdbm.setPreparedStatementRef(sqlString);
	
	tdbm.setParameter(ParameterType.DATE, this.dataDato, 1);
	tdbm.setParameter(ParameterType.INT, ""+this.id_mobile_station, 2);
	tdbm.setParameter(ParameterType.INT, ""+this.co2, 3);
	tdbm.setParameter(ParameterType.DOUBLE, ""+this.tair, 4);
	tdbm.setParameter(ParameterType.DOUBLE, ""+this.rad, 5);
	tdbm.setParameter(ParameterType.DOUBLE, ""+this.noise, 6);
	
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

public int getCo2() {
	return co2;
}

public void setCo2(int co2) {
	this.co2 = co2;
}

public double getTair() {
	return tair;
}

public void setTair(double tair) {
	this.tair = tair;
}

public double getRad() {
	return rad;
}

public void setRad(double rad) {
	this.rad = rad;
}

public double getNoise() {
	return noise;
}

public void setNoise(double noise) {
	this.noise = noise;
}

public String getGpsstring() {
	return gpsstring;
}

public void setGpsstring(String gpsstring) {
	this.gpsstring = gpsstring;
}

public double getUtc() {
	return utc;
}

public void setUtc(double utc) {
	this.utc = utc;
}

public double getLongitudine() {
	
	
	
	return longitudine;
}

public void setLongitudine(String longitudine) {
	
	
	String datoStr=longitudine;
//	System.out.println("Longitudine : "+datoStr.substring(0,3)+" "+datoStr.substring(3));
	
	int datoInt=Integer.parseInt(datoStr.substring(0,3));
	double datoDouble = Double.parseDouble(datoStr.substring(3));
	datoDouble=datoDouble/60;
	
	
	this.longitudine=datoInt+datoDouble;

}

public double getLatitudine() {
	
	
	return latitudine;
}

public void setLatitudine(String latitudine) {
	
	String datoStr=latitudine;
//	System.out.println("Latitudine : "+datoStr.substring(0,2)+" "+datoStr.substring(2));
	int datoInt=Integer.parseInt(datoStr.substring(0,2));
	double datoDouble = Double.parseDouble(datoStr.substring(2));
	datoDouble=datoDouble/60;
	
	this.latitudine=datoInt+datoDouble;

}
	
	
}
