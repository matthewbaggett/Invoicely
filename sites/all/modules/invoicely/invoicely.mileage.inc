<?php

function invoicely_mileage_dashboard(){
    $user = user_active_record::current();
    $view = new StdClass();

    $view->mileage_chart_data = array(array('Date', 'Miles', 'Cumulative'));
    $results = db_query("
      SELECT
        yearmonth,
        SUM(distance) as distance
      FROM
        invoicely_mileage_view
      WHERE
        uid = {$user->uid}
      GROUP BY yearmonth
      ORDER BY yearmonth
    ");

    $cumulative = 0;
    foreach($results as $result){
        $cumulative = $cumulative + floatval($result->distance);
        $view->mileage_chart_data[] = array($result->yearmonth, floatval($result->distance), $cumulative);
    }
    drupal_add_js("https://www.google.com/jsapi");
    drupal_add_js('google.load("visualization", "1", {packages:["corechart"]});', 'inline');

    return invoicely_template_view('templates/mileage/dash.phtml', $view);
}

