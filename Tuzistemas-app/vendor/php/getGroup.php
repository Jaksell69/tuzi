<?php

$conexion = new mysqli("localhost", "root", "", "tuzistemaapp");
// Verificar la conexión
if ($conexion->connect_error) {
    die("Error en la conexión: " . $conexion->connect_error);
}

$group = $_GET['group'];
$listGroup;

$stmt = $conexion->prepare("SELECT U_name, U_mail, U_phone, U_enrollment FROM users WHERE `U_group` = ?");
$stmt->bind_param("s", $group);

// Ejecutar la consulta
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $lista = array();
    // Salida de datos de cada fila
    while ($row = $result->fetch_assoc()) {
        $lista[] = $row;
    }
    echo json_encode($lista);
}
