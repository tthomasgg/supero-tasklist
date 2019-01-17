<%@include file="connection.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Gerenciador de Tasklist 1.0</title>
        <meta contentType="text/html;" charset="UTF-8" />

        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="${root}css/main.css">
        <link rel="stylesheet" href="${bootstrapCssRoot}bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
        <style>
            ul { list-style-type: none; margin: 0; padding: 0; margin-bottom: 10px; }
            li { margin: 5px; padding: 5px; width: 150px; }
        </style>

        <!--<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>-->
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="${bootstrapJsRoot}bootstrap.min.js"></script>
        <script src="${root}js/main.js?v=1"></script>
    </head>
    <body>
    <nav class="navbar navbar-expand-lg">
        <a href="#" class="navbar-brand">Gerenciador de Tasklist</a>
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
              <a class="nav-link" href="${root}">Início <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  Ações
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                  <a class="dropdown-item" href="${root}listar.jsp">Listar</a>
                  <a class="dropdown-item" href="${root}adicionar.jsp">Adicionar</a>
                </div>
              </li>            
        </ul>
    </nav>