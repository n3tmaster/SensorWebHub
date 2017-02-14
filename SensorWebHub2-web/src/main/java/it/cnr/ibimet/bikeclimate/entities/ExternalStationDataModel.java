package it.cnr.ibimet.bikeclimate.entities;

import org.primefaces.model.SelectableDataModel;

import javax.faces.model.ListDataModel;
import java.util.List;

/**
 * Created by lerocchi on 19/08/16.
 */

public class ExternalStationDataModel extends ListDataModel<ExternalStationData> implements SelectableDataModel<ExternalStationData> {

    public ExternalStationDataModel(){

    }

    public ExternalStationDataModel(List<ExternalStationData> data){
        super(data);
    }
    @Override
    public ExternalStationData getRowData(String rowKey) {
        List<ExternalStationData> zone = (List<ExternalStationData>) getWrappedData();

        for(ExternalStationData zona : zone){
            String aaa = ""+zona.getIddata();
            if(aaa.equals(rowKey))
                return zona;
        }

        return null;
    }

    @Override
    public Object getRowKey(ExternalStationData zona) {

        return zona.getIddata();
    }

}