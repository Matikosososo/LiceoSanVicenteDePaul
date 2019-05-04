/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.klawx3.iot.service;

import java.util.List;
import org.klawx3.iot.thingspeak.ThingSpeakRest;
import org.klawx3.iot.thingspeak.model.ChannelFeed;
import org.klawx3.iot.thingspeak.model.FeedModel;

/**
 *
 * @author Kenshi
 */
public class ThingSpeakRiegoService {
   
        private static String channelId = "773558";
        private static String readApiKey = "NNJ4AW9R092LV476";
        private static String writeApiKey = "9JZPFNSC2Q6Q6TFE";
        
        private static int field = 1;
        
        private static ThingSpeakRest ts;     
        
        static {
            ts = new ThingSpeakRest(channelId,readApiKey,writeApiKey);
        }
        
        public static FeedModel getLastFeed(){ 
            return getFeeds(1).get(0); // solo un resultado
        }
        
        public static List<FeedModel> getFeeds(int lenght){
            ChannelFeed channelFeed = ts.getChannelFeed(field,lenght);
            return channelFeed.getFeeds();             
        }

}
