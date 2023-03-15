<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="config.Conexao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%  
    Statement st = null;
    ResultSet rs = null;
    %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Lista de Usuários</h1>              

<%  
            try{
     
            st = new Conexao().conectar().createStatement();
            
            rs = st.executeQuery("Select * from usuarios");
            
            
                out.println("<table border=1><tr>");
            while(rs.next())
            {    
                out.println("<td>" + rs.getString(2) + "</td>");
                out.println("<td>" + rs.getString(3)+ "</td>");
                out.print("<td>");
                out.print("<a href='editar.jsp?funcao=editar&id="+rs.getString(1)+"' class='text-info'>Editar | <i class='far fa-edit'></i></a>");
                out.print("<a href='excluir.jsp?funcao=excluir&id="+rs.getString(1)+"' class='text-danger'>Excluir<i class='far fa-trash-alt'></i></a>");
                out.print("</td></tr>");
        }
                out.println("</table>");
            }
            catch(Exception e)
            {
                out.println(e);
            }
            


        if(request.getParameter("funcao")!=null && request.getParameter("funcao").equals("excluir")){
         String id =request.getParameter("id");
            
            try{
     
                st = new Conexao().conectar().createStatement();
                st.executeUpdate("Delete from usuarios where id='"+ id +"'");
                            out.println("<meta http-equiv='refresh' content='0;URL=excluir.jsp'>");
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('Cadastro excluído com sucesso');");
         
            }
            catch(Exception e)
            {
            out.println(e);
            }
        }
                
            %>

             <br>
      <a href="index.jsp">Voltar</a>      
            
 </body>
   </html>