package it.cnr.ibimet.swhservices.entities;

import it.cnr.ibimet.dbutils.TDBManager;
import it.lr.libs.DBManager.ParameterType;

import java.io.Serializable;
import java.sql.SQLException;

public class Eddy implements Serializable{
	private String nomeEddy;
	private int id_bike_sensor;
	private TDBManager tdbm;
	
	

	public Eddy(TDBManager tdbm){
		this.tdbm=tdbm;
	}

	public Eddy(TDBManager tdbm, String nomeEddy) throws SQLException{
		this(tdbm);
		this.nomeEddy=nomeEddy;

		getBikeInfo();
	}

	public String getNomeEddy() {
		return nomeEddy;
	}

	public void setNomeEddy(String nomeEddy) {
		this.nomeEddy = nomeEddy;
	}

	public int getId_bike_sensor() {
		return id_bike_sensor;
	}
	
	public void setId_bike_sensor(int id_bike_sensor) {
		this.id_bike_sensor = id_bike_sensor;
	}

	public void getBikeInfo() throws SQLException{

		String sqlString = "select id_mobile_station from mobile_stations where nome=? and tipo='E' ";
		
		
		tdbm.setPreparedStatementRef(sqlString);

		tdbm.setParameter(ParameterType.STRING,this.nomeEddy, 1);
		tdbm.runPreparedQuery();
		
		if(tdbm.next()){
			this.id_bike_sensor=tdbm.getInteger(1);
		}else{
			this.id_bike_sensor=-1;
		}
			
	}
	
}
