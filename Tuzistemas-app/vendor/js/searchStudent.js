let dataStudent = document.getElementById("dataStudent");
dataStudent.style.display = "none";
function searchStudent() {
  let inputName = document.getElementById("inputNameS").value;
  let selectResult = document.getElementById("resultS");

  // Realiza una solicitud AJAX para obtener resultados de la base de datos
  let xhr = new XMLHttpRequest();
  xhr.open("GET", "../../vendor/php/searchStudent.php?nombre=" + inputName, true);

  xhr.onreadystatechange = function () {
    if (xhr.readyState == 4 && xhr.status == 200) {
      // Borra las opciones anteriores
      while (selectResult.firstChild) {
        selectResult.removeChild(selectResult.firstChild);
      }

      // Parsea la respuesta JSON y crea las opciones del select
      let data = JSON.parse(xhr.responseText);
      let option = document.createElement("option");
      option.value = null;
      option.text = "Selecciona";
      selectResult.appendChild(option);
      data.forEach(function (Teacher) {
        let option = document.createElement("option");
        option.value = Teacher.U_id;
        option.text = Teacher.U_name;
        selectResult.appendChild(option);
      });

      // Muestra u oculta el select según la cantidad de resultados
      if (data.length > 0) {
        selectResult.style.display = "block";
      } else {
        selectResult.style.display = "none";
      }
    }
  };

  xhr.send();
}

function selectionStudent() {
  let inputName = document.getElementById("inputNameS");
  let selectResult = document.getElementById("resultS");
  let selectedOption = selectResult.options[selectResult.selectedIndex];

  // Asigna el valor del ID al campo inputNombre
  inputName.value = selectedOption.value;

  let xhr = new XMLHttpRequest();
  xhr.open("GET", "../../vendor/php/searchS.php?idT=" + inputName.value, true);

  xhr.onreadystatechange = function () {
    if (xhr.readyState == 4 && xhr.status == 200) {
      let paramGroup;
      let data = JSON.parse(xhr.responseText);
      data.forEach(function (Student) {
        document.getElementById("nameS").innerHTML = Student.U_name;
        document.getElementById("mailS").innerHTML = Student.U_mail;
        document.getElementById("phoneS").innerHTML = Student.U_phone;
        document.getElementById("enrollmentS").innerHTML = Student.U_enrollment;
        document.getElementById("groupS").innerHTML = Student.U_group;
        paramGroup = Student.U_group;
        console.log(paramGroup);
      });
      teachersForStudent(paramGroup);
    }
  };

  xhr.send();

  dataTeacher.hidden = "block";
}

function clearSelection() {
  let inputName = document.getElementById("inputNameS");
  let selectResult = document.getElementById("resultS");

  // Borra la selección del select y el valor del campo inputNombre
  selectResult.selectedIndex = -1;
  inputName.value = "";
}

function teachersForStudent(paramGroup) {
  const teacherS = document.getElementById('teacherS');
  const urlTeacher = '../../vendor/php/getteacherGroup.php';
  const data = {
    group: paramGroup,
  };
  const paramT = new URLSearchParams(data);
  const URLT = `${urlTeacher}?${paramT}`;
  fetch(URLT)
    .then(response => response.json())
    .then(data => {
      // Mostrar la tabla si hay datos
      if (data.length > 0) {
        teacherS.innerHTML = '';
        data.forEach(docente => {
          teacherS.innerHTML = `${docente.profesores}`;
        });
      } else if (data == 0) {
        teacherS.innerHTML = 'Sin Docente';
      }
    })
    .catch(error => console.error('Error:', error));
}