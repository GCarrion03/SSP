/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package SSP_CAPAS;
import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import com.sun.rowset.CachedRowSetImpl;
import java.io.File;
/**
 *
 * @author Guz
 */
public class GMPresentacion {
        String is_pant;
        HttpServletRequest ir_request=null;
        String ls_pant="";
        public CachedRowSetImpl registrosbasedocp;
        public String G_busqueda="";
        private String usrlogged ="";
        private String nombre_usr,nombre_menu;
        public String dia;
        public String mes;
        public String anio;
    public GMPresentacion()
    {

        java.util.Calendar fecha = java.util.Calendar.getInstance();
        dia=("0"+Integer.toString(fecha.get(java.util.Calendar.DATE)));
        mes=("0"+Integer.toString(fecha.get(java.util.Calendar.MONTH)+ 1));
        anio=Integer.toString(fecha.get(java.util.Calendar.YEAR));
        dia=dia.substring(dia.length()-2, dia.length());
        mes=mes.substring(mes.length()-2, mes.length());
    }
    public String getNombre_menu() {
        return nombre_menu;
    }

    public String getNombre_usr() {
        return nombre_usr;
    }
public void setir_request(HttpServletRequest ar_request)
    {
        ir_request=ar_request;
    }
    public String EJECUTARSPDEVSTR(String SPROC,String param1,String param2) throws SQLException, NamingException
    {
        String return_usr="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{ call DBO."+SPROC+"('"+param1+"','"+param2+"')}");
        DBconten.beforeFirst();
        while (DBconten.next())
        {
            return_usr=DBconten.getString(1);
        }
        if (return_usr.compareTo("")==0)
        {
            return ("0");
        }else
            return (return_usr);
    }
    public String EJECUTARSPDEVSTR(String SPROC,String param1) throws SQLException, NamingException
    {
        String return_usr="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{ call DBO."+SPROC+"('"+param1+"')}");
        DBconten.beforeFirst();
        while (DBconten.next())
        {
            return_usr=DBconten.getString(1);
        }
        if (return_usr.compareTo("")==0)
        {
            return ("0");
        }else
            return (return_usr);
    }
    public void SETUSRMEN(String SPROC,String param1,String param2) throws SQLException, NamingException
    {
        String return_usr="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{ call DBO."+SPROC+"('"+param1+"','"+param2+"')}");
        DBconten.beforeFirst();
        while (DBconten.next())
        {
            nombre_usr=DBconten.getString(1);
            nombre_menu=DBconten.getString(2);
        }
    }
     public void SETUSRMEN(String SPROC,String param1) throws SQLException, NamingException
    {
        String return_usr="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{ call DBO."+SPROC+"('"+param1+"')}");
        DBconten.beforeFirst();
        while (DBconten.next())
        {
            nombre_usr=DBconten.getString(1);
            nombre_menu=DBconten.getString(2);
        }
    }
    public void OBTENERREGISTROSPRBL(String SPROC,String param1) throws SQLException, NamingException
    {
        registrosbasedocp=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        registrosbasedocp=pers1.recuperar_rowsetSP("{ call DBO."+SPROC+"('"+param1+"')}");
        registrosbasedocp.first();
    }
    public String devolfch ()
    {
        java.util.Calendar fecha = java.util.Calendar.getInstance();
        String dia=("0"+Integer.toString(fecha.get(java.util.Calendar.DATE)));
        String mes=("0"+Integer.toString(fecha.get(java.util.Calendar.MONTH)+ 1));
        String anio=Integer.toString(fecha.get(java.util.Calendar.YEAR));
        dia=dia.substring(dia.length()-2, dia.length());
        mes=mes.substring(mes.length()-2, mes.length());
        return("<input type=\"text\" name=\"f_apertura\" id=\"f_apertura\" style=\"width:100%;z-index:5\" value=\""+dia+ "/" +mes+ "/" +anio+" "+fecha.get(java.util.Calendar.HOUR_OF_DAY) + ":"+ fecha.get(java.util.Calendar.MINUTE) + ":"+ fecha.get(java.util.Calendar.SECOND) +"\" READONLY>");
    }
    public String Strfechahoy ()
    {
        return(dia + "/" + mes + "/" + anio);
    }
    public String getmes()
    {
        return(mes);
    }
    public String getdia()
    {
        return(dia);
    }
    public String getanio()
    {
        return(anio);
    }
    public String devuelve_commakey (String Storedproc)throws SQLException, NamingException
    {
        String return_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{ call DBO."+Storedproc+"}");
        DBconten.beforeFirst();
        while (DBconten.next())
        {
            return_pant+=DBconten.getString(1);
            if(!DBconten.isLast())
                return_pant+=",";
        }
        return (return_pant);
    }
    public String devuelve_dept ()throws SQLException, NamingException
    {
        String return_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{ call DBO.DEVUELVEPTOAP()}");
        DBconten.beforeFirst();
        while (DBconten.next())
        {
            return_pant+="<option value=\""+DBconten.getString(1)+"\">"+DBconten.getString(2)+"</option>";
        }
        return (return_pant);
    }
    public String devuelve_corresponsales ()throws SQLException, NamingException
    {
        String return_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{ call DBO.DEVUELVE_CORRESPONSALES()}");
        DBconten.beforeFirst();
        while (DBconten.next())
        {
            return_pant+="<option value=\""+DBconten.getString(1)+"\">"+DBconten.getString(2)+"</option>";
        }
        return (return_pant);
    }
    public String OBT_COMBOSELECCIONADOSVD (String sproc,String dependencia,String id_item)throws SQLException, NamingException //Devuelve una lista consumiendo un SP con 2 parametros
    {
        String return_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{call DBO."+sproc+"('"+dependencia+"','"+id_item+"')}");
        DBconten.beforeFirst();
        while (DBconten.next())
        {
            return_pant+="<option value=\""+DBconten.getString(1)+"\">"+DBconten.getString(2)+"</option>";
        }
        return (return_pant);
    }
    public String EXISTEN_DOCS (String sproc)throws SQLException, NamingException //Devuelve una lista consumiendo un SP con 2 parametros
    {
        String return_pant="";String exist="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{call DBO."+sproc+"()}");
        DBconten.beforeFirst();
        return_pant="<table border=\"2\">";
        return_pant+="<tr><td colspan=\"5\">LISTA DE DOCUMENTOS NO DIGITALIZADOS</td></tr>";
        return_pant+="<tr><td>Código problema</td><td>Criticidad</td><td>Fecha Apertura</td><td>Fecha Cierre</td><td>Estatus</td></tr>";
        while (DBconten.next())
        {
            String sFichero = "C:/DIGITALIZADOS/"+DBconten.getString(1)+".pdf";
                 //String sFichero = "C:/"+beancslt.G_busqueda+".TIF";
                 //String sFichero = "C:/"+beancslt.G_busqueda+".pdf";
                 File fichero = new File(sFichero);
                 if (!fichero.exists())
                 {
                     return_pant+="<tr><td>"+DBconten.getString(1)+"</td><td>"+DBconten.getString(2)+"</td><td>"+DBconten.getString(3)+"</td><td>"+DBconten.getString(4)+"</td><td>"+DBconten.getString(5)+"</td></tr>";
            }   
        }
        return_pant+="</table>";
        return (return_pant);
    }
    public String EXISTEN_ELECS (String sproc)throws SQLException, NamingException //Devuelve una lista consumiendo un SP con 2 parametros
    {
        File fichero=new File("C:/DIGITALIZADOS/");
        String[] listaArchivos=fichero.list();

        String return_pant="";String exist="";
        int band;
        return_pant="<table border=\"1\">";
        return_pant+="<tr><td>LISTA DE DOCUMENTOS CON NOMBRE INCORRECTO</td></tr>";
        return_pant+="<tr><td>Nombre Documento</td></tr>";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{call DBO."+sproc+"()}");
        for(int i=0; i<listaArchivos.length; i++){
            band=0;
            DBconten.beforeFirst();
            while (DBconten.next()){
                if (listaArchivos[i].compareTo((DBconten.getString(1)+".pdf"))==0)
                   band=1;
            }
            if (band==0)
                return_pant+="<tr><td>"+listaArchivos[i]+"</td></tr>";
        }
        return_pant+="</table>";
        return (return_pant);
    }
    public String OBT_COMBOSELECCIONADOSVD (String sproc,String dependencia,String dependencia2,String id_item)throws SQLException, NamingException //Devuelve una lista consumiendo un SP con 2 parametros
    {
        String return_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{call DBO."+sproc+"('"+dependencia+"','"+dependencia2+"','"+id_item+"')}");
        DBconten.beforeFirst();
        while (DBconten.next())
        {
            return_pant+="<option value=\""+DBconten.getString(1)+"\">"+DBconten.getString(2)+"</option>";
        }
        return (return_pant);
    }
    public String OBT_COMBOSELECCIONADOSVD (String sproc,String dependencia,String dependencia2,String dependencia3,String id_item)throws SQLException, NamingException //Devuelve una lista consumiendo un SP con 2 parametros
    {
        String return_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{call DBO."+sproc+"('"+dependencia+"','"+dependencia2+"','"+dependencia3+"','"+id_item+"')}");
        DBconten.beforeFirst();
        while (DBconten.next())
        {
            return_pant+="<option value=\""+DBconten.getString(1)+"\">"+DBconten.getString(2)+"</option>";
        }
        return (return_pant);
    }
    public String OBT_COMBOSELECCIONADOSVD (String sproc,String dependencia,String dependencia2,String dependencia3,String dependencia4,String id_item)throws SQLException, NamingException //Devuelve una lista consumiendo un SP con 2 parametros
    {
        String return_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{call DBO."+sproc+"('"+dependencia+"','"+dependencia2+"','"+dependencia3+"','"+dependencia4+"','"+id_item+"')}");
        DBconten.beforeFirst();
        while (DBconten.next())
        {
            return_pant+="<option value=\""+DBconten.getString(1)+"\">"+DBconten.getString(2)+"</option>";
        }
        return (return_pant);
    }
    public boolean ActualizarAma (String coddoc,String estatus,String id_estar,String idprs_r,String f_cierre) throws NamingException
    {
        GMPersistencia pers1=new GMPersistencia();
        return(pers1.recuperar_ejecutarSP("{call DBO.ACTUALIZAR_YC('"+coddoc+"','5',N'"+estatus+"','"+id_estar+"','"+idprs_r+"','"+f_cierre+"')}"));
    }
    public boolean ActualizarFMEA (String coddoc,String estatus,String FP2,String FSEG,String FC,String HE_DOCS,String rpnini,String rpnfin,String n_casos,String facilitador) throws NamingException
    {
        GMPersistencia pers1=new GMPersistencia();
        return(pers1.recuperar_ejecutarSP("{call DBO.ACTUALIZAR_FMEA('"+coddoc+"','4',N'"+estatus+"','"+FP2+"','"+FSEG+"','"+FC+"','"+HE_DOCS+"','"+rpnini+"','"+rpnfin+"','"+n_casos+"','"+facilitador+"')}"));
    }
    public String MostrarT_ama (String coddoc) throws SQLException, NamingException
    {
        CachedRowSetImpl DBconten,DBconten1=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{call DBO.CONSULTA_AMARILLA('"+coddoc+"')}");
        DBconten.first();
        String return_pant="";
        return_pant="<table width=\"100%\">";
        return_pant+="<tr>";
        return_pant+="<td>";
        return_pant+="<fieldset class=\"fieldset\">";
        return_pant+="<legend>Tarjeta amarilla:</legend>";
        return_pant+="<table width=\"100%\">";
        return_pant+="<tr>";
        return_pant+="<td width=\"5%\">";
        return_pant+="<select style=\"height:50px;background-color:#CCCCCC;font-size:38px;\"  id=\"cmb_stsam\" name=\"cmb_stsam\" onChange=\"cambiosegama()\" disabled>";
        return_pant+="<option selected style=\"color:"+DBconten.getString(2)+"\" value=\""+DBconten.getString(1)+"\">"+DBconten.getString(1)+"</option>";
        return_pant+=OBT_COLCOMBOSTS("MOSTRAR_STS_TDOCS","2",DBconten.getString(1));
        return_pant+="</select>";
        return_pant+="</td>";
        return_pant+="<td width=\"20%\">";
        return_pant+="<fieldset class=\"fieldset\">";
        return_pant+="<legend>EV responsable:</legend>";
        return_pant+="<select name=\"cmb_responsable\" id=\"cmb_responsable\" style=\"width:100%\" disabled>";
        return_pant+="<option selected value=\""+DBconten.getString(3)+"\">"+DBconten.getString(4)+"</option>";
        return_pant+=OBT_COMBO("DEVUELVEPTOAP_MODIF",DBconten.getString(3));
        return_pant+="</select>";
        return_pant+="</fieldset>";
        return_pant+="</td>";
        return_pant+="<td width=\"20%\">";
        return_pant+="<fieldset class=\"fieldset\">";
        return_pant+="<legend>LET:</legend>";
        return_pant+="<select name=\"cmb_prsresp\" id=\"cmb_prsresp\" style=\"width:100%\" disabled>";
        return_pant+="<option selected value=\""+DBconten.getString(5)+"\">"+DBconten.getString(6)+"</option>";
        return_pant+=OBT_COMBO("DEVUELVE_CORRESPONSALES_MODIF",DBconten.getString(5));
        return_pant+="</select>";
        return_pant+="</fieldset>";
        return_pant+="</td>";
        return_pant+="<td width=\"10%\">";
        return_pant+="<fieldset class=\"fieldset\">";
        return_pant+="<legend>Fecha Cierre:</legend>";
        return_pant+="<input type=\"text\" name=\"txt_fechaama\" id=\"txt_fechaama\" value=\""+DBconten.getString(7)+"\" disabled><a href=\"javascript:NewCal('txt_fechaama','ddmmyyyy',true,24)\" id=\"calendariodefama\" style=\"visibility:hidden\"><img src=\"images/cal.gif\" width=\"16\" height=\"16\" border=\"0\" alt=\"Seleccione una fecha\">";
        return_pant+="</fieldset>";
        return_pant+="</td>";
        return_pant+="<td width=\"10%\">";
        return_pant+="<input type=\"button\" id=\"btn_dsblqama\" value=\"Desbloquear amarilla\" style=\"BORDER: rgb(128,128,128) 2px outset;width:100%; FONT-SIZE: 8pt; FONT-FAMILY: Verdana; BACKGROUND-COLOR: #CCCCCC\" onClick=\"JavaScript:habilitarama()\">";
        return_pant+="<input type=\"submit\" name=\"btn_Guardarama\" id=\"btn_Guardarama\" value=\"Guardar Amarilla\" style=\"BORDER: rgb(128,128,128) 2px outset;width:100%; FONT-SIZE: 8pt; FONT-FAMILY: Verdana; BACKGROUND-COLOR: #CCCCCC\">";
        return_pant+="</td>";
        return_pant+="</tr>";
        return_pant+="</table>";
        return_pant+="</fieldset>";
        return_pant+="</td>";
        return_pant+="</tr>";
        return_pant+="</table>";
        return (return_pant);
    }
    public String MostrarFMEAS (String coddoc) throws SQLException, NamingException
    {
        CachedRowSetImpl DBconten,DBconten1=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{call DBO.CONSULTA_FMEAS('"+coddoc+"')}");
        DBconten.first();
        String return_pant="";
        return_pant="<table width=\"100%\">";
        return_pant+="<tr>";
        return_pant+="<td>";
        return_pant+="<fieldset class=\"fieldset\">";
        return_pant+="<legend>PFMEA:</legend>";
        return_pant+="<table width=\"100%\">";
        return_pant+="<tr>";
        return_pant+="<td>";
        return_pant+="</td>";
        return_pant+="</tr>";
        return_pant+="<tr>";
        return_pant+="<td>";
        return_pant+="<table width=\"100%\">";
        return_pant+="<tr>";
        return_pant+="<td align=\"center\">";
        return_pant+="<select style=\"height:50px;background-color:#CCCCCC;font-size:38px;\"  id=\"cmb_stsFM\" name=\"cmb_stsFM\" onChange=\"cambiosegFM()\" disabled>";
        return_pant+="<option selected style=\"color:"+DBconten.getString(2)+"\" value=\""+DBconten.getString(1)+"\">"+DBconten.getString(1)+"</option>";
        return_pant+=OBT_COLCOMBOSTS("MOSTRAR_STS_TDOCS","4",DBconten.getString(1));
        return_pant+="</select>";
        return_pant+="</td>";
        return_pant+="<td colspan=\"3\" align=\"center\">";
        return_pant+="<fieldset class=\"fieldset\">";
        return_pant+="<legend>Información del problema:</legend>";
        return_pant+="<table width=\"100%\">";
        return_pant+="<tr>";
        return_pant+="<td>";
        return_pant+="Número de casos:";
        return_pant+="</td>";
        return_pant+="<td>";
        return_pant+="<input type=\"text\" name=\"txt_ncasos\" id=\"txt_ncasos\" value=\""+DBconten.getString(7)+"\" disabled>";
        return_pant+="</td>";
        return_pant+="</tr>";
        return_pant+="<tr>";
        return_pant+="<td>";
        return_pant+="Facilitador:";
        return_pant+="</td>";
        return_pant+="<td>";
        return_pant+="<input type=\"text\" name=\"txt_facilitador\" id=\"txt_facilitador\" value=\""+DBconten.getString(10)+"\" disabled>";
        return_pant+="</td>";
        return_pant+="</tr>";
        return_pant+="</table>";
        return_pant+="</fieldset>";
        return_pant+="</td>";
        return_pant+="</tr>";
        return_pant+="<tr>";
        return_pant+="<td width=\"10%\">";
        return_pant+="<fieldset class=\"fieldset\">";
        return_pant+="<legend>Elaboración del FMEA:</legend>";
        return_pant+="<table width=\"100%\">";
        return_pant+="<tr>";
        return_pant+="<td>";
        return_pant+="<fieldset class=\"fieldset\">";
        return_pant+="<legend>Fecha de Elaboración del FMEA:</legend>";
        return_pant+="<input type=\"text\" name=\"txt_fp2FMEAS\" id=\"txt_fp2FMEAS\" value=\""+DBconten.getString(3)+"\" disabled><a href=\"javascript:NewCal('txt_fp2FMEAS','ddmmyyyy',true,24)\" id=\"calendariofp2FMEAS\" style=\"visibility:hidden\"><img src=\"images/cal.gif\" width=\"16\" height=\"16\" border=\"0\" alt=\"Seleccione una fecha\">";
        return_pant+="</fieldset>";
        return_pant+="</td>";
        return_pant+="</tr>";
        return_pant+="<tr>";
        return_pant+="<td>";
        return_pant+="<fieldset class=\"fieldset\">";
        return_pant+="<legend>RPN Inicial:</legend>";
        return_pant+="<input type=\"text\" name=\"txt_rpni\" id=\"txt_rpni\" value=\""+DBconten.getString(8)+"\" disabled>";
        return_pant+="</fieldset>";
        return_pant+="</td>";
        return_pant+="</tr>";
        return_pant+="</table>";
        return_pant+="</fieldset>";
        return_pant+="</td>";
        return_pant+="<td width=\"10%\">";
        return_pant+="<fieldset class=\"fieldset\">";
        return_pant+="<legend>Seguimiento:</legend>";
        return_pant+="<table width=\"100%\">";
        return_pant+="<tr>";
        return_pant+="<td>";
        return_pant+="<fieldset class=\"fieldset\">";
        return_pant+="<legend>F. Inicio Seguimiento:</legend>";
        return_pant+="<input type=\"text\" name=\"txt_fsegFMEAS\" id=\"txt_fsegFMEAS\" value=\""+DBconten.getString(4)+"\" disabled><a href=\"javascript:NewCal('txt_fsegFMEAS','ddmmyyyy',true,24)\" id=\"calendariofsegFMEAS\" style=\"visibility:hidden\"><img src=\"images/cal.gif\" width=\"16\" height=\"16\" border=\"0\" alt=\"Seleccione una fecha\">";
        return_pant+="</fieldset>";
        return_pant+="</td>";
        return_pant+="</tr>";
        return_pant+="<tr>";
        return_pant+="<td>";
        return_pant+="<fieldset class=\"fieldset\">";
        return_pant+="<legend>RPN Final:</legend>";
        return_pant+="<input type=\"text\" name=\"txt_rpnf\" id=\"txt_rpnf\" value=\""+DBconten.getString(9)+"\" disabled>";
        return_pant+="</fieldset>";
        return_pant+="</td>";
        return_pant+="</tr>";
        return_pant+="</table>";
        return_pant+="</fieldset>";
        return_pant+="</td>";
        return_pant+="<td width=\"10%\">";
        return_pant+="<fieldset class=\"fieldset\">";
        return_pant+="<legend>Cierre:</legend>";
        return_pant+="<table width=\"100%\"><tr><td>";
        return_pant+="<fieldset class=\"fieldset\">";
        return_pant+="<legend>Fecha Cierre:</legend>";
        return_pant+="<input type=\"text\" name=\"txt_fCFMEAS\" id=\"txt_fCFMEAS\" value=\""+DBconten.getString(5)+"\" disabled><a href=\"javascript:NewCal('txt_fCFMEAS','ddmmyyyy',true,24)\" id=\"calendariofCFMEAS\" style=\"visibility:hidden\"><img src=\"images/cal.gif\" width=\"16\" height=\"16\" border=\"0\" alt=\"Seleccione una fecha\">";
        return_pant+="</fieldset>";
        return_pant+="</td>";
        return_pant+="</tr>";
        return_pant+="<tr>";
        return_pant+="<td>";
        return_pant+="<fieldset class=\"fieldset\">";
        return_pant+="<legend>N° Hoja de elementos:</legend>";
        return_pant+="<input type=\"text\" name=\"txt_HElementos\" id=\"txt_HElementos\" value=\""+DBconten.getString(6)+"\" disabled>";
        return_pant+="</fieldset>";
        return_pant+="</td></tr></table>";
        return_pant+="<td width=\"10%\">";
        return_pant+="<input type=\"button\" id=\"btn_dsblqFM\" value=\"Desbloquear PFMEA\" style=\"BORDER: rgb(128,128,128) 2px outset;width:100%; FONT-SIZE: 8pt; FONT-FAMILY: Verdana; BACKGROUND-COLOR: #CCCCCC\" onClick=\"JavaScript:habilitarFMEAS()\">";
        return_pant+="<input type=\"submit\" name=\"btn_GuardarFM\" id=\"btn_GuardarFM\" value=\"Guardar PFMEA\" style=\"BORDER: rgb(128,128,128) 2px outset;width:100%; FONT-SIZE: 8pt; FONT-FAMILY: Verdana; BACKGROUND-COLOR: #CCCCCC\">";
        return_pant+="</td>";
        return_pant+="</tr>";
        return_pant+="</table>";
        return_pant+="</td>";
        return_pant+="</tr>";
        return_pant+="</table>";
        return_pant+="</fieldset>";
        return_pant+="</td>";
        return_pant+="</tr>";
        return_pant+="</table>";
        return (return_pant);
    }
    public String OBT_COLCOMBOSTS (String sproc,String CD1,String dependencia)throws SQLException, NamingException //Devuelve una lista consumiendo un SP con 2 parametros
    {
        String return_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{call DBO."+sproc+"('"+CD1+"',N'"+dependencia+"')}");
        DBconten.beforeFirst();
        while (DBconten.next())
        {
            return_pant+="<option style=\"color:"+DBconten.getString(2)+"\" value=\""+DBconten.getString(1)+"\">"+DBconten.getString(1)+"</option>";
        }
        return (return_pant);
    }
    public String OBT_COLCOMBO (String sproc,String dependencia)throws SQLException, NamingException //Devuelve una lista consumiendo un SP con 2 parametros
    {
        String return_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{call DBO."+sproc+"(N'"+dependencia+"')}");
        DBconten.beforeFirst();
        while (DBconten.next())
        {
            return_pant+="<option style=\"color:"+DBconten.getString(2)+"\" value=\""+DBconten.getString(1)+"\">"+DBconten.getString(1)+"</option>";
        }
        return (return_pant);
    }
    public String OBT_COMBO (String sproc,String dependencia)throws SQLException, NamingException //transforma un sp con 2 datos a combobox
    {
        String return_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{call DBO."+sproc+"('"+dependencia+"')}");
        DBconten.beforeFirst();
        while (DBconten.next())
        {
            return_pant+="<option value=\""+DBconten.getString(1)+"\">"+DBconten.getString(2)+"</option>";
        }
        return (return_pant);
    }
    public String OBT_COMBO_SIMPLE (String sproc)throws SQLException, NamingException //transforma un sp con 2 datos a combobox
    {
        String return_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{call DBO."+sproc+"()}");
        DBconten.beforeFirst();
        while (DBconten.next())
        {
            return_pant+="<option value=\""+DBconten.getString(1)+"\">"+DBconten.getString(2)+"</option>";
        }
        return (return_pant);
    }
    public String devdoc ()throws SQLException, NamingException
    {
        String return_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{ call DBO.DEVUELVE_TDOC('P')}");
        DBconten.beforeFirst();
        while (DBconten.next())
        {
            return_pant+="<option value=\""+DBconten.getString("ID_TDOC")+"\">"+DBconten.getString("DESCRIPCION")+"</option>";
        }
        return (return_pant);
    }
    public String catBPD ()throws SQLException, NamingException
    {
        String return_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{call DBO.MOSTRAR_BPD()}");
        DBconten.beforeFirst();
        while (DBconten.next())
        {
            return_pant+="<option value=\""+DBconten.getString("ID_DPN")+"\">"+DBconten.getString("DESCRIPCION")+"</option>";
        }
        return (return_pant);
    }
    public String obtplataforma ()throws SQLException, NamingException
    {
        String return_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{call DBO.MOSTRAR_PLATAFORMA()}");
        DBconten.beforeFirst();
        while (DBconten.next())
        {
            return_pant+="<option value=\""+DBconten.getString("ID_PLAT")+"\">"+DBconten.getString("NOMBRE")+"</option>";
        }
        return (return_pant);
    }
    public String obtturno ()throws SQLException, NamingException
    {
        String return_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{call DBO.MOSTRAR_TURNO()}");
        DBconten.beforeFirst();
        while (DBconten.next())
        {
            return_pant+="<option value=\""+DBconten.getString("NOMBRE_TURNO")+"\">"+DBconten.getString("DESCRIPCION")+"</option>";
        }
        return (return_pant);
    }
    public String obtescalonamiento ()throws SQLException, NamingException
    {
        String return_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{call DBO.MOSTRAR_ESCALONAMIENTO()}");
        DBconten.beforeFirst();
        while (DBconten.next())
        {
            return_pant+="<option value=\""+DBconten.getString("ID_ESCAL")+"\">"+DBconten.getString("TIPO")+"</option>";
        }
        return (return_pant);
    }
    public String obtponderacion ()throws SQLException, NamingException
    {
        String return_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{call DBO.OBTENER_CRITICIDAD()}");
        DBconten.beforeFirst();
        while (DBconten.next())
        {
            return_pant+="<option value=\""+DBconten.getString("ID_POND")+"\">"+DBconten.getString("PUNTOS")+"</option>";
        }
        return (return_pant);
    }
    public String devpapertura() throws SQLException, NamingException
    {
        String return_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{call DBO.DEVUELVEEV()}");
        DBconten.beforeFirst();
        while (DBconten.next())
        {
            return_pant+="<option value=\""+DBconten.getString(1)+"\">"+DBconten.getString(2)+"</option>";
        }
        return (return_pant);
    }
    public String devuelvptoa() throws SQLException, NamingException
    {
        String return_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowset("select ID_AREA, NOMBRE from dbo.AREA_RESPONSABLE");
        DBconten.beforeFirst();
        while (DBconten.next())
        {
            return_pant+="<option value=\""+DBconten.getString("ID_AREA")+"\">"+DBconten.getString("NOMBRE")+"</option>";
        }
            return (return_pant);
    }
    public String AJX_LG(String dpto_seleccion, String cmb_act,String SProc) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{ call DBO."+SProc+"('"+dpto_seleccion+"')}");
        DBconten.beforeFirst();
        ls_pant="<select name='"+cmb_act+"'id='"+cmb_act+"' style=\"width:100%\" onChange=\"javascript:ejecutarprs()\">";
        ls_pant+="<option value=0>Seleccione</option>";
        while (DBconten.next())
        {
            ls_pant+="<option value='"+DBconten.getString(1)+"'>"+DBconten.getString(2)+"</option>";
        }
        ls_pant+="</select>";
        return(ls_pant);
    }
     public String AJX_ET(String dpto_seleccion, String cmb_act,String SProc,String CRTLdsbl) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{ call DBO."+SProc+"('"+dpto_seleccion+"')}");
        DBconten.beforeFirst();
        ls_pant="<select name='"+cmb_act+"'id='"+cmb_act+"' style=\"width:100%\" onChange=\"unlock('"+CRTLdsbl+"')\">";
        ls_pant+="<option selected value=0>Seleccione</option>";
        while (DBconten.next())
        {
            ls_pant+="<option value='"+DBconten.getString(1)+"'>"+DBconten.getString(2)+"</option>";
        }
        ls_pant+="</select>";
        return(ls_pant);
    }
     public String AJX_ET(String dpto_seleccion,String cmb_dep2, String cmb_act,String SProc,String div, String cmbusd,String SPROCH) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{ call DBO."+SProc+"('"+dpto_seleccion+"','"+cmb_dep2+"')}");
        DBconten.beforeFirst();
        ls_pant="<select name='"+cmb_act+"'id='"+cmb_act+"' style=\"width:100%\">";
        ls_pant+="<option value=0>Seleccione</option>";
        while (DBconten.next())
        {
            ls_pant+="<option value='"+DBconten.getString(1)+"'>"+DBconten.getString(2)+"</option>";
        }
        ls_pant+="</select>";
        return(ls_pant);
    }
    public String AJX_ETMNT(String dpto_seleccion,String cmb_dep2, String cmb_act,String SProc,String div, String cmbusd,String SPROCH) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{ call DBO."+SProc+"('"+dpto_seleccion+"','"+cmb_dep2+"')}");
        DBconten.beforeFirst();
        ls_pant="<select name='"+cmb_act+"'id='"+cmb_act+"' size=\"20\" style=\"width:100%\">";
        ls_pant+="<option value=0>Seleccione</option>";
        while (DBconten.next())
        {
            ls_pant+="<option value='"+DBconten.getString(1)+"'>"+DBconten.getString(2)+"</option>";
        }
        ls_pant+="</select>";
        return(ls_pant);
    }
    public String AJX_PR(String dpto_seleccion,String sel2, String cmb_act,String SProc,String tamano) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{ call DBO."+SProc+"('"+dpto_seleccion+"','"+sel2+"')}");
        DBconten.beforeFirst();
        ls_pant="<select name='"+cmb_act+"'id='"+cmb_act+"' size=\""+tamano+"\" style=\"width:100%\" onChange=\"javascript:unlock('cmb_corresp')\">";
        ls_pant+="<option value=0>Seleccione</option>";
        while (DBconten.next())
        {
            ls_pant+="<option value='"+DBconten.getString(1)+"'>"+DBconten.getString(2)+"</option>";
        }
        ls_pant+="</select>";
        return(ls_pant);
    }
    public String AJX_PR(String dpto_seleccion, String cmb_act,String SProc,String tamano) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{ call DBO."+SProc+"('"+dpto_seleccion+"')}");
        DBconten.beforeFirst();
        ls_pant="<select name='"+cmb_act+"'id='"+cmb_act+"' size=\""+tamano+"\" style=\"width:100%\" onChange=\"javascript:unlock('cmb_corresp')\">";
        ls_pant+="<option value=0>Seleccione</option>";
        while (DBconten.next())
        {
            ls_pant+="<option value='"+DBconten.getString(1)+"'>"+DBconten.getString(2)+"</option>";
        }
        ls_pant+="</select>";
        return(ls_pant);
    }
    public String AJX_PRMNT(String dpto_seleccion,String sel2, String cmb_act,String SProc,String tamano) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{ call DBO."+SProc+"('"+dpto_seleccion+"','"+sel2+"')}");
        DBconten.beforeFirst();
        ls_pant="<select name='"+cmb_act+"'id='"+cmb_act+"' size=\""+tamano+"\" style=\"width:100%\">";
        ls_pant+="<option value=0>Seleccione</option>";
        while (DBconten.next())
        {
            ls_pant+="<option value='"+DBconten.getString(1)+"'>"+DBconten.getString(2)+"</option>";
        }
        ls_pant+="</select>";
        return(ls_pant);
    }
    public String AJX_PRMNT(String dpto_seleccion, String cmb_act,String SProc,String tamano) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{ call DBO."+SProc+"('"+dpto_seleccion+"')}");
        DBconten.beforeFirst();
        ls_pant="<select name='"+cmb_act+"'id='"+cmb_act+"' size=\""+tamano+"\" style=\"width:100%\">";
        ls_pant+="<option value=0>Seleccione</option>";
        while (DBconten.next())
        {
            ls_pant+="<option value='"+DBconten.getString(1)+"'>"+DBconten.getString(2)+"</option>";
        }
        ls_pant+="</select>";
        return(ls_pant);
    }
    public String AJX_LIDERG(String dpto_seleccion, String cmb_act,String SProc,String tamano) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{ call DBO."+SProc+"('"+dpto_seleccion+"')}");
        DBconten.beforeFirst();
        ls_pant="<select name='"+cmb_act+"'id='"+cmb_act+"' size=\""+tamano+"\" style=\"width:100%\" onChange=\"javascript:ejecutarprs()\">";
        ls_pant+="<option value=0>Seleccione</option>";
        while (DBconten.next())
        {
            ls_pant+="<option value='"+DBconten.getString(1)+"'>"+DBconten.getString(2)+"</option>";
        }
        ls_pant+="</select>";
        return(ls_pant);
    }
    public String AJX_LIDERGREP(String dpto_seleccion, String cmb_act,String SProc,String tamano) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{ call DBO."+SProc+"('"+dpto_seleccion+"')}");
        DBconten.beforeFirst();
        ls_pant="<select name='"+cmb_act+"'id='"+cmb_act+"' size=\""+tamano+"\" style=\"width:100%\">";
        ls_pant+="<option selected value="+devuelve_commakey(SProc+"('"+dpto_seleccion+"')")+">Todos</option>";
        while (DBconten.next())
        {
            ls_pant+="<option value='"+DBconten.getString(1)+"'>"+DBconten.getString(2)+"</option>";
        }
        ls_pant+="</select>";
        return(ls_pant);
    }
    public String AJX_LIDERGMNT(String dpto_seleccion, String cmb_act,String SProc,String tamano) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{ call DBO."+SProc+"('"+dpto_seleccion+"')}");
        DBconten.beforeFirst();
        ls_pant="<select name='"+cmb_act+"'id='"+cmb_act+"' size=\""+tamano+"\" style=\"width:100%\" onChange=\"javascript:ejecutarprsMNT()\">";
        ls_pant+="<option value=0>Seleccione</option>";
        while (DBconten.next())
        {
            ls_pant+="<option value='"+DBconten.getString(1)+"'>"+DBconten.getString(2)+"</option>";
        }
        ls_pant+="</select>";
        return(ls_pant);
    }
    public String AJX_ETMNT(String dpto_seleccion, String cmb_act,String SProc,String CRTLdsbl,String tamano) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{ call DBO."+SProc+"('"+dpto_seleccion+"')}");
        DBconten.beforeFirst();
        ls_pant="<select name='"+cmb_act+"'id='"+cmb_act+"' size=\""+tamano+"\" style=\"width:100%\">";
        ls_pant+="<option value=0>Seleccione</option>";
        while (DBconten.next())
        {
            ls_pant+="<option value='"+DBconten.getString(1)+"'>"+DBconten.getString(2)+"</option>";
        }
        ls_pant+="</select>";
        return(ls_pant);
    }
    public String AJX_PERSONAL(String dpto_seleccion, String cmb_act,String SProc) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{ call DBO."+SProc+"('"+dpto_seleccion+"')}");
        DBconten.beforeFirst();
        ls_pant="<select name='"+cmb_act+"'id='"+cmb_act+"' style=\"width:100%\">";
        if(DBconten.next())
        {
        ls_pant+="<option selected value='"+DBconten.getString(1)+"' >"+DBconten.getString(2)+"</option>";
        while (DBconten.next())
        {
            ls_pant+="<option value='"+DBconten.getString(1)+"'>"+DBconten.getString(2)+"</option>";
        }
        }
        else
        {
            ls_pant+="<option selected value=0>Ninguno</option>";
        }
        ls_pant+="</select>";
        return(ls_pant);
    }
    public String AJX_LISTSP(String dpto_seleccion, String cmb_act,String SProc,String CRTLdsbl1,String CRTLdsbl2) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{ call DBO."+SProc+"('"+dpto_seleccion+"')}");
        DBconten.beforeFirst();
        ls_pant="<select name='"+cmb_act+"'id='"+cmb_act+"' style=\"width:100%\" \" onChange=\"unlock('"+CRTLdsbl1+"');unlock('"+CRTLdsbl2+"');\">";
        ls_pant+="<option selected value=0>Seleccione</option>";
        while (DBconten.next())
        {
            ls_pant+="<option value='"+DBconten.getString(1)+"'>"+DBconten.getString(2)+"</option>";
        }
        ls_pant+="</select>";
        return(ls_pant);
    }
    public String AJX_MUESTRA_TEXTO(String dpto_seleccion, String cmb_act,String SProc) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{ call DBO."+SProc+"('"+dpto_seleccion+"')}");
        DBconten.first();
        ls_pant="<input id=\"txtrep\" name=\"txtrep\" type=\"text\" value=\""+DBconten.getString(1)+"\" readonly=\"true\" style=\"width:82px\">";
        return(ls_pant);
    }
    public String AJX_CARGAID_DOC(String lista,String repeticion,String usuario, String cmb_act,String SProc) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{ call DBO."+SProc+"('"+lista+"','"+repeticion+"','"+usuario+"')}");
        DBconten.first();
        ls_pant="<input id=\"coddoc\" name=\"coddoc\" type=\"text\" value=\""+DBconten.getString(1)+"\" readonly=\"true\" style=\"width:100%\">";
        return(ls_pant);
    }
     public String AJX_CARGAID_DOCRX(String usuario, String cmb_act,String SProc) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{ call DBO."+SProc+"('"+usuario+"')}");
        DBconten.first();
        ls_pant="<input id=\"coddoc\" name=\"coddoc\" type=\"text\" value=\""+DBconten.getString(1)+"\" readonly=\"true\" style=\"width:100%\">";
        return(ls_pant);
    }
    public String AJX_CREALISTA(String seleccion1,String seleccion2, String cmb_act,String SProc) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{ call DBO."+SProc+"('"+seleccion1+"','"+seleccion2+"')}");
        DBconten.beforeFirst();
        //ls_pant="<div style=\"overflow-x:scroll; width:100%;overflow: -moz-scrollbars-horizontal;\">";
        //ls_pant+="<select name='"+cmb_act+"' size=\"9\" id='"+cmb_act+"' style=\"font-family:'Courier New', Courier, monospace;width:500px;font-size:10px\" onChange=\"javascript:cargarid_doc()\">";
        ls_pant+="<select name='"+cmb_act+"' size=\"9\" id='"+cmb_act+"' style=\"font-family:'Courier New', Courier, monospace\" onChange=\"javascript:cargarid_doc()\">";
        ls_pant+="<option selected value=0>Ninguno de los problemas listados es el que requiero</option>";
        while (DBconten.next())
        {
            ls_pant+="<option value='"+DBconten.getString(1)+"'>"+ Valida_long(DBconten.getString(1),12)+"|"+Valida_long(DBconten.getString(2),8)+"|"+Valida_long(DBconten.getString(3),8)+"|"+Valida_long(DBconten.getString(4),20)+"  |  "+Valida_long(DBconten.getString(5),27)+"  |  "+Valida_long(DBconten.getString(6),35)+"  |  "+Valida_long(DBconten.getString(7),20)+"  |  "+Valida_long(DBconten.getString(8),20)+"  |  "+Valida_long(DBconten.getString(9),3)+"</option>";
        }
        ls_pant+="</select>";
        //ls_pant+="</div>";
        return(ls_pant);
    }
    public String AJX_CREACSLT(String seleccion1,String seleccion2,String seleccion3,String seleccion4,String seleccion5,String seleccion6, String cmb_act,String SProc) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{ call DBO."+SProc+"('"+seleccion1+"','"+seleccion2+"','"+seleccion3+"','"+seleccion4+"','"+seleccion5+"','"+seleccion6+"')}");
        //DBconten=pers1.recuperar_rowsetSP("{ call DBO."+SProc+"('"+seleccion1+"','"+seleccion2+"','"+seleccion3+"','"+seleccion4+"')}");
        DBconten.beforeFirst();
        //ls_pant="<select name='"+cmb_act+"' size=\"9\" id='"+cmb_act+"'  style=\"font-family:'Courier New', Courier, monospace;width:100%\" onChange=\"JavaScript:obt_cod()\">";
        ls_pant="<select name='"+cmb_act+"' size=\"9\" id='"+cmb_act+"'  style=\"font-family:'Courier New', Courier, monospace\" onChange=\"JavaScript:obt_cod()\">";
        //onChange=\"javascript:cargarid_doc()\
        while (DBconten.next())
        {
            
            ls_pant+="<option value='"+DBconten.getString(1)+"'>"+ Valida_long(DBconten.getString(1),12)+"|"+Valida_long(DBconten.getString(2),15)+"|"+Valida_long(DBconten.getString(3),8)+"|"+Valida_long(DBconten.getString(4),20)+"  |  "+Valida_long(DBconten.getString(5),27)+"  |  "+Valida_long(DBconten.getString(6),35)+"  |  "+Valida_long(DBconten.getString(7),20)+"  |  "+Valida_long(DBconten.getString(8),20)+"  |  "+Valida_long(DBconten.getString(9),3)+"</option>";
        }
        ls_pant+="</select>";
        return(ls_pant);
    }
    private String Valida_long(String Cadena,int longit)
    {
            String cdoc;
            StringBuilder sb = new StringBuilder();
            sb.append(Cadena).toString();
            int len = Cadena.length();
            // why put "String" in the name of a String?
            while ( len++ < longit )
            {
            sb.append("&#160;");
            }
            return(sb.toString());
    }
    public String AJX_NIVMNT(String dpto_seleccion, String cmb_act,String SProc,String div, String cmbusd,String SPROCH,String tamano) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{ call DBO."+SProc+"('"+dpto_seleccion+"')}");
        DBconten.beforeFirst();
        ls_pant="<select name='"+cmb_act+"'id='"+cmb_act+"' size=\""+tamano+"\" style=\"width:100%\" onChange=\"javascript:cargarCombo('compcomboMant.jsp', '"+cmb_act+"','"+div+"', '"+cmbusd+"','"+SPROCH+"')\">";
        ls_pant+="<option value=0>Seleccione</option>";
        while (DBconten.next())
        {
            ls_pant+="<option value='"+DBconten.getString(1)+"'>"+DBconten.getString(2)+"</option>";
        }
        ls_pant+="</select>";
        return(ls_pant);
    }
    public String AJX_NIVMNTPOS(String dpto_seleccion,String dep2,String dep3,String dep4, String cmb_act,String SProc,String CRTLdsbl1,String CRTLdsbl2,String tamano) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{ call DBO."+SProc+"('"+dpto_seleccion+"','"+dep2+"','"+dep3+"','"+dep4+"')}");
        DBconten.beforeFirst();
        ls_pant="<select name='"+cmb_act+"'id='"+cmb_act+"' style=\"width:100%\" size=\""+tamano+"\" onChange=\"unlock('"+CRTLdsbl1+"');unlock('"+CRTLdsbl2+"');\">";
        ls_pant+="<option value=0>Seleccione</option>";
        while (DBconten.next())
        {
            ls_pant+="<option value='"+DBconten.getString(1)+"'>"+DBconten.getString(2)+"</option>";
        }
        ls_pant+="</select>";
        return(ls_pant);
    }
    public String AJX_NIVMNTPOS(String dpto_seleccion,String sel2,String sel3, String cmb_act,String SProc,String tamano) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{ call DBO."+SProc+"('"+dpto_seleccion+"','"+sel2+"','"+sel3+"')}");
        DBconten.beforeFirst();
        ls_pant="<select name='"+cmb_act+"'id='"+cmb_act+"' size=\""+tamano+"\" style=\"width:100%\">";
        ls_pant+="<option value=0>Seleccione</option>";
        while (DBconten.next())
        {
            ls_pant+="<option value='"+DBconten.getString(1)+"'>"+DBconten.getString(2)+"</option>";
        }
        ls_pant+="</select>";
        return(ls_pant);
    }
    public String AJX_NIVMNTN2(String dpto_seleccion,String sel2,String sel3, String cmb_act,String SProc,String div, String cmbusd,String SPROCH,String tamano,String redirigir) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{ call DBO."+SProc+"('"+dpto_seleccion+"','"+sel2+"','"+sel3+"')}");
        DBconten.beforeFirst();
        ls_pant="<select name='"+cmb_act+"'id='"+cmb_act+"' size=\""+tamano+"\" style=\"width:100%\" onChange=\"javascript:cargarcslt('"+redirigir+".jsp', '"+cmb_act+"','cmb_niv1','cmd_defecto','cmb_categoria','"+div+"', '"+cmbusd+"','"+SPROCH+"')\">";
        ls_pant+="<option value=0>Seleccione</option>";
        while (DBconten.next())
        {
            ls_pant+="<option value='"+DBconten.getString(1)+"'>"+DBconten.getString(2)+"</option>";
        }
        ls_pant+="</select>";
        return(ls_pant);
    }
    public String AJX_NIVSPMODN1(String seleccion1,String seleccion2, String cmb_act,String SProc,String div, String cmbusd,String SPROCH,String tamano) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{ call DBO."+SProc+"('"+seleccion1+"','"+seleccion2+"')}");
        DBconten.beforeFirst();
        ls_pant="<select name='"+cmb_act+"'id='"+cmb_act+"' size=\""+tamano+"\" style=\"width:100%\" onChange=\"javascript:ejecutardepsMOD()\">";
        ls_pant+="<option value=0>Seleccione</option>";
        while (DBconten.next())
        {
            ls_pant+="<option value='"+DBconten.getString(1)+"'>"+DBconten.getString(2)+"</option>";
        }
        ls_pant+="</select>";
        return(ls_pant);
    }
    public String AJX_NIVSPMODRXN1(String seleccion1,String seleccion2, String cmb_act,String SProc,String div, String cmbusd,String SPROCH,String tamano) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{ call DBO."+SProc+"('"+seleccion1+"','"+seleccion2+"')}");
        DBconten.beforeFirst();
        ls_pant="<select name='"+cmb_act+"'id='"+cmb_act+"' size=\""+tamano+"\" style=\"width:100%\" onChange=\"javascript:ejecutardepsMODRX()\">";
        ls_pant+="<option value=0>Seleccione</option>";
        while (DBconten.next())
        {
            ls_pant+="<option value='"+DBconten.getString(1)+"'>"+DBconten.getString(2)+"</option>";
        }
        ls_pant+="</select>";
        return(ls_pant);
    }
    public String AJX_NIVSPMNTN1(String seleccion1,String seleccion2, String cmb_act,String SProc,String div, String cmbusd,String SPROCH,String tamano) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{ call DBO."+SProc+"('"+seleccion1+"','"+seleccion2+"')}");
        DBconten.beforeFirst();
        ls_pant="<select name='"+cmb_act+"'id='"+cmb_act+"' size=\""+tamano+"\" style=\"width:100%\" onChange=\"javascript:ejecutardepsMNT()\">";
        ls_pant+="<option value=0>Seleccione</option>";
        while (DBconten.next())
        {
            ls_pant+="<option value='"+DBconten.getString(1)+"'>"+DBconten.getString(2)+"</option>";
        }
        ls_pant+="</select>";
        return(ls_pant);
    }
    public String AJX_NIVMNTFALLO(String dpto_seleccion, String cmb_act,String cmb_act2,String SProc,String div, String cmbusd,String SPROCH,String tamano,String redirigir) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{ call DBO."+SProc+"('"+dpto_seleccion+"')}");
        DBconten.beforeFirst();
        ls_pant="<select name='"+cmb_act+"'id='"+cmb_act+"' size=\""+tamano+"\" style=\"width:100%\" onChange=\"javascript:cargarComboN1('"+redirigir+".jsp', '"+cmb_act+"', '"+cmb_act2+"','"+div+"', '"+cmbusd+"','"+SPROCH+"')\">";
        ls_pant+="<option value=0>Seleccione</option>";
        while (DBconten.next())
        {
            ls_pant+="<option value='"+DBconten.getString(1)+"'>"+DBconten.getString(2)+"</option>";
        }
        ls_pant+="</select>";
        return(ls_pant);
    }
    public String AJX_NIVYC(String dpto_seleccion, String cmb_act,String SProc,String div, String cmbusd,String SPROCH) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{ call DBO."+SProc+"('"+dpto_seleccion+"')}");
        DBconten.beforeFirst();
        ls_pant="<select name='"+cmb_act+"'id='"+cmb_act+"' onChange=\"javascript:cargarCombo('compcombolgYC.jsp', '"+cmb_act+"','"+div+"', '"+cmbusd+"','"+SPROCH+"')\">";
        ls_pant+="<option value=0>Seleccione</option>";
        while (DBconten.next())
        {
            ls_pant+="<option value='"+DBconten.getString(1)+"'>"+DBconten.getString(2)+"</option>";
        }
        ls_pant+="</select>";
        return(ls_pant);
    }
    public String AJX_NIVSP(String dpto_seleccion, String cmb_act,String SProc,String div, String cmbusd,String SPROCH) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{ call DBO."+SProc+"('"+dpto_seleccion+"')}");
        DBconten.beforeFirst();
        ls_pant="<select name='"+cmb_act+"'id='"+cmb_act+"' style=\"width:100%\" onChange=\"javascript:ejecutardeps()\">";
        ls_pant+="<option value=0>Seleccione</option>";
        while (DBconten.next())
        {
            ls_pant+="<option value='"+DBconten.getString(1)+"'>"+DBconten.getString(2)+"</option>";
        }
        ls_pant+="</select>";
        return(ls_pant);
    }
    public String AJX_NIVSPMNT(String dpto_seleccion, String cmb_act,String SProc,String div, String cmbusd,String SPROCH,String tamano) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{ call DBO."+SProc+"('"+dpto_seleccion+"')}");
        DBconten.beforeFirst();
        ls_pant="<select name='"+cmb_act+"'id='"+cmb_act+"' size=\""+tamano+"\" style=\"width:100%\" onChange=\"javascript:ejecutardepsMNT()\">";
        ls_pant+="<option value=0>Seleccione</option>";
        while (DBconten.next())
        {
            ls_pant+="<option value='"+DBconten.getString(1)+"'>"+DBconten.getString(2)+"</option>";
        }
        ls_pant+="</select>";
        return(ls_pant);
    }
    
    public String AJX_NIVSPYC(String dpto_seleccion, String cmb_act,String SProc,String div, String cmbusd,String SPROCH) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{ call DBO."+SProc+"('"+dpto_seleccion+"')}");
        DBconten.beforeFirst();
        ls_pant="<select name='"+cmb_act+"'id='"+cmb_act+"' onChange=\"javascript:ejecutardepsYC()\">";
        ls_pant+="<option value=0>Seleccione</option>";
        while (DBconten.next())
        {
            ls_pant+="<option value='"+DBconten.getString(1)+"'>"+DBconten.getString(2)+"</option>";
        }
        ls_pant+="</select>";
        return(ls_pant);
    }
    public String devprbl() throws SQLException, NamingException
    {
        String return_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowset("select * from dbo.CAT_FALLA");
        DBconten.beforeFirst();
        while (DBconten.next())
        {
            return_pant+="<option value=\""+DBconten.getString("ID_CFALLA")+"\">"+DBconten.getString("NOMBRE_CAT")+"</option>";
        }
            return (return_pant);
    }
    public boolean insertarequipoRX(String ID_PROBLEMA,String[] NOMBRES_INTEGRANTE) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        for(int loopIndex = 0; loopIndex < NOMBRES_INTEGRANTE.length; loopIndex++)
        pers1.recuperar_ejecutarSP("{ call DBO.INSERTAR_EQUIPORX('"+ID_PROBLEMA+"','"+NOMBRES_INTEGRANTE[loopIndex]+"')}");
     return true;
    }
    public boolean insertarRX(String ID_PROBLEMA,String ID_AREA,String ID_INICIADOR,String FECHA_APERTURA,String LIDER_EQUIPO,String ID_PLAT,String ID_CFALLA,String ID_FALLA,String ID_N1,String ID_N2,String ID_ZONA,String descripcion) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        if (pers1.recuperar_ejecutarSP("{ call DBO.INSERTAR_REDX('"+ID_PROBLEMA+"','"+ID_AREA+
                "','"+ID_INICIADOR+"','"+FECHA_APERTURA+"','"+LIDER_EQUIPO+"','"+ID_PLAT+"','"+
                ID_CFALLA+"','"+ID_FALLA+"','"+ID_N1+"','"+ID_N2+"','"+ID_ZONA+"','"+descripcion+"')}"))
            return true;
        return false;
    }
    public boolean insertarprob(String ID_PROBLEMA,String FECHA_APERTURA,String ID_PTOA,String ID_INICIADOR,String ID_DPN,String NOMBRE_TURNO,String ID_AREA,String ID_LGRUPO,String ID_ETRA,String ID_PERSONAL,String ID_CORRESPONSAL,String ID_ESCAL,String ID_PLAT,String COD__MODELO,String VIN,String LOTE, String ID_POND,String ID_CFALLA,String ID_FALLA,String ID_N1,String ID_N2,String ID_ZONA,String descripcion,String repetitividad,String documento_ant, String idtdoc,String FECHA_U_REAPERT) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        if (pers1.recuperar_ejecutarSP("{ call DBO.INSERTAR_REGISTROHISTORIAL('"+ID_PROBLEMA+"','"+FECHA_APERTURA+"','"+ID_PTOA+"','"+ID_INICIADOR+"','"+ID_DPN+"','"+NOMBRE_TURNO+"','"+ID_AREA+"','"+ID_LGRUPO+"','"+ID_ETRA+"','"+ID_PERSONAL+"','"+ID_CORRESPONSAL+"','"+ID_ESCAL+"','"+ID_PLAT+"','"+COD__MODELO+"','"+VIN+"','"+LOTE+"','"+ID_POND+"','"+ID_CFALLA+"','"+ID_FALLA+"','"+ID_N1+"','"+ID_N2+"','"+ID_ZONA+"','"+descripcion+"','"+repetitividad+"','"+documento_ant+"','"+idtdoc+"','"+FECHA_U_REAPERT+"')}"))
            return true;
        return false;
    }
    public boolean actualizarprobadmin(String ID_PROBLEMA,String f_apertura,String ID_TDOC,String cmb_dpn,String id_escalonamiento,String id_turno,String id_pond,String id_modelo,String id_vin,String id_lote,String id_lg,String id_let,String id_personal,String id_corresp,String ID_SHOP,String status,String acontenp2,String lotep2,String fechap2,String adefi,String lotedef,String fechadefi,String origendef,String id_5m,String Anul,String id_cfalla,String id_falla,String id_n1,String id_n2,String id_pos,String comentario,String id_usr) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        if (pers1.recuperar_ejecutarSP("{ call DBO.GUARDAR_PROB_PRINCIPALADM('"+ID_PROBLEMA+"','"+f_apertura+"','"+ID_TDOC+"','"+cmb_dpn+"','"+id_escalonamiento+"','"+id_turno+"','"+id_pond+"','"+id_modelo+"','"+id_vin+"','"+id_lote+"','"+id_lg+"','"+id_let+"','"+id_personal+"','"+id_corresp+"','"+ID_SHOP+"',N'"+status+"','"+acontenp2+"','"+lotep2+"','"+fechap2+"','"+adefi+"','"+lotedef+"','"+fechadefi+"','"+origendef+"','"+id_5m+"','"+Anul+"','"+id_cfalla+"','"+id_falla+"','"+id_n1+"','"+id_n2+"','"+id_pos+"','"+comentario+"','"+id_usr+"')}"))
            return true;
        return false;
    }
    public boolean actualizarRXadmin(String ID_PROBLEMA,String f_apertura,String AREA,String lider,String status,String fechadefi,String Anul,String id_cfalla,String id_falla,String id_n1,String id_n2,String id_pos,String comentario,String id_usr) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        if (pers1.recuperar_ejecutarSP("{ call DBO.GUARDAR_RXADM('"+ID_PROBLEMA+"','"+f_apertura+"','"+
                AREA+"','"+lider+"',N'"+status+"','"+fechadefi+"','"+Anul+"','"+id_cfalla+"','"+
                id_falla+"','"+id_n1+"','"+id_n2+"','"+id_pos+"','"+comentario+"','"+id_usr+"')}"))
            return true;
        return false;
    }
    public boolean actualizarprobprod(String ID_PROBLEMA,String id_lg,String id_let,String id_personal,String id_usr) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        if (pers1.recuperar_ejecutarSP("{ call DBO.GUARDAR_PROB_PRINCIPALPROD('"+ID_PROBLEMA+"','"+id_lg+"','"+id_let+"','"+id_personal+"','"+id_usr+"')}"))
            return true;
        return false;
    }
    public boolean actualizarprob(String ID_PROBLEMA,String f_apertura,String ID_TDOC,String cmb_dpn,String id_escalonamiento,String id_turno,String id_pond,String id_modelo,String id_vin,String id_lote,String id_lg,String id_let,String id_personal,String id_corresp,String ID_SHOP,String status,String acontenp2,String lotep2,String fechap2,String adefi,String lotedef,String fechadefi,String origendef,String id_5m,String Anul,String id_usr) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        if (pers1.recuperar_ejecutarSP("{ call DBO.GUARDAR_PROB_PRINCIPAL('"+ID_PROBLEMA+"','"+f_apertura+"','"+ID_TDOC+"','"+cmb_dpn+"','"+id_escalonamiento+"','"+id_turno+"','"+id_pond+"','"+id_modelo+"','"+id_vin+"','"+id_lote+"','"+id_lg+"','"+id_let+"','"+id_personal+"','"+id_corresp+"','"+ID_SHOP+"',N'"+status+"','"+acontenp2+"','"+lotep2+"','"+fechap2+"','"+adefi+"','"+lotedef+"','"+fechadefi+"','"+origendef+"','"+id_5m+"','"+Anul+"','"+id_usr+"')}"))
            return true;
        return false;
    }
    public boolean insertafmamarilla(String ID_PROBLEMA, String ID_EV,String responsable) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        if (pers1.recuperar_ejecutarSP("{ call DBO.insertYCFM('"+ID_PROBLEMA+"','"+ID_EV+"','"+responsable+"')}"))
            return true;
        return false;
    }
    public boolean insertadicamarilla(String ID_PROBLEMA, String ID_EV,String responsable ) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        if (pers1.recuperar_ejecutarSP("{ call DBO.insertYC('"+ID_PROBLEMA+"','"+ID_EV+"','"+responsable+"')}"))
            return true;
        return false;
    }
    public boolean insertadicfmea(String ID_PROBLEMA,String casos,String facilitador) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        if (pers1.recuperar_ejecutarSP("{call DBO.insertFM('"+ID_PROBLEMA+"','"+casos+"','"+facilitador+"')}"))
            return true;
        return false;
    }
    public String otorgaperpert(String usr,String v_permiso) throws SQLException, NamingException
    {
        GMPersistencia pers1=new GMPersistencia();
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        DBconten=pers1.recuperar_rowsetSP("{ call DBO.DEVOLVER_PERMISO ('"+usr+"','"+v_permiso+"')}");
        DBconten.first();
        if (Integer.parseInt(DBconten.getString("conteo_valor"))>0)
        {
        ls_pant="<script language=\"javascript\"> ";
        ls_pant+="unhide('"+v_permiso+"');";
        ls_pant+="</script>";
        }
        return(ls_pant);
    }
    //insercion de niveles
    public boolean cambiadatosadmin (String Sproc,String dato) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        if (pers1.recuperar_ejecutarSP("{call DBO."+Sproc+"('"+dato+"')}"))
            return true;
        return false;
    }
    public boolean CAMBIOTDOCRX(String iddoc,String f_apertura,String txt_lider,String usrCambio) throws NamingException, SQLException
        {
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        if (pers1.recuperar_ejecutarSP("{call DBO.CAMBIOTDOCRX('"+iddoc+"','"+f_apertura+"','"+txt_lider+"','"+usrCambio+"')}"))
            return true;
        return false;
        }
    public boolean cambiadatosadmin (String Sproc,String datodep,String dato) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        if (pers1.recuperar_ejecutarSP("{call DBO."+Sproc+"('"+datodep+"','"+dato+"')}"))
            return true;
        return false;
    }
    public boolean cambiadatosadmin (String Sproc,String datodep2,String datodep,String dato) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        if (pers1.recuperar_ejecutarSP("{call DBO."+Sproc+"('"+datodep2+"','"+datodep+"','"+dato+"')}"))
            return true;
        return false;
    }
    public boolean cambiadatosadmin (String Sproc,String datodep3,String datodep2,String datodep,String dato) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        if (pers1.recuperar_ejecutarSP("{call DBO."+Sproc+"('"+datodep3+"','"+datodep2+"','"+datodep+"','"+dato+"')}"))
            return true;
        return false;
    }
    public boolean cambiadatosadmin (String Sproc,String datodep4,String datodep3,String datodep2,String datodep,String dato) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        if (pers1.recuperar_ejecutarSP("{call DBO."+Sproc+"('"+datodep4+"','"+datodep3+"','"+datodep2+"','"+datodep+"','"+dato+"')}"))
            return true;
        return false;
    }
    public boolean cambiadatosadmin (String Sproc,String datodep5,String datodep4,String datodep3,String datodep2,String datodep,String dato) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        if (pers1.recuperar_ejecutarSP("{call DBO."+Sproc+"('"+datodep5+"','"+datodep4+"','"+datodep3+"','"+datodep2+"','"+datodep+"','"+dato+"')}"))
            return true;
        return false;
    }
    public boolean alteradatosadmin (String Sproc,String key,String Nnombre) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        if (pers1.recuperar_ejecutarSP("{call DBO."+Sproc+"('"+key+"','"+Nnombre+"')}"))
            return true;
        return false;
    }
    public boolean alteradatosadmin (String Sproc,String key2,String key1,String Nnombre) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        if (pers1.recuperar_ejecutarSP("{call DBO."+Sproc+"('"+key2+"','"+key1+"','"+Nnombre+"')}"))
            return true;
        return false;
    }
     public boolean alteradatosadmin (String Sproc,String key3,String key2,String key1,String Nnombre) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        if (pers1.recuperar_ejecutarSP("{call DBO."+Sproc+"('"+key3+"','"+key2+"','"+key1+"','"+Nnombre+"')}"))
            return true;
        return false;
    }
    /*REESTRUCTURACION FALLO*/
    public String AJX_NIVFALLO(String dpto_seleccion, String cmb_act,String cmb_act2,String SProc,String div, String cmbusd,String SPROCH) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{ call DBO."+SProc+"('"+dpto_seleccion+"')}");
        DBconten.beforeFirst();
        ls_pant="<select name='"+cmb_act+"'id='"+cmb_act+"' style=\"width:100%\" onChange=\"javascript:buscarreps()\">";
        ls_pant+="<option value=0>Seleccione</option>";
        while (DBconten.next())
        {
            ls_pant+="<option value='"+DBconten.getString(1)+"'>"+DBconten.getString(2)+"</option>";
        }
        ls_pant+="</select>";
        return(ls_pant);
    }
    public String AJX_NIVSPN1(String seleccion1,String seleccion2, String cmb_act,String SProc,String div, String cmbusd,String SPROCH) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{ call DBO."+SProc+"('"+seleccion1+"','"+seleccion2+"')}");
        DBconten.beforeFirst();
        ls_pant="<select name='"+cmb_act+"'id='"+cmb_act+"' style=\"width:100%\" onChange=\"javascript:ejecutardeps()\">";
        ls_pant+="<option value=0>Seleccione</option>";
        while (DBconten.next())
        {
            ls_pant+="<option value='"+DBconten.getString(1)+"'>"+DBconten.getString(2)+"</option>";
        }
        ls_pant+="</select>";
        return(ls_pant);
    }
     public String AJX_NIVN2(String dpto_seleccion,String sel2,String sel3, String cmb_act,String SProc,String div, String cmbusd,String SPROCH,String tamano) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{ call DBO."+SProc+"('"+dpto_seleccion+"','"+sel2+"','"+sel3+"')}");
        DBconten.beforeFirst();
        ls_pant="<select name='"+cmb_act+"'id='"+cmb_act+"' size=\""+tamano+"\" style=\"width:100%\" onChange=\"javascript:cargarcslt('compcombolg.jsp', '"+cmb_act+"','cmb_niv1','cmd_defecto','cmb_categoria','"+div+"', '"+cmbusd+"','"+SPROCH+"')\">";
        ls_pant+="<option value=0>Seleccione</option>";
        while (DBconten.next())
        {
            ls_pant+="<option value='"+DBconten.getString(1)+"'>"+DBconten.getString(2)+"</option>";
        }
        ls_pant+="</select>";
        return(ls_pant);
    }
    public String AJX_NIVPOS(String dpto_seleccion,String dep2,String dep3,String dep4, String cmb_act,String SProc,String CRTLdsbl1,String CRTLdsbl2,String tamano) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{ call DBO."+SProc+"('"+dpto_seleccion+"','"+dep2+"','"+dep3+"','"+dep4+"')}");
        DBconten.beforeFirst();
        ls_pant="<select name='"+cmb_act+"'id='"+cmb_act+"' style=\"width:100%\" size=\""+tamano+"\" onChange=\"unlock('"+CRTLdsbl1+"');unlock('"+CRTLdsbl2+"');\">";
        ls_pant+="<option value=0>Seleccione</option>";
        while (DBconten.next())
        {
            ls_pant+="<option value='"+DBconten.getString(1)+"'>"+DBconten.getString(2)+"</option>";
        }
        ls_pant+="</select>";
        return(ls_pant);
    }
    public String AJX_NIVPOS(String dpto_seleccion,String sel2,String sel3, String cmb_act,String SProc,String tamano) throws SQLException, NamingException
    {
        int x=0;
        String ls_pant="";
        CachedRowSetImpl DBconten=new CachedRowSetImpl();
        GMPersistencia pers1=new GMPersistencia();
        DBconten=pers1.recuperar_rowsetSP("{ call DBO."+SProc+"('"+dpto_seleccion+"','"+sel2+"','"+sel3+"')}");
        DBconten.beforeFirst();
        ls_pant="<select name='"+cmb_act+"'id='"+cmb_act+"' size=\""+tamano+"\" style=\"width:100%\">";
        ls_pant+="<option value=0>Seleccione</option>";
        while (DBconten.next())
        {
            ls_pant+="<option value='"+DBconten.getString(1)+"'>"+DBconten.getString(2)+"</option>";
        }
        ls_pant+="</select>";
        return(ls_pant);
    }
}
