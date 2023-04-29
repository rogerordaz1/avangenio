# avangenio

Este Respositorio contiene la prueba técnica proporcionada por Avangenio.

## Empezando.

Prueba práctica.
## Eje 1:
Find the bug(s) and modify one line on the incorrect  implementation of the function solution that is supposed to return the smallest the element on the given non-empty list "numbers" which contains at most 1000 integers within the range [-1000..1000]

Notice that the example test case "var numbers = <int>[-1, 1, -2, 2];"  the attached code is already returning the correct answer (-2)

void solution(List<int> numbers) {
  var small = 0;
  for (var i = 1; i < numbers.length; i++) {
    if (small > numbers[i]) {
      small = numbers[i];
    }
  }

  print(small);
}

## Eje 2:  
Implement a groupByOwners function that:
●	Accepts a map containing the file owner name for each file name.
●	Returns a map containing a list of file names for each owner name, in any order.
For example, for map {'Input.txt': 'Randy', 'Code.py': 'Stan', 'Output.txt': 'Randy'} the groupByOwners function should return {'Randy': ['Input.txt', 'Output.txt'], 'Stan': ['Code.py']}.


## Ejercicio 3: 
Implementar un estado global y almacenamiento en el dispositivo en una aplicación Flutter utilizando la librería Provider y la librería shared_preferences.
Descripción: La tarea consiste en crear una aplicación Flutter que tenga la capacidad de almacenar información del usuario actual en un estado global y guardar esta información en el dispositivo utilizando la librería shared_preferences.
Requisitos
1.	La aplicación debe tener una pantalla de inicio de sesión que permita al usuario ingresar su nombre de usuario y contraseña.
2.	La aplicación debe tener una pantalla principal que muestre la información del usuario actual, como su nombre y correo electrónico.
3.	La aplicación debe tener la capacidad de almacenar la información del usuario actual en un estado global utilizando la librería Provider.
4.	La información del usuario actual debe ser guardada en el dispositivo utilizando la librería shared_preferences.
5.	El estado global debe actualizarse correctamente cuando el usuario inicie sesión o cierre sesión en la aplicación.
6.	La información del usuario actual debe cargarse desde el dispositivo cuando la aplicación se inicie.
7.	La aplicación debe tener pruebas unitarias que aseguren que el estado global y el almacenamiento en el dispositivo funcionen correctamente.


Sugerencias:
1.	Utiliza la librería Provider para implementar el estado global en la aplicación.
2.	Utiliza la librería shared_preferences para guardar y cargar la información del usuario actual en el dispositivo.
3.	Considera utilizar un patrón de diseño como Bloc para manejar la lógica de autenticación, actualización del estado global y almacenamiento en el dispositivo.
4.	Utiliza la navegación de Flutter para navegar entre la pantalla de inicio de sesión y la pantalla principal.
5.	Utiliza el widget Consumer de Provider para acceder al estado global en la pantalla principal.
6.	Utiliza el widget ChangeNotifierProvider de Provider para proporcionar el estado global a toda la aplicación.
7.	Escribe pruebas unitarias para asegurar que el estado global y el almacenamiento en el dispositivo funcionen correctamente.
