<%--     Document   : cadUsu    Created on : 1 de mar. de 2023, 21:50:25    Author     : rovil--%><%@ page language="java" contentType="text/html; charset=ISO-8859-1"    pageEncoding="UTF-8"%><%@page import="java.sql.*"%><%@page import="com.mysql.jdbc.Driver"%><%@page import="config.Conexao"%><%
    Statement st = null;
    ResultSet rs = null;
%><!DOCTYPE html><html>   
    <head>       
        <meta charset=UTF-8>       
        <title>JSP Page</title>  
    </head>   
    <body>       
        <h1>Cadastro de Usuários</h1>   
        <form action="" method="post" id="cadastro"> 
            <label>Nome do Usuário</label><br>   
            <input type="text" name="txtNome"><br>   
            <label>Usuário</label><br>        
            <input type="text" name="txtUsu"><br>          
            <label>Senha</label><br>          
            <input type="text" name="txtSenha"><br>
            <!-- comment -->     
            <br>     
            <select name="txtNivel">        
                <option value="" disabled selected hidden>escolha uma opção</option>
                <option value="usu">Usuário</option>     
                <option value="admin">Administrador</option>     
                <option value="vis">Visitante</option>      
            </select>         
            <br>          
            <input type="submit" name="btnSalvar">     
        </form>   
               
      <%
    if (request.getParameter("btnSalvar") != null) {
        String nome = request.getParameter("txtNome");
        String usuario = request.getParameter("txtUsu");
        String senha = request.getParameter("txtSenha");
        String nivel = request.getParameter("txtNivel");
        try {
            st = new Conexao().conectar().createStatement();
            st.executeUpdate("insert into usuarios(nome,usuario,senha,nivel) values('" + nome + "'" + ", '" + usuario + "', '" + senha + "', '" + nivel + "')");
            out.println("<meta http-equiv='refresh' content='0;URL=index.jsp'>");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Cadastro realizado com sucesso');");
            out.println("</script>");
        } catch (Exception e) {
            out.println(e);
        }
    }
%>

<br>
 <a href="index.jsp">Voltar</a>
    </body>
</html>