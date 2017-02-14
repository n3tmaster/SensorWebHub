package it.cnr.ibimet.bikeclimate.entities;

import it.cnr.ibimet.bikeclimate.dbutils.TDBManager;
import it.lr.libs.DBManager.ParameterType;

import java.sql.SQLException;

public class Eddy {
	private final static String ACTIVATED = "ATTIVO"; //TODO: inserire nome file attivo
	private final static String DEACTIVATED = "NON ATTIVO"; //TODO: inserire nome file disattivo
	private String nomeEddy;
	private int id_bike_sensor;
	private TDBManager tdbm;
	private String descrizione;
	private String img;
	private String status;
	private String weburl;
	private String params;
	private String external;
	private String oper;
	public Eddy(String nomeEddy, int id_bike_sensor){
		this.nomeEddy=nomeEddy;
		this.id_bike_sensor=id_bike_sensor;
	}

	public Eddy(String nomeEddy, int id_bike_sensor, String descrizione){

		this(nomeEddy, id_bike_sensor);
		this.descrizione=descrizione;
	}


        public Eddy(String nomeEddy, int id_bike_sensor, String descrizione, String img){

		this(nomeEddy, id_bike_sensor, descrizione);
		this.img=img;
	}

	public Eddy(String nomeTotem, int id_bike_sensor, String description, String img, boolean activated)  throws SQLException{
		this(nomeTotem,  id_bike_sensor,  description,  img);

		if(activated){
			status = ACTIVATED;
		}else{
			status = DEACTIVATED;
		}

	}

	public Eddy(TDBManager tdbm){
		this.tdbm=tdbm;
	}

	public Eddy(TDBManager tdbm, String nomeEddy) throws SQLException{
		this(tdbm);
		this.nomeEddy=nomeEddy;

		getBikeInfo();
	}

	public Eddy(String nomeTotem, int id_bike_sensor,
				 String description, String img,
				 boolean activated, String weburl,
				 String params,
				 String oper)  throws SQLException{
		this( nomeTotem,  id_bike_sensor,  description,  img,  activated);
		this.weburl = weburl;
		this.params = params;
		this.oper = oper;
		this.external = "EXT";

	}

    public String getImg() {
        return img;
    }

	public void setImg(String img) {
        this.img = img;
    }

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
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

	public String getWeburl() {
		return weburl;
	}

	public void setWeburl(String weburl) {
		this.weburl = weburl;
	}

	public String getParams() {
		return params;
	}

	public void setParams(String params) {
		this.params = params;
	}

	public String getExternal() {
		return external;
	}

	public void setExternal(String external) {
		this.external = external;
	}
	
	public String getOper() {
		return oper;
	}

	public void setOper(String oper) {
		this.oper = oper;
	}

	public void getBikeInfo() throws SQLException{

		String sqlString = "select id_mobile_station, descrizione from mobile_stations where nome=? and tipo='E' ";
		
		
		tdbm.setPreparedStatementRef(sqlString);

		tdbm.setParameter(ParameterType.STRING,this.nomeEddy, 1);
		tdbm.runPreparedQuery();
		
		if(tdbm.next()){
			this.id_bike_sensor=tdbm.getInteger(1);
			this.descrizione=tdbm.getString(2);
		}else{
			this.id_bike_sensor=-1;
			this.descrizione="-1";
		}
			
	}
	
}
