void main() {
  // solution([1, 2, 3, 4, 5]);
  solution([-1, 1, -2, 2]);

  print(groupByOwners({
    'Input.txt': 'Randy',
    'Code.py': 'Stan',
    'Code.py2': 'Stan',
    'Output.txt': 'Randy',
    'Output2.txt': 'Randy',
  }));
}

void solution(List<int> numbers) {
  var small = numbers.first;
  for (var i = 1; i < numbers.length; i++) {
    if (small > numbers[i]) {
      small = numbers[i];
    }
  }

  print(small);
}

//? En la funcion de arriba segun el ejercicio solo debo modificar una linea para corregir los bus(s)
//? Pero teniendo en cuanta que la funcion es void no va a devolver el valor int solo lo imprime en la consola.
//? para mi la funcion correcta quedaria de la siguinte manera...
int solutionCorrecta(List<int> numbers) {
  var small = numbers.first;
  for (var i = 1; i < numbers.length; i++) {
    if (small > numbers[i]) {
      small = numbers[i];
    }
  }

  return small;
}

//? Ejercicio 2..
Map<String, List<String>> groupByOwners(Map<String, String> files) {
  Map<String, List<String>> owners = {};
  files.forEach((key, value) {
    if (!owners.containsKey(value)) {
      owners[value] = [];
    }
    owners[value]!.add(key);
  });

  return owners;
}
