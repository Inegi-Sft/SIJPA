/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clasesAuxiliar;

import ConexionDB.Conexion_Mysql;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author CESAR.OSORIO
 */
public class showConclusiones {

    Conexion_Mysql conn = new Conexion_Mysql();
    ArrayList<String[]> conc;
    String sql;
    ResultSet resul;
    int conteoConclu;

    public ArrayList findConclusion() {
        conn.Conectar();
        conc = new ArrayList();
        sql = "SELECT * FROM DATOS_CONCLUSIONES_ADOJC";
        resul = conn.consultar(sql);
        try {
            while(resul.next()){
                conc.add(new String[]{resul.getString(1), resul.getString(2),resul.getString(3),
                    resul.getString(4),resul.getString(5),resul.getString(6),resul.getString(7),resul.getString(8),
                    resul.getString(9),resul.getString(10),resul.getString(11),resul.getString(12),resul.getString(13),
                    resul.getString(14),resul.getString(15),resul.getString(16),resul.getString(17),resul.getString(18),
                    resul.getString(19),resul.getString(20),resul.getString(21),resul.getString(22),resul.getString(23),resul.getString(24)});
            }
            conn.close();
        }
        catch (SQLException ex) {
            Logger.getLogger(showConclusiones.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conc;

    }
    
    public ArrayList findConcluTabla() {
        conn.Conectar();
        conc = new ArrayList();
        sql = "SELECT C.CONCLUSION_CLAVE, C.FECHA_CONCLUSION, C.PROCESADO_CLAVE, CAT.DESCRIPCION FROM DATOS_CONCLUSIONES_ADOJC C, CATALOGOS_TIPO_RESOLUCION CAT"
                + " WHERE C.TIPO_RESOLUCION=CAT.RESOLUCION_ID";
        resul = conn.consultar(sql);
        try {
            while(resul.next()){
                conc.add(new String[]{resul.getString(1), resul.getString(2),resul.getString(3),resul.getString(4)});
            }
            conn.close();
        }
        catch (SQLException ex) {
            Logger.getLogger(showConclusiones.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conc;

    }
    public ArrayList findConcluProce(String pro) {
        conn.Conectar();
        conc = new ArrayList();
        sql = "SELECT C.PROCESADO_CLAVE, P.NOMBRE, P.A_PATERNO, P.A_MATERNO, C.FECHA_CONCLUSION, TR.DESCRIPCION "
                + " FROM DATOS_CONCLUSIONES_ADOJC C, DATOS_PROCESADOS_ADOJC P, CATALOGOS_TIPO_RESOLUCION TR"
                + " WHERE C.PROCESADO_CLAVE=P.PROCESADO_CLAVE"
                + " AND C.TIPO_RESOLUCION=TR.RESOLUCION_ID"
                + " AND C.PROCESADO_CLAVE='"+pro+"'";
        resul = conn.consultar(sql);
        try {
            while(resul.next()){
                conc.add(new String[]{
                    resul.getString(1), resul.getString(2)+" "+resul.getString(3)+" "+resul.getString(4),
                    resul.getString(5),resul.getString(6)
                });
            }
            conn.close();
        }
        catch (SQLException ex) {
            Logger.getLogger(showConclusiones.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conc;

    }
    public int countConclusionesExp(String exp) {
        try{
            conn.Conectar();
            conteoConclu = 0;
            sql = "SELECT COUNT(*) FROM DATOS_CONCLUSIONES_ADOJC WHERE EXPEDIENTE_CLAVE = '" + exp + "'";
            resul = conn.consultar(sql);
            while (resul.next()) {
                conteoConclu = resul.getInt(1);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showConclusiones .class.getName()).log(Level.SEVERE, null, ex);
        }
        return conteoConclu;

    }
    
}
