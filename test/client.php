<?php
$client= new GearmanClient();
$client->addServer();
print $client->do("reverse", "Hello World!");

