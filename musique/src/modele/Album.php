<?php 

	class Album{

	public $id;
	public $libelle;
	public $dateajout;
	public $dateparution;
	public $image;


	function __construct(id, libelle,dateajout,dateparution, image){

	$this ->id = id;
	$this ->libelle =libelle; 
	$this ->dateparution =dateparution;
	$this ->dateajout = dateajout;
	$this ->image = image;
	}

	static function initFrom($data) {
		return new Album($data['id'], $data['libelle'], $data['dateparution'],$data['dateajout'],$data['image']);
	}


	} 