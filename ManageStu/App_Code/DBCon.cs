using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
///DB_con 的摘要说明
/// </summary>
public static class DBCon
{
    public static SqlConnection getConnection()
    {

        SqlConnection conn = new SqlConnection("server=.;database=db_school;uid=sa;pwd=ls920901");
        return conn;
    }

    public static void CloseAll(SqlConnection conn, SqlCommand com)
    {
        if (conn.State != ConnectionState.Closed)
        {
            com.Dispose();
            conn.Close();
            conn.Dispose();
        }
    }

    public static void CloseAll(SqlConnection conn)
    {
        if (conn.State != ConnectionState.Closed)
        {

            conn.Close();
            conn.Dispose();
        }
    }
}