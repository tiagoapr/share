<?php
  session_start();

  include 'session.php';
  include 'db-config/db.php';
  
  if( !isset($_SESSION['role']) || $_SESSION['role'] != 1 ) { 
    header("location:index.php");
    return;
  }

  $sql = "SELECT * FROM cars;";
  $carsBD = mysql_query($sql) or die(mysql_error());

?>
<!DOCTYPE html>
<html>
<head>
	<title>Versão Desportiva - Administração</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta charset="utf-8" />
	<!-- jQuery UI -->
	<link href="https://code.jquery.com/ui/1.10.3/themes/redmond/jquery-ui.css" rel="stylesheet" media="screen">
	<!-- Bootstrap -->
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<!-- styles -->
	<link href="css/styles.css" rel="stylesheet">
	<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
	<link href="vendors/form-helpers/css/bootstrap-formhelpers.min.css" rel="stylesheet">
	<link href="vendors/select/bootstrap-select.min.css" rel="stylesheet">
	<link href="vendors/tags/css/bootstrap-tags.css" rel="stylesheet">
	<link href="css/forms.css" rel="stylesheet">
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
					  <li><a href="home.php"><i class="glyphicon glyphicon-home"></i>Início</a></li>
					  <li class="current"><a href="cars.php"><i class="glyphicon glyphicon-list"></i>Automóveis</a></li>
					</ul>
				</div>
			</div>
			  
			<div class="col-md-10">
				<div class="content-box-large">
					<div class="panel-body">              
						<fieldset>
							<legend>Automóveis</legend>
							<form action="upload.php" method="post" enctype="multipart/form-data">
								<div class="form-group col-md-4">
									<label>Imagem Fundo</label>
									<div class="input-group">
										<input type="file" name="fileToUpload" id="fileToUpload" class="form-control btn btn-default"/>
										<span class="input-group-btn">
											<button type="submit" class="btn btn-primary">Upload</button>
										</span>
									</div>
								</div>
								<div class="col-md-2">
									<img width="128px;" src="imagens/pagina_automoveis/fundo.jpg"/>
								</div>
								<div class="form-group col-md-4">
									<label>Cor Texto (legenda)</label>
									<div class="bfh-colorpicker" data-name="colorpicker1"></div>
								</div>
							</form>
						</fieldset>
					</div>
			  	</div>

				<div class="content-box-large">
					<div class="panel-body">              
						<fieldset>
							<legend>Carros a apresentar</legend>
							<a href="car.php?a=n"><button class="btn btn-primary">Adicionar</button></a>
						</fieldset>
						<div class="table-responsive" style="margin-top:25px;">
							<table class="table text-center">
								<thead>
									<tr>
										<th class="text-center">Imagem</th>
										<th class="text-center">Nome</th>
										<th class="text-center">Opções</th>
									</tr>
								</thead>
								<tbody>
									<?php
									while($carRow = mysql_fetch_array($carsBD)){
										echo 
										'<tr>
											<td class="col-md-4">
												<img width="128px;" src="imagens/pagina_inicio/09.jpg"/>
											</td>
											<td>
												<span>'
												.$carRow['title'].
												'</span>
											</td>
											<td>
												<a href="#"><img width="16px;" src="imagens/remove.png"/></a>
											</td>
										</tr>'
										;
									}
									?>
								</tbody>
							</table>
						</div>             
					</div>
				</div>
			</div><!-- main col 10 -->
		</div>
    </div><!-- end content -->

    <footer>
        <div class="container">
            <div class="copy text-center">
               &copy; Codeseason 2017 <a href='http://www.codeseason.com'>www.codeseason.com</a>
            </div>
        </div>
    </footer>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://code.jquery.com/jquery.js"></script>
    <!-- jQuery UI -->
    <script src="https://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="vendors/form-helpers/js/bootstrap-formhelpers.min.js"></script>
    <script src="vendors/select/bootstrap-select.min.js"></script>
    <script src="vendors/tags/js/bootstrap-tags.min.js"></script>
    <script src="vendors/mask/jquery.maskedinput.min.js"></script>
    <script src="vendors/moment/moment.min.js"></script>
    <script src="vendors/wizard/jquery.bootstrap.wizard.min.js"></script>
    <!-- bootstrap-datetimepicker -->
    <link href="vendors/bootstrap-datetimepicker/datetimepicker.css" rel="stylesheet">
    <script src="vendors/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
    <link href="//cdnjs.cloudflare.com/ajax/libs/x-editable/1.5.0/bootstrap3-editable/css/bootstrap-editable.css" rel="stylesheet"/>
	<script src="//cdnjs.cloudflare.com/ajax/libs/x-editable/1.5.0/bootstrap3-editable/js/bootstrap-editable.min.js"></script>
    <script src="js/custom.js"></script>
    <script src="js/forms.js"></script>
</body>
</html>