<?php

$connect = new mysqli("localhost", "root", "", "db_cadastro");
mysqli_set_charset($connect, "utf8");
if ($connect->connect_error) {
    die("Connection Failed" . $connect->connect_error);
}
$result = array('error' => false);
$action = '';
if (isset($_GET['action'])) {
    $action = $_GET['action'];
}
if ($action == 'read') {
    $sql = $connect->query("SELECT * FROM list_user");
    $users = array();
    while ($row = $sql->fetch_assoc()) {
        array_push($users, $row);
    }
    $result['list_user'] = $users;
}
if ($action == 'create') {
    $name = $_POST['name'];
    $birth = $_POST['birth'];
    $state = $_POST['state'];
    $city = $_POST['city'];
    $sex = $_POST['sex'];
    $cep = $_POST['cep'];
    $address = $_POST['address'];
    $number = $_POST['number'];
    $complement = $_POST['complement'];
    $district = $_POST['district'];

    $sql = $connect->query("INSERT INTO list_user (name,birth,state,city,sex,cep,address,number,complement,district) VALUES('$name','$birth','$state','$city','$sex','$cep','$address','$number','$complement','$district')");
    if($sql) {
        $result['message'] = "Usuario Cadastro com sucesso!";
    }else {
        $result['error'] = true;
        $result['message'] = "Falha adicionar usuario!";
    }
}
if ($action == 'update') {
    $id = $_POST['id'];
    $name = $_POST['name'];
    $birth = $_POST['birth'];
    $state = $_POST['state'];
    $city = $_POST['city'];
    $sex = $_POST['sex'];
    $cep = $_POST['cep'];
    $address = $_POST['address'];
    $number = $_POST['number'];
    $complement = $_POST['complement'];
    $district = $_POST['district'];

    $sql = $connect->query("UPDATE list_user SET name='$name',birth='$birth',state='$state',city='$city',sex='$sex',cep='$cep',address='$address',number='$number',complement='$complement',district='$district' WHERE id='$id'");

    if($sql) {
        $result['message'] = "Usuario atualizado com sucesso!";
    }else {
        $result['error'] = true;
        $result['message'] = "Falha atualizado usuario!";
    }
}
if ($action == 'delete') {
    $id = $_POST['id'];

    $sql = $connect->query("DELETE FROM list_user WHERE id='$id'");

    if($sql) {
        $result['message'] = "Usuario deletado com sucesso!";
    }else {
        $result['error'] = true;
        $result['message'] = "Falha deletar usuario!";
    }
}
$connect->close();
echo json_encode($result);