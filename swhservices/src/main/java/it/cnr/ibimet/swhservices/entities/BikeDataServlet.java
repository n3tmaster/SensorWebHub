package it.cnr.ibimet.swhservices.entities;


import it.cnr.ibimet.dbutils.TDBManager;
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
private int    o3;
private double ntc;
private double hum_rel;
private double ds18;
private int pk;
private double rain;

private int no2;
private int co;
private int voc;
private String utcSTR;

private String gpsstring;
private double utc;
private double longitudine;
private double latitudine;
private String nome_mobile_station;

private int pm2_5;
private int pm10;


private Bike questaBike;
private TDBManager tdbm;

public BikeDataServlet(){
	super();

        this.co2 = -9999;
        this.ds18 = -9999;
        this.gpsstring = "---";
        this.latitudine = -9999;
        this.longitudine = -9999;
        this.noise = - 9999;
        this.ntc = -9999;
        this.o3 = -9999;
        this.pk = -9999;
        this.rad = -9999;
        this.tair = -9999;
        this.utc = -9999;
        this.hum_rel = -9999;
        this.rain = -9999;
        this.pm10 = -9999;
        this.pm2_5 = -9999;
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
 String latitudine, TDBManager tdbm,int o3, int pm2_5 , int pm10){

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
 String latitudine, TDBManager tdbm,int o3){
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
	this.o3 = o3;
        this.pm10 = pm10;
        this.pm2_5 = pm2_5;

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

    public int getNo2() {
        return no2;
    }

    public void setNo2(int no2) {
        this.no2 = no2;
    }

    public int getCo() {
        return co;
    }

    public void setCo(int co) {
        this.co = co;
    }

    public int getVoc() {
        return voc;
    }

    public void setVoc(int voc) {
        this.voc = voc;
    }

    public String getUtcSTR() {
        return utcSTR;
    }

    public void setUtcSTR(String utcSTR) {
        this.utcSTR = utcSTR;
    }

    public int getPm2_5() {
        return pm2_5;
    }

    public void setPm2_5(int pm2_5) {
        this.pm2_5 = pm2_5;
    }

    public int getPm10() {
        return pm10;
    }

    public void setPm10(int pm10) {
        this.pm10 = pm10;
    }

public double getRain() {
    return rain;
}

public void setRain(double rain) {
    this.rain = rain;
}

public double getHum_rel() {
    return hum_rel;
}

public void setHum_rel(double hum_rel) {
    this.hum_rel = hum_rel;
}

public double getNtc() {
	return ntc;
}

public void setNtc(double ntc) {
	this.ntc = ntc;
}

public double getDs18() {
	return ds18;
}

public void setDs18(double ds18) {
	this.ds18 = ds18;
}

public int getPk() {
	return pk;
}

public void setPk(int pk) {
	this.pk = pk;
}

public String getNome_mobile_station() {
	return nome_mobile_station;
}

public void setNome_mobile_station(String nome_mobile_station) throws SQLException {
	this.nome_mobile_station = nome_mobile_station;

	this.questaBike=new Bike(this.tdbm, nome_mobile_station);

	this.id_mobile_station=this.questaBike.getId_bike_sensor();

}

public int getO3() {
	return o3;
}

public void setO3(int o3) {
	this.o3 = o3;
}

public TDBManager getTdbm() {
	return tdbm;
}

public void setTdbm(TDBManager tdbm) {
	this.tdbm = tdbm;
}

public void insertDato() throws SQLException{
	
	
	
	String sqlString = "insert into dati (data, id_mobile_station, co2, "+
					"tair, rad, noise, gpsstring, the_geom,utc,o3,ntc,ds18,pk) "+
					"values "+
					"(?,?,?,"+  
					"?,?,?,?,"+
					"ST_GeomFromText('POINT("+ this.longitudine+" "+ this.latitudine+")',4326),"+
					"?,?,?,?,?)";
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
	tdbm.setParameter(ParameterType.INT, ""+this.o3, 9);
	tdbm.setParameter(ParameterType.DOUBLE, ""+this.ntc, 10);
	tdbm.setParameter(ParameterType.DOUBLE, ""+this.ds18,11);
	tdbm.setParameter(ParameterType.INT, ""+this.pk, 12);
	tdbm.performInsert();
	
}


public void insertDato2() throws SQLException{
	
	
	
	String sqlString = "insert into dati (data, id_mobile_station, co2, "+
					"tair, rad, noise, gpsstring, the_geom,utc,o3,ntc,ds18,pk,no2,co,voc,utcstr) "+
					"values "+
					"(?,?,?,"+  
					"?,?,?,?,"+
					"ST_GeomFromText('POINT("+ this.longitudine+" "+ this.latitudine+")',4326),"+
					"?,?,?,?,?,?,?,?,?)";
	System.out.println("POINT("+ this.longitudine+" "+ this.latitudine+")");
	tdbm.setPreparedStatementRef(sqlString);
	
	tdbm.setParameter(ParameterType.DATE,  this.dataDato, 1);
	tdbm.setParameter(ParameterType.INT, ""+this.id_mobile_station, 2);
	tdbm.setParameter(ParameterType.INT, ""+this.co2, 3);
	tdbm.setParameter(ParameterType.DOUBLE, ""+this.tair, 4);
	tdbm.setParameter(ParameterType.DOUBLE, ""+this.rad, 5);
	tdbm.setParameter(ParameterType.DOUBLE, ""+this.noise, 6);
	tdbm.setParameter(ParameterType.STRING, this.gpsstring, 7);
	tdbm.setParameter(ParameterType.DOUBLE, ""+this.utc, 8);
	tdbm.setParameter(ParameterType.INT, ""+this.o3, 9);
	tdbm.setParameter(ParameterType.DOUBLE, ""+this.ntc, 10);
	tdbm.setParameter(ParameterType.DOUBLE, ""+this.ds18,11);
	tdbm.setParameter(ParameterType.INT, ""+this.pk, 12);
        tdbm.setParameter(ParameterType.INT, ""+this.no2, 13);
        tdbm.setParameter(ParameterType.INT, ""+this.co, 14);
        tdbm.setParameter(ParameterType.INT, ""+this.voc, 15);
        tdbm.setParameter(ParameterType.STRING, ""+this.utcSTR, 16);
        
	tdbm.performInsert();
	
}

public void insertDato3() throws SQLException{
	
	
	
	String sqlString = "insert into dati (data, id_mobile_station, co2, "+
					"tair, rad, noise, gpsstring, the_geom,utc,o3,ntc,ds18,pk,no2,co,voc,utcstr,pm2_5,pm10) "+
					"values "+
					"(?,?,?,"+  
					"?,?,?,?,"+
					"ST_GeomFromText('POINT("+ this.longitudine+" "+ this.latitudine+")',4326),"+
					"?,?,?,?,?,?,?,?,?,?,?)";
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
	tdbm.setParameter(ParameterType.INT, ""+this.o3, 9);
	tdbm.setParameter(ParameterType.DOUBLE, ""+this.ntc, 10);
	tdbm.setParameter(ParameterType.DOUBLE, ""+this.ds18,11);
	tdbm.setParameter(ParameterType.INT, ""+this.pk, 12);
        tdbm.setParameter(ParameterType.INT, ""+this.no2, 13);
        tdbm.setParameter(ParameterType.INT, ""+this.co, 14);
        tdbm.setParameter(ParameterType.INT, ""+this.voc, 15);
        tdbm.setParameter(ParameterType.STRING, ""+this.utcSTR, 16);
        tdbm.setParameter(ParameterType.INT, ""+this.pm2_5, 17);
        tdbm.setParameter(ParameterType.INT, ""+this.pm10, 18);
        
	tdbm.performInsert();
	
}


public void insertDatoNoGeo() throws SQLException{
	
	
	
	String sqlString = "insert into dati_no_geo (data, id_mobile_station, co2, "+
					"tair, rad, noise,o3) "+
					"values "+
					"(?,?,?,"+  
					"?,?,?,?)";
	
	tdbm.setPreparedStatementRef(sqlString);
	
	tdbm.setParameter(ParameterType.DATE, this.dataDato, 1);
	tdbm.setParameter(ParameterType.INT, ""+this.id_mobile_station, 2);
	tdbm.setParameter(ParameterType.INT, ""+this.co2, 3);
	tdbm.setParameter(ParameterType.DOUBLE, ""+this.tair, 4);
	tdbm.setParameter(ParameterType.DOUBLE, ""+this.rad, 5);
	tdbm.setParameter(ParameterType.DOUBLE, ""+this.noise, 6);
	tdbm.setParameter(ParameterType.INT, ""+this.o3, 7);
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
