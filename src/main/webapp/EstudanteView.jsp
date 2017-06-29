<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="academico.Estudante"%>
<html>

  <head>
    <title>Professor</title>
  </head>

  <body>
    <h1><a href="exercicio">Estudante</a></h1>
    <form>
      <table>
        <tr>
          <td>Matrícula</td>
          <td><input name="matricula"></td>
        </tr>
        <tr>
          <td>Nome:</td>
          <td><input name="nome"></td>
        </tr>
      </table>
      <button name="operacao" value="adicionar">Incluir</button>
      <button name="operacao" value="alterar">Alterar</button>
    </form>
    <b>${msg}</b>
    <hr>
    <table border="1">
      <tr>
        <th>Matrícula</th>
        <th>Nome</th>
        <th>Ações</th>
      </tr>
      <%
      ArrayList<Estudante> estudantes =
        (ArrayList<Estudante>) request.getAttribute("estudantes");
      for (Estudante estudante : estudantes) {
      %>
      <tr>
        <td><%=estudante.getMatricula()%></td>
        <td><%=estudante.getNome()%></td>
        <td><a href="?acao=excluir&matricula=<%=estudante.getMatricula()%>">Excluir</a></td>
      </tr>
      <%}%>
    </table>
  </body>

</html>