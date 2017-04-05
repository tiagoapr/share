<?php
session_start();
include 'session.php';
if( !isset($_SESSION['role']) || $_SESSION['role']!=1  ) { 
	header("location:index.php");
}
?>

<!DOCTYPE html>
<html>
<head>
	<title>Versão Desportiva - Administração</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta charset="utf-8" />

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
<body>
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

	<div class="page-content">
		<div class="row">		  
			<div class="col-md-2">
				<div class="sidebar content-box" style="display: block;">
					<ul class="nav">
						<!-- Main menu -->
						<li class="current"><a href="home.php"><i class="glyphicon glyphicon-home"></i>Início</a></li>
						<li><a href="cars.php"><i class="glyphicon glyphicon-list"></i>Automóveis</a></li>
					</ul>
				</div>
			</div>

			<div class="col-md-10">			
				<div class="content-box-large">
					<div class="panel-body">
						<fieldset>
							<legend>Início</legend>
							<form action="upload.php" method="post" enctype="multipart/form-data" class="row">
								<div class="form-group col-md-4">
									<label>Adicionar Imagem Fundo</label>
									<div class="input-group">
										<input type="file" name="fileToUpload" id="fileToUpload" class="form-control btn btn-default"/>
										<span class="input-group-btn">
											<button type="submit" class="btn btn-primary">Upload</button>
										</span>
									</div>
								</div>
							</form>
						</fieldset>
						<div class="table-responsive" style="margin-top:25px;">
							<table class="table text-center">
								<thead>
									<tr>
										<th class="text-center">Imagem</th>
										<th class="text-center">Nome</th>
										<th class="text-center">Remover</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="col-md-4">
											<img width="128px;" src="imagens/pagina_inicio/09.jpg"/>
										</td>
										<td>
											<span>Mark</span>
										</td>
										<td>
											<a href="#"><img width="16px;" src="imagens/remove.png"/></a>
										</td>
									</tr>
									<tr>
										<td class="col-md-4">
											<img width="128px;" src="imagens/pagina_inicio/09.jpg"/>
										</td>
										<td>
											<span>Mark</span>
										</td>
										<td>
											<a href="#"><img width="16px;" src="imagens/remove.png"/></a>
										</td>
									</tr>
									<tr>
										<td class="col-md-4">
											<img width="128px;" src="imagens/pagina_inicio/09.jpg"/>
										</td>
										<td>
											<span>Mark</span>
										</td>
										<td>
											<a href="#"><img width="16px;" src="imagens/remove.png"/></a>
										</td>
									</tr>
								</tbody>
							</table>
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