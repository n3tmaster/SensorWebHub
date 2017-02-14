package it.cnr.ibimet.bikeclimate.entities;


import org.primefaces.model.SelectableDataModel;

import javax.faces.model.ListDataModel;
import java.util.List;

public class TrackElementDataModel extends ListDataModel<TrackElement> implements SelectableDataModel<TrackElement>{

	public TrackElementDataModel(){
		
	}
	
	public TrackElementDataModel(List<TrackElement> data){
		super(data);
	}
	@Override
	public TrackElement getRowData(String rowKey) {
		List<TrackElement> zone = (List<TrackElement>) getWrappedData();
		
		for(TrackElement zona : zone){
			String aaa = ""+zona.getId_track();
			if(aaa.equals(rowKey))
				return zona;
		}
		
		return null;
	}

	@Override
	public Object getRowKey(TrackElement zona) {
		
		return zona.getId_track();
	}

}