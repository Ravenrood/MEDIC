<?php
/**
 * Obsługa i wyswietlenie biblioteki do operacji na tekście
 */
require_once ('lib/stringopr/stringOpr.php');
require_once ('lib/Twig/Autoloader.php');


/* ACTIONS */
$_post = $_POST;

$fraza = '';
if (!empty($_post['fraza'])) {
    $fraza = $_post['fraza'];
}

Twig_Autoloader::register();

// specify where to look for templates
$loader = new Twig_Loader_Filesystem('templates');

// initialize Twig environment
$twig = new Twig_Environment($loader);

// load template
$template = $twig->loadTemplate('library.twig');


if (!empty($fraza)) {
    $stringOpr = new stringOpr($fraza);
    //odwracamy w całości
    $frazaWhole = $stringOpr->reverseWhole();
    //przywracamy
    $stringOpr->reverseWhole();
    //odwracamy w pierwszym
    $frazaFirst = $stringOpr->reverseFirst();
    //przywracamy w pierwszym
    $stringOpr->reverseFirst();
    //odwracamy w całości i potem w pierwszym
    $stringOpr->reverseWhole();
    $frazaWholeFirst = $stringOpr->reverseFirst();
}
// set template variables
// render template
echo $template->render(array(
    'site' => 3,
    'fraza' => $fraza,
    'frazaFirst' => $frazaFirst,
    'frazaWhole' => $frazaWhole,
    'frazaWholeFirst' => $frazaWholeFirst
));



?>