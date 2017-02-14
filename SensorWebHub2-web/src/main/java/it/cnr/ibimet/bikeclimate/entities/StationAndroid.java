package it.cnr.ibimet.bikeclimate.entities;

import java.io.Serializable;

public class StationAndroid extends Station implements Serializable{

	public StationAndroid(String id_stazione, int id_ente, int id_azienda,
			long gsm, String ente, String azienda) {
		super(id_stazione, id_ente, id_azienda, gsm, ente, azienda);
		
	}

}
