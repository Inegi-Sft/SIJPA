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
public class estatusJO {

    Conexion_Mysql conn = new Conexion_Mysql();
    String sql, Conc;
    ResultSet resul;
    showCausasPenalesJO pena = new showCausasPenalesJO();
    showJuicio inicia = new showJuicio();
    int TCP = 0, TCV = 0, TCD = 0;
    int TP = 0, TV = 0, TD = 0, EI = 0;
    int total = 0;

    public String findEstatus(int Est, String causaClave) {

        switch (Est) {
            case 2:
                TCD = pena.countTotalDelitosJO(causaClave);
                TD = pena.total_reg_DelitosJO(causaClave);
                total = TCD - TD;
                Conc = "---*Por Capturar " + total + " Delito(s)--";
                break;

            case 3:
                TCP = pena.countTotalProcesadosJO(causaClave);
                TP = pena.total_reg_ProcesadosJO(causaClave);
                total = TCP - TP;
                Conc = "---*Por Capturar " + total + " Procesado(s)--";
                break;

            case 4:
                TCV = pena.countTotalVictimasJO(causaClave);
                TV = pena.total_reg_VictimasJO(causaClave);
                total = TCV - TV;
                Conc = "---*Por Capturar " + total + " Victima(s)--";
                break;

            case 5://ETAPA JO
                TCP = pena.countTotalProcesadosJO(causaClave);
                EI = pena.total_reg_etaInicialJO(causaClave);
                if (TCP != EI) {
                    total = TCP - EI;
                    Conc = "---*Por Capturar " + total + " Procesado(s) en Etapa JuicioOral--";
                } else {
                    Conc = "";
                }
                break;
            default:
                Conc = "";
                break;
        }
        return Conc;
    }

}
