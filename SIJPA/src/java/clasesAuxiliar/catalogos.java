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
 * @author LUISA.CASTILLO
 */
public class catalogos {

    Conexion_Mysql conn = new Conexion_Mysql();
    ArrayList<String[]> lista;
    String sql;
    ResultSet resul;

    /**
     *
     * @return
     */
    public ArrayList findAcuerdoRepara() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_ACUERDO_REPARATORIO ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findAlfabetismo() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_ALFABETISMO ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findAsentamientoHumano() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_ASENTAMIENTO_HUMANO ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findAutoVinculacion() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_AUTO_VINCULACION ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findCalificacionDelito() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_CALIFICACION_DELITO ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findCausaSuspencion() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_CAUSA_SUSPENCION ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findClasificacion() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_CLASIFICACION ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findCodigoNorma() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_CODIGO_NORMA WHERE ID_CODIGO <>-2 ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{
                    resul.getString(1), resul.getString(2), resul.getString(3)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findConcurso() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_CONCURSO ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findCondicionActividad() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_CONDICION_ACTIVIDAD ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findCondicionEstudiante() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_CONDICION_ESTUDIANTE ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findConsumacion() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_CONSUMACION ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findContextoSituacional() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_CONTEXTO_SITUACIONAL where CONTEXTO_ID <> -2 ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findCosaRobada() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_COSA_ROBADA WHERE COSA_ID <> -2 ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findDelitosNorma(int norma) {
        conn.Conectar();
        lista = new ArrayList();
        sql = "SELECT * FROM CATALOGOS_DELITOS_NORMA WHERE ID_DELITO = " + norma + " ORDER BY 1";
        System.out.println(sql);
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{
                    resul.getString(1), resul.getString(3)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findDominioEspanol() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_DOMINIO_ESPANOL ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findEntidades() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_ENTIDADES ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findEstadoCivil() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_ESTADO_CIVIL ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findEstadoPsicofisico() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_ESTADO_PSICOFISICO ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findEstudioProfesional() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_ESTUDIO_PROFESIONAL ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findEtapaInicial() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_ETAPA_INICIAL ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findEtapaIntermedia() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_ETAPA_INTERMEDIA ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findEtapaProcesal() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_ETAPA_PROCESAL ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findExclusionAccionp() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_EXCLUSION_ACCIONP ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findFiguraMprueba() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_FIGURA_MPRUEBA ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findFiguraProceso() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_FIGURA_PROCESO ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findFormaAccion() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_FORMA_ACCION ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findFormaComision() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_FORMA_COMISION ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findFormaConduccion() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_FORMA_CONDUCCION ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findFormaDivision() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_FORMA_DIVISION ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findFuenteIngresos() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_FUENTE_INGRESOS ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{
                    resul.getString(1), resul.getString(2)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findFuero() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_FUERO ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findFuncionJuzgado() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_FUNCION_JUZGADO ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findGradoEstudios() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_GRADO_ESTUDIOS ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findGradoParticipacion() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_GRADO_PARTICIPACION ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findIncompetencia() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_INCOMPETENCIA ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findInstrumentoComision() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_INSTRUMENTO_COMISION ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findJurisdiccion() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_JURISDICCION ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findLinguisticas() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_LINGUISTICAS ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findMedidasCautelares() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_MEDIDAS_CAUTELARES WHERE CAUTELARES_ID <> -2  ORDER BY 1;";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
    
    public ArrayList findMedidasDuracion() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_MEDIDAS_DURACION ORDER BY 1;";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findMedidasMujer() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_MEDIDAS_MUJER WHERE MUJER_ID <>-2 ORDER BY 1;";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findMedidasProteccion() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_MEDIDAS_PROTECCION WHERE PROTECCION_ID <> -2 ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
    
    public ArrayList findMedidasSolicita() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_MEDIDAS_SOLICITA WHERE MEDIDA_SOLICITA_ID NOT IN(-2) ORDER BY 1;";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public ArrayList findMediosPrueba() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_MEDIOS_PRUEBA WHERE PRUEBA_ID <> -2 ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findModalidad() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_MODALIDAD ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findMulta() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_MULTA ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findMunicipios(int enti) {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_MUNICIPIOS WHERE ENTIDAD_ID = " + enti + " ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{
                    resul.getString(2), resul.getString(3)
                });
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findNacionalidad() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_NACIONALIDAD ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findNoprivativas() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_NOPRIVATIVAS ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findNumero() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_NUMERO ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findOcupacion() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_OCUPACION ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findPais() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_PAIS ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findPlazoCierre() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_PLAZO_CIERRE ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findPlazoConstitucional() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_PLAZO_CONSTITUCIONAL ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findPrivativas() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_PRIVATIVAS ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findProcAbreviado() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_PROC_ABREVIADO ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findPuebloIndigena() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_PUEBLO_INDIGENA ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findRangoIngresos() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_RANGO_INGRESOS ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findReincidencia() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_REINCIDENCIA ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findRelacionImputado() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_RELACION_IMPUTADO WHERE RELACION_ID <> -2 ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findReparacionDano() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_REPARACION_DANO ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findRepresentanteLegal() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_REPRESENTANTE_LEGAL ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findResolucionMprueba() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_RESOLUCION_MPRUEBA ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findRespuestaSimple() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_RESPUESTA_SIMPLE ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findSexo() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_SEXO ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findSitioOcurrencia() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_SITIO_OCURRENCIA ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findSobreseimiento() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_SOBRESEIMIENTO ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findSuspensionCondicional() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_SUSPENSION_CONDICIONAL ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findTiempoInternamiento() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_TIEMPO_INTERNAMIENTO ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findTipoAudiencias() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_TIPO_AUDIENCIAS ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findTipoConsignacion() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_TIPO_CONSIGNACION ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findTipoDefensor() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_TIPO_DEFENSOR ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findTipoDetencion() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_TIPO_DETENCION ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findTipoImpugnacion() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_TIPO_IMPUGNACION ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findTipoResolucion() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_TIPO_RESOLUCION ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findTipoSobreseimiento() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_TIPO_SOBRESEIMIENTO ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findTipoVictima() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_TIPO_VICTIMA ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findVialidad() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_VIALIDAD ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findVictimaMoral() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_VICTIMA_MORAL ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public ArrayList findVulnerabilidad() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM CATALOGOS_VULNERABILIDAD ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }
    public ArrayList findAudienciasInvestigacion() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_audiencias_investigacion where audiencia_id <> -2 ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }
    
    public ArrayList findAudienciasIntermedia() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_audiencias_intermedia where audiencia_id <> -2 ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }
    public ArrayList findAudienciasJuicioOral() {
        conn.Conectar();
        lista = new ArrayList();
        sql = " SELECT * FROM catalogos_audiencias_juiciooral ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }
    
    //********************************* E X C L U S I V O S   J O  ***********************
    
    public ArrayList findTipoResolucionJO() {
        conn.Conectar();
        lista = new ArrayList();
        sql = "SELECT * FROM catalogos_tipo_resolucionjo ORDER BY 1";
        resul = conn.consultar(sql);
        try {
            while (resul.next()) {
                lista.add(new String[]{resul.getString(1), resul.getString(2)});
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(catalogos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

}