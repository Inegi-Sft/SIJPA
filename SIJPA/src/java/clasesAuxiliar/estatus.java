/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clasesAuxiliar;

import ConexionDB.Conexion_Mysql;
import java.sql.ResultSet;

/**
 *
 * @author ANTONIO.CORIA
 */
public class estatus {
    
    Conexion_Mysql conn = new Conexion_Mysql();
    String sql,Conc;
    ResultSet resul;
    showCausasPenales pena=new showCausasPenales();
    showInicial inicia=new showInicial();
    int TCP=0,TCV=0,TCD=0;
    int TP=0,TV=0,TD=0,EI=0;
    int total=0;
    
    public String finEstatus(int Est, String causaClave){
        System.out.println("estatuuuuuus: "+Est);
        switch (Est)
        {
            case 2:
            TCD=pena.countTotalDelitos(causaClave);
            TD=pena.total_reg_Delitos(causaClave);
            total=TCD-TD;
            Conc="---*Por Capturar "+ total +" Delito(s)--";
             break;
                
            case 3:
            TCP=pena.countTotalProcesados(causaClave);
            TP=pena.total_reg_Procesados(causaClave);
            total=TCP-TP;
            Conc="---*Por Capturar "+ total +" Procesado(s)--";
            break;    
            
             case 4:
            TCV=pena.countTotalVictimas(causaClave);
            TV=pena.total_reg_Victimas(causaClave);
            total=TCV-TV;
            Conc="---*Por Capturar "+ total +" Victima(s)--";
            break; 
                 
             case 5://ETAPA Inicial
            TCP=pena.countTotalProcesados(causaClave);
            EI=pena.total_reg_etaInicial(causaClave);
            total=TCP-EI;
           Conc="---*Por Capturar "+ total +" Procesado(s) en Etapa Inicial--";
            break;
                 
           case 6://ETAPA Inicial
            EI=inicia.findEtapaCausaClave(causaClave);
            total=EI;
           Conc="---*Por Capturar "+ total +" Procesado(s) en Etapa Inicial--";
            break;         
        }
 
        return Conc;
        
        
    }
    
}