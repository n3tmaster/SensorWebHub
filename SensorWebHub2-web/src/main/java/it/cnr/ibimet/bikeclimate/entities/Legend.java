package it.cnr.ibimet.bikeclimate.entities;

import org.primefaces.model.StreamedContent;

import java.io.IOException;
import java.io.Serializable;




/**
 * Classe per la gestione di unaa legenda
 * @author lerocchi
 */
public class Legend implements Serializable{
    private String color;
    private String minVal, maxVal;
    private String label;
    private StreamedContent image;

    public Legend(String label, String color){
        this.label=label;
        this.color=color;

    }

    public Legend(String label, String color, String minVal, String maxVal){
        this(label, color);
        this.minVal=minVal;
        this.maxVal=maxVal;

    }
         
 
 
    public Legend(String label, String color, String minVal, String maxVal, StreamedContent image){
        this(label, color, minVal, maxVal);
        this.image=image;
    }

    public StreamedContent getImage() throws IOException {
        System.out.println("cavolo ora lo chiama : "+image.getStream().available());
        return image;
    }

    public void setImage(StreamedContent image) {
        this.image = image;
    }

    public String getMinVal() {
        return minVal;
    }

    public void setMinVal(String minVal) {
        this.minVal = minVal;
    }

    public String getMaxVal() {
        return maxVal;
    }

    public void setMaxVal(String maxVal) {
        this.maxVal = maxVal;
    }

    public String getColor() {
        return color;
    }
        
    public void setColor(String color) {
        this.color = color;
    }
	
    public String getLabel() {
        return label;
    }
    
    public void setLabel(String label) {
        this.label = label;
    }
	
}
