package it.cnr.ibimet.bikeclimate.entities;

import org.primefaces.model.SelectableDataModel;

import javax.faces.model.ListDataModel;
import java.util.List;

public class TotemStationDataModel extends ListDataModel<Totem> implements SelectableDataModel<Totem>{

	public TotemStationDataModel(){
		
	}
	
	public TotemStationDataModel(List<Totem> data){
		super(data);
	}
	@Override
	public Totem getRowData(String rowKey) {
		List<Totem> zone = (List<Totem>) getWrappedData();
		
		for(Totem zona : zone){
			String aaa = ""+zona.getId_bike_sensor();
			if(aaa.equals(rowKey))
				return zona;
		}
		
		return null;
	}

	@Override
	public Object getRowKey(Totem zona) {
		
		return zona.getId_bike_sensor();
	}

}