<?php
$failure = strpos( 'something','weird',0,null);

class Bar {
    public function foo($bool = false) {
    }
}

class Fo {
}

class breaksPsr12 {
}


function a(int $a): bool
{
    $collecting = 0;
    if ($a > 0) {
        return true;
    }

    switch ($a) {
        case 1:
            // Code for case 1
            break;
        case 2:
            // Code for case 2
            break;
        default:
            // Code for default case
            break;
    }

    for ($i = 0; $i < 10; $i++) {
        if ($i > $a) {
            $collecting += $i;
        }
    }

    return false;
}

function b(int $a): bool
{
    if ($a > 123) {
        return true;
    }
    return false;
}

function c(int $a): bool
{
    $collecting = 0;
    if ($a > 0) {
        return true;
    }

    switch ($a) {
        case 1:
            // Code for case 1
            break;
        case 2:
            // Code for case 2
            break;
        default:
            // Code for default case
            break;
    }

    for ($i = 0; $i < 10; $i++) {
        if ($i > $a) {
            $collecting += $i;
        }
    }

    return false;
}
