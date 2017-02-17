/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.cnr.ibimet.dbutils;

import it.cnr.ibimet.entities.Legend;
import it.lr.libs.DBManager.ParameterType;
import org.primefaces.model.map.Polygon;
import org.primefaces.model.map.Polyline;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author lerocchi
 */
public class LegendModel implements SWH4EConst{
    
    private TDBManager dsm;
    private String legendType;
    private TableSchema ts;
    
    private List<String> stroke_color;
    private List<Double> opacita;
    private List<String> label;
    private List<String> colore;
    private List<String> valMin;
    private List<String> valMax;
    private List<Integer> lineWidth;
    private List<String> campo;
    private List<String> value;
    private String lingua;
    
    
    private Polygon questoPoligono;
    private Polyline questoLine;

     public LegendModel(TDBManager dsm,  TableSchema ts, String lingua) throws SQLException{
        this.dsm=dsm;
        this.legendType=ts.getTipoLayer();
        this.ts=ts;
        this.lingua=lingua;

    }

    public LegendModel(TDBManager dsm, String legendType, TableSchema ts, String lingua) throws SQLException{
        this.dsm=dsm;
        this.legendType=legendType;
        this.ts=ts;
        this.lingua=lingua;
    }

    //Versione che prende anche il poligono
    public LegendModel(TDBManager dsm, String legendType, TableSchema ts, Polygon questoPoligono, String lingua) throws SQLException{
        this.dsm=dsm;
        this.legendType=legendType;
        this.ts=ts;
        this.questoPoligono=questoPoligono;
        this.lingua=lingua;
    }

     public LegendModel(TDBManager dsm, String legendType, TableSchema ts, Polyline questoLine, String lingua) throws SQLException{
        this.dsm=dsm;
        this.legendType=legendType;
        this.ts=ts;
        this.questoLine=questoLine;
        this.lingua=lingua;
    }

    public List<String> getCampo() {
        return campo;
    }
    
    public void setCampo(List<String> campo) {
        this.campo = campo;
    }

    public List<String> getValue() {
        return value;
    }
    
    public void setValue(List<String> value) {
        this.value = value;
    }

    public Legend getLegenda(int questoElemento){
        if (this.legendType.equals(LEGEND_TYPE_SINGLE_COLOR)){
           return new Legend(this.label.get(questoElemento),
                            this.colore.get(questoElemento),
                            this.valMin.get(questoElemento),
                            this.valMax.get(questoElemento));
        }else if(this.legendType.equals(LEGEND_TYPE_UNIQUE_VALUE)){
            return new Legend(this.label.get(questoElemento),
                            this.colore.get(questoElemento),
                            this.value.get(questoElemento),
                            " ");
        }else if(this.legendType.equals(LEGEND_TYPE_CLASSBREAK_VALUE)){

        }
        return null;
    }

    public List<Integer> getLineWidth() {
        return lineWidth;
    }

    public void setLineWidth(List<Integer> lineWidth) {
        this.lineWidth = lineWidth;
    }

    public List<String> getColore() {
        return colore;
    }

    public void setColore(List<String> colore) {
        this.colore = colore;
    }
    
    public List<String> getValMin() {
        return valMin;
    }
    
    public void setValMin(List<String> valMin) {
        this.valMin = valMin;
    }

    public List<String> getValMax() {
        return valMax;
    }

    public void setValMax(List<String> valMax) {
        this.valMax = valMax;
    }

    public int getCount(){
        return this.label.size();
    }

    public String getLegendType() {
        return legendType;
    }

    public void setLegendType(String legendType) {
        this.legendType = legendType;
    }

    public List<String> getStroke_color() {
        return stroke_color;
    }

    public void setStroke_color(List<String> stroke_color) {
        this.stroke_color = stroke_color;
    }
  
    public List<Double> getOpacita() {
        return opacita;
    }
    
    public void setOpacita(List<Double> opacita) {
        this.opacita = opacita;
    }
    
    public List<String> getLabel() {
        return label;
    }

    public void setLabel(List<String> label) {
        this.label = label;
    }

    public void createLegendModel() throws SQLException{
        
        
     
        if(legendType.equals(LEGEND_TYPE_SINGLE_COLOR)){
            dsm.setPreparedStatementRef("select colore, stroke_color, opacita, label_"+lingua+", campo,linewidth from legende where nome_tabella=?");
            dsm.setParameter(ParameterType.STRING, ts.getTableName(), 1);
            dsm.runPreparedQuery();
            colore = new ArrayList<String>();
            stroke_color = new ArrayList<String>();
            opacita = new ArrayList<Double>();
            label = new ArrayList<String>();
            valMin = new ArrayList<String>();
            valMax = new ArrayList<String>();
            campo = new ArrayList<String>();
            lineWidth = new ArrayList<Integer>();
            if(dsm.next()){
                colore.add(dsm.getString(1));
                stroke_color.add(dsm.getString(2));
                opacita.add(dsm.getDouble(3));
                label.add(dsm.getString(4));
                valMin.add("---");
                valMax.add("---");
                campo.add(dsm.getString(5));
                lineWidth.add(dsm.getInteger(6));
            }

        }else if(legendType.equals(LEGEND_TYPE_UNIQUE_VALUE)){
            dsm.setPreparedStatementRef("select colore, stroke_color, opacita, label_"+lingua+
                    ", campo, value, linewidth from legende where nome_tabella=?");
            dsm.setParameter(ParameterType.STRING, ts.getTableName(), 1);
            dsm.runPreparedQuery();
            colore = new ArrayList<String>();
            stroke_color = new ArrayList<String>();
            opacita = new ArrayList<Double>();
            label = new ArrayList<String>();
            campo = new ArrayList<String>();
            value = new ArrayList<String>();
            lineWidth = new ArrayList<Integer>();
            while(dsm.next()){
                colore.add(dsm.getString(1));
                stroke_color.add(dsm.getString(2));
                opacita.add(dsm.getDouble(3));
                label.add(dsm.getString(4));
                campo.add(dsm.getString(5));
                value.add(dsm.getString(6));
                 lineWidth.add(dsm.getInteger(7));
            }               
        }else if(legendType.equals(LEGEND_TYPE_CLASSBREAK_VALUE)){
            dsm.setPreparedStatementRef("select colore, stroke_color, opacita, label_"+lingua+
                    ", campo, valMin, linewidth, valMax from legende where nome_tabella=?");
            dsm.setParameter(ParameterType.STRING, ts.getTableName(), 1);
            dsm.runPreparedQuery();
            colore = new ArrayList<String>();
            stroke_color = new ArrayList<String>();
            opacita = new ArrayList<Double>();
            label = new ArrayList<String>();
            campo = new ArrayList<String>();
            valMin = new ArrayList<String>();
            valMax = new ArrayList<String>();
            lineWidth = new ArrayList<Integer>();
            while(dsm.next()){
                colore.add(dsm.getString(1));
                stroke_color.add(dsm.getString(2));
                opacita.add(dsm.getDouble(3));
                label.add(dsm.getString(4));
                campo.add(dsm.getString(5));
                valMin.add(dsm.getString(6));
                 lineWidth.add(dsm.getInteger(7));
                    valMax.add(dsm.getString(8));
            }                //TODO: da implementare                
            
       }
    }
    
    public void createLegendModelLine() throws SQLException{
        
        
     
        if(legendType.equals(LEGEND_TYPE_SINGLE_COLOR)){
            dsm.setPreparedStatementRef("select colore,  opacita, label_"+lingua+", linewidth from legende where nome_tabella=?");
            dsm.setParameter(ParameterType.STRING, ts.getTableName(), 1);
            dsm.runPreparedQuery();
            colore = new ArrayList<String>();
            opacita = new ArrayList<Double>();
            label = new ArrayList<String>();
            lineWidth = new ArrayList<Integer>();
            
            if(dsm.next()){
                colore.add(dsm.getString(1));
                opacita.add(dsm.getDouble(2));
                label.add(dsm.getString(3));
                lineWidth.add(dsm.getInteger(4));
                
                questoLine.setStrokeColor(dsm.getString(1));
                questoLine.setStrokeOpacity(dsm.getDouble(2));
                questoLine.setStrokeWeight(dsm.getInteger(4));
                
        
            }

        }else if(legendType.equals(LEGEND_TYPE_UNIQUE_VALUE)){
                            //TODO: da implementare
        }else if(legendType.equals(LEGEND_TYPE_CLASSBREAK_VALUE)){
                            //TODO: da 
       }
    }
    
    public void createLegendModelPolygon() throws SQLException{
        if(legendType.equals(LEGEND_TYPE_SINGLE_COLOR)){
            dsm.setPreparedStatementRef("select colore, stroke_color, opacita, label_"+lingua+" from legende where nome_tabella=?");
            dsm.setParameter(ParameterType.STRING, ts.getTableName(), 1);
            dsm.runPreparedQuery();
            colore = new ArrayList<String>();
            stroke_color = new ArrayList<String>();
            opacita = new ArrayList<Double>();
            label = new ArrayList<String>();
            if(dsm.next()){
                colore.add(dsm.getString(1));
                stroke_color.add(dsm.getString(2));
                opacita.add(dsm.getDouble(3));
                label.add(dsm.getString(4));
                
                questoPoligono.setFillColor(dsm.getString(1));
                questoPoligono.setStrokeColor(dsm.getString(2));
                questoPoligono.setFillOpacity(dsm.getDouble(3));
            }

        }else if(legendType.equals(LEGEND_TYPE_UNIQUE_VALUE)){
                            //TODO: da implementare
        }else if(legendType.equals(LEGEND_TYPE_CLASSBREAK_VALUE)){
                            //TODO: da 
       }
    }
    
    //Utilizzo manuale a singolo poligono
    public void putLegendOnPolygon(Polygon questoPoligono) throws SQLException{
        if(legendType.equals(LEGEND_TYPE_SINGLE_COLOR)){
            dsm.setPreparedStatementRef("select colore, stroke_color, opacita, label_"+lingua+" from legende where nome_tabella=?");
            dsm.setParameter(ParameterType.STRING, ts.getTableName(), 1);
            dsm.runPreparedQuery();
           
            if(dsm.next()){
               
                
                questoPoligono.setFillColor(dsm.getString(1));
                questoPoligono.setStrokeColor(dsm.getString(2));
                questoPoligono.setFillOpacity(dsm.getDouble(3));
            }

        }else if(legendType.equals(LEGEND_TYPE_UNIQUE_VALUE)){
                            //TODO: da implementare
        }else if(legendType.equals(LEGEND_TYPE_CLASSBREAK_VALUE)){
                            //TODO: da 
       }
    }
    //Utilizzo manuale a singolo poligono con campo
    public void putLegendOnPolygon(Polygon questoPoligono, String questoCampo) throws SQLException{
        if(legendType.equals(LEGEND_TYPE_SINGLE_COLOR)){
            questoPoligono.setFillColor(this.colore.get(0));
            questoPoligono.setStrokeColor(this.stroke_color.get(0));
            questoPoligono.setFillOpacity(this.opacita.get(0));
        }else if(legendType.equals(LEGEND_TYPE_UNIQUE_VALUE)){
            //se non trovo una classe gli do nero
            if(value.indexOf(questoCampo)!=-1){
                
                questoPoligono.setFillColor(this.colore.get(value.indexOf(questoCampo)));
                questoPoligono.setStrokeColor(this.stroke_color.get(value.indexOf(questoCampo)));
                questoPoligono.setFillOpacity(this.opacita.get(value.indexOf(questoCampo)));
            }else{
                questoPoligono.setFillColor("#000000");
                questoPoligono.setStrokeColor("#000000");
                questoPoligono.setFillOpacity(0);
            }
        }
    }
    
    //Utilizzo manuale a singola linea
    public void putLegendOnLine(Polyline questoLine) throws SQLException{
        if(legendType.equals(LEGEND_TYPE_SINGLE_COLOR)){
            dsm.setPreparedStatementRef("select colore, opacita, label_"+lingua+", linewidth from legende where nome_tabella=?");
            dsm.setParameter(ParameterType.STRING, ts.getTableName(), 1);
            dsm.runPreparedQuery();
           
            if(dsm.next()){
               
                questoLine.setStrokeColor(dsm.getString(1));
                questoLine.setStrokeOpacity(dsm.getDouble(2));
                questoLine.setStrokeWeight(dsm.getInteger(4));
                
            }

        }else if(legendType.equals(LEGEND_TYPE_UNIQUE_VALUE)){
                            //TODO: da implementare
        }else if(legendType.equals(LEGEND_TYPE_CLASSBREAK_VALUE)){
                            //TODO: da 
       }
    }
    
        //Utilizzo manuale a singolo line con campo
    public void putLegendOnLine(Polyline questoLine, String questoCampo) throws SQLException{
        if(legendType.equals(LEGEND_TYPE_SINGLE_COLOR)){
            questoLine.setStrokeColor(this.colore.get(0));
            questoLine.setStrokeWeight(this.lineWidth.get(0));
            questoLine.setStrokeOpacity(this.opacita.get(0));
        }else if(legendType.equals(LEGEND_TYPE_UNIQUE_VALUE)){
            
            if(value.indexOf(questoCampo)!=-1){
                questoLine.setStrokeColor(this.colore.get(value.indexOf(questoCampo)));
                questoLine.setStrokeWeight(this.lineWidth.get(value.indexOf(questoCampo)));
                questoLine.setStrokeOpacity(this.opacita.get(value.indexOf(questoCampo)));
            }else{
                questoLine.setStrokeColor("#000000");
                questoLine.setStrokeWeight(1);
                questoLine.setStrokeOpacity(1);
            }
        
        }
    }
}
