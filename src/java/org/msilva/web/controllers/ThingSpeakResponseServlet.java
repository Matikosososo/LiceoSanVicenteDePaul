/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.msilva.web.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.klawx3.iot.service.ThingSpeakRiegoService;
import org.klawx3.iot.thingspeak.model.ChannelFeed;
import org.klawx3.iot.thingspeak.model.ChannelModel;
import org.klawx3.iot.thingspeak.model.FeedModel;



@WebServlet(name = "ThingSpeakResponseServlet", urlPatterns = {"/ThingSpeakResponseServlet"})
public class ThingSpeakResponseServlet extends HttpServlet {

    
     
    

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        FeedModel lastFeed = ThingSpeakRiegoService.getLastFeed();
        String field1 = lastFeed.getField1();
        try (PrintWriter out = response.getWriter()) {
            out.print(field1);
        }
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
