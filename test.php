<?php 
 
   /*require_once("classes/db.class.php");
   //date_default_timezone_set('America/Sao_Paulo'); 
   

     $banco= new DB;
	 $banco->conectaDB();
	 $conecta=$banco;
	 if($conecta!==FALSE){
		 $sql="SELECT * FROM Patrimonio WHERE situacao = 1";
		 $res=mysql_query($sql,$conecta);
		 	if ($res===FALSE){
			echo"<h3 align='center'>Não há patrimonios ativos</h3><a href='relatorio.php'><input type='button' value='Voltar' /></a> <hr />";
			}
		    else{
				   $tabela='';
					while($patrimonio=mysql_fetch_assoc($res)){
						
						$tabela.="<tr> <td>".$patrimonio["num_patrimonio"]."</td><td>".$patrimonio["tipo"]."</td><td>".$patrimonio["num_posicionamento"]."</td><td>".$patrimonio["situacao"]."</td></tr>";
						
						}				
				}
	} */
	
	
	
  $relatorio='
<html>
<head>
<style>
        *
        {
            margin:0;
            padding:0;
            font-family:Arial;
            font-size:10pt;
            color:#000;
        }
        body
        {
            width:100%;
            font-family:Arial;
            font-size:10pt;
            margin:0;
            padding:0;
        }
         
        p
        {
            margin:0;
            padding:0;
        }
         
        #wrapper
        {
            width:180mm;
            margin:0 15mm;
        }
         
        .page
        {
            height:297mm;
            width:210mm;
            page-break-after:always;
        }
 
        table
        {
            border-left: 1px solid #ccc;
            border-top: 1px solid #ccc;
             
            border-spacing:0;
            border-collapse: collapse; 
             
        }
         
        table td 
        {
            border-right: 1px solid #ccc;
            border-bottom: 1px solid #ccc;
            padding: 2mm;
        }
		table th
        {
            border-right: 1px solid #ccc;
            border-bottom: 1px solid #ccc;
            padding: 2mm;
			background:#eee;

        }
         
        table.heading
        {
            height:50mm;
        }
         
        h1.heading
        {
            font-size:14pt;
            color:#000;
            font-weight:normal;
        }
         
        h2.heading
        {
            font-size:9pt;
            color:#000;
            font-weight:normal;
        }
         
        hr
        {
            color:#ccc;
            background:#ccc;
        }
         
        #invoice_body
        {
            height: 149mm;
        }
         
        #invoice_body , #invoice_total
        {   
            width:100%;
        }
        #invoice_body table , #invoice_total table
        {
            width:100%;
            border-left: 1px solid #ccc;
            border-top: 1px solid #ccc;
     
            border-spacing:0;
            border-collapse: collapse; 
             
            margin-top:5mm;
        }
         
        #invoice_body table td , #invoice_total table td
        {
            text-align:center;
            font-size:9pt;
            border-right: 1px solid #ccc;
            border-bottom: 1px solid #ccc;
            padding:2mm 0;
        }
         
        #invoice_body table td.mono  , #invoice_total table td.mono
        {
            font-family:monospace;
            text-align:right;
            padding-right:3mm;
            font-size:10pt;
        }
         
        #footer
        {   
            width:180mm;
            margin:0 15mm;
            padding-bottom:3mm;
        }
        #footer table
        {
            width:100%;
            border-left: 1px solid #ccc;
            border-top: 1px solid #ccc;
             
            background:#eee;
             
            border-spacing:0;
            border-collapse: collapse; 
        }
        #footer table td
        {
            width:25%;
            text-align:center;
            font-size:9pt;
            border-right: 1px solid #ccc;
            border-bottom: 1px solid #ccc;
        }
    </style>
</head>
<body>
<hr>

        <h2 align="center"> Relatório de Bens Ativos</h2>';




$relatorio.='
<table align="center">
 
 </table>
 
  <br>
  <br> 
 <table align="center">
 <tr>
 <th>Número do patrimônio </th> <th>Tipo</th> <th>Nº de posicionamento</th> <th>Situação</th>
 </tr>
 '.$tabela.'
  </table>
  

<htmlpagefooter name="footer">
<hr />
<div id="footer"> 
    <table>
        <tr><td>Paróquia Santa Lúcia</td></tr>
    </table>
</div>
</htmlpagefooter>
<sethtmlpagefooter name="footer" value="on" />
</body>
</html>
';
  
  
  include('MPDF57/mpdf.php');
  $mpdf=new mPDF('c','A4','','' , 0 , 0 , 0 , 0 , 0 , 0); 
  $mpdf->SetDisplayMode('fullpage');
  $mpdf->list_indent_first_level = 0; 
  $mpdf->WriteHTML($relatorio);
  $mpdf->Output();
  exit();
  
 ?>
 
