<?php
/* 
 * Klasa odpowiedzialna za łączenie, pobieranie i zwracanie wartości z bazy danych
 * Autor: Kamil Wiczkowski
 * Data: 2015-04-11
 */

class dbController {
    
    private $_connection;
    
    /**
     * Konstruktor
     * @param array $config
     * @return boolean
     */
    public function __construct($config = array()) {
        if (!empty($config)) {
            $connection = mysqli_connect($config['host'], $config['username'], $config['password'], $config['database']);
            if (!empty($connection)) {
                $connection->set_charset("utf8");
                $this->_connection = $connection;
                return true;
            } 
        }
        return false;
    }
    
    /**
     * Wykonanie zapytania i wyciągnięcie danych
     * @param type $sql
     * @return array
     */
    private function _runSQL ($sql) {
        $response = array ();
        if ($result = $this->_connection->query($sql)) {
            while ($row = $result->fetch_assoc()) {
                $response[] = $row;
            }
            $result->free();
        }
        return $response;
    }
    
    /**
     * Pobranie placówek
     * @return array
     */
    public function getBranches () {
        $response = array();
        $sql = 'SELECT * FROM placowka';
        
        $response = $this->_runSQL ($sql);
            
        return $response;
    }
    
    /**
     * Pobranie usług specjalistycznych
     * @return array
     */
    public function getServices () {
        $response = array();
        $sql = 'SELECT * FROM usluga WHERE id_typ_uslugi = 2';
        
        $response = $this->_runSQL ($sql);
            
        return $response;
    }
    
    /**
     * Pobranie Poradni z danego oddziału
     * @param int $idBranch
     * @return array
     */
    public function getBranchClinics ($idBranch) {
        $response = array();
        if (!empty($idBranch)) {
            
            /** LISTA PORADNI W PLACÓWCE DO KTÓREJ PRZYPISANY JEST LEKARZ SPECJALISTA **/
            
            $sql = 'SELECT pl.*, p.*, l.* FROM poradniaplacowka AS pp
                    JOIN poradnia AS p ON p.id_poradni = pp.id_poradni
                    JOIN placowka AS pl ON pl.id_placowki = pp.id_placowki
                    JOIN lekarzplacowka AS lp ON lp.id_placowki = pp.id_placowki
                    JOIN lekarz AS l ON l.id_lekarza = lp.id_lekarza
                    JOIN lekarzporadnia AS lep ON lep.id_lekarza = lp.id_lekarza AND p.id_poradni = lep.id_poradni 
                    WHERE lp.id_stanowiska = 1 AND pp.id_placowki = ' . (int) $idBranch ; 
            
            $response = $this->_runSQL ($sql);
            
        }
        return $response;
    }
    
    /**
     * Wyszukanie lekarzy specjalistów
     * @param int $idBranch
     * @return array
     */
    
    public function getSpecialists ($idBranch, $idService) {
        $response = array();
        if (!empty($idBranch)) {
            
            /** LISTA SPECJALISTÓW W PLACÓWCE WYKONUJĄCYCH DANĄ USŁUGĘ **/
            
            $sql = 'SELECT l.* FROM poradniaplacowka AS pp
                    JOIN poradnia AS p ON p.id_poradni = pp.id_poradni
                    JOIN placowka AS pl ON pl.id_placowki = pp.id_placowki
                    JOIN lekarzplacowka AS lp ON lp.id_placowki = pp.id_placowki
                    JOIN lekarz AS l ON l.id_lekarza = lp.id_lekarza
                    JOIN lekarzporadnia AS lep ON lep.id_lekarza = lp.id_lekarza AND p.id_poradni = lep.id_poradni 
                    JOIN uslugaplacowka AS upl ON upl.id_placowki = pp.id_placowki
                    JOIN uslugaporadnia AS upo ON upo.id_poradni = lep.id_poradni AND upo.id_uslugi = upl.id_uslugi 
                    WHERE lp.id_stanowiska = 1 AND pp.id_placowki = ' . (int) $idBranch ; 
            
            if (!empty($idService)) {
                $sql .= ' AND upl.id_uslugi = ' . (int) $idService ;
            }
            
            $response = $this->_runSQL ($sql);
            
        } elseif (!empty($idService)) {
            /** LISTA SPECJALISTÓW W FIRMIE MEDIC **/
            $sql = 'SELECT l.* FROM uslugaporadnia AS up 
                    JOIN lekarzporadnia AS lp ON lp.id_poradni = up.id_poradni
		    JOIN lekarz AS l ON l.id_lekarza = lp.id_lekarza
		    JOIN usluga AS u ON u.id_uslugi = up.id_uslugi AND u.id_typ_uslugi = 2
		    AND up.id_uslugi =' . (int) $idService ; 
            $response = $this->_runSQL ($sql);
        }
        return $response;
    }
    
    /**
     * Pobranie usług z placówki
     * @param int $idBranch
     * @return array
     */
    public function getBranchServices ($idBranch) {
        $response = array();
        if (!empty($idBranch)) {
            
            /** LISTA USŁUG WYKONYWANYCH W PLACÓWCE **/
            
            $sql = 'SELECT u.* FROM usluga AS u
                    WHERE `id_typ_uslugi` = 1
                    UNION
                    SELECT u.* FROM uslugaplacowka AS up
                    JOIN usluga AS u ON u.id_uslugi = up.id_uslugi
                    WHERE up.id_placowki = ' . (int) $idBranch ; 
            
            $response = $this->_runSQL ($sql);
            
        }
        return $response;
    }    
}

