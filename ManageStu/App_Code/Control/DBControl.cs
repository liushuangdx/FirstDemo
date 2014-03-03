using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
/// <summary>
///DBControl 的摘要说明
/// </summary>
public static class DBControl
{
    public static int Insert(string sql)
    {
        SqlConnection conn = DBCon.getConnection();
        SqlTransaction transaction = null;
        try
        {
            conn.Open();
            transaction = conn.BeginTransaction();
            SqlCommand com = new SqlCommand(sql, conn, transaction);
            int n = com.ExecuteNonQuery();
            transaction.Commit();
            return n;
        }
        catch (Exception ex)
        {
            transaction.Rollback();
            throw new Exception(ex.Message);
        }
        finally
        {
            DBCon.CloseAll(conn);
        }
    }
    //删除记录
    public static int delete(string sql)
    {
        SqlConnection conn = DBCon.getConnection();
        SqlTransaction transaction = null;
        try
        {
            conn.Open();
            transaction = conn.BeginTransaction();
            SqlCommand com = new SqlCommand(sql, conn, transaction);
            int n = com.ExecuteNonQuery();
            transaction.Commit();
            return n;
        }
        catch (Exception ex)
        {
            transaction.Rollback();
            throw new Exception(ex.Message);
        }
        finally
        {
            DBCon.CloseAll(conn);
        }
    }
    //修改记录
    public static int update(string sql)
    {
        SqlConnection conn = DBCon.getConnection();
        SqlTransaction transaction = null;


        try
        {
            conn.Open();
            transaction = conn.BeginTransaction();
            SqlCommand com = new SqlCommand(sql, conn, transaction);
            int n = com.ExecuteNonQuery();
            transaction.Commit();
            return n;
        }
        catch (Exception ex)
        {
            transaction.Rollback();
            throw new Exception(ex.Message);
        }
        finally
        {
            DBCon.CloseAll(conn);
        }
    }
    //查询
    public static object findOne(string sql)
    {
        SqlConnection conn = DBCon.getConnection();
        SqlCommand com = new SqlCommand(sql, conn);
        try
        {
            conn.Open();
            return com.ExecuteScalar();
        }
        catch (Exception ex)
        {
            return null;
        }
        finally
        {
            DBCon.CloseAll(conn, com);
        }
    }

    public static SqlDataReader select(string sql)
    {
        SqlConnection conn = DBCon.getConnection();
        SqlCommand com = new SqlCommand(sql, conn);
        try
        {
            conn.Open();
            SqlDataReader sdr = com.ExecuteReader();
            return sdr;
        }
        catch (Exception ex)
        {
            return null;
        }
        finally
        {
            DBCon.CloseAll(conn, com);
        }
    }

}