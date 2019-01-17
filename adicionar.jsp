<%@ include file="inc/header.jsp" %>

<%

  PreparedStatement preparedStatement = null;
  String titulo = "", descricao = "", status = "";

  if ("POST".equalsIgnoreCase(request.getMethod())) {
    String conclusaoDDL = "", conclusaoValue = "", statusDDL = "", statusValue = "";

    titulo = request.getParameter("de_titulo");
    descricao = request.getParameter("de_descricao");
    status = request.getParameter("de_status");

    if (status.length() != 0) {
      statusDDL = ", de_status";
      statusValue = ", ?";
    } 
    if ("FINALIZADA".equals(status)) {
      conclusaoDDL = ", dt_conclusao";
      conclusaoValue = ", CURRENT_TIMESTAMP()";
    }

    String insertSQL = "INSERT INTO tb_tasks (de_titulo, de_descricao "+ statusDDL + conclusaoDDL +") VALUES (?,? " + statusValue + conclusaoValue + ")";

    out.println(new Timestamp(System.currentTimeMillis()));
  
    preparedStatement = connection.prepareStatement(insertSQL);
    preparedStatement.setString(1, titulo);
    preparedStatement.setString(2, descricao);
    if (status.length() != 0) {
      preparedStatement.setString(3, status);
    }
  
    try {
      preparedStatement.executeUpdate();
      response.sendRedirect("listar.jsp");
    } catch(SQLException e) {
      out.println(e.getMessage());
    } finally {
      if (preparedStatement != null) {
        preparedStatement.close();
      }      
    }
  }

%>

<div class="container-fluid">
  <div class="row">
    <div class="col-6">
        <form method="POST">
            <div class="form-group">
              <label for="de_titulo">Título</label>
              <input type="text" class="form-control" name="de_titulo" value="<%=titulo%>" id="de_titulo">
            </div>
            <div class="form-group">
              <label for="de_descricao">Descrição</label>
              <textarea type="text" class="form-control" name="de_descricao" id="de_descricao"><%=descricao%></textarea>
            </div>
            <div class="form-group">
              <label class="mr-sm-2 sr-only" for="inlineFormCustomSelect">Preference</label>
              <select class="custom-select mr-sm-2" name="de_status">
                <option value="">Status...</option>
                <option value="INICIADA" <%if ("INICIADA".equals(status)) { out.println("selected=\'selected\'"); } %>>Iniciada</option>
                <option value="FINALIZADA" <%if ("FINALIZADA".equals(status)) { out.println("selected=\'selected\'"); } %>>Finalizada</option>
              </select>
            </div>
            <button type="submit" class="btn btn-primary">Enviar</button>
          </form>
    </div>
  </div>
</div>

<%@ include file="inc/footer.jsp" %>