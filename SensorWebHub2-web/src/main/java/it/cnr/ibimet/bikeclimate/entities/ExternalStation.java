package it.cnr.ibimet.bikeclimate.entities;

/**
 * Created by lerocchi on 19/08/16.
 */

public class ExternalStation extends MobileStation{


    private String weburl,params;

    public ExternalStation(int id_mobile_station, String img, String nome) {
        super(id_mobile_station, img, nome);
    }

    public ExternalStation(int id_mobile_station, String img, String nome, String descrizione) {
        super(id_mobile_station, img, nome, descrizione);
    }

    public ExternalStation(int id_mobile_station, String img, String nome, String descrizione, boolean activated) {
        super(id_mobile_station, img, nome, descrizione, activated);
    }

    public ExternalStation(int id_mobile_station, String img, String nome, String descrizione,
                           boolean activated, String weburl, String params){
        this(id_mobile_station, img, nome, descrizione, activated);

        this.weburl = weburl;
        this.params = params;
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



}
