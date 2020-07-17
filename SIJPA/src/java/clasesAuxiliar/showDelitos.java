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
public class showDelitos {

    Conexion_Mysql conn = new Conexion_Mysql();
    ArrayList<String[]> deli;
    ArrayList<String> deliAdi;
    String sql;
    ResultSet resul;
    int conteoDel;

    public ArrayList findDelitos(String causaClave, String delitoClave) {
        conn.Conectar();
        deli = new ArrayList();
        sql = "SELECT D.*, CD.DELITO "
                + "FROM DATOS_DELITOS_ADOJC D, CATALOGOS_DELITOS_NORMA CD "
                + "WHERE D.DELITO_NORMA_TECNICA = CD.ID_DELITO "
                + "AND CAUSA_CLAVE = '" + causaClave + "' "
                + "AND DELITO_CLAVE = '" + delitoClave + "';";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                deli.add(new String[]{
                    resul.getString("D.DELITO_CODIGO_PENAL"), resul.getString("D.TIPO_FUERO"), resul.getString("D.ART_CODIGO_PENAL"),
                    resul.getString("D.DELITO_RECLASIFICADO"), resul.getString("D.FECHA_RECLASIFICACION"), resul.getString("D.DELITO_NORMA_TECNICA"),
                    resul.getString("CD.DELITO"), resul.getString("D.FECHA_OCURRENCIA"), resul.getString("D.SITIO_OCURRENCIA"), resul.getString("D.ESPECIFIQUE_SITIO"),
                    resul.getString("D.GRADO_CONSUMACION"), resul.getString("D.CALIFICACION"), resul.getString("D.CLASIFICACION"),
                    resul.getString("D.CONCURSO"), resul.getString("D.FORMA_COMISION"), resul.getString("D.FORMA_ACCION"), resul.getString("D.MODALIDAD"),
                    resul.getString("D.INSTRUMENTO_COMISION"), resul.getString("D.OCURRIO_ENTIDAD"), resul.getString("D.OCURRIO_MUNICIPIO"),
                    resul.getString("D.COMENTARIOS")
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showDelitos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return deli;
    }
    
    public ArrayList findDeliCausas(String causaClave) {
        conn.Conectar();
        deli = new ArrayList();
        sql = "SELECT D.DELITO_CLAVE, CCN.CODIGO, CDN.DELITO, D.FECHA_OCURRENCIA, CC.DESCRIPCION, CFC.DESCRIPCION "
                + "FROM DATOS_DELITOS_ADOJC D, CATALOGOS_CODIGO_NORMA CCN, CATALOGOS_DELITOS_NORMA CDN, CATALOGOS_CONSUMACION CC, CATALOGOS_FORMA_COMISION CFC "
                + "WHERE D.DELITO_CODIGO_PENAL = CCN.ID_CODIGO "
                + "AND D.DELITO_NORMA_TECNICA = CDN.ID_DELITO "
                + "AND D.GRADO_CONSUMACION = CC.CONSUMACION_ID "
                + "AND D.FORMA_COMISION = CFC.COMISION_ID "
                + "AND D.CAUSA_CLAVE = '" + causaClave + "' "
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
    
    public ArrayList findDeliTabla(String delitoClave) {
        conn.Conectar();
        deli = new ArrayList();
        sql = "SELECT D.DELITO_CLAVE, CCN.CODIGO, CDN.DELITO, D.FECHA_OCURRENCIA, CC.DESCRIPCION, CFC.DESCRIPCION "
                + "FROM DATOS_DELITOS_ADOJC D,CATALOGOS_CODIGO_NORMA CCN, CATALOGOS_DELITOS_NORMA CDN, CATALOGOS_CONSUMACION CC, CATALOGOS_FORMA_COMISION CFC "
                + "WHERE D.DELITO_CODIGO_PENAL = CCN.ID_CODIGO "
                + "AND D.DELITO_NORMA_TECNICA = CDN.ID_DELITO "
                + "AND D.GRADO_CONSUMACION = CC.CONSUMACION_ID "
                + "AND D.FORMA_COMISION = CFC.COMISION_ID "
                + "AND D.DELITO_CLAVE = '" + delitoClave + "' "
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

    public int countDelitosInsertados(String causaClave) {
        try {
            conn.Conectar();
            conteoDel = 0;
            sql = "SELECT COUNT(*) AS TOTAL FROM DATOS_DELITOS_ADOJC WHERE CAUSA_CLAVE = '" + causaClave + "' "
                    + "AND DELITO_CODIGO_PENAL <> -2;";
            resul = conn.consultar(sql);
            while (resul.next()) {
                conteoDel = resul.getInt("TOTAL");
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showDelitos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conteoDel;
    }

    public ArrayList findDelitosCausa(String causaClave) {
        try {
            conn.Conectar();
            deli = new ArrayList();

            sql = "SELECT D.DELITO_CLAVE, CN.CODIGO, D.DELITO_NORMA_TECNICA "
                    + "FROM DATOS_DELITOS_ADOJC D, CATALOGOS_CODIGO_NORMA CN "
                    + "WHERE D.DELITO_CODIGO_PENAL = CN.ID_CODIGO "
                    + "AND D.CAUSA_CLAVE = '" + causaClave + "';";

            resul = conn.consultar(sql);
            while (resul.next()) {
                deli.add(new String[]{
                    resul.getString("DELITO_CLAVE"), resul.getString("CODIGO"), resul.getString("DELITO_NORMA_TECNICA")
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showDelitos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return deli;
    }
    
    public ArrayList findDRobo(String causaClave, String delitoCLave, String cosaRoba) {
        try {
            conn.Conectar();
            deliAdi = new ArrayList();
            sql = "SELECT TIPO_COSA_ROBADA FROM DATOS_DROBO_ADOJC "
                    + "WHERE CAUSA_CLAVE = '" + causaClave + "' "
                    + "AND DELITO_CLAVE = '" + delitoCLave + "' "
                    + "AND TIPO_COSA_ROBADA = " + cosaRoba + ";";
            resul = conn.consultar(sql);
            while (resul.next()) {
                deliAdi.add(resul.getString("TIPO_COSA_ROBADA"));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showDelitos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return deliAdi;
    }
    
    public ArrayList findDHomicidios(String causaClave, String delitoCLave, String situacion) {
        try {
            conn.Conectar();
            deliAdi = new ArrayList();
            sql = "SELECT CONTEXTO_SITUACIONAL FROM DATOS_DHOMICIDIO_ADOJC "
                    + "WHERE CAUSA_CLAVE = '" + causaClave + "' "
                    + "AND DELITO_CLAVE = '" + delitoCLave + "' "
                    + "AND CONTEXTO_SITUACIONAL = " + situacion + ";";
            resul = conn.consultar(sql);
            while (resul.next()) {
                deliAdi.add(resul.getString("CONTEXTO_SITUACIONAL"));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(showDelitos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return deliAdi;
    }
}
