package it.cnr.ibimet.swhservices.entities;

public class MobileStation {
	private int id_mobile_station;
	private String img;
	private String nome;
	public MobileStation(int id_mobile_station,
			String img, String nome){
		this.id_mobile_station=id_mobile_station;
		this.img=img;
		this.nome=nome;
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
	
}
