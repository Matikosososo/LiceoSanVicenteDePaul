package org.msilva.iot.riego;

import java.util.logging.Level;
import java.util.logging.Logger;
import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttException;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.eclipse.paho.client.mqttv3.persist.MemoryPersistence;

/**
 *
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */
public class MqttRiegoService {

    private static long lastMillis = 0;
    private static long allowedMillis = 3500;
    static final int MQTT_PORT = 1883;
    static final String SERVIDOR = "tcp://klawx3.softether.net:";

    private static MqttClient client;
   
    //-------------------------------------------------------------------------

    public static boolean activarRiego(boolean activar){
        if( (System.currentTimeMillis() - lastMillis > allowedMillis) || lastMillis == 0){
            if(activar){
                activarRiego();
            }else{
                desactivarRiego();
            }
            lastMillis = System.currentTimeMillis();
            return true;
        }
        return false;
    }

    private static void activarRiego(){
        try {
            client = new MqttClient(SERVIDOR + MQTT_PORT, MqttClient.generateClientId(), new MemoryPersistence());
            client.connect();
            
            client.publish("led/estado1", new MqttMessage(new Integer(1).toString().getBytes()));
            
            client.disconnect();
            client.close();
        } catch (MqttException ex) {
            Logger.getLogger(MqttRiegoService.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    private static void desactivarRiego(){
        try {
            client = new MqttClient(SERVIDOR + MQTT_PORT, MqttClient.generateClientId(), new MemoryPersistence());
            client.connect();
            
            client.publish("led/estado1", new MqttMessage(new Integer(0).toString().getBytes()));
            
            client.disconnect();
            client.close();
        } catch (MqttException ex) {
            Logger.getLogger(MqttRiegoService.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
