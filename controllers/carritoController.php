<?php
require_once 'models/producto.php';

class carritoController{
	
	public function index(){
		if(isset($_SESSION['carrito']) && count($_SESSION['carrito']) >= 1){
			$carrito = $_SESSION['carrito'];
		}else{
			$carrito = array();
		}
		require_once 'views/carrito/index.php';
	}
	
	public function add(){
		if(isset($_GET['id'])){
			$producto_id = (int) $_GET['id'];
		}else{
			header('Location:'.base_url);
			exit;
		}

		// Conseguir producto actualizado (para saber el stock real)
		$producto = new Producto();
		$producto->setId($producto_id);
		$producto = $producto->getOne();

		if(!is_object($producto) || $producto->stock < 1){
			$_SESSION['carrito_error'] = "Este producto no tiene stock disponible.";
			header("Location:".base_url."carrito/index");
			exit;
		}

		$counter = 0;
		if(isset($_SESSION['carrito'])){
			foreach($_SESSION['carrito'] as $indice => $elemento){
				if($elemento['id_producto'] == $producto_id){
					if($elemento['unidades'] < $producto->stock){
						$_SESSION['carrito'][$indice]['unidades']++;
					}else{
						$_SESSION['carrito_error'] = "No hay más unidades disponibles de este producto.";
					}
					$counter++;
				}
			}
		}

		if($counter == 0){
			// Añadir al carrito
			$_SESSION['carrito'][] = array(
				"id_producto" => $producto->id,
				"precio" => $producto->precio,
				"unidades" => 1,
				"producto" => $producto
			);
		}

		header("Location:".base_url."carrito/index");
	}
	
	public function delete(){
		if(isset($_GET['index'])){
			$index = $_GET['index'];
			unset($_SESSION['carrito'][$index]);
		}
		header("Location:".base_url."carrito/index");
	}
	
	public function up(){
		if(isset($_GET['index']) && isset($_SESSION['carrito'][$_GET['index']])){
			$index = $_GET['index'];

			$producto = new Producto();
			$producto->setId($_SESSION['carrito'][$index]['id_producto']);
			$actual = $producto->getOne();

			if(is_object($actual) && $_SESSION['carrito'][$index]['unidades'] < $actual->stock){
				$_SESSION['carrito'][$index]['unidades']++;
			}else{
				$_SESSION['carrito_error'] = "No hay más unidades disponibles de este producto.";
			}
		}
		header("Location:".base_url."carrito/index");
	}
	
	public function down(){
		if(isset($_GET['index'])){
			$index = $_GET['index'];
			$_SESSION['carrito'][$index]['unidades']--;
			
			if($_SESSION['carrito'][$index]['unidades'] == 0){
				unset($_SESSION['carrito'][$index]);
			}
		}
		header("Location:".base_url."carrito/index");
	}
	
	public function delete_all(){
		unset($_SESSION['carrito']);
		header("Location:".base_url."carrito/index");
	}
	
}