package Connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Model.User;

public class UserDao {

    public static Connection getConnection() {
        Connection con = null;

        try {
            String url = "jdbc:mysql://localhost:3306/jsp";
            String uname = "root";
            String pass = "abc123";
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, uname, pass);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }

    public static int save(User e) {
        int status = 0;
        try {
            Connection con = UserDao.getConnection();

            PreparedStatement ps = con.prepareStatement("insert into jsp.j1 (name,email,phone) values (?,?,?)");

            ps.setString(1, e.getName());
            ps.setString(2, e.getEmail());
            ps.setString(3, e.getPhone());

            status = ps.executeUpdate();

            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return status;
    }

    
    //View
    
    public static List<User> getAllEmployees()
	  {  
	        List<User> list=new ArrayList<User>();  
	          
	        try{  
	            Connection con=UserDao.getConnection();  
	            PreparedStatement ps=con.prepareStatement("select * from jsp.j1");  
	           
	            ResultSet rs=ps.executeQuery();  
	            while(rs.next())
	            {  
	            	User e=new User(); 
	               
	                e.setId(rs.getInt(1));  
	                e.setName(rs.getString(2));  
	                e.setEmail(rs.getString(3));  
	                e.setPhone(rs.getString(4));  
	                list.add(e);  
	                
	            }  
	            con.close();  
	        }
	        catch(Exception e){e.printStackTrace();}  
	          
	        return list;  
	  }
    
    //Delete
    
    public static int delete(int id){  
        int status=0;  
        try{  
            Connection con=UserDao.getConnection();  
            PreparedStatement ps=con.prepareStatement("delete from jsp.j1 where id=?");  
            ps.setInt(1,id);  
            status=ps.executeUpdate();  
              
            con.close();  
        }catch(Exception e){e.printStackTrace();}  
          
        return status;  
    }  
}
