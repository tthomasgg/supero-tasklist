<%@ include file="inc/header.jsp" %>

<%

  PreparedStatement preparedStatement = null;

  try {

    String id = request.getParameter("id");
    String pos = request.getParameter("pos");

    out.println(id);
    out.println(pos);

    /*for (int i = 0; i < ids.length;i++) {
      out.println(ids[i]);
    }*/

    String deleteSQL = "UPDATE tb_tasks SET nr_posicao = ? WHERE cd_task = ?";
  
    preparedStatement = connection.prepareStatement(deleteSQL);
    preparedStatement.setInt(1, Integer.parseInt(pos));
    preparedStatement.setInt(2, Integer.parseInt(id));
  
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

<%@ include file="inc/footer.jsp" %>