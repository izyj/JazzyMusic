<?php

	class Chanson{

	public $id;
	public $libelle;
	public $path;
	public $album;

	function __construct(id,libelle,path,album){

		$this ->id =id;
		$this ->libelle = libelle;
		$this ->path =path;
		$this ->album = album;

	}

	static function initFrom($data) {
		return new Personne($data['id'], $data['libelle'], $data['path'],$data['album']);
	}



	}
?>