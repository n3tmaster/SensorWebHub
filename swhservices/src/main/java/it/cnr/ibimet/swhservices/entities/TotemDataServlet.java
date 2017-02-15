package it.cnr.ibimet.swhservices.entities;


import it.cnr.ibimet.dbutils.TDBManager;
import it.lr.libs.DBManager.ParameterType;

import java.sql.SQLException;
import java.util.Calendar;
import java.util.GregorianCalendar;

public class TotemDataServlet {
private GregorianCalendar dataDato;
private String dataDatoStr;
private int id_mobile_station;
private int co2;
private double tair;
private double rad;
private double noise;
private int    o3;
private double hum_rel;
private double rain;
private double utc;
private String nome_mobile_station;
private Totem questaTotem;
private double ntc;
private int pk;
private int k_s;
private double wind;
//private double precipitazione;
private double rad_solare;
private double bagnatura_fogliare;
private double solar_wm2_avg;
private double solar_wm2_max;
private double solar_w2_avg;
private double solar_w_2_max;
private double rs_solar_avg;
private double rs_solar_max;
private double hb_r3_w_avg;
private double batt_min_level;
private double pt100_sup_avg;
private double ds18;

private int co;
private int no2;
private int voc;
private TDBManager tdbm;

public TotemDataServlet(){
	super();


        this.co2 = -9999;
        this.noise = - 9999;
        this.o3 = -9999;

        this.rad = -9999;
        this.tair = -9999;
        this.utc = -9999;


        this.rain = -9999;
        this.pk= -9999;
        this.ntc = -9999;

        this.k_s= -9999;
        this.wind= -9999;
        this.rad_solare= -9999;

        this.bagnatura_fogliare= -9999;
        this.solar_wm2_avg= -9999;
        this.solar_wm2_max= -9999;

        this.solar_w2_avg= -9999;
        this.solar_w_2_max= -9999;
        this.rs_solar_avg= -9999;

        this.rs_solar_max= -9999;
        this.hb_r3_w_avg= -9999;
        this.batt_min_level= -9999;

        this.pt100_sup_avg= -9999;
        this.ds18 = -9999;
}

public TotemDataServlet(TDBManager tdbm){
	this();
	this.tdbm=tdbm;

}

public TotemDataServlet(int anno, int mese, int giorno, int ora, int minuti,
 int id_mobile_station,
 int co2,
 double tair,
 double rad,
 double noise,

 double utc,
 TDBManager tdbm,int o3){
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

	this.utc=utc;
	this.o3 = o3;





	this.dataDato = new GregorianCalendar();
	this.dataDato.set(Calendar.YEAR,anno);
	this.dataDato.set(Calendar.MONTH, mese);
	this.dataDato.set(Calendar.DAY_OF_MONTH, giorno);
	this.dataDato.set(Calendar.HOUR_OF_DAY, ora);
	this.dataDato.set(Calendar.MINUTE,minuti);




}

    public double getNtc() {
        return ntc;
    }

    public void setNtc(double ntc) {
        this.ntc = ntc;
    }

    public int getCo() {
        return co;
    }

    public void setCo(int co) {
        this.co = co;
    }

    public int getNo2() {
        return no2;
    }

    public void setNo2(int no2) {
        this.no2 = no2;
    }

    public int getVoc() {
        return voc;
    }

    public void setVoc(int voc) {
        this.voc = voc;
    }

    public double getDs18() {
        return ds18;
    }

    public void setDs18(double ds18) {
        this.ds18 = ds18;
    }

    public String getDataDatoStr() {
        return dataDatoStr;
    }

    public void setDataDatoStr(String dataDatoStr) {
        this.dataDatoStr = dataDatoStr;
    }

    public Totem getQuestaTotem() {
        return questaTotem;
    }

    public void setQuestaTotem(Totem questaTotem) {
        this.questaTotem = questaTotem;
    }

    public int getPk() {
        return pk;
    }

    public void setPk(int pk) {
        this.pk = pk;
    }

   // public double getPrecipitazione() {
   //     return precipitazione;
   // }

   // public void setPrecipitazione(double precipitazione) {
   //     this.precipitazione = precipitazione;
   // }

    public int getK_s() {
        return k_s;
    }

    public void setK_s(int k_s) {
        this.k_s = k_s;
    }

    public double getWind() {
        return wind;
    }

    public void setWind(double wind) {
        this.wind = wind;
    }

   public double getRad_solare() {
        return rad_solare;
   }

    public void setRad_solare(double rad_solare) {
        this.rad_solare = rad_solare;
    }

    public double getBagnatura_fogliare() {
        return bagnatura_fogliare;
    }

    public void setBagnatura_fogliare(double bagnatura_fogliare) {
        this.bagnatura_fogliare = bagnatura_fogliare;
    }

    public double getSolar_wm2_avg() {
        return solar_wm2_avg;
    }

    public void setSolar_wm2_avg(double solar_wm2_avg) {
        this.solar_wm2_avg = solar_wm2_avg;
    }

    public double getSolar_wm2_max() {
        return solar_wm2_max;
    }

    public void setSolar_wm2_max(double solar_wm2_max) {
        this.solar_wm2_max = solar_wm2_max;
    }

    public double getSolar_w2_avg() {
        return solar_w2_avg;
    }

    public void setSolar_w2_avg(double solar_w2_avg) {
        this.solar_w2_avg = solar_w2_avg;
    }

    public double getSolar_w_2_max() {
        return solar_w_2_max;
    }

    public void setSolar_w_2_max(double solar_w_2_max) {
        this.solar_w_2_max = solar_w_2_max;
    }

    public double getRs_solar_avg() {
        return rs_solar_avg;
    }

    public void setRs_solar_avg(double rs_solar_avg) {
        this.rs_solar_avg = rs_solar_avg;
    }

    public double getRs_solar_max() {
        return rs_solar_max;
    }

    public void setRs_solar_max(double rs_solar_max) {
        this.rs_solar_max = rs_solar_max;
    }

    public double getHb_r3_w_avg() {
        return hb_r3_w_avg;
    }

    public void setHb_r3_w_avg(double hb_r3_w_avg) {
        this.hb_r3_w_avg = hb_r3_w_avg;
    }

    public double getBatt_min_level() {
        return batt_min_level;
    }

    public void setBatt_min_level(double batt_min_level) {
        this.batt_min_level = batt_min_level;
    }

    public double getPt100_sup_avg() {
        return pt100_sup_avg;
    }

    public void setPt100_sup_avg(double pt100_sup_avg) {
        this.pt100_sup_avg = pt100_sup_avg;
    }

public double getHum_rel() {
    return hum_rel;
}

public void setHum_rel(double hum_rel) {
    this.hum_rel = hum_rel;
}

public double getRain() {
    return rain;
}

public void setRain(double rain) {
    this.rain = rain;
}

public String getNome_mobile_station() {
	return nome_mobile_station;
}

public void setNome_mobile_station(String nome_mobile_station) throws SQLException {

	this.nome_mobile_station = nome_mobile_station;

	this.questaTotem=new Totem(this.tdbm, nome_mobile_station);

	this.id_mobile_station=this.questaTotem.getId_bike_sensor();

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

public void insertDato2() throws SQLException{
    String sqlString = "insert into dati_stazioni_fisse (data, id_mobile_station, co2,"+
					"tair, rad, noise," +
                                        "o3,ntc,ds18," +
                                        "pk,no2,co,voc) " +
                                        "values "+
					"(?,?,?,"+  
					"?,?,?,"+
                                        "?,?,?,"+
                                        "?,?,?,?)";
    tdbm.setPreparedStatementRef(sqlString);
	
        
        //data, id_station,co2
	tdbm.setParameter(ParameterType.DATE, this.dataDato, 1);
	tdbm.setParameter(ParameterType.INT, ""+this.id_mobile_station, 2);
        if(this.co2 == -9999)
            tdbm.setParameterNull(3);
        else
            tdbm.setParameter(ParameterType.INT, ""+this.co2, 3);
        
        //tair, rad, noise,
        if(this.tair == -9999)
            tdbm.setParameterNull(4);
        else
            tdbm.setParameter(ParameterType.DOUBLE, ""+this.tair, 4);
        
        if(this.rad == -9999)
            tdbm.setParameterNull(5);
        else
            tdbm.setParameter(ParameterType.DOUBLE, ""+this.rad, 5);
        
        if(this.noise == -9999)
            tdbm.setParameterNull(6);
        else
            tdbm.setParameter(ParameterType.DOUBLE, ""+this.noise, 6);
        
        //o3,ntc,ds18,
        if(this.o3 == -9999)
            tdbm.setParameterNull(7);
        else
            tdbm.setParameter(ParameterType.INT, ""+this.o3, 7);
        
        if(this.ntc == -9999)
            tdbm.setParameterNull(8);
        else
            tdbm.setParameter(ParameterType.DOUBLE, ""+this.ntc, 8);
        
        if(this.ds18 == -9999)
            tdbm.setParameterNull(9);
        else
            tdbm.setParameter(ParameterType.DOUBLE, ""+this.ds18, 9);
        
        //pk,utc,k_s,
        if(this.pk == -9999)
            tdbm.setParameterNull(10);
        else
            tdbm.setParameter(ParameterType.INT, ""+this.pk, 10);
        
        //pk,utc,k_s,
        if(this.no2 == -9999)
            tdbm.setParameterNull(11);
        else
            tdbm.setParameter(ParameterType.INT, ""+this.no2, 11);
        //pk,utc,k_s,
        if(this.co == -9999)
            tdbm.setParameterNull(12);
        else
            tdbm.setParameter(ParameterType.INT, ""+this.co, 12);
        //pk,utc,k_s,
        if(this.voc == -9999)
            tdbm.setParameterNull(13);
        else
            tdbm.setParameter(ParameterType.INT, ""+this.voc, 13);
        
        
	tdbm.performInsert();
	
}

public void insertDato() throws SQLException{
	
	
	
	String sqlString = "insert into dati_stazioni_fisse (data, id_mobile_station, co2,"+
					"tair, rad, noise," +
                                        "o3,ntc,ds18," +
                                        "pk,utc,k_s," +
                                        "wind,precipitazione,rad_solare," +
                                        "bagnatura_fogliare,solar_wm2_avg,solar_wm2_max," +
                                        "solar_w2_avg,solar_w_2_max,rs_solar_avg," +
                                        "rs_solar_max,hb_r3_w_avg,batt_min_level," +
                                        "pt100_sup_avg) " +
                                        "values "+
					"(?,?,?,"+  
					"?,?,?,"+
                                        "?,?,?,"+
                                        "?,?,?,"+
                                        "?,?,?,"+
                                        "?,?,?,"+
                                        "?,?,?,"+
                                        "?,?,?,"+
                                        "?)";
	
	tdbm.setPreparedStatementRef(sqlString);
	
        
        //data, id_station,co2
	tdbm.setParameter(ParameterType.DATE, this.dataDato, 1);
	tdbm.setParameter(ParameterType.INT, ""+this.id_mobile_station, 2);
	if(this.co2 == -9999)
            tdbm.setParameterNull(3);
        else
            tdbm.setParameter(ParameterType.INT, ""+this.co2, 3);
        
        //tair, rad, noise,
        if(this.tair == -9999)
            tdbm.setParameterNull(4);
        else
            tdbm.setParameter(ParameterType.DOUBLE, ""+this.tair, 4);
        
        if(this.rad == -9999)
            tdbm.setParameterNull(5);
        else
            tdbm.setParameter(ParameterType.DOUBLE, ""+this.rad, 5);
        
        if(this.noise == -9999)
            tdbm.setParameterNull(6);
        else
            tdbm.setParameter(ParameterType.DOUBLE, ""+this.noise, 6);
        
        //o3,ntc,ds18,
        if(this.o3 == -9999)
            tdbm.setParameterNull(7);
        else
            tdbm.setParameter(ParameterType.INT, ""+this.o3, 7);
        
        if(this.ntc == -9999)
            tdbm.setParameterNull(8);
        else
            tdbm.setParameter(ParameterType.DOUBLE, ""+this.ntc, 8);
        
        if(this.ds18 == -9999)
            tdbm.setParameterNull(9);
        else
            tdbm.setParameter(ParameterType.DOUBLE, ""+this.ds18, 9);
        
        //pk,utc,k_s,
        if(this.pk == -9999)
            tdbm.setParameterNull(10);
        else
            tdbm.setParameter(ParameterType.INT, ""+this.pk, 10);
        
        if(this.utc == -9999)
            tdbm.setParameterNull(11);
        else
            tdbm.setParameter(ParameterType.DOUBLE, ""+this.utc, 11);
        
        if(this.k_s == -9999)
            tdbm.setParameterNull(12);
        else
            tdbm.setParameter(ParameterType.INT, ""+this.k_s, 12);
        
        //wind,rain,rad_solare,
        if(this.wind == -9999)
            tdbm.setParameterNull(13);
        else
            tdbm.setParameter(ParameterType.DOUBLE, ""+this.wind, 13);
        
        if(this.rain == -9999)
            tdbm.setParameterNull(14);
        else
            tdbm.setParameter(ParameterType.DOUBLE, ""+this.rain, 14);
        
        if(this.rad_solare == -9999)
            tdbm.setParameterNull(15);
        else
            tdbm.setParameter(ParameterType.DOUBLE, ""+this.rad_solare, 15);
        
         //bagnatura_fogliare,solar_wm2_avg,solar_wm2_max,
        if(this.bagnatura_fogliare == -9999)
            tdbm.setParameterNull(16);
        else
            tdbm.setParameter(ParameterType.DOUBLE, ""+this.bagnatura_fogliare, 16);
        
        if(this.solar_wm2_avg == -9999)
            tdbm.setParameterNull(17);
        else
            tdbm.setParameter(ParameterType.DOUBLE, ""+this.solar_wm2_avg, 17);
        
        if(this.solar_wm2_max == -9999)
            tdbm.setParameterNull(18);
        else
            tdbm.setParameter(ParameterType.DOUBLE, ""+this.solar_wm2_max, 18);
        
	 //solar_w2_avg,solar_w_2_max,rs_solar_avg,
        if(this.solar_w2_avg == -9999)
            tdbm.setParameterNull(19);
        else
            tdbm.setParameter(ParameterType.DOUBLE, ""+this.solar_w2_avg, 19);
        
        if(this.solar_w_2_max == -9999)
            tdbm.setParameterNull(20);
        else
            tdbm.setParameter(ParameterType.DOUBLE, ""+this.solar_w_2_max, 20);
        
        if(this.rs_solar_avg == -9999)
            tdbm.setParameterNull(21);
        else
            tdbm.setParameter(ParameterType.DOUBLE, ""+this.rs_solar_avg, 21);
        
        //rs_solar_max,hb_r3_w_avg,batt_min_level,
        if(this.rs_solar_max == -9999)
            tdbm.setParameterNull(22);
        else
            tdbm.setParameter(ParameterType.DOUBLE, ""+this.rs_solar_max, 22);
        
        if(this.hb_r3_w_avg == -9999)
            tdbm.setParameterNull(23);
        else
            tdbm.setParameter(ParameterType.DOUBLE, ""+this.hb_r3_w_avg, 23);
        
        if(this.batt_min_level == -9999)
            tdbm.setParameterNull(24);
        else
            tdbm.setParameter(ParameterType.DOUBLE, ""+this.batt_min_level, 24);
        
        //pt100_sup_avg
        if(this.pt100_sup_avg == -9999)
            tdbm.setParameterNull(25);
        else
            tdbm.setParameter(ParameterType.DOUBLE, ""+this.pt100_sup_avg, 25);
        
        
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


public double getUtc() {
	return utc;
}

public void setUtc(double utc) {
	this.utc = utc;
}



	
}
