<?php
/* 
 * Biblioteka do operacji na tekście
 * Autor: Kamil Wiczkowski
 * Data: 2015-04-19
 */

class stringOpr {
    
    private $_stringArray;
    
    /**
     * Konstruktor
     * @param string $string
     * return bool
     */
    public function __construct($string) {
        $array = array();
        if (!empty($string)) {
            $array = explode(' ', $string);
        }
        $this->_stringArray = $array;
    }
    
    /**
     * Odbij element
     * @param type $elementNumber
     */
    private function _reverseIt($elementNumber = NULL) {
        if (!empty($elementNumber) ||  0 === $elementNumber) {
            //odbij wyraz
            $this->_stringArray[$elementNumber] = strrev($this->_stringArray[$elementNumber]);
        } else {
            //odbij cały ciąg
            $string = join(' ', $this->_stringArray);
            $string = strrev($string);
            $this->_stringArray = explode (' ', $string);
        }
    }
    
    /**
     * odbij pierwszy element
     * @return type
     */
    public function reverseFirst () {
        $this->_reverseIt(0);
        return join(' ', $this->_stringArray); 
    }
    
    /**
     * odbij całą frazę
     * @return type
     */
    public function reverseWhole () {
        $this->_reverseIt();
        return join(' ', $this->_stringArray); 
    }
    
}

