<?php

class Personne
{

	public  $id;
	public  $nom;
	public  $prenom;
	public  $ville;
	public  $rue;
	public  $voie;
	public  $code_postal;
	public  $mail;

	function __construct(id, nom, prenom, ville, rue, voie, cp, mail){

		$this ->id = id;
		$this ->nom = nom;
		$this ->prenom = prenom;
		$this ->ville = ville;
		$this ->rue = rue;
		$this ->voie = voie;
		$this ->code_postal = cp;
		$this ->mail = mail;
		
	}


	static function initFrom($data) {
		return new Personne($data['id'], $data['nom'], $data['prenom'],$data['ville'],$data['rue'],$data['voie'],$data['code_postal'],$data['mail']);
	}


}

?>