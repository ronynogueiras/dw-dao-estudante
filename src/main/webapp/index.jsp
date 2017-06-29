<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="academico.Estudante"%>
<meta charset="UTF-8">
<html>

<head>
    <title>Estudante</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>

<body>
<h1><a href="#">Estudante</a></h1>
<form action="estudante">
    <div class="form-group">
        <label>Matricula</label>
        <input type="text" name="matricula" class="form-control" required/>
    </div>
    <div class="form-group">
        <label>Nome</label>
        <input type="text" name="nome" class="form-control" required/>
    </div>
    <p>
        <button name="acao" value="adicionar" class="btn btn-success">Incluir</button>
        <button name="acao" value="alterar" class="btn btn-primary">Alterar</button>
    </p>
</form>
<b>${msg}</b>
<hr>
<table class="table">
    <tr>
        <th>Matricula</th>
        <th>Nome</th>
        <th>Remover</th>
    </tr>
    <%
      ArrayList<Estudante> estudantes = (ArrayList<Estudante>) request.getAttribute("estudantes");
        if (estudantes != null) {
          for (Estudante estudante : estudantes) {
          %>
          <tr>
            <td><%=estudante.getMatricula()%></td>
            <td><%=estudante.getNome()%></td>
            <td><a class="btn btn-danger" href="?acao=excluir&matricula=<%=estudante.getMatricula()%>">Excluir</a></td>
          </tr>
          <%
        }
      }%>
</table>
</body>

</html>