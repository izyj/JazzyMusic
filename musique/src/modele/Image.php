<?php 

	class Image{

		$id;
		$path;

		function __construct(id,path){

			$this->id = id;
			$this->path = path;
		}

		static function initFrom($data) {
		return new Image($data['id'], $data['path']);
	}
	}
?>