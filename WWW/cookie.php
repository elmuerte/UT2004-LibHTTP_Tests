<?php

header("Content-Type: text/plain");

if (empty($_GET["lifetime"]))
    SetCookie($_GET["cookiename"], $_GET["token"]);
else
    SetCookie($_GET["cookiename"], $_GET["token"], (time()+intval($_GET["lifetime"])));

print_r($_COOKIE[$_GET["cookiename"]]);

?>