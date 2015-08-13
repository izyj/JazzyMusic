<?php

class Artiste {
	
	public $id
	public $libelle
	public $image 


	function __construct(id, libelle, image){

	$this ->id = id;
	$this ->libelle =libelle; 
	$this ->image = image;
	}

	static function initFrom($data) {
		return new Artiste($data['id'], $data['libelle'], $data['image']);
	}

}
?>