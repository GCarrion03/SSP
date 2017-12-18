/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package SSP_CAPAS;

import com.sun.rowset.CachedRowSetImpl;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
/**
 *
 * @author Guz
 */
public class GMPersistencia {
public CachedRowSetImpl recuperar_rowset(String as_sql) throws NamingException
    {   DataSource ds;
        String is_error;
        Connection ic_con = null;
        CachedRowSetImpl lcrs_rowset;
        try
        {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("SQL_jdbc");
            ic_con=ds.getConnection();
            lcrs_rowset = new CachedRowSetImpl();
            lcrs_rowset.setCommand(as_sql);
            lcrs_rowset.execute(ic_con);
        ic_con.close();
        }
        catch (SQLException e)
        {
            is_error=e.getMessage();
            return null;
        }
        return lcrs_rowset;
    }
public CachedRowSetImpl recuperar_rowsetSP(String as_sql) throws NamingException
    {   DataSource ds;
        String is_error;
        Connection ic_con = null;
        CallableStatement cs;
        CachedRowSetImpl lcrs_rowset;
        try
        {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("SQL_jdbc");
            ic_con=ds.getConnection();
            lcrs_rowset = new CachedRowSetImpl();
            cs=ic_con.prepareCall(as_sql);
            cs.execute();
            lcrs_rowset.populate(cs.getResultSet()) ;
        ic_con.close();
        cs.close();
        }
        catch (SQLException e)
        {
            is_error=e.getMessage();
            return null;
        }
        return lcrs_rowset;
    }
    public void ejecutar(String as_sql) throws NamingException
    {
        DataSource ds;
        String is_error;
        Connection ic_con = null;
        CachedRowSetImpl lcrs_rowset;
        try
        {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("SQL_jdbc");
            ic_con=ds.getConnection();
            lcrs_rowset = new CachedRowSetImpl();
            lcrs_rowset.setCommand(as_sql);
            lcrs_rowset.execute(ic_con);
            ic_con.close();
        }
        catch (SQLException e)
        {
            is_error=e.getMessage();
        }
    }
    public boolean recuperar_ejecutarSP(String as_sql) throws NamingException
    {   DataSource ds;
        String is_error;
        Connection ic_con = null;
        CallableStatement cs;
        CachedRowSetImpl lcrs_rowset;
        try
        {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("SQL_jdbc");
            ic_con=ds.getConnection();
            cs=ic_con.prepareCall(as_sql);
            cs.execute();
            ic_con.close();
            cs.close();
            return true;
        }
        catch (SQLException e)
        {
            is_error=e.getMessage();
            return false;
        }

    }
}