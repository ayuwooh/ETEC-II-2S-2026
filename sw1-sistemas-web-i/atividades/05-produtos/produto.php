<?php

class product
{
    private $price;
    private $quantity;
    private $discount;

    public function setPrice($price)
    {
        $this->price = $price;
    }

    public function setQuantity($quantity)
    {
        $this->quantity = $quantity;
    }

    public function setDiscount($discount)
    {
        if ($discount == "1") {
            $this->discount = 0.10;
        } else if ($discount == "2") {
            $this->discount = 0.25;
        } else if ($discount == "3") {
            $this->discount = 0.50;
        }
    }

    public function lowStock()
    {
        if ($this->quantity < 5) {
            return true;
        }
        return false;
    }

    public function calc()
    {
        $totalprice = $this->price * $this->quantity;
        if ($this->discount != 0){
            $discountValue = $totalprice * $this->discount;
            $pricewdisc = $totalprice - $discountValue;
            return $pricewdisc;
            } else {
                return $totalprice;
            }
    }
}