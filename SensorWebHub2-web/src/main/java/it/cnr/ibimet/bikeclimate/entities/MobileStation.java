package it.cnr.ibimet.bikeclimate.entities;

import java.io.Serializable;
import java.sql.SQLException;

public class MobileStation implements  Serializable{
	private final static String ACTIVATED = "ATTIVO"; //TODO: inserire nome file attivo
	private final static String DEACTIVATED = "NON ATTIVO"; //TODO: inserire nome file disattivo
	private int id_mobile_station;
	private String img;
	private String nome;
	private String descrizione;
	private String weburl;
	private String params;
	private String external;
	private String oper;
	private String status;

	public MobileStation(int id_mobile_station,
			String img, String nome){
		this.id_mobile_station=id_mobile_station;
		this.img=img;
		this.nome=nome;
	}

	public MobileStation(int id_mobile_station,
			String img, String nome, String descrizione){
		this(id_mobile_station,img,nome);
		this.descrizione=descrizione;
	}

	public MobileStation(int id_mobile_station,
						 String img, String nome, String descrizione, boolean activated){
		this(id_mobile_station,img,nome,descrizione);

		if(activated){
			status = ACTIVATED;
		}else{
			status = DEACTIVATED;
		}

	}
	public MobileStation(int id_mobile_station,
						 String img, String nome, String descrizione, boolean activated, String weburl,
				 String params,
				 String oper)  throws SQLException {
		this( id_mobile_station,  img,  nome,  descrizione,  activated);
		this.weburl = weburl;
		this.params = params;
		this.oper = oper;
		this.external = "EXT";

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

	public int getId_mobile_station() {
		return id_mobile_station;
	}

	public void setId_mobile_station(int id_mobile_station) {
		this.id_mobile_station = id_mobile_station;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
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

	public void salvaStazione(){
            //TODO: da completare
        }
}
