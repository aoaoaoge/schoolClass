package com.ao.school.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.swing.JButton;

import com.alibaba.druid.pool.DruidDataSource;


public class JdbcUtil {
	private static String driverName;//驱动
	private static String url;//数据库路径
	private static String userName;//用户名
	private static String password;//密码
	private static DruidDataSource dds = new DruidDataSource();
	
	/**
	 * 初始化静态成员变量
	 */
	static{
		InputStream in = null;
		try {
			in = JdbcUtil.class.getResourceAsStream("/jdbc.properties");
			Properties pro = new Properties();
			pro.load(in);
			driverName = pro.getProperty("className.driver");
			url = pro.getProperty("url");
			userName = pro.getProperty("user");
			password = pro.getProperty("password");
			dds.setDriverClassName(driverName);
			dds.setUrl(url);
			//dds.getConnection(userName, password);
			dds.setUsername(userName);
			dds.setPassword(password);
			dds.setMinIdle(10);
			dds.setMaxActive(50);
			dds.setInitialSize(10);
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
				try {
					if(in != null)
						in.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}		
		}
	}

	public JdbcUtil() {
	}
	/**
	 * 连接数据库，并返回一个连接
	 * @return
	 */
	public static Connection conn(){
		Connection conn = null;
		try {
			
			conn = dds.getConnection();
			//System.out.println("连接成功！");
			return conn;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
		
	}
	
	/**
	 * 增删改
	 * @param sql SQL语句
	 * @param p   查询的参数
	 */
	public static boolean update(String sql,Object...p){
		PreparedStatement pstm = null;
		Connection conn =null;
		boolean flag = false;
		try {
			conn = conn();
			pstm=conn.prepareStatement(sql);
			for(int i=0;i<p.length;i++){
				pstm.setObject(i+1, p[i]);
			}
			pstm.executeUpdate();
			flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("更新失败！");
		}finally{
				try {
					if(conn != null)
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		return flag;
	
	}
	/**
	 * 单行结果查询
	 * @param c 实体类
	 * @param sql 语气
	 * @param p SQL查询的元素
	 * @return
	 */
	public static Object select(Class c,String sql,Object...p){
		PreparedStatement pstm = null;
		Connection conn = null;
		ResultSet res = null;
		conn = conn();
		try {
			pstm = conn.prepareStatement(sql);
			if(p!=null&&p.length>0){
				for(int i=0;i<p.length;i++){
					pstm.setObject(i+1, p[i]);
				}
			}
			res = pstm.executeQuery();
			if(res.next()){
				Object obj = c.newInstance();//使用形参中的类初始化创建对象
				Field[] fields = c.getDeclaredFields();//获取类中的变量
				for (Field field : fields) {
					field.setAccessible(true);
					String fname = field.getName();
					ResultSetMetaData rsd = res.getMetaData();
					int colcout  = rsd.getColumnCount();
					for(int i=1;i<=colcout;i++){
						if(rsd.getColumnLabel(i).equals(fname)){
							field.set(obj, res.getObject(fname));
							break;
							
						}
					}
				}
				return obj;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return null;
	}
	/**
	 * 多行查询
	 * @param c 实体类
	 * @param sql 语句
	 * @param p sql元素
	 * @return
	 */
	public static List selects(Class c,String sql,Object...p){
		PreparedStatement pstm = null;
		Connection conn = null;
		ResultSet res = null;
		conn = conn();
		List<Object> list = new ArrayList<>();
		try {
			pstm = conn.prepareStatement(sql);
			if(p!=null&&p.length>0){
				for(int i=0;i<p.length;i++){
					pstm.setObject(i+1, p[i]);
				}
			}
			res = pstm.executeQuery();
			while(res.next()){
				Object obj = c.newInstance();//使用形参中的类初始化创建对象
				Field[] fields = c.getDeclaredFields();//获取类中的变量
				for (Field field : fields) {
					field.setAccessible(true);//变量操作权限
					String fname = field.getName();//获取变量名
					ResultSetMetaData rsd = res.getMetaData();//结果集数据对象
					int colcout  = rsd.getColumnCount();//结果的列数
					for(int i=1;i<=colcout;i++){
						if(rsd.getColumnLabel(i).equals(fname)){//当结果集的列名与对象变量相同时为变量赋值
							field.set(obj, res.getObject(fname));//为变量赋值
							break;
						}
					}
				}	
				list.add(obj);//将获取到的对象放入对象数组中
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
}
