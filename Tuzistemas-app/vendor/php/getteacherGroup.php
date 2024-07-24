<?php

$conexion = new mysqli("localhost", "root", "", "tuzistemaapp");

// Verificar la conexión
if ($conexion->connect_error) {
    die("Error en la conexión: " . $conexion->connect_error);
}

$group = htmlspecialchars($_GET['group']); // Sanear la entrada para evitar XSS

$stmt = $conexion->prepare("SELECT t.gT_group, GROUP_CONCAT(CONCAT(t.gT_enrollment, ' - ', u.U_name) ORDER BY t.gT_enrollment ASC SEPARATOR '<br>') AS profesores 
FROM group_teacher t 
JOIN users u ON t.gT_enrollment = u.U_enrollment 
WHERE t.gT_group = ?
GROUP BY t.gT_group");
$stmt->bind_param("s", $group);

// Ejecutar la consulta
$stmt->execute();
$result = $stmt->get_result();

$lista = array();
if ($result->num_rows > 0) {
    // Salida de datos de cada fila
    while ($row = $result->fetch_assoc()) {
        $lista[] = $row;
    }
} else {
    $lista = 0;
}

echo json_encode($lista);

// Cerrar la declaración y la conexión
$stmt->close();
$conexion->close();
