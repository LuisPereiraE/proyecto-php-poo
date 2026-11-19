<?php

class Database{
	public static function connect(){
		// Datos por defecto (WAMP local)
		$config = [
			'host' => 'localhost',
			'user' => 'root',
			'pass' => '',
			'name' => 'tienda_master'
		];

		// Si existe db.local.php (hosting), usa esos datos
		$local = __DIR__ . '/db.local.php';
		if(file_exists($local)){
			$config = array_merge($config, require $local);
		}

		$db = new mysqli($config['host'], $config['user'], $config['pass'], $config['name']);
		$db->query("SET NAMES 'utf8'");
		return $db;
	}
}
