package it.cnr.ibimet.bikeclimate.entities;

import it.cnr.ibimet.bikeclimate.dbutils.TDBManager;
import it.lr.libs.DBManager.ParameterType;

import java.sql.SQLException;

public class Fotovoltaic {
	private String fotovoltaic_name;
	private int id_fotovoltaic;
	private String descrizione;
        private String img;
	private TDBManager tdbm;

	public Fotovoltaic(TDBManager tdbm){
		this.tdbm=tdbm;
	}

	public Fotovoltaic(TDBManager tdbm, String fotovoltaic_name) throws SQLException{
		this(tdbm);
		this.fotovoltaic_name=fotovoltaic_name;

		getBikeInfo();
	}

        public Fotovoltaic(String fotovoltaic_name, int id_fotovoltaic, String descrizione, String img) throws SQLException{
            this.fotovoltaic_name=fotovoltaic_name;
            this.id_fotovoltaic=id_fotovoltaic;
            this.descrizione=descrizione;
            this.img=img;
        }

        public Fotovoltaic( String fotovoltaic_name, int id_fotovoltaic) {
		this.fotovoltaic_name=fotovoltaic_name;

		this.id_fotovoltaic=id_fotovoltaic;


	}

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
	
    public String getFotovoltaic_name() {
        return fotovoltaic_name;
    }

    public void setFotovoltaic_name(String fotovoltaic_name) {
        this.fotovoltaic_name = fotovoltaic_name;
    }

    public int getId_fotovoltaic() {
        return id_fotovoltaic;
    }
	
    public void setId_fotovoltaic(int id_fotovoltaic) {
        this.id_fotovoltaic = id_fotovoltaic;
    }

	public String getDescrizione() {
		return descrizione;
	}
        
	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}
	
	public void getBikeInfo() throws SQLException{

		String sqlString = "select id_mobile_station, descrizione from mobile_stations where nome=? ";
		
		tdbm.setPreparedStatementRef(sqlString);

		tdbm.setParameter(ParameterType.STRING,this.fotovoltaic_name, 1);
		tdbm.runPreparedQuery();
		
		if(tdbm.next()){
			this.id_fotovoltaic=tdbm.getInteger(1);
			this.descrizione=tdbm.getString(2);
		}else{
			this.id_fotovoltaic=-1;
			this.descrizione="-1";
		}
			
	}

        
        
}
