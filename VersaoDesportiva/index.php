<!DOCTYPE html>
<html>
	<head>
		<title>Versão Desportiva - Administração</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- Bootstrap -->
		<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<!-- styles -->
		<link href="css/styles.css" rel="stylesheet">
		<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		  <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
		<![endif]-->
	</head>
	
	
	<body class="login-bg">
		<div class="header">
		   <div class="container">
			  <div class="row">
				 <div class="col-md-7">
					<!-- Logo -->
					<div class="logo">
					   <img height="80px;" src="imagens/logotipo/02.png"/>
					</div>
				 </div>
			  </div>
		   </div>
		</div>

		<div class="page-content container" style="margin-top:10%;">
			<div class="row">
				<div class="col-md-4 col-md-offset-4">
					<div class="login-wrapper">
						<div class="box">
							<div class="content-wrap">
								<form action="users_management.php" method="post">
									<input name="email" class="form-control" type="text" placeholder="Utilizador">
									<input name="pass" class="form-control" type="password" placeholder="Password">
									<div class="action text-right">
										<button class="btn btn-primary signup" >Entrar</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<footer>
			 <div class="container">
				<div class="copy text-center">
				   &copy; Codeseason 2017 <a href='http://www.codeseason.com'>www.codeseason.com</a>
				</div>
			</div>
		</footer>

		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="https://code.jquery.com/jquery.js"></script>
		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<script src="bootstrap/js/bootstrap.min.js"></script>
		<script src="js/custom.js"></script>
	</body>
</html>