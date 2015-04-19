<?php
/* 
 * Schemat Bazy danych
 * Autor: Kamil Wiczkowski
 * Data: 2015-04-11
 */

require_once ('include/config.php');
require_once ('include/dbController.php');
require_once('lib/Twig/Autoloader.php');

/* ACTIONS */
$_get = $_GET;
$dBAction = new dbController($config['db']);

Twig_Autoloader::register();

// specify where to look for templates
$loader = new Twig_Loader_Filesystem('templates');

// initialize Twig environment
$twig = new Twig_Environment($loader);

// load template
$template = $twig->loadTemplate('schemat.twig');

// set template variables
// render template
echo $template->render(array(
    'branches' => $branches,
    'clinics' => $clinics,
    'services' => $services,
    'branchId' => $branchId,
    'site' => 2
));


?>