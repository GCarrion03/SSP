/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package SSP_CAPAS;

import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import com.sun.rowset.CachedRowSetImpl;


/**
 *
 * @author Guz
 */
public class GMNegocio {
public String imprid(int usr,int id_fal, int id_n1) throws SQLException, NamingException
{
    int idcont;
    String nev;
    CachedRowSetImpl DBconten=new CachedRowSetImpl();
    GMPersistencia pers1=new GMPersistencia();
    DBconten=pers1.recuperar_rowsetSP("{ call DBO.DEVOLVER_ULTIMO ("+usr+","+id_fal+","+id_n1+")}");
    DBconten.first();
    nev=DBconten.getString("PTO_APERT")+"-"+DBconten.getString("ID_PROB")+"-"+DBconten.getString("REPET");
    return(nev);
}
}
