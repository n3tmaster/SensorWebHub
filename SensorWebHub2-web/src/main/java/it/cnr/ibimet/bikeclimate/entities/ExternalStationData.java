package it.cnr.ibimet.bikeclimate.entities;

import java.util.GregorianCalendar;

/**
 * Created by lerocchi on 19/08/16.
 */
public class ExternalStationData extends BikeData {
    public ExternalStationData() {
    }

    public ExternalStationData(GregorianCalendar gc, double tair, double noise, double rad, int co2, String bikename, int iddata, int o3) {
        super(gc, tair, noise, rad, co2, bikename, iddata, o3);
    }

    public ExternalStationData(GregorianCalendar gc, double tair, double noise, double rad, int co2, String bikename, int iddata, int o3, double ntc, double ds18, int pk, byte[] the_geom, double utc) {
        super(gc, tair, noise, rad, co2, bikename, iddata, o3, ntc, ds18, pk, the_geom, utc);

    }

    public ExternalStationData(GregorianCalendar gc,
                               double tair,
                               double noise,
                               double rad,
                               int co2,
                               String bikename,
                               int iddata,
                               int o3,
                               double ntc,
                               double ds18,
                               int pk,
                               double utc) {
        super(gc, tair, noise, rad, co2, bikename, iddata, o3, ntc, ds18, pk, null, utc);

    }



}
