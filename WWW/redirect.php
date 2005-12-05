<?php

header("HTTP/1.1 301 Moved Permanently");
header("Location: ".dirname($_SERVER["PHP_SELF"])."/XHTML.html");

?>