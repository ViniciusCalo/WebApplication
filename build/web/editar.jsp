<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="config.Conexao"%>

<%  
    Statement st = null;
    ResultSet rs = null;  
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Usuário</title>
    </head>
    <body>
        <h1>Editar Usuários</h1>
        <%
            String valorNome=null;
            String valorUsuario=null;
            String valorNivel=null;
            
            if(request.getParameter("funcao")!=null && request.getParameter("funcao").equals("editar")){
                String valorID = request.getParameter("id");       
                st = new Conexao().conectar().createStatement();
                
            try{
                rs = st.executeQuery("Select * from usuarios where id='"+ valorID +"'");
                while(rs.next())
                    {    
                        valorNome =  rs.getString(2);
                        valorUsuario =  rs.getString(3);
                        valorNivel = rs.getString(5);
                
                    }
            }
                catch(Exception e)
                        {
                        out.println(e);
                        }
  
            }
            %>
        <form action="" method="post" id="cadastro">
            <label>Nome do Usuário</label><br>
            <input type="text" name="txtNome" value="<%=valorNome %>"><br>
            <br>
            <input type="text" name="txtUsuario" value="<%=valorUsuario %>"><br>
            <br>
            <select name="txtNivel">
                <option value="<%=valorNivel %>"><%=valorNivel %></option>
                <option value="usu">Usuário</option>
                <option value="admin">Administrador</option>
                <option value="vis">Visitante</option>
            </select>
            <br>
            <input type="submit" name="btnAtualizar" value="Atualizar">
        </form>
        
<%
            if(request.getParameter("btnAtualizar")!=null){
                String id = request.getParameter("id");
                String nome = request.getParameter("txtNome");
                String usuario = request.getParameter("txtUsuario");
                String nivel = request.getParameter("txtNivel");            
               try{
                        st = new Conexao().conectar().createStatement();

                        st.executeUpdate("Update usuarios set nome='" + nome + "',usuario='" + usuario 
                        + "',nivel='" + nivel + "'where id='" + id + "'");     
                        out.println("<meta http-equiv='refresh' content='0;URL=excluir.jsp'>");
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Usuário atualizado com sucesso');");
                        out.println("</script>");    
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