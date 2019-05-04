package org.klawx3.iot.thingspeak;

import org.klawx3.iot.service.ThingSpeakRiegoService;
import org.klawx3.iot.thingspeak.model.ChannelFeed;
import org.klawx3.iot.thingspeak.model.ChannelModel;
import org.klawx3.iot.thingspeak.model.FeedModel;


/**
 * Hello world!
 *
 */
public class App {
    public static void main( String[] args ){    
        FeedModel lastFeed = ThingSpeakRiegoService.getLastFeed();
        String field1 = lastFeed.getField1();
        String created_at = lastFeed.getCreated_at();
        System.out.println("Valor del Feed:" + field1);
        System.out.println("Creado a:" + created_at );
        
    }
}
