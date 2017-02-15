package it.cnr.ibimet.swhservices.entities;

import it.cnr.ibimet.dbutils.TDBManager;
import it.lr.libs.DBManager.ParameterType;

import java.sql.SQLException;

public class Totem {
	private String nomeTotem;
	private int id_bike_sensor;
	private TDBManager tdbm;
	
	public Totem(TDBManager tdbm){
		this.tdbm=tdbm;
	}

	public Totem(TDBManager tdbm, String nomeTotem) throws SQLException{
		this(tdbm);
		this.nomeTotem=nomeTotem;

		getBikeInfo();
	}

	public String getNomeTotem() {
		return nomeTotem;
	}

	public void setNomeTotem(String nomeTotem) {
		this.nomeTotem = nomeTotem;
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

		tdbm.setParameter(ParameterType.STRING,this.nomeTotem, 1);
		tdbm.runPreparedQuery();
		
		if(tdbm.next()){
			this.id_bike_sensor=tdbm.getInteger(1);
		}else{
			this.id_bike_sensor=-1;
		}
			
	}
	
}
