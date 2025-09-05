{3. Realizar un programa que genere un archivo de novelas filmadas durante el presente
año. De cada novela se registra: código, género, nombre, duración, director y precio.
El programa debe presentar un menú con las siguientes opciones:
a. Crear el archivo y cargarlo a partir de datos ingresados por teclado. Se
utiliza la técnica de lista invertida para recuperar espacio libre en el
archivo. Para ello, durante la creación del archivo, en el primer registro del
mismo se debe almacenar la cabecera de la lista. Es decir un registro
ficticio, inicializando con el valor cero (0) el campo correspondiente al
código de novela, el cual indica que no hay espacio libre dentro del
archivo.
b. Abrir el archivo existente y permitir su mantenimiento teniendo en cuenta el
inciso a., se utiliza lista invertida para recuperación de espacio. En
particular, para el campo de ´enlace´ de la lista, se debe especificar los
números de registro referenciados con signo negativo, (utilice el código de
novela como enlace).Una vez abierto el archivo, brindar operaciones para:
i. Dar de alta una novela leyendo la información desde teclado. Para
esta operación, en caso de ser posible, deberá recuperarse el
espacio libre. Es decir, si en el campo correspondiente al código de
novela del registro cabecera hay un valor negativo, por ejemplo -5,
se debe leer el registro en la posición 5, copiarlo en la posición 0
(actualizar la lista de espacio libre) y grabar el nuevo registro en la
posición 5. Con el valor 0 (cero) en el registro cabecera se indica
que no hay espacio libre.
ii. Modificar los datos de una novela leyendo la información desde
teclado. El código de novela no puede ser modificado.
iii. Eliminar una novela cuyo código es ingresado por teclado. Por
ejemplo, si se da de baja un registro en la posición 8, en el campo
código de novela del registro cabecera deberá figurar -8, y en el
registro en la posición 8 debe copiarse el antiguo registro cabecera.
c. Listar en un archivo de texto todas las novelas, incluyendo las borradas, que
representan la lista de espacio libre. El archivo debe llamarse “novelas.txt”.
NOTA: Tanto en la creación como en la apertura el nombre del archivo debe ser
proporcionado por el usuario}

program ej3;
type
	novela = record
		codigo: integer;
		genero: string;
		nombre: string;
		duracion: real;
		director: string;
		precio: real;
	end;
	archivo = file of novela;
procedure leerNovela(var n: novela);
begin
	writeln('Ingrese codigo de la novela');
	readln(n.codigo);
	if (n.codigo <> -1) then begin
		writeln('Ingrese el genero de la novela');
		readln(n.genero);
		writeln('Ingrese el nombre de la novela');
		readln(n.nombre);
		writeln('Ingrese la duracion de la novela');
		readln(n.duracion);
		writeln('Ingrese el director de la novela');
		readln(n.director);
		writeln('Ingrese el precio de la novela');
		readln(n.precio);
	end;
end;
procedure crearArchivo(var arc: archivo);
var
	n: novela;
	nombre: string;
begin
	writeln('Ingrese el nombre del archivo');
	readln(nombre);
	assign(arc, nombre);
	rewrite(arc);
	n.codigo:= 0;
	n.genero:= '';
	n.nombre:= '';
	n.duracion:= 0;
	n.director:= '';
	n.precio:= 0;
	write(arc, n);
	leerNovela(n);
	while (n.codigo <> -1) do begin
		write(arc, n);
		leerNovela(n);
	end;
	close(arc);
	writeln('Archivo generado correctamente');
end;

procedure alta(var arc: archivo);
var
	n, aux: novela;
begin
	reset(arc);
	read(arc, aux);
	leerNovela(n);
	if (aux.codigo = 0) then begin
		seek(arc, filesize(arc));
		write(arc, n);
	end else begin
		seek(arc, aux.codigo * -1);
		read(arc, aux);
		seek(arc, filepos(arc)-1);
		write(arc, n);
		seek(arc, 0);
		write(arc, aux);
	end;
	close(arc);
end;
