/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.cnr.ibimet.bikeclimate.backingbeans;

import javax.annotation.PostConstruct;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import java.io.Serializable;
/**
 *
 * @author lerocchi
 */

@ManagedBean(name="toolbarBean")
@SessionScoped
public class ToolbarBean implements Serializable{
    
    public static final String BIKE_TYPE = "bike";
    public static final String GARBAGE_TYPE = "garbage";
    public static final String BUS_TYPE = "bus";
    public static final String POLICE_TYPE = "police";
    public static final String JEEP_TYPE = "jeep";
    public static final String COVARIANCE_TYPE = "covariance";
    public static final String STATION_TYPE = "station";
    public static final String TOTEM_TYPE = "totem";
    public static final String TAXI_TYPE = "taxi";
    public static final String WATCH_TYPE = "watch";
    public static final String TRAM_TYPE = "tram";
    public static final String FOTOVOLTAICO_TYPE = "fotovoltaic";
    public static final String BIOMASSE_TYPE = "biomasse";
    private static final String GREY=".png";
    private static final String ORANGE=".png";
    private static final String TUTTE_STAZIONI_URL="images/imgui/TUTTE_STAZIONI";
    private static final String TUTTE_SENSORI_MOBILI_URL="images/imgui/SENSORI_MOBILI";
    private static final String TRAM_URL="images/imgui/TRAM";
    private static final String BIKE_URL="images/imgui/BIKE";
    private static final String BUS_URL="images/imgui/BUS";
    private static final String WATCH_URL="images/imgui/WATCH";
    private static final String POLICE_URL="images/imgui/POLICE";
    private static final String TAXI_URL="images/imgui/TAXI";
    private static final String JEEP_URL="images/imgui/JEEP";
    private static final String STAZIONI_URL="images/imgui/STAZIONE";
    private static final String COVARIANCE_URL="images/imgui/COVARIANCE";
    private static final String GARBAGE_URL="images/imgui/GARBAGE";
    private static final String TOTEM_URL="images/imgui/TOTEM";
    private static final String BIOMASSE_URL="images/imgui/BIOMASSE";
    private static final String FOTOVOLTAICO_URL="images/imgui/FOTOVOLTAICO";
    private final static String BIANCO = "#E6E6E6";
    private final static String GRIGIO = "#FFFFFF";
    private String coloreBck,coloreTram,coloreBike,coloreBus,coloreWatch,colorePolice,coloreBiomasse,coloreFotovoltaico;
    private String coloreTaxi, coloreJeep, coloreStazioni, coloreCovariance, coloreGarbage, coloreTotem,coloreTSensori;
    private boolean doTutteStazioni, doTram, doBike, doBus, doWatch,doPolice;
    private boolean doTaxi, doJeep, doStazioni, doStazioni2, doCovariance, doGarbage, doTotem,doTuttiSensori,doBiomasse,doFotovoltaico;
    private String  doTutteStazioniURL,doTramURL,doBikeURL,doBusURL,doWatchURL,doPoliceURL;
    private String  doTaxiURL, doJeepURL, doStazioniURL, doCovarianceURL, doGarbageURL, doTotemURL, doTuttiSensoriURL,doBiomasseURL,doFotovoltaicoURL;
    private boolean pDM,pDE,pSE,pSM,pDT,pST;
    private boolean pgB,pgF, pgS,psB,psF,psS, pdB, pdS, pdF;
    private String  tipoStazioneSelezionato;
    private boolean disattivaTab;
    @ManagedProperty(value="#{mapUrbanBean}")
    private MapBean mapBean;
    @ManagedProperty(value="#{sweStationBean}")
    private SWEBean sweStationBean;
    @ManagedProperty(value="#{fotoBean}")
    private FotovoltaicBean fotoStationBean;
    @ManagedProperty(value="#{mobileStationBean}")
    private MobileStationBean mobileStationBean;
    @ManagedProperty(value="#{eddyStationBean}")
    private EddyStationBean eddyStationBean;
    @ManagedProperty(value="#{totemStationBean}")
    private TotemStationBean totemStationBean;

    public MapBean getMapBean() {
        return mapBean;
    }

    public void setMapBean(MapBean mapBean) {
        this.mapBean = mapBean;
    }

    public MobileStationBean getMobileStationBean() {
        return mobileStationBean;
    }

    public void setMobileStationBean(MobileStationBean mobileStationBean) {
        this.mobileStationBean = mobileStationBean;
    }

    public boolean isDisattivaTab() {
        return disattivaTab;
    }

    public void setDisattivaTab(boolean disattivaTab) {
        this.disattivaTab = disattivaTab;
    }

    public EddyStationBean getEddyStationBean() {
        return eddyStationBean;
    }

    public void setEddyStationBean(EddyStationBean eddyStationBean) {
        this.eddyStationBean = eddyStationBean;
    }

    public TotemStationBean getTotemStationBean() {
        return totemStationBean;
    }

    public void setTotemStationBean(TotemStationBean totemStationBean) {
        this.totemStationBean = totemStationBean;
    }

    public SWEBean getSweStationBean() {
        return sweStationBean;
    }

    public void setSweStationBean(SWEBean sweStationBean) {
        this.sweStationBean = sweStationBean;
    }

    public boolean isDoBiomasse() {
        return doBiomasse;
    }

    public void setDoBiomasse(boolean doBiomasse) {
        this.doBiomasse = doBiomasse;
    }

    public FotovoltaicBean getFotoStationBean() {
        return fotoStationBean;
    }

    public void setFotoStationBean(FotovoltaicBean fotoStationBean) {
        this.fotoStationBean = fotoStationBean;
    }

    public boolean isDoFotovoltaico() {
        return doFotovoltaico;
    }

    public void setDoFotovoltaico(boolean doFotovoltaico) {
        this.doFotovoltaico = doFotovoltaico;
    }

    public boolean isPgB() {
        return pgB;
    }

    public void setPgB(boolean pgB) {
        this.pgB = pgB;
    }

    public boolean isPgF() {
        return pgF;
    }

    public void setPgF(boolean pgF) {
        this.pgF = pgF;
    }

    public boolean isPgS() {
        return pgS;
    }

    public void setPgS(boolean pgS) {
        this.pgS = pgS;
    }

    public boolean isPsB() {
        return psB;
    }

    public void setPsB(boolean psB) {
        this.psB = psB;
    }

    public boolean isPsF() {
        return psF;
    }

    public void setPsF(boolean psF) {
        this.psF = psF;
    }

    public boolean isPsS() {
        return psS;
    }

    public void setPsS(boolean psS) {
        this.psS = psS;
    }

    public boolean isPdB() {
        return pdB;
    }

    public void setPdB(boolean pdB) {
        this.pdB = pdB;
    }

    public boolean isPdS() {
        return pdS;
    }

    public void setPdS(boolean pdS) {
        this.pdS = pdS;
    }

    public boolean isPdF() {
        return pdF;
    }

    public void setPdF(boolean pdF) {
        this.pdF = pdF;
    }

    public String getDoBiomasseURL() {
        return doBiomasseURL;
    }

    public void setDoBiomasseURL(String doBiomasseURL) {
        this.doBiomasseURL = doBiomasseURL;
    }

    public String getDoFotovoltaicoURL() {
        return doFotovoltaicoURL;
    }

    public void setDoFotovoltaicoURL(String doFotovoltaicoURL) {
        this.doFotovoltaicoURL = doFotovoltaicoURL;
    }

    public String getColoreBiomasse() {
        return coloreBiomasse;
    }

    public void setColoreBiomasse(String coloreBiomasse) {
        this.coloreBiomasse = coloreBiomasse;
    }

    public String getColoreFotovoltaico() {
        return coloreFotovoltaico;
    }

    public void setColoreFotovoltaico(String coloreFotovoltaico) {
        this.coloreFotovoltaico = coloreFotovoltaico;
    }

    public boolean isDoStazioni2() {
        return doStazioni2;
    }

    public void setDoStazioni2(boolean doStazioni2) {
        this.doStazioni2 = doStazioni2;
    }

    public boolean ispDT() {
        return pDT;
    }

    public void setpDT(boolean pDT) {
        this.pDT = pDT;
    }

    public boolean ispST() {
        return pST;
    }

    public void setpST(boolean pST) {
        this.pST = pST;
    }
    
    
    public String getTipoStazioneSelezionato() {
        return tipoStazioneSelezionato;
    }

    public void setTipoStazioneSelezionato(String tipoStazioneSelezionato) {
        this.tipoStazioneSelezionato = tipoStazioneSelezionato;
    }
    
    
    
    
    public boolean ispSE() {
        return pSE;
    }

    public void setpSE(boolean pSE) {
        this.pSE = pSE;
    }

    public boolean ispSM() {
        return pSM;
    }

    public void setpSM(boolean pSM) {
        this.pSM = pSM;
    }

    public boolean ispDE() {
        return pDE;
    }

    public void setpDE(boolean pDE) {
        this.pDE = pDE;
    }

    public String getColoreTSensori() {
        return coloreTSensori;
    }

    public void setColoreTSensori(String coloreTSensori) {
        this.coloreTSensori = coloreTSensori;
    }

    public boolean isDoTutteStazioni() {
        return doTutteStazioni;
    }

    public void setDoTutteStazioni(boolean doTutteStazioni) {
        this.doTutteStazioni = doTutteStazioni;
    }

    public boolean isDoTram() {
        return doTram;
    }

    public void setDoTram(boolean doTram) {
        this.doTram = doTram;
    }

    public boolean isDoBike() {
        return doBike;
    }

    public void setDoBike(boolean doBike) {
        this.doBike = doBike;
    }

    public boolean isDoBus() {
        return doBus;
    }

    public void setDoBus(boolean doBus) {
        this.doBus = doBus;
    }

    public boolean isDoWatch() {
        return doWatch;
    }

    public void setDoWatch(boolean doWatch) {
        this.doWatch = doWatch;
    }

    public boolean isDoPolice() {
        return doPolice;
    }

    public void setDoPolice(boolean doPolice) {
        this.doPolice = doPolice;
    }

    public boolean isDoTaxi() {
        return doTaxi;
    }

    public void setDoTaxi(boolean doTaxi) {
        this.doTaxi = doTaxi;
    }

    public boolean isDoJeep() {
        return doJeep;
    }

    public void setDoJeep(boolean doJeep) {
        this.doJeep = doJeep;
    }

    public boolean isDoStazioni() {
        return doStazioni;
    }

    public void setDoStazioni(boolean doStazioni) {
        this.doStazioni = doStazioni;
    }

    public boolean isDoCovariance() {
        return doCovariance;
    }

    public void setDoCovariance(boolean doCovariance) {
        this.doCovariance = doCovariance;
    }

    public boolean isDoGarbage() {
        return doGarbage;
    }

    public void setDoGarbage(boolean doGarbage) {
        this.doGarbage = doGarbage;
    }

    public boolean isDoTotem() {
        return doTotem;
    }

    public void setDoTotem(boolean doTotem) {
        this.doTotem = doTotem;
    }

    public boolean isDoTuttiSensori() {
        return doTuttiSensori;
    }

    public void setDoTuttiSensori(boolean doTuttiSensori) {
        this.doTuttiSensori = doTuttiSensori;
    }

    public String getDoTuttiSensoriURL() {
        return doTuttiSensoriURL;
    }

    public void setDoTuttiSensoriURL(String doTuttiSensoriURL) {
        this.doTuttiSensoriURL = doTuttiSensoriURL;
    }

    public boolean ispDM() {
        return pDM;
    }

    public void setpDM(boolean pDM) {
        this.pDM = pDM;
    }

    
    
    public String getColoreTram() {
        return coloreTram;
    }

    public void setColoreTram(String coloreTram) {
        this.coloreTram = coloreTram;
    }

    public String getColoreBike() {
        return coloreBike;
    }

    public void setColoreBike(String coloreBike) {
        this.coloreBike = coloreBike;
    }

    public String getColoreBus() {
        return coloreBus;
    }

    public void setColoreBus(String coloreBus) {
        this.coloreBus = coloreBus;
    }

    public String getColoreWatch() {
        return coloreWatch;
    }

    public void setColoreWatch(String coloreWatch) {
        this.coloreWatch = coloreWatch;
    }

    public String getColorePolice() {
        return colorePolice;
    }

    public void setColorePolice(String colorePolice) {
        this.colorePolice = colorePolice;
    }

    public String getColoreTaxi() {
        return coloreTaxi;
    }

    public void setColoreTaxi(String coloreTaxi) {
        this.coloreTaxi = coloreTaxi;
    }

    public String getColoreJeep() {
        return coloreJeep;
    }

    public void setColoreJeep(String coloreJeep) {
        this.coloreJeep = coloreJeep;
    }

    public String getColoreStazioni() {
        return coloreStazioni;
    }

    public void setColoreStazioni(String coloreStazioni) {
        this.coloreStazioni = coloreStazioni;
    }

    public String getColoreCovariance() {
        return coloreCovariance;
    }

    public void setColoreCovariance(String coloreCovariance) {
        this.coloreCovariance = coloreCovariance;
    }

    public String getColoreGarbage() {
        return coloreGarbage;
    }

    public void setColoreGarbage(String coloreGarbage) {
        this.coloreGarbage = coloreGarbage;
    }

    public String getColoreTotem() {
        return coloreTotem;
    }

    public void setColoreTotem(String coloreTotem) {
        this.coloreTotem = coloreTotem;
    }

    public String getColoreBck() {
        return coloreBck;
    }

    public void setColoreBck(String coloreBck) {
        this.coloreBck = coloreBck;
    }
    
  

    public String getDoTotemURL() {
        return doTotemURL;
    }

    public void setDoTotemURL(String doTotemURL) {
        this.doTotemURL = doTotemURL;
    }
    
	
    public String getDoTutteStazioniURL() {
        return doTutteStazioniURL;
    }

    public void setDoTutteStazioniURL(String doTutteStazioniURL) {
        this.doTutteStazioniURL = doTutteStazioniURL;
    }

    public String getDoTramURL() {
        return doTramURL;
    }

    public void setDoTramURL(String doTramURL) {
        this.doTramURL = doTramURL;
    }

    public String getDoBikeURL() {
        return doBikeURL;
    }

    public void setDoBikeURL(String doBikeURL) {
        this.doBikeURL = doBikeURL;
    }

    public String getDoBusURL() {
        return doBusURL;
    }

    public void setDoBusURL(String doBusURL) {
        this.doBusURL = doBusURL;
    }

    public String getDoWatchURL() {
        return doWatchURL;
    }

    public void setDoWatchURL(String doWatchURL) {
        this.doWatchURL = doWatchURL;
    }

    public String getDoPoliceURL() {
        return doPoliceURL;
    }

    public void setDoPoliceURL(String doPoliceURL) {
        this.doPoliceURL = doPoliceURL;
    }

    public String getDoTaxiURL() {
        return doTaxiURL;
    }

    public void setDoTaxiURL(String doTaxiURL) {
        this.doTaxiURL = doTaxiURL;
    }

    public String getDoJeepURL() {
        return doJeepURL;
    }

    public void setDoJeepURL(String doJeepURL) {
        this.doJeepURL = doJeepURL;
    }

    public String getDoStazioniURL() {
        return doStazioniURL;
    }

    public void setDoStazioniURL(String doStazioniURL) {
        this.doStazioniURL = doStazioniURL;
    }

    public String getDoCovarianceURL() {
        return doCovarianceURL;
    }

    public void setDoCovarianceURL(String doCovarianceURL) {
        this.doCovarianceURL = doCovarianceURL;
    }

    public String getDoGarbageURL() {
        return doGarbageURL;
    }

    public void setDoGarbageURL(String doGarbageURL) {
        this.doGarbageURL = doGarbageURL;
    }
        
            
	
	

	@PostConstruct
	public void init(){
            
            System.out.println("toolbarBean: init");
            //setto icone toolbar
                this.doTutteStazioniURL=TUTTE_STAZIONI_URL+ORANGE;
                this.doTuttiSensoriURL=TUTTE_SENSORI_MOBILI_URL+ORANGE;
                this.doTramURL=TRAM_URL+GREY;
                this.doBikeURL=BIKE_URL+GREY;
                this.doBusURL=BUS_URL+GREY;
                this.doWatchURL=WATCH_URL+GREY;
                this.doPoliceURL=POLICE_URL+GREY;
                this.doJeepURL=JEEP_URL+GREY;
                this.doTaxiURL=TAXI_URL+GREY;
                this.doGarbageURL=GARBAGE_URL+GREY;
                this.doCovarianceURL=COVARIANCE_URL+GREY;
                this.doStazioniURL=STAZIONI_URL+GREY;
                this.doTotemURL=TOTEM_URL+GREY;
                this.doFotovoltaicoURL=FOTOVOLTAICO_URL+GREY;
                this.doBiomasseURL=BIOMASSE_URL+GREY;
                
                
                if(mapBean.getLoginBean().getId_dominio()==3){
                    //Rinnovabili
                    resetGUI_Rinnovabili();
                }else{
                    resetGUI();
                }
                
		
		
		
	}
	
        private void resetGUI_Rinnovabili(){
            this.doTutteStazioni=false;
            
            this.doFotovoltaico = false;
            this.doBiomasse = false;
            System.out.println("sono in rinnovabili");
            
            //Preparo clausula where
            
                this.coloreBiomasse=BIANCO;
                this.coloreFotovoltaico=GRIGIO;
                this.coloreStazioni = GRIGIO;
                this.tipoStazioneSelezionato=" in ('" + BIOMASSE_TYPE +  "')";

               
                this.pgB=true;
                this.pgF=false;
                this.pgS=false;
                
                this.psB=true;
                this.psF=false;
                this.psS=false;
                
                this.pdB=true;
                this.pdF=false;
                this.pdS=false;
                
                sweStationBean.setClausulaWhere(this.tipoStazioneSelezionato);
                sweStationBean.popola();
               
                System.out.println("ora lancio mapBean");
                
                mapBean.setTipoStazioni(MapBean.STAZ_RINNOVABILI);
                mapBean.setClausulaWhere(this.tipoStazioneSelezionato);
                
                System.out.println("ora chiamo ultimimappa");
                
                mapBean.popolaUltimiMappa();
                System.out.println("resteGUI_Rinnovabili completato");
                
                
        }
        
	private void resetGUI(){
            
                //setto variabile per la gestione delle singole stazioni lato beans


        System.out.println(" ToolbarBean - resetGUI");
            	this.doTutteStazioni=false;
              
                this.doTram=false;
                this.doBike=false;
                this.doBus=false;
                this.doWatch=false;
                this.doPolice=false;
                this.doJeep=false;
                this.doTaxi=false;
                this.doGarbage=false;
                this.doTuttiSensori=true;
                this.doCovariance=false;
                this.doStazioni=false;
                this.doTotem=false;
                
                //setto toggle per la webGUI
                this.pDM=true;
                this.pDE=false;
                this.pSE=false;
                this.pSM=true;
                this.pST=false;
                this.pDT=false;
                this.disattivaTab=false;
                
                //setto colore di sfondo toolbar
                this.coloreBck=GRIGIO;
                this.coloreTSensori=BIANCO;
                this.coloreTram=GRIGIO;
                this.coloreBike=GRIGIO;
                this.coloreBus=GRIGIO;
                this.coloreWatch=GRIGIO;
                this.colorePolice=GRIGIO;
                this.coloreJeep=GRIGIO;
                this.coloreTaxi=GRIGIO;
                this.coloreGarbage=GRIGIO;
                this.coloreCovariance=GRIGIO;
                this.coloreStazioni=GRIGIO;
                this.coloreTotem=GRIGIO;
                
                //Preparo clausula where
                this.tipoStazioneSelezionato=" in ('" + BIKE_TYPE + "','" + GARBAGE_TYPE + "',";
                this.tipoStazioneSelezionato=tipoStazioneSelezionato + "'"+BUS_TYPE+"','"+POLICE_TYPE+"',";
                this.tipoStazioneSelezionato=tipoStazioneSelezionato + "'"+JEEP_TYPE+"','"+TRAM_TYPE+"',";
                this.tipoStazioneSelezionato=tipoStazioneSelezionato + "'"+TAXI_TYPE+"','"+WATCH_TYPE+"') ";
               
                System.out.println("ToolbarBean - mobileStationBean - popola");
                mobileStationBean.setClausulaWhere(this.tipoStazioneSelezionato);
                mobileStationBean.popola();

                System.out.println("ToolbarBean - mapBean.popolaUltimiMappa");
                mapBean.setTipoStazioni(MapBean.STAZ_MOBILI);
                mapBean.setClausulaWhere(this.tipoStazioneSelezionato);
                mapBean.popolaUltimiMappa();

                 System.out.println("ToolbarBean - ok");
        }
	

	public void doTutteStazioniI(){
		
                System.out.println("toolbarBean - doTutteStazioniI");
		FacesMessage msg =  new FacesMessage(FacesMessage.SEVERITY_INFO, "Stazioni selezionate", "TUTTE LE STAZIONI FISSE");  
		
                 
                this.doTutteStazioni=true;
            this.doTuttiSensori=false;
            this.doTram=false;
            this.doBike=false;
            this.doBus=false;
            this.doWatch=false;
            this.doPolice=false;
            this.doJeep=false;
            this.doTaxi=false;
            this.doGarbage=false;
            this.doCovariance=false;
            this.doStazioni=false;
            this.doTotem=false;

            this.coloreBck=BIANCO;
            this.coloreTSensori=GRIGIO;
            this.coloreTram=GRIGIO;
            this.coloreBike=GRIGIO;
            this.coloreBus=GRIGIO;
            this.coloreWatch=GRIGIO;
            this.colorePolice=GRIGIO;
            this.coloreJeep=GRIGIO;
            this.coloreTaxi=GRIGIO;
            this.coloreGarbage=GRIGIO;
            this.coloreCovariance=GRIGIO;
            this.coloreStazioni=GRIGIO;
            this.coloreTotem=GRIGIO;
            this.pDM=false;
            this.pDE=false; 
            this.pSE=false;
            this.pSM=false;
            this.pST=false;
            this.pDT=false;
            this.disattivaTab=true;
            
            
            
            this.tipoStazioneSelezionato=" in ('" + TOTEM_TYPE + "','" + STATION_TYPE + "',";
            this.tipoStazioneSelezionato= this.tipoStazioneSelezionato + "'"+COVARIANCE_TYPE+"') ";
           
      
                
                mapBean.setTipoStazioni(MapBean.TUTTE_STAZ_FISSE);
                mapBean.setClausulaWhere(this.tipoStazioneSelezionato);
                mapBean.popolaUltimiMappa();
      
            FacesContext.getCurrentInstance().addMessage(null, msg);  
	}
	
	public void doTramI(){
            FacesMessage msg =  new FacesMessage(FacesMessage.SEVERITY_INFO, "Stazioni selezionate", "TRAM");  
		
            this.doTutteStazioni=false;
            this.doTuttiSensori=false;
            this.doTram=true;
            this.doBike=false;
            this.doBus=false;
            this.doWatch=false;
            this.doPolice=false;
            this.doJeep=false;
            this.doTaxi=false;
            this.doGarbage=false;
            this.doCovariance=false;
            this.doStazioni=false;
            this.doTotem=false;
                
            this.pDM=true;
            this.pDE=false;
            this.pSE=false;
            this.pSM=true;
            this.pDT=false;
            this.pST=false;
            this.disattivaTab=false;
            
            this.coloreBck=GRIGIO;
            this.coloreTSensori=GRIGIO;
            this.coloreTram=BIANCO;
            this.coloreBike=GRIGIO;
            this.coloreBus=GRIGIO;
            this.coloreWatch=GRIGIO;
            this.colorePolice=GRIGIO;
            this.coloreJeep=GRIGIO;
            this.coloreTaxi=GRIGIO;
            this.coloreGarbage=GRIGIO;
            this.coloreCovariance=GRIGIO;
            this.coloreStazioni=GRIGIO;
            this.coloreTotem=GRIGIO;
            
            this.tipoStazioneSelezionato=" = '"+TRAM_TYPE+"'";
            
            mobileStationBean.setClausulaWhere(this.tipoStazioneSelezionato);
            mobileStationBean.popola();
            mapBean.setTipoStazioni(MapBean.STAZ_MOBILI);
            mapBean.setClausulaWhere(this.tipoStazioneSelezionato);
            mapBean.popolaUltimiMappa();
          
            /*
            this.doTutteStazioniURL=TUTTE_STAZIONI_URL+GREY;
            this.doTramURL=TRAM_URL+ORANGE;
            this.doBikeURL=BIKE_URL+GREY;
            this.doBusURL=BUS_URL+GREY;
            this.doWatchURL=WATCH_URL+GREY;
            this.doPoliceURL=POLICE_URL+GREY;
            this.doJeepURL=JEEP_URL+GREY;
            this.doTaxiURL=TAXI_URL+GREY;
            this.doGarbageURL=GARBAGE_URL+GREY;
            this.doCovarianceURL=COVARIANCE_URL+GREY;
            this.doStazioniURL=STAZIONI_URL+GREY;
            this.doTotemURL=TOTEM_URL+GREY;
                    */
            FacesContext.getCurrentInstance().addMessage(null, msg);  
        }
        
        public void doBikeI(){
            FacesMessage msg =  new FacesMessage(FacesMessage.SEVERITY_INFO, "Stazioni selezionate", "BIKE");  
		
            this.doTutteStazioni=false;
            this.doTuttiSensori=false;
            this.doTram=false;
            this.doBike=true;
            this.doBus=false;
            this.doWatch=false;
            this.doPolice=false;
            this.doJeep=false;
            this.doTaxi=false;
            this.doGarbage=false;
            this.doCovariance=false;
            this.doStazioni=false;
            this.doTotem=false;
            this.coloreBck=GRIGIO;
            this.coloreTSensori=GRIGIO;
            this.coloreTram=GRIGIO;
            this.coloreBike=BIANCO;
            this.coloreBus=GRIGIO;
            this.coloreWatch=GRIGIO;
            this.colorePolice=GRIGIO;
            this.coloreJeep=GRIGIO;
            this.coloreTaxi=GRIGIO;
            this.coloreGarbage=GRIGIO;
            this.coloreCovariance=GRIGIO;
            this.coloreStazioni=GRIGIO;
            this.coloreTotem=GRIGIO;
            
            this.pDM=true;
            this.pDE=false;
            this.pSE=false;
            this.pSM=true;
            this.pDT=false;
            this.pST=false;
            this.disattivaTab=false;
            
            this.tipoStazioneSelezionato=" = '"+BIKE_TYPE+"'";
            
            mobileStationBean.setClausulaWhere(this.tipoStazioneSelezionato);
            mobileStationBean.popola();
            
           mapBean.setTipoStazioni(MapBean.STAZ_MOBILI);
            mapBean.setClausulaWhere(this.tipoStazioneSelezionato);
            mapBean.popolaUltimiMappa();
          
            /*
            this.doTutteStazioniURL=TUTTE_STAZIONI_URL+GREY;
            this.doTramURL=TRAM_URL+GREY;
            this.doBikeURL=BIKE_URL+ORANGE;
            this.doBusURL=BUS_URL+GREY;
            this.doWatchURL=WATCH_URL+GREY;
            this.doPoliceURL=POLICE_URL+GREY;
            this.doJeepURL=JEEP_URL+GREY;
            this.doTaxiURL=TAXI_URL+GREY;
            this.doGarbageURL=GARBAGE_URL+GREY;
            this.doCovarianceURL=COVARIANCE_URL+GREY;
            this.doStazioniURL=STAZIONI_URL+GREY;
            this.doTotemURL=TOTEM_URL+GREY;*/
     
            
            
            FacesContext.getCurrentInstance().addMessage(null, msg);  
        }
        
        public void doBusI(){
            FacesMessage msg =  new FacesMessage(FacesMessage.SEVERITY_INFO, "Stazioni selezionate", "BUS");  
		
            this.doTutteStazioni=false;
            this.doTuttiSensori=false;
            this.doTram=false;
            this.doBike=false;
            this.doBus=true;
            this.doWatch=false;
            this.doPolice=false;
            this.doJeep=false;
            this.doTaxi=false;
            this.doGarbage=false;
            this.doCovariance=false;
            this.doStazioni=false;
            this.doTotem=false;

            this.coloreBck=GRIGIO;
            this.coloreTSensori=GRIGIO;
            this.coloreTram=GRIGIO;
            this.coloreBike=GRIGIO;
            this.coloreBus=BIANCO;
            this.coloreWatch=GRIGIO;
            this.colorePolice=GRIGIO;
            this.coloreJeep=GRIGIO;
            this.coloreTaxi=GRIGIO;
            this.coloreGarbage=GRIGIO;
            this.coloreCovariance=GRIGIO;
            this.coloreStazioni=GRIGIO;
            this.coloreTotem=GRIGIO;
            
            this.pDM=true;
            this.pDE=false; 
            this.pSE=false;
            this.pSM=true;
            this.pDT=false;
            this.pST=false;
            this.disattivaTab=false;
            
            this.tipoStazioneSelezionato=" = '"+BUS_TYPE+"'";
            
            mobileStationBean.setClausulaWhere(this.tipoStazioneSelezionato);
            mobileStationBean.popola();
            
            mapBean.setTipoStazioni(MapBean.STAZ_MOBILI);
               mapBean.setClausulaWhere(this.tipoStazioneSelezionato);
            mapBean.popolaUltimiMappa();
          
            /*
            this.doTutteStazioniURL=TUTTE_STAZIONI_URL+GREY;
            this.doTramURL=TRAM_URL+GREY;
            this.doBikeURL=BIKE_URL+GREY;
            this.doBusURL=BUS_URL+ORANGE;
            this.doWatchURL=WATCH_URL+GREY;
            this.doPoliceURL=POLICE_URL+GREY;
            this.doJeepURL=JEEP_URL+GREY;
            this.doTaxiURL=TAXI_URL+GREY;
            this.doGarbageURL=GARBAGE_URL+GREY;
            this.doCovarianceURL=COVARIANCE_URL+GREY;
            this.doStazioniURL=STAZIONI_URL+GREY;
            this.doTotemURL=TOTEM_URL+GREY;
                    */
            FacesContext.getCurrentInstance().addMessage(null, msg);  
        }
    
        public void doWatchI(){
            FacesMessage msg =  new FacesMessage(FacesMessage.SEVERITY_INFO, "Stazioni selezionate", "WEARABLE");  
		
            this.doTutteStazioni=false;
            this.doTuttiSensori=false;
            this.doTram=false;
            this.doBike=false;
            this.doBus=false;
            this.doWatch=true;
            this.doPolice=false;
            this.doJeep=false;
            this.doTaxi=false;
            this.doGarbage=false;
            this.doCovariance=false;
            this.doStazioni=false;
            this.doTotem=false;

            
            this.pDM=true;
            this.pDE=false; 
            this.pSE=false;
            this.pSM=true;
            this.pDT=false;
            this.pST=false;
            this.disattivaTab=false;
            
            this.coloreBck=GRIGIO;
            this.coloreTSensori=GRIGIO;
            this.coloreTram=GRIGIO;
            this.coloreBike=GRIGIO;
            this.coloreBus=GRIGIO;
            this.coloreWatch=BIANCO;
            this.colorePolice=GRIGIO;
            this.coloreJeep=GRIGIO;
            this.coloreTaxi=GRIGIO;
            this.coloreGarbage=GRIGIO;
            this.coloreCovariance=GRIGIO;
            this.coloreStazioni=GRIGIO;
            this.coloreTotem=GRIGIO;
            this.tipoStazioneSelezionato=" = '"+WATCH_TYPE+"'";
            
            mobileStationBean.setClausulaWhere(this.tipoStazioneSelezionato);
            mobileStationBean.popola();
            
            mapBean.setTipoStazioni(MapBean.STAZ_MOBILI);
               mapBean.setClausulaWhere(this.tipoStazioneSelezionato);
            mapBean.popolaUltimiMappa();
          
            /*
            this.doTutteStazioniURL=TUTTE_STAZIONI_URL+GREY;
            this.doTramURL=TRAM_URL+GREY;
            this.doBikeURL=BIKE_URL+GREY;
            this.doBusURL=BUS_URL+GREY;
            this.doWatchURL=WATCH_URL+ORANGE;
            this.doPoliceURL=POLICE_URL+GREY;
            this.doJeepURL=JEEP_URL+GREY;
            this.doTaxiURL=TAXI_URL+GREY;
            this.doGarbageURL=GARBAGE_URL+GREY;
            this.doCovarianceURL=COVARIANCE_URL+GREY;
            this.doStazioniURL=STAZIONI_URL+GREY;
            this.doTotemURL=TOTEM_URL+GREY;
                    */
            FacesContext.getCurrentInstance().addMessage(null, msg);  
        }
        
        public void doPoliceI(){
            FacesMessage msg =  new FacesMessage(FacesMessage.SEVERITY_INFO, "Stazioni selezionate", "POLIZIA");  
		
            this.doTutteStazioni=false;
            this.doTuttiSensori=false;
            this.doTram=false;
            this.doBike=false;
            this.doBus=false;
            this.doWatch=false;
            this.doPolice=true;
            this.doJeep=false;
            this.doTaxi=false;
            this.doGarbage=false;
            this.doCovariance=false;
            this.doStazioni=false;
            this.doTotem=false;
            
            this.pDM=true;
            this.pDE=false; 
            this.pSE=false;
            this.pSM=true;
            this.pDT=false;
            this.pST=false;
            this.disattivaTab=false;
            
            this.coloreBck=GRIGIO;
            this.coloreTSensori=GRIGIO;
            this.coloreTram=GRIGIO;
            this.coloreBike=GRIGIO;
            this.coloreBus=GRIGIO;
            this.coloreWatch=GRIGIO;
            this.colorePolice=BIANCO;
            this.coloreJeep=GRIGIO;
            this.coloreTaxi=GRIGIO;
            this.coloreGarbage=GRIGIO;
            this.coloreCovariance=GRIGIO;
            this.coloreStazioni=GRIGIO;
            this.coloreTotem=GRIGIO;
            this.tipoStazioneSelezionato=" = '"+POLICE_TYPE+"'";
            
            mobileStationBean.setClausulaWhere(this.tipoStazioneSelezionato);
            mobileStationBean.popola();
            
            mapBean.setTipoStazioni(MapBean.STAZ_MOBILI);
               mapBean.setClausulaWhere(this.tipoStazioneSelezionato);
            mapBean.popolaUltimiMappa();
          
            /*
            this.doTutteStazioniURL=TUTTE_STAZIONI_URL+GREY;
            this.doTramURL=TRAM_URL+GREY;
            this.doBikeURL=BIKE_URL+GREY;
            this.doBusURL=BUS_URL+GREY;
            this.doWatchURL=WATCH_URL+GREY;
            this.doPoliceURL=POLICE_URL+ORANGE;
            this.doJeepURL=JEEP_URL+GREY;
            this.doTaxiURL=TAXI_URL+GREY;
            this.doGarbageURL=GARBAGE_URL+GREY;
            this.doCovarianceURL=COVARIANCE_URL+GREY;
            this.doStazioniURL=STAZIONI_URL+GREY;
            this.doTotemURL=TOTEM_URL+GREY; */
            FacesContext.getCurrentInstance().addMessage(null, msg);  
        }
        
        public void doJeepI(){
            FacesMessage msg =  new FacesMessage(FacesMessage.SEVERITY_INFO, "Stazioni selezionate", "JEEP");  
		
            this.doTutteStazioni=false;
            this.doTuttiSensori=false;
            this.doTram=false;
            this.doBike=false;
            this.doBus=false;
            this.doWatch=false;
            this.doPolice=false;
            this.doJeep=true;
            this.doTaxi=false;
            this.doGarbage=false;
            this.doCovariance=false;
            this.doStazioni=false;
            this.doTotem=false;

            this.coloreBck=GRIGIO;
            this.coloreTSensori=GRIGIO;
            this.coloreTram=GRIGIO;
            this.coloreBike=GRIGIO;
            this.coloreBus=GRIGIO;
            this.coloreWatch=GRIGIO;
            this.colorePolice=GRIGIO;
            this.coloreJeep=BIANCO;
            this.coloreTaxi=GRIGIO;
            this.coloreGarbage=GRIGIO;
            this.coloreCovariance=GRIGIO;
            this.coloreStazioni=GRIGIO;
            this.coloreTotem=GRIGIO;
            
            this.pDM=true;
            this.pDE=false; 
            this.pSE=false;
            this.pSM=true;
            this.pDT=false;
            this.pST=false;
            this.disattivaTab=false;
            
            this.tipoStazioneSelezionato=" = '"+JEEP_TYPE+"'";
            
            mobileStationBean.setClausulaWhere(this.tipoStazioneSelezionato);
            mobileStationBean.popola();
            
            
            mapBean.setTipoStazioni(MapBean.STAZ_MOBILI);
               mapBean.setClausulaWhere(this.tipoStazioneSelezionato);
            mapBean.popolaUltimiMappa();
          
           /*
                  
           this.doTutteStazioniURL=TUTTE_STAZIONI_URL+GREY;
            this.doTramURL=TRAM_URL+GREY;
            this.doBikeURL=BIKE_URL+GREY;
            this.doBusURL=BUS_URL+GREY;
            this.doWatchURL=WATCH_URL+GREY;
            this.doPoliceURL=POLICE_URL+GREY;
            this.doJeepURL=JEEP_URL+ORANGE;
            this.doTaxiURL=TAXI_URL+GREY;
            this.doGarbageURL=GARBAGE_URL+GREY;
            this.doCovarianceURL=COVARIANCE_URL+GREY;
            this.doStazioniURL=STAZIONI_URL+GREY;
            this.doTotemURL=TOTEM_URL+GREY;*/
            FacesContext.getCurrentInstance().addMessage(null, msg);  
        }
        
        public void doTaxiI(){
            FacesMessage msg =  new FacesMessage(FacesMessage.SEVERITY_INFO, "Stazioni selezionate", "TAXI");  
		
            this.doTutteStazioni=false;
            this.doTuttiSensori=false;
            this.doTram=false;
            this.doBike=false;
            this.doBus=false;
            this.doWatch=false;
            this.doPolice=false;
            this.doJeep=false;
            this.doTaxi=true;
            this.doGarbage=false;
            this.doCovariance=false;
            this.doStazioni=false;
            this.doTotem=false;

            this.pDM=true;
            this.pDE=false; 
            this.pSE=false;
            this.pSM=true;
            this.pDT=false;
            this.pST=false;
            this.disattivaTab=false;
            
            this.coloreBck=GRIGIO;
            this.coloreTSensori=GRIGIO;
            this.coloreTram=GRIGIO;
            this.coloreBike=GRIGIO;
            this.coloreBus=GRIGIO;
            this.coloreWatch=GRIGIO;
            this.colorePolice=GRIGIO;
            this.coloreJeep=GRIGIO;
            this.coloreTaxi=BIANCO;
            this.coloreGarbage=GRIGIO;
            this.coloreCovariance=GRIGIO;
            this.coloreStazioni=GRIGIO;
            this.coloreTotem=GRIGIO;
            this.tipoStazioneSelezionato=" = '"+TAXI_TYPE+"'";
            
            mobileStationBean.setClausulaWhere(this.tipoStazioneSelezionato);
            mobileStationBean.popola();
            
            
            mapBean.setTipoStazioni(MapBean.STAZ_MOBILI);
               mapBean.setClausulaWhere(this.tipoStazioneSelezionato);
            mapBean.popolaUltimiMappa();
          
            /*
            this.doTutteStazioniURL=TUTTE_STAZIONI_URL+GREY;
            this.doTramURL=TRAM_URL+GREY;
            this.doBikeURL=BIKE_URL+GREY;
            this.doBusURL=BUS_URL+GREY;
            this.doWatchURL=WATCH_URL+GREY;
            this.doPoliceURL=POLICE_URL+GREY;
            this.doJeepURL=JEEP_URL+GREY;
            this.doTaxiURL=TAXI_URL+ORANGE;
            this.doGarbageURL=GARBAGE_URL+GREY;
            this.doCovarianceURL=COVARIANCE_URL+GREY;
            this.doStazioniURL=STAZIONI_URL+GREY;
            this.doTotemURL=TOTEM_URL+GREY;*/
            FacesContext.getCurrentInstance().addMessage(null, msg);  
        }
        
        public void doSelectBiomasse(){
            FacesMessage msg =  new FacesMessage(FacesMessage.SEVERITY_INFO, "Stazioni selezionate", "Caldaie a Biomasse");  
	
            this.doBiomasse = true;
            this.doFotovoltaico = false;
            this.doStazioni2 = false;
            
            this.coloreBiomasse=BIANCO;
            this.coloreFotovoltaico = GRIGIO;
            this.coloreStazioni = GRIGIO;
          
            this.tipoStazioneSelezionato=" = '"+BIOMASSE_TYPE+"'";
              this.pgB=true;
                this.pgF=false;
                this.pgS=false;
                
                this.psB=true;
                this.psF=false;
                this.psS=false;
                
                this.pdB=true;
                this.pdF=false;
                this.pdS=false;
                
                sweStationBean.setClausulaWhere(this.tipoStazioneSelezionato);
                sweStationBean.popola();
               
                mapBean.setTipoStazioni(MapBean.STAZ_RINNOVABILI);
                mapBean.setClausulaWhere(this.tipoStazioneSelezionato);
                
                System.out.println("ora chiamo ultimimappa");
                
                mapBean.popolaUltimiMappa();
                System.out.println("resteGUI_Rinnovabili completato");
                    
          
            FacesContext.getCurrentInstance().addMessage(null, msg);  
        }
        
        
        public void doStazioni2(){
            FacesMessage msg =  new FacesMessage(FacesMessage.SEVERITY_INFO, "Stazioni selezionate", "Stazioni fisse");  
	
            this.doBiomasse = true;
            this.doFotovoltaico = false;
            this.doStazioni2 = false;
            
            this.coloreBiomasse=GRIGIO;
            this.coloreFotovoltaico = GRIGIO;
            this.coloreStazioni = BIANCO;
            
            
            this.pgB=false;
                this.pgF=false;
                this.pgS=true;
                
                this.psB=false;
                this.psF=false;
                this.psS=true;
                
                this.pdB=false;
                this.pdF=false;
                this.pdS=true;
            
            this.tipoStazioneSelezionato=" = '"+STATION_TYPE+"'";
            
            
            totemStationBean.setClausulaWhere(this.tipoStazioneSelezionato);
            totemStationBean.popola();
            
            mapBean.setTipoStazioni(MapBean.STAZ_FISSE);
               mapBean.setClausulaWhere(this.tipoStazioneSelezionato);
            mapBean.popolaUltimiMappa();
            FacesContext.getCurrentInstance().addMessage(null, msg);  
        }
        
        
         public void doSelectFotovoltaico(){
            FacesMessage msg =  new FacesMessage(FacesMessage.SEVERITY_INFO, "Stazioni selezionate", "Fotovoltaico");  
	
            this.doBiomasse = false;
            this.doFotovoltaico = true;
            this.coloreBiomasse=GRIGIO;
            this.coloreFotovoltaico = BIANCO;
            this.coloreStazioni = GRIGIO;
            
            this.pgB=false;
                this.pgF=true;
                this.pgS=false;
                
                this.psB=false;
                this.psF=true;
                this.psS=false;
            
                this.pdB=false;
                this.pdF=true;
                this.pdS=false;
                
            this.tipoStazioneSelezionato=" = '"+FOTOVOLTAICO_TYPE+"'";
          //  mobileStationBean.setClausulaWhere(this.tipoStazioneSelezionato);
          //  mobileStationBean.popola();
            fotoStationBean.setClausulaWhere(this.tipoStazioneSelezionato);
            fotoStationBean.popola();
            mapBean.setTipoStazioni(MapBean.STAZ_FOTOVOLTAIC);
            mapBean.setClausulaWhere(this.tipoStazioneSelezionato);
            mapBean.popolaUltimiMappa();
            FacesContext.getCurrentInstance().addMessage(null, msg);  
        }
        
        public void doGarbageI(){
            FacesMessage msg =  new FacesMessage(FacesMessage.SEVERITY_INFO, "Stazioni selezionate", "NETTEZZA URBANA");  
		
            this.doTutteStazioni=false;
            this.doTuttiSensori=false;
            this.doTram=false;
            this.doBike=false;
            this.doBus=false;
            this.doWatch=false;
            this.doPolice=false;
            this.doJeep=false;
            this.doTaxi=false;
            this.doGarbage=true;
            this.doCovariance=false;
            this.doStazioni=false;
            this.doTotem=false;

            this.pDM=true;
            this.pDE=false; 
            this.pSE=false;
            this.pSM=true;
            this.pDT=false;
            this.pST=false;
            this.disattivaTab=false;
            
            this.coloreBck=GRIGIO;
            this.coloreTSensori=GRIGIO;
            this.coloreTram=GRIGIO;
            this.coloreBike=GRIGIO;
            this.coloreBus=GRIGIO;
            this.coloreWatch=GRIGIO;
            this.colorePolice=GRIGIO;
            this.coloreJeep=GRIGIO;
            this.coloreTaxi=GRIGIO;
            this.coloreGarbage=BIANCO;
            this.coloreCovariance=GRIGIO;
            this.coloreStazioni=GRIGIO;
            this.coloreTotem=GRIGIO;
            
            this.tipoStazioneSelezionato=" = '"+GARBAGE_TYPE+"'";
            
            
            mobileStationBean.setClausulaWhere(this.tipoStazioneSelezionato);
            mobileStationBean.popola();
            
            mapBean.setTipoStazioni(MapBean.STAZ_MOBILI);
               mapBean.setClausulaWhere(this.tipoStazioneSelezionato);
            mapBean.popolaUltimiMappa();
          
            /*
            this.doTutteStazioniURL=TUTTE_STAZIONI_URL+GREY;
            this.doTramURL=TRAM_URL+GREY;
            this.doBikeURL=BIKE_URL+GREY;
            this.doBusURL=BUS_URL+GREY;
            this.doWatchURL=WATCH_URL+GREY;
            this.doPoliceURL=POLICE_URL+GREY;
            this.doJeepURL=JEEP_URL+GREY;
            this.doTaxiURL=TAXI_URL+GREY;
            this.doGarbageURL=GARBAGE_URL+ORANGE;
            this.doCovarianceURL=COVARIANCE_URL+GREY;
            this.doStazioniURL=STAZIONI_URL+GREY;
            this.doTotemURL=TOTEM_URL+GREY;*/
            FacesContext.getCurrentInstance().addMessage(null, msg);  
        }
        
        public void doCovarianceI(){
            FacesMessage msg =  new FacesMessage(FacesMessage.SEVERITY_INFO, "Stazioni selezionate", "Eddy Covariance");  
		
            this.doTutteStazioni=false;
            this.doTuttiSensori=false;
            this.doTram=false;
            this.doBike=false;
            this.doBus=false;
            this.doWatch=false;
            this.doPolice=false;
            this.doJeep=false;
            this.doTaxi=false;
            this.doGarbage=false;
            this.doCovariance=true;
            this.doStazioni=false;
            this.doTotem=false;

            
            this.pDM=false;
            this.pDE=true; 
            this.pSE=true;
            this.pSM=false;
            this.pDT=false;
            this.pST=false;
            this.disattivaTab=false;
            
            this.coloreBck=GRIGIO;
            this.coloreTSensori=GRIGIO;
            this.coloreTram=GRIGIO;
            this.coloreBike=GRIGIO;
            this.coloreBus=GRIGIO;
            this.coloreWatch=GRIGIO;
            this.colorePolice=GRIGIO;
            this.coloreJeep=GRIGIO;
            this.coloreTaxi=GRIGIO;
            this.coloreGarbage=GRIGIO;
            this.coloreCovariance=BIANCO;
            this.coloreStazioni=GRIGIO;
            this.coloreTotem=GRIGIO;
            this.tipoStazioneSelezionato=" = '"+COVARIANCE_TYPE+"'";
            
            
            
            
            
            eddyStationBean.setClausulaWhere(this.tipoStazioneSelezionato);
            eddyStationBean.popola();
              //TODO:asdsad
            
                mapBean.setTipoStazioni(MapBean.STAZ_EDDY);
                mapBean.setClausulaWhere(this.tipoStazioneSelezionato);
                mapBean.popolaUltimiMappa();
            
            /*
            this.doTutteStazioniURL=TUTTE_STAZIONI_URL+GREY;
            this.doTramURL=TRAM_URL+GREY;
            this.doBikeURL=BIKE_URL+GREY;
            this.doBusURL=BUS_URL+GREY;
            this.doWatchURL=WATCH_URL+GREY;
            this.doPoliceURL=POLICE_URL+GREY;
            this.doJeepURL=JEEP_URL+GREY;
            this.doTaxiURL=TAXI_URL+GREY;
            this.doGarbageURL=GARBAGE_URL+GREY;
            this.doCovarianceURL=COVARIANCE_URL+ORANGE;
            this.doStazioniURL=STAZIONI_URL+GREY;
            this.doTotemURL=TOTEM_URL+GREY;*/
            FacesContext.getCurrentInstance().addMessage(null, msg);  
        }
        
        
        public void doStazioniI(){
            FacesMessage msg =  new FacesMessage(FacesMessage.SEVERITY_INFO, "Stazioni selezionate", "STAZIONI FISSE");  
		
            this.doTutteStazioni=false;
            this.doTuttiSensori=false;
            this.doTram=false;
            this.doBike=false;
            this.doBus=false;
            this.doWatch=false;
            this.doPolice=false;
            this.doJeep=false;
            this.doTaxi=false;
            this.doGarbage=false;
            this.doCovariance=false;
            this.doStazioni=true;
            this.doTotem=false;
            this.disattivaTab=false;
            this.pDM=false;
            this.pDE=false; 
            this.pSE=false;
            this.pSM=false;
            this.pDT=true;
            this.pST=true;
            
            this.coloreBck=GRIGIO;
            this.coloreTSensori=GRIGIO;
            this.coloreTram=GRIGIO;
            this.coloreBike=GRIGIO;
            this.coloreBus=GRIGIO;
            this.coloreWatch=GRIGIO;
            this.colorePolice=GRIGIO;
            this.coloreJeep=GRIGIO;
            this.coloreTaxi=GRIGIO;
            this.coloreGarbage=GRIGIO;
            this.coloreCovariance=GRIGIO;
            this.coloreStazioni=BIANCO;
            this.coloreTotem=GRIGIO;
            
            this.tipoStazioneSelezionato=" = '"+STATION_TYPE+"'";
          totemStationBean.setClausulaWhere(this.tipoStazioneSelezionato);
                totemStationBean.popola();
               
                mapBean.setTipoStazioni(MapBean.STAZ_FISSE);
                mapBean.setClausulaWhere(this.tipoStazioneSelezionato);
                mapBean.popolaUltimiMappa();
            FacesContext.getCurrentInstance().addMessage(null, msg);  
        }
        
        
        
        
        public void doTotemI(){
            FacesMessage msg =  new FacesMessage(FacesMessage.SEVERITY_INFO, "Stazioni selezionate", "TOTEM");  
		
            this.doTutteStazioni=false;
            this.doTuttiSensori=false;
            this.doTram=false;
            this.doBike=false;
            this.doBus=false;
            this.doWatch=false;
            this.doPolice=false;
            this.doJeep=false;
            this.doTaxi=false;
            this.doGarbage=false;
            this.doCovariance=false;
            this.doStazioni=false;
            this.doTotem=false;
            this.disattivaTab=false;
            this.coloreBck=GRIGIO;
            this.coloreTSensori=GRIGIO;
            this.coloreTram=GRIGIO;
            this.coloreBike=GRIGIO;
            this.coloreBus=GRIGIO;
            this.coloreWatch=GRIGIO;
            this.colorePolice=GRIGIO;
            this.coloreJeep=GRIGIO;
            this.coloreTaxi=GRIGIO;
            this.coloreGarbage=GRIGIO;
            this.coloreCovariance=GRIGIO;
            this.coloreStazioni=GRIGIO;
            this.coloreTotem=BIANCO;
            
            this.pDM=false;
            this.pDE=false; 
            this.pSE=false;
            this.pSM=false;
            this.pDT=true;
            this.pST=true;
            
            this.tipoStazioneSelezionato=" = '"+TOTEM_TYPE+"'";
            totemStationBean.setClausulaWhere(this.tipoStazioneSelezionato);
            totemStationBean.popola();
               
            mapBean.setTipoStazioni(MapBean.STAZ_FISSE);
            mapBean.setClausulaWhere(this.tipoStazioneSelezionato);
            mapBean.popolaUltimiMappa();
            FacesContext.getCurrentInstance().addMessage(null, msg);  
        }
        
         public void doTuttiSensoriI(){
            FacesMessage msg =  new FacesMessage(FacesMessage.SEVERITY_INFO, "Stazioni selezionate", "TUTTI I SENSORI MOBILI");  
		resetGUI();
            FacesContext.getCurrentInstance().addMessage(null, msg);  
        }
         
         public String createWhereString(String prefix){
             return prefix + this.tipoStazioneSelezionato;
         }
}
