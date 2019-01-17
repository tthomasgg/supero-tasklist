<%@ include file="inc/connection.jsp" %>

<%

  PreparedStatement preparedStatement = null;

  try {

    String deleteSQL = "UPDATE tb_tasks SET de_status = 'REMOVIDA', dt_remocao = CURRENT_TIMESTAMP() WHERE cd_task = ?";
  
    preparedStatement = connection.prepareStatement(deleteSQL);
    preparedStatement.setInt(1, Integer.parseInt(request.getParameter("id")));
  
    preparedStatement.executeUpdate();

    response.sendRedirect("listar.jsp");
    
  } catch (SQLException e) {

    out.println(e.getMessage());

  } finally {

    if (preparedStatement != null) {
      preparedStatement.close();
    }

  }

%>