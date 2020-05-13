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
 * @author CARLOS.SANCHEZG
 */
public class showDelitosJO {
    
    Conexion_Mysql conn = new Conexion_Mysql();
    ArrayList<String[]> deli;
    ArrayList<String> deliAdi;
    String sql;
    ResultSet resul;
    
    public ArrayList findDeliCausasJC(String causaClaveJC) {
        conn.Conectar();
        deli = new ArrayList();
        sql = "SELECT DISTINCT DE.DELITO_CLAVE, DE.DELITO_CODIGO_PENAL, DE.DELITO_NORMA_TECNICA, DE.FECHA_OCURRENCIA, DE.GRADO_CONSUMACION, DE.FORMA_COMISION "
                + "FROM DATOS_DELITOS_ADOJC DE, DATOS_PDELITOS_ADOJC PD, DATOS_CONCLUSIONES_ADOJC CO "
                + "WHERE DE.CAUSA_CLAVE = CO.CAUSA_CLAVE "
                + "AND PD.CAUSA_CLAVE = CO.CAUSA_CLAVE "
                + "AND DE.DELITO_CLAVE = PD.DELITO_CLAVE "
                + "AND PD.PROCESADO_CLAVE = CO.PROCESADO_CLAVE "
                + "AND CO.TIPO_RESOLUCION = 5 "
                + "AND DE.CAUSA_CLAVE = '" + causaClaveJC + "'"
                + "ORDER BY 1;";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                deli.add(new String[]{
                    resul.getString(1), resul.getString(2), resul.getString(3),
                    resul.getString(4), resul.getString(5), resul.getString(6)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showDelitos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return deli;
    }
    
    public ArrayList findDeliCausasJO(String causaClaveJC, String delitoClave) {
        conn.Conectar();
        deli = new ArrayList();
        sql = "SELECT DE.DELITO_CLAVE, CCN.CODIGO, CDN.DELITO, DE.FECHA_OCURRENCIA, CC.DESCRIPCION, CFC.DESCRIPCION "
                + "FROM DATOS_DELITOS_ADOJO DE, DATOS_CAUSAS_PENALES_ADOJO CP, CATALOGOS_CODIGO_NORMA CCN, CATALOGOS_DELITOS_NORMA CDN, CATALOGOS_CONSUMACION CC, CATALOGOS_FORMA_COMISION CFC "
                + "WHERE DE.CAUSA_CLAVEJO = CP.CAUSA_CLAVEJO "
                + "AND DE.DELITO_CODIGO_PENAL = CCN.ID_CODIGO "
                + "AND DE.DELITO_NORMA_TECNICA = CDN.ID_DELITO "
                + "AND DE.GRADO_CONSUMACION = CC.CONSUMACION_ID "
                + "AND DE.FORMA_COMISION = CFC.COMISION_ID "
                + "AND CP.CAUSA_CLAVEJC = '" + causaClaveJC + "' "
                + "AND DE.DELITO_CLAVE = '" + delitoClave + "' "
                + "ORDER BY 1;";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                deli.add(new String[]{
                    resul.getString(1), resul.getString(2), resul.getString(3),
                    resul.getString(4), resul.getString(5), resul.getString(6)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showDelitos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return deli;
    }
}
