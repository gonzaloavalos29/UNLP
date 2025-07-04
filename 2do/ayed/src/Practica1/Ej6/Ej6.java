//6. Análisis de las estructuras de listas provistas por la API de Java.
//
//a. ¿En qué casos ArrayList ofrece un mejor rendimiento que LinkedList?
//Acceso aleatorio: ArrayList ofrece acceso aleatorio de tiempo constante a sus elementos a través del índice. Esto significa que puedes acceder a cualquier elemento en la lista en tiempo O(1). En cambio, LinkedList requiere recorrer la lista desde el inicio o el final para acceder a un elemento en una posición específica, lo que lleva tiempo O(n), donde n es la longitud de la lista.
//Iteración: Si estás iterando sobre la lista con un bucle, ArrayList es generalmente más eficiente que LinkedList. Esto se debe a que ArrayList almacena los elementos en un arreglo interno, lo que permite un acceso rápido a cada elemento durante la iteración. Por otro lado, LinkedList necesita navegar a través de los nodos enlazados, lo que puede ser más costoso en términos de rendimiento.
//
//b. ¿Cuándo LinkedList puede ser más eficiente que ArrayList?
//Inserciones y eliminaciones frecuentes al principio o al final de la lista: LinkedList tiene un rendimiento O(1) para la inserción y eliminación de elementos al principio o al final de la lista. Esto se debe a que simplemente se actualizan los punteros de los nodos enlazados. En contraste, ArrayList puede requerir la reasignación y el desplazamiento de elementos para mantener la continuidad del arreglo interno, lo que puede ser costoso, especialmente para listas grandes.
//Inserciones y eliminaciones en el medio de la lista: Para LinkedList, las inserciones y eliminaciones en el medio de la lista también tienen un rendimiento O(1), ya que solo se necesitan ajustar los punteros de los nodos vecinos. En ArrayList, estas operaciones tienen un rendimiento O(n) porque puede ser necesario desplazar todos los elementos que están después de la posición de inserción o eliminación.
//
//c. ¿Qué diferencia encuentra en el uso de la memoria en ArrayList y LinkedList?
//Internamente, ArrayList almacena sus elementos en un arreglo dinámico. Este arreglo se redimensiona automáticamente según sea necesario para manejar la adición o eliminación de elementos. Como resultado, ArrayList tiende a utilizar más memoria que LinkedList para almacenar la misma cantidad de elementos
//LinkedList internamente utiliza una lista doblemente enlazada para almacenar sus elementos. Cada nodo en la lista contiene una referencia al elemento siguiente y al anterior en la lista. Cada nodo en LinkedList requiere espacio adicional para almacenar las referencias a los nodos vecinos, lo que puede resultar en un mayor uso de memoria en comparación con ArrayList, especialmente para listas grandes. 
//
//d. ¿En qué casos sería preferible usar un ArrayList o un LinkedList?
//ArrayList es preferible cuando necesitas acceso aleatorio eficiente y cuando las operaciones principales son agregar o eliminar elementos al final de la lista. Por otro lado, LinkedList es más adecuado cuando necesitas agregar o eliminar elementos frecuentemente en diferentes partes de la lista, especialmente al principio, al final o en el medio.
//}
package Practica1.Ej6;



