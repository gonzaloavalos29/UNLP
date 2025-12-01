program ParcialMascotas;
const
  valorAlto = 9999;   { Valor alto para EOF lógico }

type
  str30 = string[30];

  tMascota = record
    cod: integer;
    nombre: str30;
    especie: str30;
    edad: integer;
    duenio: str30;
    telefono: str30;
  end;

  archivo = file of tMascota;

{=========================================================}
{ Procedimiento de lectura con control de EOF usando valor alto }
procedure leer(var a: archivo; var reg: tMascota);
begin
  if not eof(a) then
    read(a, reg)
  else
    reg.cod := valorAlto;
end;

{=========================================================}
{ Función que busca una mascota por código. 
  Devuelve posición (NRR) o 0 si no se encuentra. }
function ExisteMascota(var a: archivo; codigo: integer): integer;
var
  r: tMascota;
  pos: integer;
begin
  reset(a);
  { Saltamos la cabecera (posición 0) }
  leer(a, r);
  pos := 1;
  ExisteMascota := 0;

  leer(a, r);
  while (r.cod <> valorAlto) do begin
    if (r.cod = codigo) then begin
      ExisteMascota := pos;
    end;
    pos := pos + 1;
    leer(a, r);
  end;

  close(a);
end;

{=========================================================}
{ Alta lógica con lista invertida }
procedure AltaMascota(var a: archivo);
var
  cab, libre, nueva: tMascota;
  posLibre: integer;
begin
  writeln('ALTA DE MASCOTA');
  write('Codigo: '); readln(nueva.cod);
  if (ExisteMascota(a, nueva.cod) <> 0) then begin
    writeln('La mascota ya existe en el archivo.');
    exit;
  end;

  write('Nombre: '); readln(nueva.nombre);
  write('Especie: '); readln(nueva.especie);
  write('Edad: '); readln(nueva.edad);
  write('Dueño: '); readln(nueva.duenio);
  write('Telefono: '); readln(nueva.telefono);

  reset(a);
  read(a, cab);  { leo cabecera }

  if (cab.cod = 0) then begin
    { no hay espacio libre, agrego al final }
    seek(a, filesize(a));
    write(a, nueva);
  end else begin
    { reutilizo registro libre }
    posLibre := cab.cod * -1;  { posición del primer libre }
    seek(a, posLibre);
    read(a, libre);            { leo su contenido para enlazar siguiente libre }
    seek(a, posLibre);
    write(a, nueva);           { guardo nueva mascota en el registro libre }
    seek(a, 0);
    write(a, libre);           { actualizo cabecera con el sig. de la lista }
  end;

  close(a);
  writeln('Mascota dada de alta correctamente.');
end;

{=========================================================}
{ Baja lógica con lista invertida }
procedure BajaMascota(var a: archivo);
var
  cab, reg: tMascota;
  posBaja, codigo: integer;
begin
  writeln('BAJA DE MASCOTA');
  write('Codigo de mascota a eliminar: ');
  readln(codigo);

  posBaja := ExisteMascota(a, codigo);

  if (posBaja = 0) then begin
    writeln('Mascota no registrada.');
    exit;
  end;

  reset(a);
  read(a, cab);               { leo cabecera }
  seek(a, posBaja);
  read(a, reg);               { leo registro a borrar }
  reg.cod := cab.cod;         { guardo enlace al anterior libre }
  seek(a, filepos(a) - 1);
  write(a, reg);              { reescribo el registro marcado }
  seek(a, 0);
  cab.cod := -posBaja;        { cabecera apunta al recién libre }
  write(a, cab);
  close(a);

  writeln('Mascota dada de baja lógicamente.');
end;

{=========================================================}
{ Crear archivo maestro con cabecera inicial }
procedure CrearArchivo(var a: archivo);
var
  cab: tMascota;
begin
  rewrite(a);
  cab.cod := 0;  { sin registros libres aún }
  cab.nombre := 'CABECERA';
  write(a, cab);
  close(a);
  writeln('Archivo creado con registro cabecera.');
end;

{=========================================================}
{ Mostrar todas las mascotas activas (no borradas) }
procedure Listar(var a: archivo);
var
  r: tMascota;
begin
  reset(a);
  leer(a, r); { Cabecera }
  leer(a, r);
  writeln('--- LISTADO DE MASCOTAS ---');
  while (r.cod <> valorAlto) do begin
    if (r.cod > 0) then
      writeln('Cod: ', r.cod, ' | Nombre: ', r.nombre,
              ' | Especie: ', r.especie,
              ' | Edad: ', r.edad,
              ' | Dueño: ', r.duenio,
              ' | Tel: ', r.telefono);
    leer(a, r);
  end;
  close(a);
end;

{=========================================================}
var
  m: archivo;
  nom: str30;
  op: integer;
begin
  write('Ingrese nombre del archivo: ');
  readln(nom);
  assign(m, nom);

  repeat
    writeln;
    writeln('1. Crear archivo');
    writeln('2. Alta Mascota');
    writeln('3. Baja Mascota');
    writeln('4. Listar');
    writeln('0. Salir');
    write('Opcion: '); readln(op);
    case op of
      1: CrearArchivo(m);
      2: AltaMascota(m);
      3: BajaMascota(m);
      4: Listar(m);
    end;
  until op = 0;
end.
