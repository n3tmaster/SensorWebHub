package it.cnr.ibimet.bikeclimate.entities;

import it.cnr.ibimet.bikeclimate.dbutils.TDBManager;
import it.lr.libs.DBManager.ParameterType;

import java.io.Serializable;
import java.sql.SQLException;

public class Totem implements  Serializable{
	private final static String ACTIVATED = "ATTIVO"; //TODO: inserire nome file attivo
	private final static String DEACTIVATED = "NON ATTIVO"; //TODO: inserire nome file disattivo
	private String nomeTotem;
	private int id_bike_sensor;
	private TDBManager tdbm;
	private String descrizione;
	private String img;
    private String status;
    private String weburl;
	private String params;
	private String external;
	private String oper;

	public Totem(TDBManager tdbm){
		this.tdbm=tdbm;
	}

	public Totem(TDBManager tdbm, String nomeTotem) throws SQLException{
		this(tdbm);
		this.nomeTotem=nomeTotem;
		this.external = "";
		getBikeInfo();
	}

	public Totem(String nomeTotem, int id_bike_sensor, String descrizione) throws SQLException{
		this(nomeTotem,id_bike_sensor);
		this.descrizione=descrizione;
	}

        public Totem(String nomeTotem, int id_bike_sensor, String description, String img) throws SQLException{
            this.nomeTotem=nomeTotem;
            this.id_bike_sensor=id_bike_sensor;
            this.descrizione=description;
            this.img=img;
			this.external = "";
        }

	public Totem( String nomeTotem, int id_bike_sensor) {
		this.nomeTotem=nomeTotem;

		this.id_bike_sensor=id_bike_sensor;
		this.external = "";
	}

	public Totem(String nomeTotem, int id_bike_sensor, String description, String img, boolean activated)  throws SQLException{
		this(nomeTotem,  id_bike_sensor,  description,  img);

		if(activated){
			status = ACTIVATED;
		}else{
			status = DEACTIVATED;
		}

	}

	public Totem(String nomeTotem, int id_bike_sensor,
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

	public String getOper() {
		return oper;
	}

	public void setOper(String oper) {
		this.oper = oper;
	}

	public String getExternal() {
		return external;
	}

	public void setExternal(String external) {
		this.external = external;
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
		this.external = "";
	}

	public void getBikeInfo() throws SQLException{

		String sqlString = "select id_mobile_station, descrizione from mobile_stations where nome=? ";
		
		
		tdbm.setPreparedStatementRef(sqlString);

		tdbm.setParameter(ParameterType.STRING,this.nomeTotem, 1);
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
