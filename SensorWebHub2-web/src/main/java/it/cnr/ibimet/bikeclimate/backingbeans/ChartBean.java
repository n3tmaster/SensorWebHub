package it.cnr.ibimet.bikeclimate.backingbeans;


import it.cnr.ibimet.bikeclimate.dbutils.ChartParams;
import it.cnr.ibimet.bikeclimate.dbutils.TDBManager;
import it.lr.libs.DBManager.ParameterType;
import org.primefaces.model.chart.*;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import java.io.Serializable;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;


@ManagedBean(name="chartBean")
@ViewScoped
public class ChartBean implements Serializable, AppConsts{

	/**
	 * 
	 */
	
	private static final long serialVersionUID = 1L;
	private final String TITOLO_TEMP= "Temperature";
	private final String TITOLO_CO2= "CO2";
	private final String TITOLO_UMIDITA="Umidita";
	private final String TITOLO_OZONO="Ozono";
	private final String EDDY_STANDARD="EDDY";
	private Date xmin;
	private Date xmax;
	private Date date;
	private Date date2;
	private Date dateT;
	private Date dateT2;
	private Date dateE;
	private Date dateE2;
        private Date dateB;
	private Date dateB2;
	private LineChartModel model;
	private LineChartModel model1;
    private LineChartModel model2;
	private LineChartModel model3;
	private LineChartModel model4;
	private LineChartModel model5;
	private LineChartModel model6;
	private LineChartModel model7;
	private LineChartModel model8;
	private LineChartModel model9;
	private String graphTitle1;
	private String graphTitle2;
	private String graphTitle3;
	private String graphTitle4;
	private String graphTitle5;
	private String graphTitle6;
	private String graphTitle7;
	private String graphTitle8;
	private String graphTitle9;
    private boolean dis1;
	private boolean dis2;
	private boolean dis3;
	private boolean dis4;
	private boolean dis5;
	private boolean dis6;
	private boolean dis7;
	private boolean dis8;
	private boolean dis9;
	@ManagedProperty(value="#{fotoBean}")
    private FotovoltaicBean fotoBean;
    @ManagedProperty(value="#{sweStationBean}")
    private SWEBean sweBean;
    @ManagedProperty(value="#{totemStationBean}")
	private TotemStationBean totemStationBean;
    @ManagedProperty(value="#{eddyStationBean}")
	private EddyStationBean eddyStationBean;
    @ManagedProperty(value="#{mobileStationBean}")
	private MobileStationBean mobileStationBean;
    @ManagedProperty(value="#{loginBean}")
	private LoginBean loginBean;
	private double xmindbl;
	private double xmaxdbl;
	private int icount;
	private double minTemp, maxTemp;
	private double minCo2, maxCo2;
	private double minRad, maxRad;
//	private double minNoise, maxNoise;
	private double minOzono, maxOzono;

	public boolean isDis1() {
		return dis1;
	}

	public void setDis1(boolean dis1) {
		this.dis1 = dis1;
	}

	public boolean isDis2() {
		return dis2;
	}

	public void setDis2(boolean dis2) {
		this.dis2 = dis2;
	}

	public boolean isDis3() {
		return dis3;
	}

	public void setDis3(boolean dis3) {
		this.dis3 = dis3;
	}

	public boolean isDis4() {
		return dis4;
	}

	public void setDis4(boolean dis4) {
		this.dis4 = dis4;
	}

	public boolean isDis5() {
		return dis5;
	}

	public void setDis5(boolean dis5) {
		this.dis5 = dis5;
	}

	public boolean isDis6() {
		return dis6;
	}

	public void setDis6(boolean dis6) {
		this.dis6 = dis6;
	}

	public boolean isDis7() {
		return dis7;
	}

	public void setDis7(boolean dis7) {
		this.dis7 = dis7;
	}

	public boolean isDis8() {
		return dis8;
	}

	public void setDis8(boolean dis8) {
		this.dis8 = dis8;
	}

	public boolean isDis9() {
		return dis9;
	}

	public void setDis9(boolean dis9) {
		this.dis9 = dis9;
	}

	public String getGraphTitle1() {
		return graphTitle1;
	}

	public void setGraphTitle1(String graphTitle1) {
		this.graphTitle1 = graphTitle1;
	}

	public String getGraphTitle2() {
		return graphTitle2;
	}

	public void setGraphTitle2(String graphTitle2) {
		this.graphTitle2 = graphTitle2;
	}

	public String getGraphTitle3() {
		return graphTitle3;
	}

	public void setGraphTitle3(String graphTitle3) {
		this.graphTitle3 = graphTitle3;
	}

	public String getGraphTitle4() {
		return graphTitle4;
	}

	public void setGraphTitle4(String graphTitle4) {
		this.graphTitle4 = graphTitle4;
	}

	public LineChartModel getModel5() {
		return model5;
	}

	public void setModel5(LineChartModel model5) {
		this.model5 = model5;
	}

	public LineChartModel getModel6() {
		return model6;
	}

	public void setModel6(LineChartModel model6) {
		this.model6 = model6;
	}

	public LineChartModel getModel7() {
		return model7;
	}

	public void setModel7(LineChartModel model7) {
		this.model7 = model7;
	}

	public LineChartModel getModel8() {
		return model8;
	}

	public void setModel8(LineChartModel model8) {
		this.model8 = model8;
	}

	public LineChartModel getModel9() {
		return model9;
	}

	public void setModel9(LineChartModel model9) {
		this.model9 = model9;
	}

	public String getGraphTitle5() {
		return graphTitle5;
	}

	public void setGraphTitle5(String graphTitle5) {
		this.graphTitle5 = graphTitle5;
	}

	public String getGraphTitle6() {
		return graphTitle6;
	}

	public void setGraphTitle6(String graphTitle6) {
		this.graphTitle6 = graphTitle6;
	}

	public String getGraphTitle7() {
		return graphTitle7;
	}

	public void setGraphTitle7(String graphTitle7) {
		this.graphTitle7 = graphTitle7;
	}

	public String getGraphTitle8() {
		return graphTitle8;
	}

	public void setGraphTitle8(String graphTitle8) {
		this.graphTitle8 = graphTitle8;
	}

	public String getGraphTitle9() {
		return graphTitle9;
	}

	public void setGraphTitle9(String graphTitle9) {
		this.graphTitle9 = graphTitle9;
	}

	public LineChartModel getModel() {
            return model;
        }

        public void setModel(LineChartModel model) {
            this.model = model;
        }
        
    public LineChartModel getModel1() {
        return model1;
    }

    public void setModel1(LineChartModel model1) {
        this.model1 = model1;
    }

    public LineChartModel getModel2() {
        return model2;
    }

    public void setModel2(LineChartModel model2) {
        this.model2 = model2;
    }

    public LineChartModel getModel3() {
        return model3;
    }

    public void setModel3(LineChartModel model3) {
        this.model3 = model3;
    }

    public LineChartModel getModel4() {
        return model4;
    }

    public void setModel4(LineChartModel model4) {
        this.model4 = model4;
    }
	
    public Date getDateB() {
        return dateB;
    }

    public void setDateB(Date dateB) {
        this.dateB = dateB;
    }

    public Date getDateB2() {
        return dateB2;
    }

    public void setDateB2(Date dateB2) {
        this.dateB2 = dateB2;
    }

	public Date getDateE() {
		return dateE;
	}
	
	public void setDateE(Date dateE) {
		this.dateE = dateE;
	}

	public Date getDateE2() {
		return dateE2;
	}

	public void setDateE2(Date dateE2) {
		this.dateE2 = dateE2;
	}

	public Date getDateT() {
		return dateT;
	}

	public void setDateT(Date dateT) {
		this.dateT = dateT;
	}

	public Date getDateT2() {
		return dateT2;
	}
	
	public void setDateT2(Date dateT2) {
		this.dateT2 = dateT2;
	}

	public double getXmindbl() {
		return xmindbl;
	}

	public void setXmindbl(double xmindbl) {
		this.xmindbl = xmindbl;
	}

	public double getXmaxdbl() {
		return xmaxdbl;
	}

	public void setXmaxdbl(double xmaxdbl) {
		this.xmaxdbl = xmaxdbl;
	}
	
	public Date getDate2() {
		return date2;
	}

	public void setDate2(Date date2) {
		this.date2 = date2;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getIcount() {
		return icount;
	}

	public void setIcount(int icount) {
		this.icount = icount;
	}
        
	public Date getXmax() {
		return xmax;
	}

	public void setXmax(Date xmax) {
		this.xmax = xmax;
	}

	public Date getXmin() {
		return xmin;
	}

	public void setXmin(Date xmin) {
		this.xmin = xmin;
	}
        
    public SWEBean getSweBean() {
        return sweBean;
    }

    public void setSweBean(SWEBean sweBean) {
        this.sweBean = sweBean;
    }
	
    public FotovoltaicBean getFotoBean() {
        return fotoBean;
    }

    public void setFotoBean(FotovoltaicBean fotoBean) {
        this.fotoBean = fotoBean;
    }

	public TotemStationBean getTotemStationBean() {
		return totemStationBean;
	}

	public void setTotemStationBean(TotemStationBean totemStationBean) {
		this.totemStationBean = totemStationBean;
	}
	
	public EddyStationBean getEddyStationBean() {
		return eddyStationBean;
	}

	public void setEddyStationBean(EddyStationBean eddyStationBean) {
		this.eddyStationBean = eddyStationBean;
	}

	public MobileStationBean getMobileStationBean() {
		return mobileStationBean;
	}

	public void setMobileStationBean(MobileStationBean mobileStationBean) {
		this.mobileStationBean = mobileStationBean;
	}
	
	public double getMinOzono() {
		return minOzono;
	}

	public void setMinOzono(double minOzono) {
		this.minOzono = minOzono;
	}

	public double getMaxOzono() {
		return maxOzono;
	}

	public void setMaxOzono(double maxOzono) {
		this.maxOzono = maxOzono;
	}

	public double getMinTemp() {
		return minTemp;
	}

	public void setMinTemp(double minTemp) {
		this.minTemp = minTemp;
	}

	public double getMaxTemp() {
		return maxTemp;
	}

	public void setMaxTemp(double maxTemp) {
		this.maxTemp = maxTemp;
	}

	public double getMinCo2() {
		return minCo2;
	}

	public void setMinCo2(double minCo2) {
		this.minCo2 = minCo2;
	}

	public double getMaxCo2() {
		return maxCo2;
	}

	public void setMaxCo2(double maxCo2) {
		this.maxCo2 = maxCo2;
	}

	public double getMinRad() {
		return minRad;
	}

	public void setMinRad(double minRad) {
		this.minRad = minRad;
	}

	public double getMaxRad() {
		return maxRad;
	}

	public void setMaxRad(double maxRad) {
		this.maxRad = maxRad;
	}

	@PostConstruct
	public void init(){

            System.out.println("ChartBean - Init");

			disableGraphs();

            this.date = new Date();
            this.date2 = new Date();
            this.dateT = new Date();
            this.dateT2 = new Date();
            this.dateE = new Date();
            this.dateE2 = new Date();
            this.dateB = new Date();
            this.dateB2 = new Date();
            String dataOut;
       
          
            System.out.println("ChartBean - faccio popola");
            if(loginBean.getId_dominio() == LoginBean.RENEWABLELOGIN){
                popolaBiomasse();
            }else{
                popolaMobile();
            }
            
                
	}
	
	public LoginBean getLoginBean() {
		return loginBean;
	}

	public void setLoginBean(LoginBean loginBean) {
		this.loginBean = loginBean;
	}

	public void updVal(){
		
	}
	

	public void popolaFromData(GregorianCalendar result1, GregorianCalendar result2){
		
        String dataOut;

       
        
        
        
		TDBManager dsm2=null;
		
	
		try {
			if(loginBean.getLogged()){
				
                            LineChartSeries temp = new LineChartSeries();  
                            temp.setLabel("Max");
                            LineChartSeries tempMin = new LineChartSeries();  
                            tempMin.setLabel("Min");
                            LineChartSeries tempAvg = new LineChartSeries();  
                            tempAvg.setLabel("Avg");

                            LineChartSeries co2 = new LineChartSeries();  
                            co2.setLabel("Max");
                            LineChartSeries co2Min = new LineChartSeries();  
                            co2Min.setLabel("Min");
                            LineChartSeries co2Avg = new LineChartSeries();  
                            co2Avg.setLabel("Avg");

                            LineChartSeries rad = new LineChartSeries();  
                            rad.setLabel("Max");
                            LineChartSeries radMin = new LineChartSeries();  
                            radMin.setLabel("Min");
                            LineChartSeries radAvg = new LineChartSeries();  
                            radAvg.setLabel("Avg");

		 /*       LineChartSeries noise = new LineChartSeries();  
		        noise.setLabel("Max");
		        LineChartSeries noiseMin = new LineChartSeries();  
		        noiseMin.setLabel("Min");
		        LineChartSeries noiseAvg = new LineChartSeries();  
		        noiseAvg.setLabel("Avg");
		   */     
                            LineChartSeries ozono = new LineChartSeries();  
                            ozono.setLabel("Max");
                            LineChartSeries ozonoMin = new LineChartSeries();  
                            ozonoMin.setLabel("Min");
                            LineChartSeries ozonoAvg = new LineChartSeries();  
                            ozonoAvg.setLabel("Avg");
				
                            model1 = new LineChartModel();  
                            model2 = new LineChartModel();  
                            model3 = new LineChartModel();  
                            //noiseModel = new CartesianChartModel();  
                            model4 = new LineChartModel();  
                                    //Prelevo il primo track
					
					
					dsm2 = new TDBManager("jdbc/urbandb");
					
				//	System.out.println("Creo temperature");
					String sqlString2="select max(tair),min(tair),avg(tair), " +
							"date_trunc('hour' , data) as dataout " +
							"from dati  " +
							"where  ";
					
					
					if(result1.equals(result2)){
						//stesso giorno
						  sqlString2=sqlString2+"data=? ";
					}else{
						//giorni diversi
						 sqlString2=sqlString2+"data between ? and ? ";
					}
					sqlString2=sqlString2+"and id_mobile_station=? and tair<>"+NP_DIGITAL_VALUE+" group by dataout "+
							"order by dataout";
							
					
					
					dsm2.setPreparedStatementRef(sqlString2);
					
					if(result1.equals(result2)){
						dsm2.setParameter(ParameterType.DATE, result1, 1);
						//dsm2.setParameter(ParameterType.DATE,result2, 2);
						dsm2.setParameter(ParameterType.INT,""+mobileStationBean.getMobileStationSelezionato001().getId_mobile_station(),2);
					
					}else{
						dsm2.setParameter(ParameterType.DATE, result1, 1);
						dsm2.setParameter(ParameterType.DATE,result2, 2);
						dsm2.setParameter(ParameterType.INT,""+mobileStationBean.getMobileStationSelezionato001().getId_mobile_station(),3);
					
					}
					
					dsm2.runPreparedQuery();
					
					
			        
			        boolean trovato=false;
			        
			        while(dsm2.next()){
			        	trovato=true;
						
                                             dataOut =  dsm2.getData(4).get(Calendar.YEAR)+"-"+(dsm2.getData(4).get(Calendar.MONTH)+1)+"-"+dsm2.getData(4).get(Calendar.DAY_OF_MONTH)+" "+dsm2.getData(4).get(Calendar.HOUR_OF_DAY)+":"+dsm2.getData(4).get(Calendar.MINUTE);
                                            
                                        
                                       
						temp.set(dataOut, dsm2.getDouble(1));
						tempMin.set(dataOut, dsm2.getDouble(2));
						tempAvg.set(dataOut, dsm2.getDouble(3));
					
					}
					
			        if(!trovato){
			        	temp.set(date.getTime(), 0.0);
						
						tempMin.set(date.getTime(), 0.0);
						
						tempAvg.set(date.getTime(), 0.0);
						
						//this.titoloTemp=TITOLO_TEMP+" -- "+mobileStationBean.getMobileStationSelezionato001().getNome();
				    }
			        
			        model1.addSeries(temp);
			        model1.addSeries(tempMin);
			        model1.addSeries(tempAvg);
                                
					model1.setTitle(TITOLO_TEMP+" -- "+mobileStationBean.getMobileStationSelezionato001().getNome());
					model1.setAnimate(true);
					model1.setZoom(true);
					model1.getAxis(AxisType.Y).setLabel("Temperatura");
					model1.setSeriesColors("D2D2D2,D2D2D2,27B4D8");
					model1.setLegendPosition("e");

					DateAxis axis = new DateAxis("Tempo");
					axis.setTickAngle(-70);

					axis.setTickFormat("%d-%m-%Y  %H:%M");
					model1.getAxes().put(AxisType.X, axis);
                                

					sqlString2="select max(co2),min(co2),avg(co2), " +
							"date_trunc('hour' , data) as dataout " +
							"from dati  " +
							"where  ";
					
					
					if(result1.equals(result2)){
						//stesso giorno
						  sqlString2=sqlString2+"data=? ";
					}else{
						//giorni diversi
						 sqlString2=sqlString2+"data between ? and ? ";
					}
					sqlString2=sqlString2+"and id_mobile_station=? and tair<>"+NP_DIGITAL_VALUE+" group by dataout "+
							"order by dataout";
							
					
					
					dsm2.setPreparedStatementRef(sqlString2);
					
					if(result1.equals(result2)){
						dsm2.setParameter(ParameterType.DATE, result1, 1);
						//dsm2.setParameter(ParameterType.DATE,result2, 2);
						dsm2.setParameter(ParameterType.INT,""+mobileStationBean.getMobileStationSelezionato001().getId_mobile_station(),2);
					
					}else{
						dsm2.setParameter(ParameterType.DATE, result1, 1);
						dsm2.setParameter(ParameterType.DATE,result2, 2);
						dsm2.setParameter(ParameterType.INT,""+mobileStationBean.getMobileStationSelezionato001().getId_mobile_station(),3);
					
					}
					
					dsm2.runPreparedQuery();
					
					
			        
			        trovato=false;
			        
			        while(dsm2.next()){
			        	trovato=true;
					  dataOut =  dsm2.getData(4).get(Calendar.YEAR)+"-"+(dsm2.getData(4).get(Calendar.MONTH)+1)+"-"+dsm2.getData(4).get(Calendar.DAY_OF_MONTH)+" "+dsm2.getData(4).get(Calendar.HOUR_OF_DAY)+":"+dsm2.getData(4).get(Calendar.MINUTE);
                                            
						co2.set(dataOut, dsm2.getDouble(1));
						co2Min.set(dataOut, dsm2.getDouble(2));
						co2Avg.set(dataOut, dsm2.getDouble(3));
					
					}
					
			        if(!trovato){
			        	co2.set(date.getTime(), 0.0);
						
			        	co2Min.set(date.getTime(), 0.0);
						
			        	co2Avg.set(date.getTime(), 0.0);
						
						//this.titoloCO2=TITOLO_CO2+" -- "+mobileStationBean.getMobileStationSelezionato001().getNome();
				    }
			        
			           model2.addSeries(co2);
                                model2.addSeries(co2Min);
                                model2.addSeries(co2Avg);
				    
                                model2.setTitle(TITOLO_CO2+" -- "+mobileStationBean.getMobileStationSelezionato001().getNome());
                                model2.setAnimate(true);
                                model2.setZoom(true);
                                model2.getAxis(AxisType.Y).setLabel("CO2");
                                model2.setSeriesColors("D2D2D2,D2D2D2,27B4D8");
                                model2.setLegendPosition("e");
                                  
                                DateAxis axisCo2 = new DateAxis("Tempo");
                                axisCo2.setTickAngle(-70);
                                
                                axisCo2.setTickFormat("%d-%m-%Y  %H:%M");
                                model2.getAxes().put(AxisType.X, axisCo2);   
                                    
                                    
				    
			//	    System.out.println("Creo rad");
					sqlString2="select max(rad),min(rad),avg(rad), " +
							"date_trunc('hour' , data) as dataout " +
							"from dati  " +
							"where  ";
					
					
					if(result1.equals(result2)){
						//stesso giorno
						  sqlString2=sqlString2+"data=? ";
					}else{
						//giorni diversi
						 sqlString2=sqlString2+"data between ? and ? ";
					}
					sqlString2=sqlString2+"and id_mobile_station=? and tair<>"+NP_DIGITAL_VALUE+" group by dataout "+
							"order by dataout";
							
					
					
					dsm2.setPreparedStatementRef(sqlString2);
					
					if(result1.equals(result2)){
						dsm2.setParameter(ParameterType.DATE, result1, 1);
						//dsm2.setParameter(ParameterType.DATE,result2, 2);
						dsm2.setParameter(ParameterType.INT,""+mobileStationBean.getMobileStationSelezionato001().getId_mobile_station(),2);
					
					}else{
						dsm2.setParameter(ParameterType.DATE, result1, 1);
						dsm2.setParameter(ParameterType.DATE,result2, 2);
						dsm2.setParameter(ParameterType.INT,""+mobileStationBean.getMobileStationSelezionato001().getId_mobile_station(),3);
					
					}
					
					dsm2.runPreparedQuery();
					
					
			        
			        trovato=false;
			        
			        while(dsm2.next()){
			        	trovato=true;
						  dataOut =  dsm2.getData(4).get(Calendar.YEAR)+"-"+(dsm2.getData(4).get(Calendar.MONTH)+1)+"-"+dsm2.getData(4).get(Calendar.DAY_OF_MONTH)+" "+dsm2.getData(4).get(Calendar.HOUR_OF_DAY)+":"+dsm2.getData(4).get(Calendar.MINUTE);
                                      
					
						rad.set(dataOut, dsm2.getDouble(1));
						radMin.set(dataOut, dsm2.getDouble(2));
						radAvg.set(dataOut, dsm2.getDouble(3));
					
			//			System.out.println("ok");
					}
					
			        if(!trovato){
			        	rad.set(date.getTime(), 0.0);
						
			        	radMin.set(date.getTime(), 0.0);
						
			        	radAvg.set(date.getTime(), 0.0);
						
						//this.titoloUmidita=TITOLO_UMIDITA+" -- "+mobileStationBean.getMobileStationSelezionato001().getNome();
				    }
				    
				    model3.addSeries(rad);
				    model3.addSeries(radMin);
				    model3.addSeries(radAvg);
			
                         
				    
                                model3.setTitle(TITOLO_UMIDITA+" -- "+mobileStationBean.getMobileStationSelezionato001().getNome());
                                model3.setAnimate(true);
                                model3.setZoom(true);
                                model3.getAxis(AxisType.Y).setLabel("Umidità");
                                model3.setSeriesColors("D2D2D2,D2D2D2,27B4D8");
                                model3.setLegendPosition("e");
                                  
                                DateAxis axisRad = new DateAxis("Tempo");
                                axisRad.setTickAngle(-70);
                                
                                axisRad.setTickFormat("%d-%m-%Y  %H:%M");
                                model3.getAxes().put(AxisType.X, axisRad);
			//	    System.out.println("Creo ozono");
					sqlString2="select max(o3),min(o3),avg(o3), " +
							"date_trunc('hour' , data) as dataout " +
							"from dati  " +
							"where  ";
					
					
					if(result1.equals(result2)){
						//stesso giorno
						  sqlString2=sqlString2+"data=? ";
					}else{
						//giorni diversi
						 sqlString2=sqlString2+"data between ? and ? ";
					}
					sqlString2=sqlString2+"and id_mobile_station=? and tair<>"+NP_DIGITAL_VALUE+" group by dataout "+
							"order by dataout";
							
					
					
					dsm2.setPreparedStatementRef(sqlString2);
					
					if(result1.equals(result2)){
						dsm2.setParameter(ParameterType.DATE, result1, 1);
						//dsm2.setParameter(ParameterType.DATE,result2, 2);
						dsm2.setParameter(ParameterType.INT,""+mobileStationBean.getMobileStationSelezionato001().getId_mobile_station(),2);
					
					}else{
						dsm2.setParameter(ParameterType.DATE, result1, 1);
						dsm2.setParameter(ParameterType.DATE,result2, 2);
						dsm2.setParameter(ParameterType.INT,""+mobileStationBean.getMobileStationSelezionato001().getId_mobile_station(),3);
					
					}
					
					dsm2.runPreparedQuery();
					
					
			        
			        trovato=false;
			        
			        while(dsm2.next()){
			        	trovato=true;
					 dataOut =  dsm2.getData(4).get(Calendar.YEAR)+"-"+(dsm2.getData(4).get(Calendar.MONTH)+1)+"-"+dsm2.getData(4).get(Calendar.DAY_OF_MONTH)+" "+dsm2.getData(4).get(Calendar.HOUR_OF_DAY)+":"+dsm2.getData(4).get(Calendar.MINUTE);
                                      
						ozono.set(dataOut, dsm2.getDouble(1));
						ozonoMin.set(dataOut, dsm2.getDouble(2));
						ozonoAvg.set(dataOut, dsm2.getDouble(3));
					
			//			System.out.println("ok");
					}
					
			        if(!trovato){
			        	ozono.set(date.getTime(), 0.0);
						
			        	ozonoMin.set(date.getTime(), 0.0);
						
			        	ozonoAvg.set(date.getTime(), 0.0);
						
						//this.titoloOzono=TITOLO_OZONO+" -- "+mobileStationBean.getMobileStationSelezionato001().getNome();
				    }
				    
				    model3.addSeries(ozono);
				    model3.addSeries(ozonoMin);
				    model3.addSeries(ozonoAvg);	
                                model3.setTitle(TITOLO_OZONO+" -- "+mobileStationBean.getMobileStationSelezionato001().getNome());
                                model3.setAnimate(true);
                                model3.setZoom(true);
                                model3.getAxis(AxisType.Y).setLabel("Ozono");
                                model3.setSeriesColors("D2D2D2,D2D2D2,27B4D8");
                                model3.setLegendPosition("e");
                                  
                                DateAxis axisO3 = new DateAxis("Tempo");
                                axisO3.setTickAngle(-70);
                                
                                axisO3.setTickFormat("%d-%m-%Y  %H:%M");
                                model3.getAxes().put(AxisType.X, axisO3);
			
			}
			
		
		} catch (Exception e) {
			
			e.printStackTrace();
		} finally{
			try {
				dsm2.closeConnection();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
		
	}
	
	
         public void popolaBiomasse(){
            System.out.println("popolmaBiomasse");
            GregorianCalendar result1 = null; 
            result1 = new GregorianCalendar(); 
            result1.setTimeInMillis(dateB.getTime()); 
            result1.add(Calendar.DAY_OF_MONTH, -1);
            GregorianCalendar result2 = null; 
            result2 = new GregorianCalendar(); 
            result2.setTimeInMillis(dateB2.getTime()); 
            result2.add(Calendar.DAY_OF_MONTH, 1);
            System.out.println("ecco swe: "+sweBean.getSweSelezionato3().getId_swe());
            getChartData(result1, result2, sweBean.getSweSelezionato3().getId_swe(),"dati_swe");
            getChartHourly(result1, result2, sweBean.getSweSelezionato3().getId_swe(),"dati_swe");
            
        }
         
        public void popolaFotovoltaico(){
            System.out.println("popolmaFotovoltaico");
            GregorianCalendar result1 = null; 
            result1 = new GregorianCalendar(); 
            result1.setTimeInMillis(dateT.getTime()); 
            result1.add(Calendar.DAY_OF_MONTH, -1);
            GregorianCalendar result2 = null; 
            result2 = new GregorianCalendar(); 
            result2.setTimeInMillis(dateT2.getTime()); 
            result2.add(Calendar.DAY_OF_MONTH, 1);
           // System.out.println("ecco foto: "+sweBean.getSweSelezionato3().getId_swe());
            getChartData(result1, result2, fotoBean.getFotoSelezionato3().getId_fotovoltaic(),"dati_fotovoltaico");
            getChartHourly(result1, result2, fotoBean.getFotoSelezionato3().getId_fotovoltaic(),"dati_fotovoltaico");
            
        }
        
        public void popolaMobile(){
            System.out.println("popolaMobile");
            GregorianCalendar result1 = null; 
            result1 = new GregorianCalendar(); 
            result1.setTimeInMillis(date.getTime()); 
            result1.add(Calendar.DAY_OF_MONTH, -1);
            GregorianCalendar result2 = null; 
            result2 = new GregorianCalendar(); 
            result2.setTimeInMillis(date2.getTime()); 
            result2.add(Calendar.DAY_OF_MONTH, 1);
            
            getChartData(result1, result2, mobileStationBean.getMobileStationSelezionato001().getId_mobile_station(),"dati");
            getChartHourly(result1, result2, mobileStationBean.getMobileStationSelezionato001().getId_mobile_station(),"dati");
            
        }
         
        public void popolaTotem(){
            //System.out.println("popolaMobile");
            GregorianCalendar result1 = null; 
            result1 = new GregorianCalendar(); 
            result1.setTimeInMillis(dateT.getTime()); 
            result1.add(Calendar.DAY_OF_MONTH, -1);
            GregorianCalendar result2 = null; 
            result2 = new GregorianCalendar(); 
            result2.setTimeInMillis(dateT2.getTime()); 
            result2.add(Calendar.DAY_OF_MONTH, 1);
            
            getChartData(result1, result2, totemStationBean.getTotemStationSelezionato3().getId_bike_sensor(),"dati_stazioni_fisse");
            getChartHourly(result1, result2,totemStationBean.getTotemStationSelezionato3().getId_bike_sensor(),"dati_stazioni_fisse");
            
        }
        
        public void popolaEddy(){
            //System.out.println("popolaMobile");
            GregorianCalendar result1 = null; 
            result1 = new GregorianCalendar(); 
            result1.setTimeInMillis(dateE.getTime()); 
            result1.add(Calendar.DAY_OF_MONTH, -1);
            GregorianCalendar result2 = null; 
            result2 = new GregorianCalendar(); 
            result2.setTimeInMillis(dateE2.getTime()); 
            result2.add(Calendar.DAY_OF_MONTH, 1);
            
            getChartData(result1, result2, eddyStationBean.getEddyStationSelezionato3().getId_bike_sensor(),"dati_eddy");
            getChartHourly(result1, result2, eddyStationBean.getEddyStationSelezionato3().getId_bike_sensor(),"dati_eddy");
            
        }
        
        /**
         * Crea il grafico di riepilogo giornaliero
         * @param result1 - data inizio 
         * @param result2 - data fine
         */
	private void getChartData(GregorianCalendar result1, GregorianCalendar result2, int id_mobile_station, String data_table){

		Axis yAxis, y2Axis, y3Axis, y4Axis;
		Axis y5Axis, y6Axis, y7Axis, y8Axis, y9Axis;

		TDBManager dsm2=null;
             
		String dataOut;
	        GregorianCalendar dataNow = new GregorianCalendar();
              //  boolean barUsed = false;
                
		try {
                        model = new LineChartModel();

			ArrayList<ChartSeries> seriesIn = new ArrayList<ChartSeries>();


			if(loginBean.getLogged()){
                            
                            
	                 
                            dsm2 = new TDBManager("jdbc/urbandb");
                            System.out.println("ChartBean - getChartData - prima");
                            //recupero lista parametri
                            ChartParams cp = new ChartParams(dsm2, id_mobile_station, loginBean.getLingua());
                            cp.getTableParams(); //prepare table params
                            System.out.println("ChartBean - getChartData - dopo");
                            //System.out.println("Costruisco le serie");
                            for(int i=0; i<cp.getParamNumbers(); i++){
                                if(cp.getChart_type().get(i).equals("LINE") ){ //|| barUsed
                                    LineChartSeries questoChart = new LineChartSeries();
                                    
                                    questoChart.setLabel(cp.getParam_name().get(i)+" "+cp.getUnit().get(i));
                                    questoChart.setXaxis(AxisType.X);
                                    System.out.println("Costruisco le serie");
                                    switch((i+1)){
                                        case 1:
                                            questoChart.setYaxis(AxisType.Y);
                                            break;
                                        case 2:
                                            questoChart.setYaxis(AxisType.Y2);
                                            break;
                                        case 3:
                                            questoChart.setYaxis(AxisType.Y3);
                                            break;
                                        case 4:
                                            questoChart.setYaxis(AxisType.Y4);
                                            break;
										case 5:
											questoChart.setYaxis(AxisType.Y5);
											break;
										case 6:
											questoChart.setYaxis(AxisType.Y6);
											break;
										case 7:
											questoChart.setYaxis(AxisType.Y7);
											break;
										case 8:
											questoChart.setYaxis(AxisType.Y8);
											break;
										case 9:
											questoChart.setYaxis(AxisType.Y9);
											break;

                                    }
                                    seriesIn.add(questoChart);
                                }else if(cp.getChart_type().get(i).equals("BAR") ){
                                    
                                    
                                    BarChartSeries questoChart = new BarChartSeries();

                                    questoChart.setLabel(cp.getParam_name().get(i)+" "+cp.getUnit().get(i));
                                    questoChart.setXaxis(AxisType.X);
                                    
                                    System.out.println("Costruisco le serie");
                                    switch((i+1)){
                                        case 1:
                                            questoChart.setYaxis(AxisType.Y);
                                            break;
                                        case 2:
                                            questoChart.setYaxis(AxisType.Y2);
                                            break;
                                        case 3:
                                            questoChart.setYaxis(AxisType.Y3);
                                            break;
                                        case 4:
                                            questoChart.setYaxis(AxisType.Y4);
                                            break;
										case 5:
											questoChart.setYaxis(AxisType.Y5);
											break;
										case 6:
											questoChart.setYaxis(AxisType.Y6);
											break;
										case 7:
											questoChart.setYaxis(AxisType.Y7);
											break;
										case 8:
											questoChart.setYaxis(AxisType.Y8);
											break;
										case 9:
											questoChart.setYaxis(AxisType.Y9);
											break;
                                    }
                                    
                                    seriesIn.add(questoChart);
                                    
                                }
                               
                            }
                            String sqlString2="";
                            
                     //       System.out.println("Creo temperature");
                            
                            for(int i=0; i<cp.getParamNumbers(); i++){
                                sqlString2="select " +cp.getAggregation_type().get(i)+"("+ cp.getParam().get(i) + ")," +
                                    "date(data) as dataout " +
                                    "from " + data_table + " " +
                                    "where  ";
                                
                                if(result1.equals(result2)){
                                    //stesso giorno
                                    sqlString2=sqlString2+"data=? ";
                                }else{
                                    //giorni diversi
                                    sqlString2=sqlString2+"data between ? and ? ";
                                }
                                
                                sqlString2=sqlString2+"and id_mobile_station=? "+cp.getSQL_WhereStr(i)+" group by dataout "+ 
                                " order by dataout";
                                
                                
                               // System.out.println("Ecco stringa: "+sqlString2);
					
                                dsm2.setPreparedStatementRef(sqlString2);

                                if(result1.equals(result2)){
                                        dsm2.setParameter(ParameterType.DATE, result1, 1);
                                        dsm2.setParameter(ParameterType.INT,""+id_mobile_station,2);

                                }else{
                                        dsm2.setParameter(ParameterType.DATE, result1, 1);
                                        dsm2.setParameter(ParameterType.DATE,result2, 2);
                                        dsm2.setParameter(ParameterType.INT,""+id_mobile_station,3);
                                }
                                dsm2.runPreparedQuery();
			
                                
                                
                                boolean trovato=false;

                                while(dsm2.next()){
                                    trovato=true;


                                    dataOut =  dsm2.getData(2).get(Calendar.YEAR)+"-"+
                                            (dsm2.getData(2).get(Calendar.MONTH)+1)+"-"+
                                            dsm2.getData(2).get(Calendar.DAY_OF_MONTH);

                                   if(seriesIn.get(i) instanceof LineChartSeries){
                                        LineChartSeries questoElem = (LineChartSeries) seriesIn.get(i);
                                        questoElem.set(dataOut, dsm2.getDouble(1));
                                    }else if(seriesIn.get(i) instanceof BarChartSeries){
                                        BarChartSeries questoElem = (BarChartSeries) seriesIn.get(i);
                                        questoElem.set(dataOut, dsm2.getDouble(1));
                                    }
                                    
                                }

                                if(!trovato){
									dataOut = result1.get(Calendar.YEAR)+"-"+
											(result1.get(Calendar.MONTH)+1)+"-"+
											result1.get(Calendar.DAY_OF_MONTH);

                                    if(seriesIn.get(i) instanceof LineChartSeries ){ // || barUsed
                                        LineChartSeries questoElem = (LineChartSeries) seriesIn.get(i);
                                        questoElem.set(dataOut, null);


                                    }else if(seriesIn.get(i) instanceof BarChartSeries){
                                            BarChartSeries questoElem = (BarChartSeries) seriesIn.get(i);
                                            questoElem.set(dataOut, null);

                                    }


                                   
                                }
			        
                                
                            }
                            
                
                            

                            
                           
                            for(int i=0; i<cp.getParamNumbers(); i++) {


								if (seriesIn.get(i) instanceof LineChartSeries) {


									switch ((i + 1)) {
										case 1:
											yAxis = model.getAxis(AxisType.Y);
											yAxis.setLabel(cp.getParam_name().get(i) + " " + cp.getUnit().get(i));
											yAxis.setTickFormat("%.2f");
											break;
										case 2:
											y2Axis = new LinearAxis(cp.getParam_name().get(i) + " " + cp.getUnit().get(i));
											y2Axis.setTickFormat("%.2f");
											model.getAxes().put(AxisType.Y2, y2Axis);
											break;
										case 3:
											y3Axis = new LinearAxis(cp.getParam_name().get(i) + " " + cp.getUnit().get(i));
											y3Axis.setTickFormat("%.2f");
											model.getAxes().put(AxisType.Y3, y3Axis);
											break;
										case 4:
											y4Axis = new LinearAxis(cp.getParam_name().get(i) + " " + cp.getUnit().get(i));
											y4Axis.setTickFormat("%.2f");
											model.getAxes().put(AxisType.Y4, y4Axis);
											break;
										case 5:
											y5Axis = new LinearAxis(cp.getParam_name().get(i) + " " + cp.getUnit().get(i));
											y5Axis.setTickFormat("%.2f");
											model.getAxes().put(AxisType.Y5, y5Axis);
											break;
										case 6:
											y6Axis = new LinearAxis(cp.getParam_name().get(i) + " " + cp.getUnit().get(i));
											y6Axis.setTickFormat("%.2f");
											model.getAxes().put(AxisType.Y6, y6Axis);
											break;
										case 7:
											y7Axis = new LinearAxis(cp.getParam_name().get(i) + " " + cp.getUnit().get(i));
											y7Axis.setTickFormat("%.2f");
											model.getAxes().put(AxisType.Y7, y7Axis);
											break;
										case 8:
											y8Axis = new LinearAxis(cp.getParam_name().get(i) + " " + cp.getUnit().get(i));
											y8Axis.setTickFormat("%.2f");
											model.getAxes().put(AxisType.Y8, y8Axis);
											break;
										case 9:
											y9Axis = new LinearAxis(cp.getParam_name().get(i) + " " + cp.getUnit().get(i));
											y9Axis.setTickFormat("%.2f");
											model.getAxes().put(AxisType.Y9, y9Axis);
											break;
									}

								} else if (seriesIn.get(i) instanceof BarChartSeries) {


									switch ((i + 1)) {
										case 1:
											yAxis = model.getAxis(AxisType.Y);
											yAxis.setLabel(cp.getParam_name().get(i) + " " + cp.getUnit().get(i));
											yAxis.setTickFormat("%.2f");
											break;
										case 2:
											y2Axis = model.getAxis(AxisType.Y2);
											y2Axis.setLabel(cp.getParam_name().get(i) + " " + cp.getUnit().get(i));
											y2Axis.setTickFormat("%.2f");
											model.getAxes().put(AxisType.Y2, y2Axis);
											break;
										case 3:
											y3Axis = model.getAxis(AxisType.Y3);
											y3Axis.setLabel(cp.getParam_name().get(i) + " " + cp.getUnit().get(i));
											y3Axis.setTickFormat("%.2f");
											model.getAxes().put(AxisType.Y3, y3Axis);
											break;
										case 4:
											y4Axis = model.getAxis(AxisType.Y4);
											y4Axis.setLabel(cp.getParam_name().get(i) + " " + cp.getUnit().get(i));
											y4Axis.setTickFormat("%.2f");
											model.getAxes().put(AxisType.Y4, y4Axis);
											break;
										case 5:
											y5Axis = model.getAxis(AxisType.Y5);
											y5Axis.setLabel(cp.getParam_name().get(i) + " " + cp.getUnit().get(i));
											y5Axis.setTickFormat("%.2f");
											model.getAxes().put(AxisType.Y5, y5Axis);
											break;
										case 6:
											y6Axis = model.getAxis(AxisType.Y6);
											y6Axis.setLabel(cp.getParam_name().get(i) + " " + cp.getUnit().get(i));
											y6Axis.setTickFormat("%.2f");
											model.getAxes().put(AxisType.Y6, y6Axis);
											break;
										case 7:
											y7Axis = model.getAxis(AxisType.Y7);
											y7Axis.setLabel(cp.getParam_name().get(i) + " " + cp.getUnit().get(i));
											y7Axis.setTickFormat("%.2f");
											model.getAxes().put(AxisType.Y7, y7Axis);
											break;
										case 8:
											y8Axis = model.getAxis(AxisType.Y8);
											y8Axis.setLabel(cp.getParam_name().get(i) + " " + cp.getUnit().get(i));
											y8Axis.setTickFormat("%.2f");
											model.getAxes().put(AxisType.Y8, y8Axis);
											break;
										case 9:
											y9Axis = model.getAxis(AxisType.Y9);
											y9Axis.setLabel(cp.getParam_name().get(i) + " " + cp.getUnit().get(i));
											y9Axis.setTickFormat("%.2f");
											model.getAxes().put(AxisType.Y9, y9Axis);
											break;
									}

								}


                            }



							System.out.print("Grafico: numero di serie "+seriesIn.size());
							//Aggiungo i charts series
							for(int i=0; i<seriesIn.size(); i++){
								if(seriesIn.get(i) instanceof LineChartSeries){ //|| barUsed
									LineChartSeries questoElem = (LineChartSeries) seriesIn.get(i);
									model.addSeries(questoElem);

								}else if(seriesIn.get(i) instanceof BarChartSeries){
									BarChartSeries questoElem = (BarChartSeries) seriesIn.get(i);
									model.addSeries(questoElem);
								}
							}


							model.setSeriesColors("FF1919,FFAB19,1988FF,C63CD8,FF1919,FFAB19,1988FF,C63CD8,C63CD8");
                            model.setLegendPosition("e");
                            model.setLegendPlacement(LegendPlacement.OUTSIDEGRID);
							model.setBreakOnNull(true);
                          //  model.setShowPointLabels(true);

                            model.setZoom(true);
                           
                            //setto Asse X
                            DateAxis axis = new DateAxis("Giorni");
                            axis.setTickAngle(-70);
                            axis.setTickFormat("%e-%m-%Y");
                            
                            //calcolo il max time
                       
                            model.getAxes().put(AxisType.X, axis);
                            
                            
                        }
			
                         
			
		} catch (Exception e) {
			
			e.printStackTrace();
		} finally{
			try {
				dsm2.closeConnection();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
	}
        
        
        
        private void getChartHourly(GregorianCalendar result1, GregorianCalendar result2, int id_mobile_station, String data_table){
                Axis yAxis, y2Axis, y3Axis, y4Axis;
		TDBManager dsm2=null;
             
		String dataOut;
	        GregorianCalendar dataNow = new GregorianCalendar();
              //  boolean barUsed = false;
                
		try {
                    System.out.println("Hourly");


			ArrayList<ChartSeries> seriesIn = new ArrayList<ChartSeries>();


			disableGraphs();
			if(loginBean.getLogged()){
                            
                            
	                 
                            dsm2 = new TDBManager("jdbc/urbandb");
			
                            //recupero lista parametri
                            ChartParams cp = new ChartParams(dsm2, id_mobile_station, loginBean.getLingua(),true);
                            cp.getTableParams(); //prepare table params
                          
                           // System.out.println("Costruisco le serie: "+cp.getParamNumbers());
                            for(int i=0; i<cp.getParamNumbers(); i++){
                                if(cp.getChart_type().get(i).equals("LINE") ){ //|| barUsed
                                    LineChartSeries questoChart = new LineChartSeries();
                                    
                                    questoChart.setLabel(cp.getParam_name().get(i)+" "+cp.getUnit().get(i));
                                    
                                    
                                    seriesIn.add(questoChart);
                                }else if(cp.getChart_type().get(i).equals("BAR") ){
                                    
                                    
                                    BarChartSeries questoChart = new BarChartSeries();

                                    questoChart.setLabel(cp.getParam_name().get(i)+" "+cp.getUnit().get(i));
                                    
                                    seriesIn.add(questoChart);
                                    
                                }
                               
                            }
                            
                            String sqlString2="";
                            for(int i=0; i<cp.getParamNumbers(); i+=3){
                                sqlString2="select " +cp.getAggregation_type().get(i)+"("+ cp.getParam().get(i) + ")," +
                                    cp.getAggregation_type().get(i+1)+"("+ cp.getParam().get(i+1) + ")," +
                                    cp.getAggregation_type().get(i+2)+"("+ cp.getParam().get(i+2) + ")," +
                                    "date_trunc('hour' , data) as dataout " +
                                    "from " + data_table + " " +
                                    "where  ";
                                
                                if(result1.equals(result2)){
                                    //stesso giorno
                                    sqlString2=sqlString2+"data=? ";
                                }else{
                                    //giorni diversi
                                    sqlString2=sqlString2+"data between ? and ? ";
                                }
                                sqlString2=sqlString2+"and id_mobile_station=? "+cp.getSQL_WhereStr(i)+" group by dataout "+ 
                                " order by dataout";
                          
                                System.out.println("Ecco stringa: "+sqlString2);
			
                                dsm2.setPreparedStatementRef(sqlString2);

                                if(result1.equals(result2)){
                                        dsm2.setParameter(ParameterType.DATE, result1, 1);
                                        dsm2.setParameter(ParameterType.INT,""+id_mobile_station,2);

                                }else{
                                        dsm2.setParameter(ParameterType.DATE, result1, 1);
                                        dsm2.setParameter(ParameterType.DATE,result2, 2);
                                        dsm2.setParameter(ParameterType.INT,""+id_mobile_station,3);
                                }
                                
                                
                                dsm2.runPreparedQuery();

                                boolean trovato=false;

                                while(dsm2.next()){
                                 trovato=true;
                                
                                
                                    dataOut =  dsm2.getData(4).get(Calendar.YEAR)+"-"+
                                            (dsm2.getData(4).get(Calendar.MONTH)+1)+"-"+
                                            dsm2.getData(4).get(Calendar.DAY_OF_MONTH)+" "+
                                            dsm2.getData(4).get(Calendar.HOUR_OF_DAY)+":"+
                                            dsm2.getData(4).get(Calendar.MINUTE);


                                    

                                    if(seriesIn.get(i) instanceof LineChartSeries){
                                        LineChartSeries questoElem = (LineChartSeries) seriesIn.get(i);

                                        questoElem.set(dataOut, dsm2.getDouble(1));
                                        questoElem = (LineChartSeries) seriesIn.get(i+1);
                                        questoElem.set(dataOut, dsm2.getDouble(2));
                                        questoElem = (LineChartSeries) seriesIn.get(i+2);
                                        questoElem.set(dataOut, dsm2.getDouble(3));

                                    }else if(seriesIn.get(i) instanceof BarChartSeries){
                                        BarChartSeries questoElem = (BarChartSeries) seriesIn.get(i);

                                        questoElem.set(dataOut, dsm2.getDouble(1));
                                        questoElem = (BarChartSeries) seriesIn.get(i+1);
                                        questoElem.set(dataOut, dsm2.getDouble(2));
                                        questoElem = (BarChartSeries) seriesIn.get(i+2);
                                        questoElem.set(dataOut, dsm2.getDouble(3));
                                    }
                                   
                                }

                                if(!trovato){
									dataOut = result1.get(Calendar.YEAR)+"-"+
											(result1.get(Calendar.MONTH)+1)+"-"+
											result1.get(Calendar.DAY_OF_MONTH);

                                    
                                    if(seriesIn.get(i) instanceof LineChartSeries ){ // || barUsed
                                        LineChartSeries questoElem = (LineChartSeries) seriesIn.get(i);
                                        questoElem.set(dataOut, null);


                                    }else if(seriesIn.get(i) instanceof BarChartSeries){
                                        BarChartSeries questoElem = (BarChartSeries) seriesIn.get(i);
                                        questoElem.set(dataOut, null);

                                    }
                                    
                                }
                            }


				DateAxis axis = new DateAxis("Tempo");
				axis.setTickAngle(-70);
				axis.setTickFormat("%d-%m-%Y  %H:%M");


				//ciclo per attivare i modelli necessari
							for(int i=0; i<seriesIn.size(); i++){
								switch(i){
									case 0:
									case 1:
									case 2:
										model1 = new LineChartModel();
										break;
									case 3:
									case 4:
									case 5:
										model2 = new LineChartModel();
										break;
									case 6:
									case 7:
									case 8:
										model3 = new LineChartModel();
										break;
									case 9:
									case 10:
									case 11:
										model4 = new LineChartModel();
										break;
									case 12:
									case 13:
									case 14:
										model5 = new LineChartModel();
										break;
									case 15:
									case 16:
									case 17:
										model6 = new LineChartModel();
										break;
									case 18:
									case 19:
									case 20:
										model7 = new LineChartModel();
										break;
									case 21:
									case 22:
									case 23:
										model8 = new LineChartModel();
										break;
									case 24:
									case 25:
									case 26:
										model9 = new LineChartModel();
										break;

								}

							}
                            

                           
                            for(int i=0; i<seriesIn.size(); i++){
                                
                                switch(i){
                                    case 0:
                                    case 1:
                                    case 2:
                                        System.out.println("metto dentro model1");

                                        if(seriesIn.get(i) instanceof LineChartSeries){ //|| barUsed
                                            LineChartSeries questoElem = (LineChartSeries) seriesIn.get(i);
                                            model1.addSeries(questoElem);

                                        }else if(seriesIn.get(i) instanceof BarChartSeries){
                                            BarChartSeries questoElem = (BarChartSeries) seriesIn.get(i);
                                            model1.addSeries(questoElem);
                                        }


                                    break;
                                    case 3:
                                    case 4:
                                    case 5:
                                        System.out.println("metto dentro model2");
                                        if(seriesIn.get(i) instanceof LineChartSeries){ //|| barUsed
                                            LineChartSeries questoElem = (LineChartSeries) seriesIn.get(i);
                                            model2.addSeries(questoElem);

                                        }else if(seriesIn.get(i) instanceof BarChartSeries){
                                            BarChartSeries questoElem = (BarChartSeries) seriesIn.get(i);
                                            model2.addSeries(questoElem);
                                        }  
                                    break;
                                        
                                    case 6:
                                    case 7:
                                    case 8:
                                        System.out.println("metto dentro model3");
                                        if(seriesIn.get(i) instanceof LineChartSeries){ //|| barUsed
                                            LineChartSeries questoElem = (LineChartSeries) seriesIn.get(i);
                                            model3.addSeries(questoElem);

                                        }else if(seriesIn.get(i) instanceof BarChartSeries){
                                            BarChartSeries questoElem = (BarChartSeries) seriesIn.get(i);
                                            model3.addSeries(questoElem);
                                        }  
                                    break;
                                    case 9:
                                    case 10:
                                    case 11:
                                        System.out.println("metto dentro model4");
                                        if(seriesIn.get(i) instanceof LineChartSeries){ //|| barUsed
                                            LineChartSeries questoElem = (LineChartSeries) seriesIn.get(i);
                                            model4.addSeries(questoElem);

                                        }else if(seriesIn.get(i) instanceof BarChartSeries){
                                            BarChartSeries questoElem = (BarChartSeries) seriesIn.get(i);
                                            model4.addSeries(questoElem);
                                        }
                                    break;
									case 12:
									case 13:
									case 14:
										System.out.println("metto dentro model5");
										if(seriesIn.get(i) instanceof LineChartSeries){ //|| barUsed
											LineChartSeries questoElem = (LineChartSeries) seriesIn.get(i);
											model5.addSeries(questoElem);

										}else if(seriesIn.get(i) instanceof BarChartSeries){
											BarChartSeries questoElem = (BarChartSeries) seriesIn.get(i);
											model5.addSeries(questoElem);
										}
										break;
									case 15:
									case 16:
									case 17:
										System.out.println("metto dentro model6");
										if(seriesIn.get(i) instanceof LineChartSeries){ //|| barUsed
											LineChartSeries questoElem = (LineChartSeries) seriesIn.get(i);
											model6.addSeries(questoElem);

										}else if(seriesIn.get(i) instanceof BarChartSeries){
											BarChartSeries questoElem = (BarChartSeries) seriesIn.get(i);
											model6.addSeries(questoElem);
										}
										break;
									case 18:
									case 19:
									case 20:
										System.out.println("metto dentro model7");
										if(seriesIn.get(i) instanceof LineChartSeries){ //|| barUsed
											LineChartSeries questoElem = (LineChartSeries) seriesIn.get(i);
											model7.addSeries(questoElem);

										}else if(seriesIn.get(i) instanceof BarChartSeries){
											BarChartSeries questoElem = (BarChartSeries) seriesIn.get(i);
											model7.addSeries(questoElem);
										}
										break;
									case 21:
									case 22:
									case 23:
										System.out.println("metto dentro model8");
										if(seriesIn.get(i) instanceof LineChartSeries){ //|| barUsed
											LineChartSeries questoElem = (LineChartSeries) seriesIn.get(i);
											model8.addSeries(questoElem);

										}else if(seriesIn.get(i) instanceof BarChartSeries){
											BarChartSeries questoElem = (BarChartSeries) seriesIn.get(i);
											model8.addSeries(questoElem);
										}
										break;
									case 24:
									case 25:
									case 26:
										System.out.println("metto dentro model9");
										if(seriesIn.get(i) instanceof LineChartSeries){ //|| barUsed
											LineChartSeries questoElem = (LineChartSeries) seriesIn.get(i);
											model9.addSeries(questoElem);

										}else if(seriesIn.get(i) instanceof BarChartSeries){
											BarChartSeries questoElem = (BarChartSeries) seriesIn.get(i);
											model9.addSeries(questoElem);
										}
										break;
                                }
                               
                            }
                            
                            
                           
                             for(int i=0; i<cp.getParamNumbers(); i+=3){
                                
                                    switch(i){
                                        case 0:
                                        
                                            yAxis = model1.getAxis(AxisType.Y);
                                            yAxis.setLabel(cp.getParam_name().get(0)+" "+cp.getUnit().get(0));
                                            yAxis.setTickFormat("%.2f");

											model1.getAxes().put(AxisType.X, axis);
											model1.setSeriesColors("27B4D8,D2D2D2,D2D2D2");
											model1.setLegendPosition("e");
											model1.setBreakOnNull(true);
											model1.setZoom(true);
											model1.setLegendPlacement(LegendPlacement.OUTSIDEGRID);
											this.graphTitle1 = cp.getParam_name().get(0);
											this.dis1 = false;

											break;
                                            
                                        case 3:
                                       
                                            yAxis = model2.getAxis(AxisType.Y);

                                            yAxis.setLabel(cp.getParam_name().get(3)+" "+cp.getUnit().get(3));
                                            yAxis.setTickFormat("%.2f");

											model2.getAxes().put(AxisType.X, axis);

											model2.setSeriesColors("27B4D8,D2D2D2,D2D2D2");
											model2.setLegendPosition("e");


											model2.setZoom(true);
											model2.setBreakOnNull(true);
											model2.setLegendPlacement(LegendPlacement.OUTSIDEGRID);
											this.graphTitle2 = cp.getParam_name().get(3);
											this.dis2 = false;

                                            break;
                                            
                                            
                                        case 6:
                                        
                                            yAxis = model3.getAxis(AxisType.Y);

                                          
                                            yAxis.setLabel(cp.getParam_name().get(6)+" "+cp.getUnit().get(6));
                                            yAxis.setTickFormat("%.2f");

											model3.getAxes().put(AxisType.X, axis);

											model3.setSeriesColors("27B4D8,D2D2D2,D2D2D2");
											model3.setLegendPosition("e");


											model3.setZoom(true);
											model3.setBreakOnNull(true);
											model3.setLegendPlacement(LegendPlacement.OUTSIDEGRID);
											this.graphTitle3 = cp.getParam_name().get(6);
											this.dis3 = false;
											break;
                                            
                                        case 9:
                                       
                                            yAxis = model4.getAxis(AxisType.Y);


                                            yAxis.setLabel(cp.getParam_name().get(9)+" "+cp.getUnit().get(9));
                                            yAxis.setTickFormat("%.2f");

											model4.getAxes().put(AxisType.X, axis);

											model4.setSeriesColors("27B4D8,D2D2D2,D2D2D2");
											model4.setLegendPosition("e");


											model4.setZoom(true);
											model4.setBreakOnNull(true);
											model4.setLegendPlacement(LegendPlacement.OUTSIDEGRID);
											this.graphTitle4 = cp.getParam_name().get(9);
											this.dis4 = false;
                                            break;


										case 12:

											yAxis = model5.getAxis(AxisType.Y);


											yAxis.setLabel(cp.getParam_name().get(12)+" "+cp.getUnit().get(12));
											yAxis.setTickFormat("%.2f");

											model5.getAxes().put(AxisType.X, axis);

											model5.setSeriesColors("27B4D8,D2D2D2,D2D2D2");
											model5.setLegendPosition("e");


											model5.setZoom(true);
											model5.setBreakOnNull(true);
											model5.setLegendPlacement(LegendPlacement.OUTSIDEGRID);
											this.graphTitle5 = cp.getParam_name().get(12);
											this.dis5 = false;
											break;

										case 15:

											yAxis = model6.getAxis(AxisType.Y);


											yAxis.setLabel(cp.getParam_name().get(15)+" "+cp.getUnit().get(15));
											yAxis.setTickFormat("%.2f");

											model6.getAxes().put(AxisType.X, axis);

											model6.setSeriesColors("27B4D8,D2D2D2,D2D2D2");
											model6.setLegendPosition("e");


											model6.setZoom(true);
											model6.setBreakOnNull(true);
											model6.setLegendPlacement(LegendPlacement.OUTSIDEGRID);
											this.graphTitle6 = cp.getParam_name().get(15);
											this.dis6 = false;
											break;

										case 18:

											yAxis = model7.getAxis(AxisType.Y);


											yAxis.setLabel(cp.getParam_name().get(18)+" "+cp.getUnit().get(18));
											yAxis.setTickFormat("%.2f");

											model7.getAxes().put(AxisType.X, axis);

											model7.setSeriesColors("27B4D8,D2D2D2,D2D2D2");
											model7.setLegendPosition("e");


											model7.setZoom(true);
											model7.setBreakOnNull(true);
											model7.setLegendPlacement(LegendPlacement.OUTSIDEGRID);
											this.graphTitle7 = cp.getParam_name().get(18);
											this.dis7 = false;
											break;

										case 21:

											yAxis = model8.getAxis(AxisType.Y);


											yAxis.setLabel(cp.getParam_name().get(21)+" "+cp.getUnit().get(21));
											yAxis.setTickFormat("%.2f");

											model8.getAxes().put(AxisType.X, axis);

											model8.setSeriesColors("27B4D8,D2D2D2,D2D2D2");
											model8.setLegendPosition("e");

											model8.setLegendPlacement(LegendPlacement.OUTSIDEGRID);
											model8.setZoom(true);
											model8.setBreakOnNull(true);

											this.graphTitle8 = cp.getParam_name().get(21);
											this.dis8 = false;

											break;

										case 24:

											yAxis = model9.getAxis(AxisType.Y);


											yAxis.setLabel(cp.getParam_name().get(24)+" "+cp.getUnit().get(24));
											yAxis.setTickFormat("%.2f");

											model9.getAxes().put(AxisType.X, axis);

											model9.setSeriesColors("27B4D8,D2D2D2,D2D2D2");
											model9.setLegendPosition("e");

											model9.setLegendPlacement(LegendPlacement.OUTSIDEGRID);
											model9.setZoom(true);
											model9.setBreakOnNull(true);

											this.graphTitle9 = cp.getParam_name().get(24);
											this.dis9 = false;
											break;

									}

                                    
                               
                                    
                                }
                            
                            
                            
                         

                            
                        }
			
                         
			
		} catch (Exception e) {
			
			e.printStackTrace();
		} finally{
			try {
				dsm2.closeConnection();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
	}

	private void disableGraphs(){
		this.graphTitle1 = "Disabled";
		this.dis1 = true;
		this.graphTitle2 = "Disabled";
		this.dis2 = true;
		this.graphTitle3 = "Disabled";
		this.dis3 = true;
		this.graphTitle4 = "Disabled";
		this.dis4 = true;
		this.graphTitle5 = "Disabled";
		this.dis5 = true;
		this.graphTitle6 = "Disabled";
		this.dis6 = true;
		this.graphTitle7 = "Disabled";
		this.dis7 = true;
		this.graphTitle8 = "Disabled";
		this.dis8 = true;
		this.graphTitle9 = "Disabled";
		this.dis9 = true;




	}
        
}
