package it.cnr.ibimet.swhservices.entities;

import java.io.Serializable;
import java.util.Calendar;
import java.util.GregorianCalendar;

public class BikeData implements Serializable{
	private GregorianCalendar gc;
	private String dataStr;
	private String ora;
	private double tair;
	private double noise;
	private double rad;
	private int co2;
	private String bikename;
	private int iddata;
	private int o3;
	private double ntc;
	private double ds18;
	private int pk;
	private double utc;
	
        
private int no2;
private int co;
private int voc;
private String utcSTR;
        
	private byte[] the_geom;

	public BikeData(){
		super();
	}

	public BikeData(GregorianCalendar gc, double tair, double noise, double rad, int co2, String bikename,int iddata, int o3){
		this();
		this.gc=gc;
		this.tair=tair;
		this.noise=noise;
		this.co2=co2;
		this.bikename=bikename;
		this.iddata=iddata;
		this.rad=rad;
		this.o3=o3;
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

	public BikeData(GregorianCalendar gc,
			double tair,
			double noise,
			double rad,
			int co2,
			String bikename,
			int iddata,
			int o3,
			double ntc,
			double ds18,
			int pk,
			byte[] the_geom,
			double utc){

		this(gc,
			tair,
			noise,
			rad,
			co2,
			bikename,
			iddata,
			o3);


		this.ntc=ntc;
		this.ds18=ds18;
		this.pk=pk;
		this.the_geom=the_geom;
		this.utc = utc;
	}

        public BikeData(GregorianCalendar gc,
			double tair,
			double noise,
			double rad,
			int co2,
			String bikename,
			int iddata,
			int o3,
			double ntc,
			double ds18,
			int pk,
			byte[] the_geom,
			double utc,
                        int no2,
                        int co,
                        int voc,
                        String utcstr){

		this(gc,
			tair,
			noise,
			rad,
			co2,
			bikename,
			iddata,
			o3,
                        ntc,
                        ds18,
                        pk,
                        the_geom,
                        utc);


		this.no2=no2;
                this.co=co;
                this.voc=voc;
                this.utcSTR=utcstr;
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

	public double getUtc() {
		return utc;
	}

	public void setUtc(double utc) {
		this.utc = utc;
	}

	public byte[] getThe_geom() {
		return the_geom;
	}

	public void setThe_geom(byte[] the_geom) {
		this.the_geom = the_geom;
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

	public int getO3() {
		return o3;
	}
	
	public void setO3(int o3) {
		this.o3 = o3;
	}
	
	public int getIddata() {
		return iddata;
	}
	
	public void setIddata(int iddata) {
		this.iddata = iddata;
	}
	
	public String getOra() {
		return ora;
	}

	public void setOra(String ora) {
		this.ora = ora;
	}

	public GregorianCalendar getGc() {
		return gc;
	}
	public void setGc(GregorianCalendar gc) {
		this.gc = gc;
	}
	public String getDataStr() {
		return dataStr;
	}
	public void setDataStr(String dataStr) {
		this.dataStr = dataStr;
	}
	public double getTair() {
		return tair;
	}
	public void setTair(double tair) {
		this.tair = tair;
	}
	public double getNoise() {
		return noise;
	}
	public void setNoise(double noise) {
		this.noise = noise;
	}
	public double getRad() {
		return rad;
	}
	public void setRad(double rad) {
		this.rad = rad;
	}
	public int getCo2() {
		return co2;
	}
	public void setCo2(int co2) {
		this.co2 = co2;
	}
	public String getBikename() {
		return bikename;
	}
	public void setBikename(String bikename) {
		this.bikename = bikename;
	}
	
	
}
