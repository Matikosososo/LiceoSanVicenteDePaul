/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.msilva.iot.riego;

import java.util.logging.Level;
import java.util.logging.Logger;
import org.eclipse.paho.client.mqttv3.MqttException;

public class appTest {
    
    public static void main( String[] args ){    
        MqttRiegoService r = new MqttRiegoService();
        
        
        while(true){
            try {
                System.out.println(r.activarRiego(true));
                Thread.sleep(1000);
            } catch (InterruptedException ex) {
                Logger.getLogger(appTest.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
    }
}
