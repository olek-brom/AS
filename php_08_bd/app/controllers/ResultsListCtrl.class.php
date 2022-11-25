<?php

namespace app\controllers;

use PDOException;

class ResultsListCtrl {

        private $hide_intro; //zmienna informująca o tym czy schować intro
	private $records; //rekordy pobrane z bazy danych

	public function __construct(){
            $this->hide_intro = true;
	}
		
	public function validate() {
	}
	
	public function action_resultsList(){
		
		try{
			$this->records = getDB()->select("results", [
					"id_result",
					"kwota",
					"lata",
					"oprocentowanie",
                                        "result",
                                        "timestamp",
				]);
		} catch (PDOException $e){
			getMessages()->addError('Wystąpił błąd podczas pobierania rekordów');
			if (getConf()->debug) getMessages()->addError($e->getMessage());			
		}	
		
		// 4. wygeneruj widok
                getSmarty()->assign('hide_intro',$this->hide_intro);
                getSmarty()->assign('page_title','Lista wyników');
		getSmarty()->assign('results',$this->records);  // lista rekordów z bazy danych
		getSmarty()->display('ResultsList.tpl');
	}
	
}
