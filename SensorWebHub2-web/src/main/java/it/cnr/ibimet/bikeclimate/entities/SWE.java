package it.cnr.ibimet.bikeclimate.entities;

import it.cnr.ibimet.bikeclimate.dbutils.TDBManager;
import it.lr.libs.DBManager.ParameterType;

import java.sql.SQLException;

public class SWE  {
	private String swe_name;
	private int id_swe;
	private String descrizione;
        private String img;
	private TDBManager tdbm;

	public SWE(TDBManager tdbm){
		this.tdbm=tdbm;
	}

	public SWE(TDBManager tdbm, String swe_name) throws SQLException{
		this(tdbm);
		this.swe_name=swe_name;

		getBikeInfo();
	}
	
	
	
	
        
        public SWE(String swe_name, int id_swe, String descrizione, String img) throws SQLException{
            this.swe_name=swe_name;
            this.id_swe=id_swe;
            this.descrizione=descrizione;
            this.img=img;
        }

        public SWE( String swe_name, int id_swe) {
		this.swe_name=swe_name;

		this.id_swe=id_swe;


	}

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

    public String getSwe_name() {
        return swe_name;
    }
	
    public void setSwe_name(String swe_name) {
        this.swe_name = swe_name;
    }

    public int getId_swe() {
        return id_swe;
    }
        
    public void setId_swe(int id_swe) {
        this.id_swe = id_swe;
    }
	
	public void getBikeInfo() throws SQLException{

		String sqlString = "select id_mobile_station, descrizione from mobile_stations where nome=? ";
		
		tdbm.setPreparedStatementRef(sqlString);

		tdbm.setParameter(ParameterType.STRING,this.swe_name, 1);
		tdbm.runPreparedQuery();
		
		if(tdbm.next()){
			this.id_swe=tdbm.getInteger(1);
			this.descrizione=tdbm.getString(2);
		}else{
			this.id_swe=-1;
			this.descrizione="-1";
		}
			
	}

        
        
}
