<?php 

	class Genre{


		public $id;
		public $libelle;

		function __construct(id,libelle){

			$this->libelle = libelle;
			$this->id = id;
		}

		static function initFrom($data) {
			return new Genre($data['id'], $data['libelle']);
		}



	}
?>