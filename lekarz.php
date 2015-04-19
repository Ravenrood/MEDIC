<?php
/* 
 * Wyszukanie lekarza
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
    $branchId = 0;
} else {
    $branchId = $_get['branch'];
}
if (empty($_get['service'])) {
    $serviceId = 0;
} else {
    $serviceId = $_get['service'];
}




$branches = array();
$services = array();

$branches = $dBAction->getBranches();
$services = $dBAction->getServices();
$specialists = $dBAction->getSpecialists($branchId, $serviceId);

Twig_Autoloader::register();

// specify where to look for templates
$loader = new Twig_Loader_Filesystem('templates');

// initialize Twig environment
$twig = new Twig_Environment($loader);

// load template
$template = $twig->loadTemplate('lekarz.twig');

// set template variables
// render template
echo $template->render(array(
    'branches' => $branches,
    'services' => $services,
    'specialists' => $specialists,
    'branchId' => $branchId,
    'serviceId' => $serviceId,
    'site' => 1
));
