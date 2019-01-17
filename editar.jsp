<%@ include file="inc/header.jsp" %>

<%

  PreparedStatement preparedStatement = null;
  String titulo = null, descricao = null, status = null;

  try {

    String deleteSQL = "SELECT * from tb_tasks WHERE cd_task = ?";
  
    preparedStatement = connection.prepareStatement(deleteSQL);
    preparedStatement.setInt(1, Integer.parseInt(request.getParameter("id")));
  
    ResultSet rs = preparedStatement.executeQuery();

    while (rs.next()) {
      titulo = rs.getString("de_titulo");
      descricao = rs.getString("de_descricao");
      status = rs.getString("de_status");
    }    
    
  } catch (SQLException e) {

    out.println(e.getMessage());

  } finally {

    if (preparedStatement != null) {
      preparedStatement.close();
    }

  }

  if ("POST".equalsIgnoreCase(request.getMethod())) {
    String conclusao = "";

    titulo = request.getParameter("de_titulo");
    descricao = request.getParameter("de_descricao");
    status = request.getParameter("de_status");

    if ("FINALIZADA".equals(status)) {
      conclusao = ", dt_conclusao = CURRENT_TIMESTAMP()";
    } else if ("INICIADA".equals(status)) {
      conclusao = ", dt_conclusao = NULL";
    }

    String updateSQL = "UPDATE tb_tasks SET de_titulo = ?, de_descricao = ?, de_status = ? "+ conclusao +" WHERE cd_task = ?";
  
    preparedStatement = connection.prepareStatement(updateSQL);
    preparedStatement.setString(1, titulo);
    preparedStatement.setString(2, descricao);
    preparedStatement.setString(3, status);
    preparedStatement.setInt(4, Integer.parseInt(request.getParameter("id")));
  
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
            <input type="hidden" name="cd_task" value="<%=request.getParameter("id")%>" />
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
                <option>Status...</option>
                <option value="INICIADA" <%if ("INICIADA".equals(status)) { out.println("selected=\'selected\'"); } %>>Iniciada</option>
                <option value="FINALIZADA" <%if ("FINALIZADA".equals(status)) { out.println("selected=\'selected\'"); } %>>Finalizada</option>
              </select>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
          </form>
    </div>
  </div>
</div>

<%@ include file="inc/footer.jsp" %>