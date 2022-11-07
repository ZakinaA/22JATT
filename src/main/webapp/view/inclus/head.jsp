<!DOCTYPE html>
<html lang="en">
    <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>Norman'Zik <% if(pageName != "") { out.println(": "+pageName); } %></title>
      <link href="https://simmanagementsystem.com/libs/2JATT/libs/css/NormanZikStyle.css" rel="stylesheet">
      <link href="https://simmanagementsystem.com/libs/2JATT/libs/css/bootstrap.css" rel="stylesheet">
      <link rel="preconnect" href="https://fonts.googleapis.com">
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
      <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@500&display=swap" rel="stylesheet">
      <script src="https://kit.fontawesome.com/e43d5fbf75.js" crossorigin="anonymous"></script>
    </head>
    <style>
        .bgOrange2 {
        background: #E14D2A;
        }
        .btnHover:hover {
            font-weight: 900;
        }

        .testCard:hover {
            transition: 0.66s;
            transform: scale(1.053);
            margin-top: 1.7em;
            box-shadow: 0 1rem 1.7rem rgba(0, 0, 0, 0.055) !important;
        } 
    </style>
    <% if(pageID == "creerGroupe") { %>
        <body style="background-size: cover;-webkit-background-size: cover;-moz-background-size: cover;-o-background-size: cover;background-image: url('https://github.com/ZakinaA/22JATT/blob/design/bg_nouvelle2.png?raw=true'); ">
    <% } else { %>
        <body class="body">  
    <% } %>
