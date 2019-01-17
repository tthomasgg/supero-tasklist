<%@include file="inc/header.jsp"%>

<%
    String selectTableSQL = "SELECT * FROM tb_tasks ORDER BY dt_remocao, dt_conclusao DESC, dt_criacao DESC";
    Statement statement = connection.createStatement();
    ResultSet rs = statement.executeQuery(selectTableSQL);
%>

<div class="container-fluid">
    <div class="row">
        <div class="col col-xl-12">
            <a href="${root}adicionar.jsp"><button type="button" class="btn btn-primary">Adicionar <i class="far fa-calendar-plus"></i></button></a>
        </div>
    </div>
</div>

<div class="container-fluid containerListagem">
    <div class="row">
        <div class="col col-xl-12">
            <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Titulo</th>
                            <th scope="col">Status:</th>
                            <th scope="col">Adicionada em:</th>
                            <th scope="col">Editada em:</th>
                            <th scope="col">Finalizada em:</th>
                            <th scope="col">Removida em:</th>
                            <th scope="col">Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                        while (rs.next()) {
                            String titulo = rs.getString("de_titulo");
                            String id = rs.getString("cd_task");
                            String status = rs.getString("de_status");
                            String criacao = rs.getString("dt_criacao") == null ? "" : rs.getString("dt_criacao");
                            String edicao = rs.getString("dt_edicao") == null ? "" : rs.getString("dt_edicao");
                            String conclusao = rs.getString("dt_conclusao") == null ? "" : rs.getString("dt_conclusao");
                            String remocao = rs.getString("dt_remocao") == null ? "" : rs.getString("dt_remocao");
                    %>                        
                            <tr>
                                <th scope="row"><%=id%></th>
                                <td><%=titulo%></td>
                                <td class="
                                <%
                                if ("FINALIZADA".equals(status)) {
                                    out.println("text-success");
                                } else if ("REMOVIDA".equals(status)) {
                                    out.println("text-secondary");
                                } else {
                                    out.println("text-primary");
                                }
                                %>
                                "><%=status%></td>
                                <td><%=criacao%></td>
                                <td><%=edicao%></td>
                                <td><%=conclusao%></td>
                                <td><%=remocao%></td>
                                <td>
                                    <%
                                        if (!"REMOVIDA".equals(status)) {
                                            if (!"FINALIZADA".equals(status)) {
                                    %>
                                                <a href="${root}finalizar.jsp?id=<%=id%>"><button type="button" class="btn btn-primary">Finalizar</button></a>
                                    <%      
                                            }
                                    %>
                                            <a href="${root}editar.jsp?id=<%=id%>"><i class="far fa-edit"></i></a>
                                            <a href="${root}deletar.jsp?id=<%=id%>"><i class="far fa-trash-alt"></i></a>
                                    <%
                                        }
                                    %>                                    
                                </td>
                            </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>
            <div class="list-group" id="sortable">
                <%
                while (rs.next()) {
                    String titulo = rs.getString("de_titulo");
                    String id = rs.getString("cd_task");
                    String status = rs.getString("de_status");
                %>
                <div data-id="<%=id%>" class="list-group-item list-group-item-action ui-state-default
                    <% if ("REMOVIDA".equals(status)) { out.println("disabled"); }
                    %>
                    ">
                    <div class="container-fluid">
                        <div class="row justify-content-start">
                                <div class="col-6">
                                    <a href="${root}editar.jsp?id=<%=id%>" class="
                                    <%
                                        if ("FINALIZADA".equals(status)) {
                                            out.println("text-success");
                                        } else if ("REMOVIDA".equals(status)) {
                                            out.println("text-secondary");
                                        } else {
                                            out.println("text-primary");
                                        }
                                    %>
                                        "><%=titulo%></a>
                                </div>
                                <div class="col-6 text-right">
                                    <%
                                        if (!"REMOVIDA".equals(status)) {
                                            if (!"FINALIZADA".equals(status)) {
                                    %>
                                                <a href="${root}finalizar.jsp?id=<%=id%>"><button type="button" class="btn btn-primary">Finalizar</button></a>
                                    <%      
                                            }
                                    %>
                                            <a href="${root}editar.jsp?id=<%=id%>"><i class="far fa-edit"></i></a>
                                            <a href="${root}deletar.jsp?id=<%=id%>"><i class="far fa-trash-alt"></i></a>
                                    <%
                                        }
                                    %>
                                </div>
                        </div>
                    </div>
                </div>
                <%
                }
                %>
            </div>
        </div>
    </div>
</div>

<%@ include file="inc/footer.jsp" %>