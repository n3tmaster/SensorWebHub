/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.cnr.ibimet.bikeclimate.entities;

import java.io.Serializable;

/**
 *
 * @author lerocchi
 * 
 * entity class for sensor
 * 
 */
public class Sensor implements Serializable {
   private String param_name;
   private double min_value, max_value;
   private String unit;
   private String chart_type;
   private String field_name;
   private String aggregation_type;
   private int id;
   
   public Sensor(){
       super();
   }
   
   public Sensor(String param_name,
    double min_value, double max_value,
    String unit,
    String chart_type,
    String field_name,
    int id, String aggregation_type){
       this();
       this.param_name = param_name;
       this.min_value  = min_value;
       this.max_value  = max_value;
       this.unit       = unit;
       this.chart_type = chart_type;
       this.field_name = field_name;
       this.id         = id;
       this.aggregation_type = aggregation_type;
       
   }

    public String getAggregation_type() {
        return aggregation_type;
    }

    public void setAggregation_type(String aggregation_type) {
        this.aggregation_type = aggregation_type;
    }
   
   
   
    public String getParam_name() {
        return param_name;
    }

    public void setParam_name(String param_name) {
        this.param_name = param_name;
    }

    public Double getMin_value() {
        return min_value;
    }

    public void setMin_value(Double min_value) {
        this.min_value = min_value;
    }

    public void setMin_value(double min_value) {
        this.min_value = min_value;
    }

    public Double getMax_value() {
        return max_value;
    }

    public void setMax_value(Double max_value) {
        this.max_value = max_value;
    }

    public void setMax_value(double max_value) {
        this.max_value = max_value;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getChart_type() {
        return chart_type;
    }

    public void setChart_type(String chart_type) {
        this.chart_type = chart_type;
    }

    public String getField_name() {
        return field_name;
    }

    public void setField_name(String field_name) {
        this.field_name = field_name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
   
   
   
   
}
