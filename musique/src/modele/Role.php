<?php 

	class Role{

		public $id;
		public $libelle;

		function __construct(id,libelle){

			$this->id = id;
			$this->libelle = libelle;

		}

		static function initFrom($data) {
			return new Personne($data['id'], $data['libelle']);
		}



	}