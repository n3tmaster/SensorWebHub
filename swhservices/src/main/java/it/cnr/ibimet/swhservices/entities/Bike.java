package it.cnr.ibimet.swhservices.entities;

import it.cnr.ibimet.dbutils.TDBManager;
import it.lr.libs.DBManager.ParameterType;

import java.sql.SQLException;

public class Bike {
	private String nomeBike;
	private int id_bike_sensor;
	private TDBManager tdbm;
	
	public Bike(TDBManager tdbm){
		this.tdbm=tdbm;
	}

	public Bike(TDBManager tdbm, String nomeBike) throws SQLException{
		this(tdbm);
		this.nomeBike=nomeBike;

		getBikeInfo();
	}

	public String getNomeBike() {
		return nomeBike;
	}

	public void setNomeBike(String nomeBike) {
		this.nomeBike = nomeBike;
	}

	public int getId_bike_sensor() {
		return id_bike_sensor;
	}
	
	public void setId_bike_sensor(int id_bike_sensor) {
		this.id_bike_sensor = id_bike_sensor;
	}

	public void getBikeInfo() throws SQLException{

		String sqlString = "select id_mobile_station from mobile_stations where nome=? ";
		
		tdbm.setPreparedStatementRef(sqlString);

		tdbm.setParameter(ParameterType.STRING,this.nomeBike, 1);
		tdbm.runPreparedQuery();
		
		if(tdbm.next()){
			this.id_bike_sensor=tdbm.getInteger(1);
		}else{
			this.id_bike_sensor=-1;
		}
			
	}
	
}
