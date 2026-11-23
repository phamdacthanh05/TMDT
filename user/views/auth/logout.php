<?php
require __DIR__ . '/../../../shared/bootstrap.php';
session_destroy();
redirect(APP_BASE . '/index.php');