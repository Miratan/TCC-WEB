<!DOCTYPE html>
<html>
<head>

	    <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet">

	    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	    <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
	    
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	
<title>Web - TCC</title>

<script type="text/javascript">

	$(document).ready(function() {
		
		//GET CURRENT URL
		var currentURL = window.location.pathname;
		console.log(currentURL);
	});

</script>

</head>
<body>

    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="">Web TCC</a>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li><a href="login.jsp">Acesso ao Sistema</a></li>
            <li><a href="register.jsp">Cadastrar</a></li>
            <li><a href="#contact">Contato</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>

    <div class="container">

    	<div class="starter-template" style="margin-top:150px;">
<!--         <h1>Bootstrap starter template</h1> -->
<!--         <p class="lead">Use this document as a way to quickly start any new project.<br> All you get is this text and a mostly barebones HTML document.</p> -->
<!--       </div> -->
      
      			<div class="col-md-12">
					<div class="row">
						<h1>Sua primeira vez aqui?</h1>
						<div class="textSize">
							<div class="textInfo">
								<span>Para usar a Ferramenta você precisa criar uma conta
									de acesso.</span>
							</div>
							<div class="textInfo">
								<span>Clique no botão abaixo e preencha o formulário.</span>
							</div>
							<div class="textInfo">
								<span>O acesso a Ferramenta será realizado a partir do Usuário e Senha
									cadastrados a seguir.</span>
							</div>
						</div>
						<div style="margin-top: 10px;">
							<a href="register.jsp"><button type="button"
									class="btn btn-primary dropdown-toggle buttonInputGroup">Cadastrar</button></a>
						</div>
					</div>
				</div>
				
				
		</div>

    </div><!-- /.container -->

</body>
</html>