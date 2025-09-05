{3. Los árboles B+ representan una mejora sobre los árboles B dado que conservan la
propiedad de acceso indexado a los registros del archivo de datos por alguna clave,
pero permiten además un recorrido secuencial rápido. Al igual que en el ejercicio 2,
considere que por un lado se tiene el archivo que contiene la información de los
alumnos de la Facultad de Informática (archivo de datos no ordenado) y por otro lado
se tiene un índice al archivo de datos, pero en este caso el índice se estructura como
un árbol B+ que ofrece acceso indizado por DNI al archivo de alumnos. Resuelva los
siguientes incisos:
a. ¿Cómo se organizan los elementos (claves) de un árbol B+? ¿Qué elementos se
encuentran en los nodos internos y que elementos se encuentran en los nodos
hojas?
b. ¿Qué característica distintiva presentan los nodos hojas de un árbol B+? ¿Por
qué?
c. Defina en Pascal las estructuras de datos correspondientes para el archivo de
alumnos y su índice (árbol B+). Por simplicidad, suponga que todos los nodos del
árbol B+ (nodos internos y nodos hojas) tienen el mismo tamaño.
d. Describa, con sus palabras, el proceso de búsqueda de un alumno con un DNI
específico haciendo uso de la estructura auxiliar (índice) que se organiza como
un árbol B+. ¿Qué diferencia encuentra respecto a la búsqueda en un índice
estructurado como un árbol B?
e. Explique con sus palabras el proceso de búsqueda de los alumnos que tienen DNI
en el rango entre 40000000 y 45000000, apoyando la búsqueda en un índice
organizado como un árbol B+. ¿Qué ventajas encuentra respecto a este tipo de
búsquedas en un árbol B?}

{ A. Todas las claves se encuentran únicamente en los nodos hojas.
* Los nodos internos contienen claves que se utilizan para dirigir la búsqueda hacia el nodo hoja correspondiente. }

{ B. Los nodos hoja contienen todas las claves del árbol B+ y un enlace adicional que apunta al siguiente nodo hoja en orden ascendente.
* Esto permite un recorrido secuencial rápido sobre las claves. }

// C
const 
	M = .. // orden del arbol
type
	alumno = record
		nombre: string;
		apellido: string;
		dni: integer;
		legajo: integer;
		anioIngreso: integer;
	end;
	lista = ^nodo;
	TArchivoDatos = file of alumno;
	nodo = record
		cant_claves: integer;
		claves: array[1..M-1] of longint;
		enlaces: array[1..M-1] of integer;
		hijos: array[1..M] of integer;
		sig: lista;
		// sig: integer;
	end;
	arbolB = file of nodo;
VAR
	archivoDatos: TArchivoDatos;
	archivoIndice: arbolB;

{ D. El proceso de busqueda de un alumno con un DNI haciendo uso del árbol B+, consiste en aprovechar el criterio de orden y los
* separadores de los nodos internos, hasta encontrar el dato en una hoja. La diferencia con respecto a un árbol B, es que la búsqueda
* siempre termina en un nodo hoja (terminal), y no en los nodos internos, al ser copias. }

{ E. Cuando se desea buscar los alumnos que tienen DNI en el rango entre 40000000 y 45000000 usando un árbol B+, el proceso es más eficiente y directo que con un árbol B. El procedimiento sería el siguiente:
Buscar la clave menor del rango (40000000):
Se recorre el árbol B+ desde la raíz hasta encontrar el nodo hoja donde se encuentra el primer DNI del rango (o el más cercano superior).
Esta búsqueda se realiza de forma similar a un árbol B, siguiendo las claves en los nodos internos hasta llegar a un nodo hoja.
Recorrer secuencialmente los nodos hoja:
Una vez encontrado el primer nodo hoja con claves dentro del rango, se recorren las claves de ese nodo y de los siguientes (a través del puntero sig o siguiente) de forma secuencial.
Este recorrido continúa hasta que se encuentre un DNI mayor a 45000000.
Por cada clave dentro del rango, se utiliza su enlace (NRR o dirección) para acceder al registro correspondiente en el archivo de datos.}
