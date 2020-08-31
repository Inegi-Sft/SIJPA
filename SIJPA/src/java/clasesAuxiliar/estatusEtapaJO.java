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
public class estatusEtapaJO {
 
    Conexion_Mysql conn = new Conexion_Mysql();
    String sql,Conc,Texto1="",Texto2="",Texto3="",Texto4="",Texto5="",Texto6="";
    ResultSet resul;
    showJuicio Inicial =new showJuicio();
    showTramiteJO Tram=new showTramiteJO();
    showConclusionesJO Conclu=new showConclusionesJO();
    ArrayList<String[]> Etapa;
    
    
    public String findEstatusOral( String causaClaveJO,String JuzgadoClave){
        Etapa=Inicial.findEtapaCausaProClaveJO(causaClaveJO);
        String JuzClave = JuzgadoClave.replace("-","");
        int CPT=0,CPC=0,CPI=0; 
        Texto1="";
        Texto2="";
        Texto3="";
        Texto4="";
        Texto5="";
        Texto6="";
        for (String[] ET : Etapa) {
            if (ET[1].equals("5")){//CONCLUSION Y/O TRAMITE
                CPT = Tram.countTramiteProcJO(causaClaveJO, ET[0]);
                CPC = Conclu.countConclusionesProcJO(causaClaveJO, ET[0]);
                if ((CPT == 0 && CPC == 0)) {
                   Texto1 ="---*Por Capturar Procesado " + ET[0].replace(JuzClave, "") + " En Tramite Y/O Conclusion --";
                }else{
                  Texto1="";  
                  }
            } else if (ET[1].equals("3") ) {
                CPT = Tram.countTramiteProcJO(causaClaveJO, ET[0]);
                if (CPT == 0) {
                    Texto2 ="---*Por Capturar Procesado " + ET[0].replace(JuzClave, "") + " En Tramite --";
                }else{
                    Texto2=""; 
                }
            }else if (ET[1].equals("2") ) {
                CPC = Conclu.countConclusionesProcJO(causaClaveJO, ET[0]);
                if (CPC == 0) {
                    Texto3 ="---*Por Capturar Procesado " + ET[0].replace(JuzClave, "") + " En Conclusion --";
                }else{
                    Texto3="";  
                }
            }
        }
        return Texto1 + Texto2 + Texto3;  
 }
    
}
