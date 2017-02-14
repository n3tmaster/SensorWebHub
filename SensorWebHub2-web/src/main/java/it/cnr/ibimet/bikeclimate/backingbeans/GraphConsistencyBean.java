package it.cnr.ibimet.bikeclimate.backingbeans;

import it.cnr.ibimet.bikeclimate.dbutils.TDBManager;
import it.lr.libs.DBManager;
import org.primefaces.model.chart.AxisType;
import org.primefaces.model.chart.BarChartModel;
import org.primefaces.model.chart.BarChartSeries;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import java.io.Serializable;
import java.sql.SQLException;
import java.text.DateFormatSymbols;
import java.util.*;

/**
 * Created by lerocchi on 19/04/16.
 */
@ManagedBean(name="graphConsistencyBean")
@SessionScoped
public class GraphConsistencyBean implements Serializable,AppConsts {

    private final String TITOLO= "Consistenza mensile (%)";
    private final String SQL_MOBILE = "select count(*), mese " +
            "from (select extract(day from data) as giorno, extract(month from data)  as mese " +
            "from dati " +
            "where id_mobile_station=? " +
            "and extract(year from data) = ? " +
            "group by 1,2 " +
            "order by 2,1 ) as foo " +
            "group by 2 " +
            "order by 2";

    private final String SQL_EDDY = "select count(*), mese " +
            "from (select extract(day from data) as giorno, extract(month from data)  as mese " +
            "from dati_eddy " +
            "where id_mobile_station=? " +
            "and extract(year from data) = ? " +
            "group by 1,2 " +
            "order by 2,1 ) as foo " +
            "group by 2 " +
            "order by 2";

    private final String SQL_FIXED = "select count(*), mese " +
            "from (select extract(day from data) as giorno, extract(month from data)  as mese " +
            "from dati_stazioni_fisse " +
            "where id_mobile_station=? " +
            "and extract(year from data) = ? " +
            "group by 1,2 " +
            "order by 2,1 ) as foo " +
            "group by 2 " +
            "order by 2";


    private int year,year2,year3;
    private BarChartModel model,model2,model3;

    private int thisMobile, thisMobile2, thisMobile3;





    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public BarChartModel getModel() {
        return model;
    }

    public void setModel(BarChartModel model) {
        this.model = model;
    }

    public int getThisMobile() {
        return thisMobile;
    }

    public void setThisMobile(int thisMobile) {
        this.thisMobile = thisMobile;
    }

    public int getThisMobile2() {
        return thisMobile2;
    }

    public void setThisMobile2(int thisMobile2) {
        this.thisMobile2 = thisMobile2;
    }

    public int getThisMobile3() {
        return thisMobile3;
    }

    public void setThisMobile3(int thisMobile3) {
        this.thisMobile3 = thisMobile3;
    }

    public int getYear3() {
        return year3;
    }

    public void setYear3(int year3) {
        this.year3 = year3;
    }

    public int getYear2() {
        return year2;
    }

    public void setYear2(int year2) {
        this.year2 = year2;
    }

    public BarChartModel getModel3() {
        return model3;
    }

    public void setModel3(BarChartModel model3) {
        this.model3 = model3;
    }

    public BarChartModel getModel2() {
        return model2;
    }

    public void setModel2(BarChartModel model2) {
        this.model2 = model2;
    }

    @PostConstruct
    public void init(){

        System.out.println("GraphConsistencyBean - Init");

        Date data = new Date();

        GregorianCalendar gd  = new GregorianCalendar();
        gd.setTimeInMillis(data.getTime() );



        year = gd.get(Calendar.YEAR);

        model = new BarChartModel();

        year2 = gd.get(Calendar.YEAR);

        model2 = new BarChartModel();

        year3 = gd.get(Calendar.YEAR);

        model3 = new BarChartModel();

        checkConsistency(SQL_MOBILE,thisMobile,year,1);
        checkConsistency(SQL_FIXED,thisMobile2,year2,2);
        checkConsistency(SQL_EDDY,thisMobile3,year3,3);
    }


    public void nextYear(){
        //System.out.println("Next Year - Prima: "+year+" - "+thisMobile);

        year++;
        //System.out.println("Next Year - dopo: "+year+" - "+thisMobile);
        checkConsistency(SQL_MOBILE,thisMobile,year,1);
    }

    public void prevYear(){
        //System.out.println("Prev Year - Prima: "+year+" - "+thisMobile);
        year--;
        //System.out.println("Prev Year - dopo: "+year+" - "+thisMobile);
        checkConsistency(SQL_MOBILE,thisMobile,year,1);
    }

    public void nextYear2(){
        //System.out.println("Next Year - Prima: "+year+" - "+thisMobile);

        year2++;
        //System.out.println("Next Year - dopo: "+year+" - "+thisMobile);
        checkConsistency(SQL_FIXED,thisMobile2,year2,2);
    }

    public void prevYear2(){
        //System.out.println("Prev Year - Prima: "+year+" - "+thisMobile);
        year2--;
        //System.out.println("Prev Year - dopo: "+year+" - "+thisMobile);
        checkConsistency(SQL_FIXED,thisMobile2,year2,2);
    }

    public void nextYear3(){
        //System.out.println("Next Year - Prima: "+year+" - "+thisMobile);

        year3++;
        //System.out.println("Next Year - dopo: "+year+" - "+thisMobile);
        checkConsistency(SQL_EDDY,thisMobile3,year3,3);
    }

    public void prevYear3(){
        //System.out.println("Prev Year - Prima: "+year+" - "+thisMobile);
        year3--;
        //System.out.println("Prev Year - dopo: "+year+" - "+thisMobile);
        checkConsistency(SQL_EDDY,thisMobile3,year3,3);
    }

    public void doCons4Mobile(){

        checkConsistency(SQL_MOBILE,thisMobile,year,1);
    }

    public void doCons4Eddy(){


        checkConsistency(SQL_EDDY,thisMobile3,year3,3);
    }

    public void doCons4Fixed(){


        checkConsistency(SQL_FIXED,thisMobile2,year2,2);
    }

    /**
     * Calcola la consistenza per un determinato anno
     */
    public void checkConsistency(String sqlString2, int inMobile, int inYear, int mode){

        TDBManager dsm2=null;



        try{
            dsm2 = new TDBManager("jdbc/urbandb");

            dsm2.setPreparedStatementRef(sqlString2);
            dsm2.setParameter(DBManager.ParameterType.INT,""+inMobile,1);
            dsm2.setParameter(DBManager.ParameterType.INT,""+ inYear,2);

            dsm2.runPreparedQuery();
            List<Double> result = new ArrayList<Double>();

            for(int i=1; i<=12; i++)
                result.add(0.0);

            while(dsm2.next()){
                double feb=0;

                switch((dsm2.getInteger(2))){
                    case 1:
                    case 3:
                    case 5:
                    case 7:
                    case 8:
                    case 10:
                    case 12:
                        System.out.println("Sono dentro ai mesi 31");
                        feb = (double)(dsm2.getInteger(1)*100/31);
                        if (feb>100)
                            feb=100.0;

                        result.set((dsm2.getInteger(2)-1),feb);
                        break;
                    case 4:
                    case 6:
                    case 9:
                    case 11:
                        System.out.println("Sono dentro ai mesi 30");
                        feb = (double)(dsm2.getInteger(1)*100/30);
                        if (feb>100)
                            feb=100.0;
                        result.set((dsm2.getInteger(2)-1),feb);
                        break;
                    case 2:
                        System.out.println("Sono dentro ai mesi 28");
                        feb = (double)(dsm2.getInteger(1)*100/28);
                        if (feb>100)
                            feb=100.0;
                        result.set((dsm2.getInteger(2)-1),feb);
                        break;


                }




            }

            BarChartSeries questoChart = new BarChartSeries();


            questoChart.setXaxis(AxisType.X);
            questoChart.setYaxis(AxisType.Y);
            for(int i=0;i<12;i++){
                questoChart.set(getMonthForInt(i), result.get(i));
            }

           // model = new BarChartModel();
            switch(mode){
                case 1:
                    model.clear();
                    model.addSeries(questoChart);


                    model.getAxis(AxisType.X).setTickAngle(-70);
                    model.setSeriesColors("27B4D8");

                    model.getAxis(AxisType.Y).setMax(100);
                    model.getAxis(AxisType.Y).setMin(0);
                    model.getAxis(AxisType.Y).setLabel("Coverage (%)");

                    model.setZoom(false);
                    break;

                case 2:
                    model2.clear();
                    model2.addSeries(questoChart);


                    model2.getAxis(AxisType.X).setTickAngle(-70);
                    model2.setSeriesColors("27B4D8");

                    model2.getAxis(AxisType.Y).setMax(100);
                    model2.getAxis(AxisType.Y).setMin(0);
                    model2.getAxis(AxisType.Y).setLabel("Coverage (%)");

                    model2.setZoom(false);
                    break;

                case 3:
                    model3.clear();
                    model3.addSeries(questoChart);


                    model3.getAxis(AxisType.X).setTickAngle(-70);
                    model3.setSeriesColors("27B4D8");

                    model3.getAxis(AxisType.Y).setMax(100);
                    model3.getAxis(AxisType.Y).setMin(0);
                    model3.getAxis(AxisType.Y).setLabel("Coverage (%)");

                    model3.setZoom(false);
                    break;

            }




        }catch(SQLException e) {

            e.printStackTrace();

        }catch (Exception e) {

            e.printStackTrace();

        }finally {
            try {
                dsm2.closeConnection();

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }




    }


   private  String getMonthForInt(int num) {
        String month = "wrong";
        DateFormatSymbols dfs = new DateFormatSymbols();
        String[] months = dfs.getMonths();
        if (num >= 0 && num <= 11 ) {
            month = months[num];
        }
        return month;
    }

}
