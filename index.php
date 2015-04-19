<?php
/* 
 * Pobieranie Usług i lekarzy dla placówki
 * Autor: Kamil Wiczkowski
 * Data: 2015-04-11
 */

require_once ('include/config.php');
require_once ('include/dbController.php');
require_once('lib/Twig/Autoloader.php');

/* ACTIONS */
$_get = $_GET;
$dBAction = new dbController($config['db']);
/* Jeżeli nie ustawiona placówka to ustaw 1 */
if (empty($_get['branch'])) {
    $branchId = 1;
} else {
    $branchId = $_get['branch'];
}

$branches = array();
$clinics = array();
$services = array();

$branches = $dBAction->getBranches();
$clinics = $dBAction->getBranchClinics($branchId);
$services = $dBAction->getBranchServices($branchId);

Twig_Autoloader::register();

// specify where to look for templates
$loader = new Twig_Loader_Filesystem('templates');

// initialize Twig environment
$twig = new Twig_Environment($loader);

// load template
$template = $twig->loadTemplate('index.twig');

// set template variables
// render template
echo $template->render(array(
    'branches' => $branches,
    'clinics' => $clinics,
    'services' => $services,
    'branchId' => $branchId,
    'site' => 0
));
