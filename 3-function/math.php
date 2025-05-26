<?php

$M_PI = 3.14159265358979323846;
$M_E = 2.71828182845904523536;

function modul($son)
{
    return $son > 0 ? $son : -$son;
}

function daraja($son, $darajasi)
{
    $k = 1;
    for ($i = 0; $i < $darajasi; $i++) {
        $k *= $son;
    }
    return $k;
}

function doira_yuzi($r)
{
    global $M_PI;
    return $M_PI * daraja($r, 2);
}

function doira_perimetri($r)
{
    global $M_PI;
    return 2 * $M_PI * $r;
}

function katta($a, $b)
{
    return $a > $b ? $a : $b;
}

function kichik($a, $b)
{
    return $a < $b ? $a : $b;
}

function son3($a, $b, $c)
{
    $max = katta($a, katta($b, $c));
    $min = kichik($a, kichik($b, $c));
    $orta = ($a + $b + $c) - ($min + $max);

    return [
        "min" => $min,
        "orta" => $orta,
        "max" => $max
    ];
}

function tortburchak($a, $b)
{
    return [
        'perimetr' => 2 * ($a + $b),
        'yuza' => $a * $b
    ];
}

function max_arr($arr)
{
    $max = $arr[0];
    $index = 0;

    foreach ($arr as $i => $son) {
        if ($max < $son) {
            $max = $son;
            $index = $i;
        }
    }
    return ['max_element' => $max, 'max_index' => $index];
}

function juft_toq($arr)
{
    $juftlar = [];
    $toqlar = [];

    foreach ($arr as $son) {
        if ($son % 2 == 0) {
            array_push($juftlar, $son);
        } else {
            array_push($toqlar, $son);
        }
    }

    return [
        'juft' => $juftlar,
        'toq' => $toqlar
    ];
}

print_r(juft_toq([1, 2, 3, 4, 5, 6, 7, 8]));

// uy ishi string, number, massif, bool bilan ishlaydigan funcsiyalar yozish