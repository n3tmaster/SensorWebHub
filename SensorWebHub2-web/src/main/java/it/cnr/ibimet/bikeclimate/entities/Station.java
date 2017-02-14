package it.cnr.ibimet.bikeclimate.entities;

public class Station {
	private String id_stazione;
	private int id_ente;
	private int id_azienda;
	private long  gsm;
	
	private String ente;
	private String azienda;
	
	public Station(String id_stazione,int id_ente, int id_azienda,
			long gsm, String ente, String azienda){
		this.id_azienda=id_azienda;
		this.id_ente=id_ente;
		this.id_stazione=id_stazione;
		this.ente=ente;
		this.azienda=azienda;
		this.gsm=gsm;
		
	}
	
	public String getId_stazione() {
		return id_stazione;
	}
	public void setId_stazione(String id_stazione) {
		this.id_stazione = id_stazione;
	}
	public int getId_ente() {
		return id_ente;
	}
	public void setId_ente(int id_ente) {
		this.id_ente = id_ente;
	}
	public int getId_azienda() {
		return id_azienda;
	}
	public void setId_azienda(int id_azienda) {
		this.id_azienda = id_azienda;
	}
	public long getGsm() {
		return gsm;
	}
	public void setGsm(long gsm) {
		this.gsm = gsm;
	}
	public String getEnte() {
		return ente;
	}
	public void setEnte(String ente) {
		this.ente = ente;
	}
	public String getAzienda() {
		return azienda;
	}
	public void setAzienda(String azienda) {
		this.azienda = azienda;
	}
	
	
	
	
}
