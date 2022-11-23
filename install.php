#! /usr/bin/env php 
<?php

    $database = basename(getcwd());
    exec('mysql -u root -proot -e "create database ' . $database . '"');

    // settings.php
    $settings = file_get_contents('web/sites/default/default.settings.php');
    $settings .="
\$databases['default']['default'] = [
  'database' => '$database',
  'username' => 'root',
  'password' => 'root',
  'host' => 'localhost',
  'port' => '3306',
  'driver' => 'mysql',
];
\$settings['hash_salt'] = file_get_contents('sites/default/saltkey.php');
\$settings['config_sync_directory'] = '../config/sync';
\$settings['file_private_path'] = '../private-files';
if (file_exists(\$app_root . '/' . \$site_path . '/settings.local.php')) {
  include \$app_root . '/' . \$site_path . '/settings.local.php';
}\n";
    file_put_contents('web/sites/default/settings.php', $settings);
    echo "Set settings.php\n";

    // settings.local.php
    $local_settings = file_get_contents('web/sites/example.settings.local.php');
    $local_settings .= "
\$settings['container_yamls'][] = DRUPAL_ROOT . '/sites/development.services.local.yml';
\$config['config_split.config_split.dev']['status'] = TRUE;
\$config['config_split.config_split.live']['status'] = FALSE;
\$settings['cache']['bins']['render'] = 'cache.backend.null';
\$settings['cache']['bins']['dynamic_page_cache'] = 'cache.backend.null';
\$settings['cache']['bins']['page'] = 'cache.backend.null';
\$config['advagg.settings']['enabled'] = false;
\$config['language.negotiation']['url']['source'] = 'path_prefix';
\$config['captcha.settings']['default_challenge'] = 'captcha/Math';
\$config['dms_theme.settings']['breakpoints'] = TRUE;\n";
    file_put_contents('web/sites/default/settings.local.php', $local_settings);
    echo "Set settings.local.php\n";
