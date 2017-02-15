/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.cnr.ibimet.dbutils;

/**
 * Costanti utilizzate dal progetto per la configurazione della webApp
 * @author lerocchi
 */
public interface SWH4EConst {
    
    //Costanti per la gestione dei dati RASTER
    String h24 = "24h";
    String h48 = "48h";
    String TEMPERATURA = "temperatura";
    String PRECIPIATAZINE = "precipitazione";
    String AFENOLOGICO = "anomalia fenologica";
    String APATOLOGICO = "anomalia patologica";

    
    
    //Costanti dati strutturali
    String LIMITI_FRASCATI_DOC = "frascati_doc";
    
    
    
    
    //Costanti per la mappa
    double CENTER_X=12.68693;
    double CENTER_Y=41.83288;
    int ZOOMFACTOR=10;

    int PRECISION = 5;
    //Costanti per la gestione dei dati VETTORIALI
    String POLYGON_COLOR_LIMITI_ADM = "#4783A5";
    double POLYGON_OPACITY_LIMITI_ADM = 0.8;
    
    
    //Costanti per i grafici
    String TITOLO_TEMP= "Temperature";
    String TITOLO_PIOGGIA = "Pioggia";
    String TITOLO_CO2= "CO2";
    String TITOLO_UMIDITA="Umidità Relativa";
    String TITOLO_OZONO="Ozono";

    
    
    String EDDY_STANDARD="EDDY";
    long NP_DIGITAL_VALUE=-1000;
    
    
    //Costanti per la gestione albero-nodi-select
    String DATI_STRUTTURALI = "DATI STRUTTURALI";
    String STAZIONI="STAZIONI METEO";
    
    String FRASCATI_DOC = "Zona Frascati DOC";
    String VIGNETI = "Vigneti";
    String STAZIONI_FISSE="Aziende agricole";
    
    //Costanti per la gestione albero-nodi-query
    String GET_FRASCATI = "select ST_AsKML(a.the_geom,8),a.nome_completo,b.colore,b.opacita "
                            + " from frascati_doc a, legende b"
                            + " where a.id_legenda=b.id_legenda";
    
    String GET_VIGNETI ="select ST_AsKML(a.the_geom,8),a.varieta,b.colore,b.opacita "
                            + " from vigneti a, legende b"
                            + " where a.id_legenda=b.id_legenda";
    
    String GET_STAZ_FISSE = "select ST_AsKML(b.the_geom,4),a.tair,a.co2,a.rad,a.o3, a.data " +
                                "from dati_stazioni_fisse a, mobile_stations b " +
                                "where  a.id_mobile_station=? " +
                                "and    a.id_mobile_station=b.id_mobile_station " +
                                "order by data desc limit 1";
    
    //Costanti per la gestione delle tabelle
    String TBL_FRASCATI_DOC = "frascati_doc";
    String TBL_VIGNETI = "vigneti";
    
    
    
    //costanti per la multilingua
    String LINGUA_IT = "it";
    String LINGUA_EN = "en";
    String LINGUA_FR = "fr";
    
    //Costanti per la gestione dei dati RASTER

    //costanti per la gestione delle tipologie di poligoni
    String POLYGON_T = "POLYGON";
    String MULTIPOLYGON_T = "MULTIPOLYGON";
    String LINE_T = "LINE";
    String MULTILINESTRING="MULTILINESTRING";
    String POINT_T = "POINT";
    String MULTIPOINT_T = "MULTIPOINT";
    
     String GET_LAYER_TYPE = "select srid, type from geometry_columns where f_table_name=?";
     
        String LEGEND_TYPE_ALL_FEATURE = "ALL"; //indica di fare una query tra legends e la tabella spaziale e di usare solo il colore
    String LEGEND_TYPE_NONE = "NONE";       //indica di non usare legende
    String LEGEND_TYPE_SINGLE_COLOR = "SINGLE_COLOR"; //unico colore
    String LEGEND_TYPE_UNIQUE_VALUE = "UNIQUE_VALUE"; //su singoli valori
    String LEGEND_TYPE_CLASSBREAK_VALUE = "CLASS_BREAK"; //class break
    
    //Costanti per PostgreSQL
    String THE_GEOM_COLUMN = "the_geom";
    String GID = "gid";
    String DATA_TYPE_INTEGER="integer";
    String DATA_TYPE_NUMERIC="numeric";
    String DATA_TYPE_DOUBLE_PRECISION = "double precision";
    String DATA_TYPE_TIMESTAMP = "timestamp without time zone";
    String DATA_TYPE_TIMESTAMP_WT = "timestamp with time zone";
    
    String DATA_TYPE_STRING = "character varying";
    String TIME_STAMP_YES = "1";
    String TIME_STAMP_NO = "0";
    
    //Costanti per i moduli della piattaforma
    String MODULE_MOBILES = "MOBILES";
    
    
}
