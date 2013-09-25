<?php

include_once(dirname(__FILE__) . '/includes/invoicely.inc');

function invoicely_form_system_theme_settings_alter(&$form, $form_state, $form_id = NULL) {
  // Work-around for a core bug affecting admin themes. See issue #943212.
  if (isset($form_id)) {
    return;
  }

  $form['invoicely'] = array(
    '#type' => 'fieldset',
    '#title' => t('Bootstrap settings'),
  );

  $form['invoicely']['invoicely_cdn'] = array(
    '#type' => 'select',
    '#title' => t('BootstrapCDN'),
    '#options' => drupal_map_assoc(array(
      '3.0.0',
    )),
    '#default_value' => theme_get_setting('invoicely_cdn'),
    '#empty_option' => t('Disabled'),
    '#empty_value' => NULL,
    '#description' => t('Use !invoicelycdn to serve the Bootstrap framework files. Enabling this setting will prevent this theme from attempting to load any Bootstrap framework files locally.', array('!invoicelycdn' => l('BootstrapCDN', 'http://invoicelycdn.com', array('external' => TRUE)))) . '<div class="alert alert-error">' . t('WARNING: Using this content distribution network will give you a performance boost but will also make you dependant on a third party who has no obligations towards you concerning uptime and service quality.') . '</div>',
  );

  $form['invoicely']['invoicely_rebuild_registry'] = array(
    '#type' => 'checkbox',
    '#title' => t('Rebuild theme registry on every page.'),
    '#default_value' => theme_get_setting('invoicely_rebuild_registry'),
    '#description' => t('During theme development, it can be very useful to continuously <a href="!link">rebuild the theme registry</a>.') . '<div class="alert alert-error">' . t('WARNING: this is a huge performance penalty and must be turned off on production websites. ') . l('Drupal.org documentation on theme-registry.', 'http://drupal.org/node/173880#theme-registry'). '</div>',
  );
}
