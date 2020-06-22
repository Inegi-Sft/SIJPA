/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clasesAuxiliar;

import ConexionDB.Conexion_Mysql;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author ANTONIO.CORIA
 */
public class estatusEtapaIn {
   Conexion_Mysql conn = new Conexion_Mysql();
    String sql,Conc,Texto1="",Texto2="",Texto3="",Texto4="",Texto5="",Texto6="";
    ResultSet resul;
    showInicial Inicial =new showInicial();
    showTramite Tram=new showTramite();
    showConclusiones Conclu=new showConclusiones();
    showIntermedia Inte=new showIntermedia();
    ArrayList<String[]> Etapa;
       
    
 public String findEstatusEtapaIn( String causaClave,String JuzgadoClave){
  Etapa=Inicial.findEtapaCausaProClave(causaClave);
  String JuzClave=JuzgadoClave.replace("-","");
        int CPT=0,CPC=0,CPI=0; 
        Texto1="";
        Texto2="";
        Texto3="";
        Texto4="";
        Texto5="";
        Texto6="";
        for (String[] ET : Etapa) {
            if (ET[1].equals("5"))//CONCLUSION Y/O TRAMITE
            {
                System.out.println("Entro a etapa 5");
                CPT = Tram.countTramiteProc(causaClave, ET[0]);
                CPC = Conclu.countConclusionesProc(causaClave, ET[0]);
                if ((CPT == 0 && CPC == 0)) {
                   Texto1 ="---*Por Capturar Procesado " + ET[0].replace(JuzClave, "") + " En Tramite Y/O Conclusion --";
                }else{
                  Texto1="";  
                  }
            } else if (ET[1].equals("3") ) {
                System.out.println("ENTRO A ETAPA 3");
                CPT = Tram.countTramiteProc(causaClave, ET[0]);
            if (CPT == 0) {
                Texto2 ="---*Por Capturar Procesado " + ET[0].replace(JuzClave, "") + " En Tramite --";
            }else{
                Texto2=""; 
               }
            }else if (ET[1].equals("2") ) {
                System.out.println("ENTRO A ETAPA 2");
                CPC = Conclu.countConclusionesProc(causaClave, ET[0]);
            if (CPC == 0) {
                Texto3 ="---*Por Capturar Procesado " + ET[0].replace(JuzClave, "") + " En Conclusion --";
            }else{
                Texto3="";  
               }
            }else if (ET[1].equals("1") ) {
                System.out.println("ENTRO A ETAPA 1");
                CPI = Inte.countIntermediaProc(causaClave, ET[0]);
            if (CPI == 0) {
                Texto4 ="---*Por Capturar Procesado " + ET[0].replace(JuzClave, "") + " En Etapa Intermedia --";
            }else{
                Texto4=""; 
               }
            }else if (ET[1].equals("6") ) {
                System.out.println("ENTRO A ETAPA 6");
                CPI = Inte.countIntermediaProc(causaClave, ET[0]);
                CPC = Conclu.countConclusionesProc(causaClave, ET[0]);
            if ((CPI == 0 && CPC == 0)) {
                Texto5 ="---*Por Capturar Procesado " + ET[0].replace(JuzClave, "") + " En Etapa Intermedia y/o Conclusion --";
            }else{
                Texto5="";
               }
            }else if (ET[1].equals("7") ) {
                System.out.println("ENTRO A ETAPA 7");
                CPI = Inte.countIntermediaProc(causaClave, ET[0]);
                CPT = Tram.countTramiteProc(causaClave, ET[0]);
            if ((CPI == 0 && CPT == 0)) {
                Texto6 ="---*Por Capturar Procesado " + ET[0].replace(JuzClave, "") + " En Etapa Intermedia y/o Tramite --";
            }else{
                Texto6=""; 
               }
            }
            System.out.println("PROCESADO_CLAVE: " + ET[0]);
            System.out.println("ETAPA: " + ET[1]);
        }
        System.out.println(JuzgadoClave);
        return Texto1+Texto2+Texto3+Texto4+Texto5+Texto6;
           
 } 
    
}
