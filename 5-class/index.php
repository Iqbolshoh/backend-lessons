<?php

abstract class Odam
{
    public $name;
    public $age;

    public function getName()
    {
        return $this->name;
    }

    public function getAge()
    {
        return $this->age;
    }
}

class Talaba extends Odam
{
    public $yonalish;
    public $kurs;
}

class Ishchi extends Odam
{
    public $soha;
}

class Dasturchi extends Odam
{
    public $daromadi;
}

$talaba = new Talaba();
$ishchi = new Ishchi();
$dasturchi = new Dasturchi();



