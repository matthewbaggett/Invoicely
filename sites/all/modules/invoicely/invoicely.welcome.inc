<?php

function invoicely_welcome(){
  $view = new StdClass();
  $view->user = user_active_record::current();
  return invoicely_template_view('templates/welcome/welcome.phtml', $view);
}