<?php
// W skrypcie definicji kontrolera nie trzeba dołączać problematycznego skryptu config.php,
// ponieważ będzie on użyty w miejscach, gdzie config.php zostanie już wywołany.

require_once $conf->root_path.'/lib/smarty/Smarty.class.php';
require_once $conf->root_path.'/lib/Messages.class.php';
require_once $conf->root_path.'/app/CalcForm.class.php';
require_once $conf->root_path.'/app/CalcResult.class.php';

/** Kontroler kalkulatora
 * @author Przemysław Kudłacik
 *
 */
class CalcCtrl {

	private $msgs;   //wiadomości dla widoku
	private $form;   //dane formularza (do obliczeń i dla widoku)
	private $result; //inne dane dla widoku
	private $hide_intro; //zmienna informująca o tym czy schować intro

	/** 
	 * Konstruktor - inicjalizacja właściwości
	 */
	public function __construct(){
		//stworzenie potrzebnych obiektów
		$this->msgs = new Messages();
		$this->form = new CalcForm();
		$this->result = new CalcResult();
		$this->hide_intro = false;
	}
	
	/** 
	 * Pobranie parametrów
	 */
	public function getParams(){
		$this->form->kwota = isset($_REQUEST ['kwota']) ? $_REQUEST ['kwota'] : null;
		$this->form->lata = isset($_REQUEST ['lata']) ? $_REQUEST ['lata'] : null;
		$this->form->oprocentowanie = isset($_REQUEST ['oprocentowanie']) ? $_REQUEST ['oprocentowanie'] : null;
	}
	
	/** 
	 * Walidacja parametrów
	 * @return true jeśli brak błedów, false w przeciwnym wypadku 
	 */
	public function validate() {
		// sprawdzenie, czy parametry zostały przekazane
		if (! (isset ( $this->form->kwota ) && isset ( $this->form->lata ) && isset ( $this->form->oprocentowanie ))) {
			// sytuacja wystąpi kiedy np. kontroler zostanie wywołany bezpośrednio - nie z formularza
			return false; //zakończ walidację z błędem
		} else { 
			$this->hide_intro = true; //przyszły pola formularza, więc - schowaj wstęp
		}
		
		// sprawdzenie, czy potrzebne wartości zostały przekazane
		if ($this->form->kwota == "") {
			$this->msgs->addError('Nie podano kwoty kredytu');
		}
		if ($this->form->lata == "") {
			$this->msgs->addError('Nie podano okresu spłaty');
		}
		if ($this->form->oprocentowanie == "") {
			$this->msgs->addError('Nie podano oprocentowania');
		}
                
		
		// nie ma sensu walidować dalej gdy brak parametrów
		if (! $this->msgs->isError()) {
			
			// sprawdzenie, czy $x i $y są liczbami całkowitymi
			if (! is_numeric ( $this->form->kwota )) {
				$this->msgs->addError('Kwota kredytu nie jest liczbą');
			}
			
			if (! is_numeric ( $this->form->lata )) {
				$this->msgs->addError('Okres spłaty nie jest liczbą');
			}
			if (! is_numeric ( $this->form->oprocentowanie )) {
				$this->msgs->addError('Oprocentowanie nie jest liczbą');
			}
		}
		
		return ! $this->msgs->isError();
	}
	
	/** 
	 * Pobranie wartości, walidacja, obliczenie i wyświetlenie
	 */
	public function process(){

		$this->getparams();
		
		if ($this->validate()) {
				
			//konwersja parametrów na int
			$this->form->kwota = floatval($this->form->kwota);
			$this->form->lata = floatval($this->form->lata);
                        $this->form->oprocentowanie = floatval($this->form->oprocentowanie);
			$this->msgs->addInfo('Parametry poprawne.');
                        
                        $this->result->result = (($this->form->kwota) * ($this->form->oprocentowanie)/100 + ($this->form->kwota)) / (12 * ($this->form->lata));
				
//			//wykonanie operacji
//			switch ($this->form->op) {
//				case 'minus' :
//					$this->result->result = $this->form->x - $this->form->y;
//					$this->result->op_name = '-';
//					break;
//				case 'times' :
//					$this->result->result = $this->form->x * $this->form->y;
//					$this->result->op_name = '*';
//					break;
//				case 'div' :
//					$this->result->result = $this->form->x / $this->form->y;
//					$this->result->op_name = '/';
//					break;
//				default :
//					$this->result->result = $this->form->x + $this->form->y;
//					$this->result->op_name = '+';
//					break;
//			}
			
			$this->msgs->addInfo('Wykonano obliczenia.');
		}
		
		$this->generateView();
	}
	
	
	/**
	 * Wygenerowanie widoku
	 */
	public function generateView(){
		global $conf;
		
		$smarty = new Smarty();
		$smarty->assign('conf',$conf);
		
		$smarty->assign('page_title','Kalkulator kredytowy');
		$smarty->assign('page_description','Obiektowość. Funkcjonalność aplikacji zamknięta w metodach różnych obiektów. Pełen model MVC.');
		$smarty->assign('page_header','Obiekty w PHP');
				
		$smarty->assign('hide_intro',$this->hide_intro);
		
		$smarty->assign('msgs',$this->msgs);
		$smarty->assign('form',$this->form);
		$smarty->assign('res',$this->result);
		
		$smarty->display($conf->root_path.'/app/CalcView.html');
	}
}

//
//
//
//
//
//
//
//
//
////pobranie parametrów
//function getParams(&$form){
//	$form['kwota'] = isset($_REQUEST['kwota']) ? $_REQUEST['kwota'] : null;
//	$form['lata'] = isset($_REQUEST['lata']) ? $_REQUEST['lata'] : null;
//	$form['oprocentowanie'] = isset($_REQUEST['oprocentowanie']) ? $_REQUEST['oprocentowanie'] : null;	
//}
//
////walidacja parametrów z przygotowaniem zmiennych dla widoku
//function validate(&$form,&$infos,&$msgs,&$hide_intro){
//
//	//sprawdzenie, czy parametry zostały przekazane - jeśli nie to zakończ walidację
//	if ( ! (isset($form['kwota']) && isset($form['lata']) && isset($form['oprocentowanie']) ))	return false;	
//	
//	//parametry przekazane zatem
//	//nie pokazuj wstępu strony gdy tryb obliczeń (aby nie trzeba było przesuwać)
//	// - ta zmienna zostanie użyta w widoku aby nie wyświetlać całego bloku itro z tłem 
//	$hide_intro = true;
//
//	$infos [] = 'Przekazano parametry.';
//
//	// sprawdzenie, czy potrzebne wartości zostały przekazane
//	if ( $form['kwota'] == "") $msgs [] = 'Nie podano kwoty kredytu';
//	if ( $form['lata'] == "") $msgs [] = 'Nie podano okresu spłaty';
//	if ( $form['oprocentowanie'] == "") $msgs [] = 'Nie podano oprocentowania';
//        
//	//nie ma sensu walidować dalej gdy brak parametrów
//	if ( count($msgs)==0 ) {
//		// sprawdzenie, czy $x i $y są liczbami całkowitymi
//		if (! is_numeric( $form['kwota'] )) $msgs [] = 'Kwota kredytu nie jest liczbą';
//		if (! is_numeric( $form['lata'] )) $msgs [] = 'Okres spłaty nie jest liczbą';
//                if (! is_numeric( $form['oprocentowanie'] )) $msgs [] = 'Oprocentowanie nie jest liczbą';
//	}
//	
//	if (count($msgs)>0) return false;
//	else return true;
//}
//	
//// wykonaj obliczenia
//function process(&$form,&$infos,&$msgs,&$result){
//	$infos [] = 'Parametry poprawne. Wykonuję obliczenia.';
//	
//	//konwersja parametrów na int
//	$form['kwota'] = floatval($form['kwota']);
//	$form['lata'] = floatval($form['lata']);
//        $form['oprocentowanie'] = floatval($form['oprocentowanie']);
//	
//	//wykonanie operacji
//	$result = ($form['kwota'] * $form['oprocentowanie']/100 + $form['kwota']) / (12 * $form['lata']);
//}
//
////inicjacja zmiennych
//$form = null;
//$infos = array();
//$messages = array();
//$result = null;
//$hide_intro = false;
//	
//getParams($form);
//if ( validate($form,$infos,$messages,$hide_intro) ){
//	process($form,$infos,$messages,$result);
//}
//
//// 4. Przygotowanie danych dla szablonu
//
//$smarty = new Smarty();
//
//$smarty->assign('app_url',_APP_URL);
//$smarty->assign('root_path',_ROOT_PATH);
//$smarty->assign('page_title','Przykład 04');
//$smarty->assign('page_description','Profesjonalne szablonowanie oparte na bibliotece Smarty');
//$smarty->assign('page_header','Szablony Smarty');
//
//$smarty->assign('hide_intro',$hide_intro);
//
////pozostałe zmienne niekoniecznie muszą istnieć, dlatego sprawdzamy aby nie otrzymać ostrzeżenia
//$smarty->assign('form',$form);
//$smarty->assign('result',$result);
//$smarty->assign('messages',$messages);
//$smarty->assign('infos',$infos);
//
//// 5. Wywołanie szablonu
//$smarty->display(_ROOT_PATH.'/app/calc.html');