package com.ao.school.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.ao.school.entity.Teacher;
import com.ao.school.util.JdbcUtil;

public class SelectTeacher extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		int count = 0;
		String tno = req.getParameter("tno");
		String tname = req.getParameter("tname");
		String zip = req.getParameter("zip");
		String date = req.getParameter("time");
		String depid = req.getParameter("depart");
		int pageno = Integer.parseInt(req.getParameter("pageno"));
		pageno = (pageno-1)*2;
		List<Teacher> list = null;
		String json = null;
		Connection conn = JdbcUtil.conn();
		PreparedStatement ps = null;
		ResultSet rs = null;
		Map<String, Object> map = new HashMap<>();
		//System.out.println(depid);
		//System.out.println(zip);
		try {
		if(depid == null || depid.equals("")){
			if(tno == null || tno.equals("")){
				if(tname == null || tname.equals("")){
					if(zip == null || zip.equals("")){
						if(date == null || date.equals("")){
							list =(List<Teacher>)JdbcUtil.selects(Teacher.class, "select * from tb_teachers limit "+pageno+",2");
							ps = conn.prepareStatement("select count(*) from tb_teachers");
							rs = ps.executeQuery();
							if(rs.next()) {
								count =  rs.getInt(1);
							}
						}
						else{
							list =(List<Teacher>)JdbcUtil.selects(Teacher.class, "select * from tb_teachers where t_date like '%"+date+"%' limit "+pageno+",2");
							ps = conn.prepareStatement("select count(*) from tb_teachers  where t_date like '%"+date+"%'");
							rs = ps.executeQuery();
							if(rs.next()) {
								count =  rs.getInt(1);
							}
						}
					}
					else{
						list =(List<Teacher>)JdbcUtil.selects(Teacher.class, "select * from tb_teachers where t_zip like '%"+zip+"%' limit "+pageno+",2");
						ps = conn.prepareStatement("select count(*) from tb_teachers wheret_zip like '%"+zip+"%'");
						rs = ps.executeQuery();
						if(rs.next()) {
							count =  rs.getInt(1);
						}
					}
				}
				else{
					list =(List<Teacher>)JdbcUtil.selects(Teacher.class, "select * from tb_teachers where t_name like '%"+tname+"%' limit "+pageno+",2");
					ps = conn.prepareStatement("select count(*) from tb_teachers where t_name like '%"+tname+"%'");
					rs = ps.executeQuery();
					if(rs.next()) {
						count =  rs.getInt(1);
					}
				}
			}
			else{
				list =(List<Teacher>)JdbcUtil.selects(Teacher.class, "select * from tb_teachers where t_no like '%"+tno+"%' limit "+pageno+",2");
				ps = conn.prepareStatement("select count(*) from tb_teachers  where t_no like '%"+tno+"%'");
				rs = ps.executeQuery();
				if(rs.next()) {
					count =  rs.getInt(1);
				}
			}
			
			//list =(List<Teacher>)JdbcUtil.selects(Teacher.class, "select * from tb_teachers where t_no like '%"+tno+"%' or t_name like '%\"+tname+\"%' or t_zip like '%\"+zip+\"%' or t_date like '%"+date+"%'");
		}
		else{
			list =(List<Teacher>)JdbcUtil.selects(Teacher.class, "select * from tb_teachers where t_depno=? limit "+pageno+",2",depid);
			ps = conn.prepareStatement("select count(*) from tb_teachers  where t_depno=?");
			ps.setString(1, depid);
			rs = ps.executeQuery();
			if(rs.next()) {
				count =  rs.getInt(1);
			}
		}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			map.put("count", count);
			map.put("teachers", list);
			json = JSONObject.fromObject(map).toString();
			resp.setCharacterEncoding("utf-8");
			resp.getWriter().write(json);
			try {
				if(rs!=null)
					rs.close();
				if(ps!=null)
					ps.close();
				if(conn!=null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
