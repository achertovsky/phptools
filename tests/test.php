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
    if ($a > 0) {
        return true;
    }
    return false;
}

function b(int $a): bool
{
    if ($a > 0) {
        return true;
    }
    return false;
}
