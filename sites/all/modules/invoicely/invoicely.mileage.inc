<?php

function invoicely_mileage_dashboard(){
    $user = user_active_record::current();
    $view = new StdClass();

    $view->mileage_chart_data = array(array('Date', 'Miles'));
    $results = db_query("SELECT yearmonth, SUM(distance) as distance FROM invoicely_mileage_view GROUP BY yearmonth ORDER BY yearmonth");

    foreach($results as $result){
        $view->mileage_chart_data[] = array($result->yearmonth, $result->distance);
    }
    drupal_add_js("https://www.google.com/jsapi");
    drupal_add_js('google.load("visualization", "1", {packages:["corechart"]});', 'inline');

    return invoicely_template_view('templates/mileage/dashboard.phtml', $view);
}

