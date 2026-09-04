<?php

class Login {
    private $user = 'admin';
    private $password = '$2y$10$KKton6U34pfxeaWehTAlSembspHkihnOlPFl82faEom/jrccoqwMW';

    public function getUser() {
        return $this->user;
    }

    public function getPassword() {
        return $this->password;
    }

    public function verify($password) {
        return password_verify($password, $this->password);
    }
}
