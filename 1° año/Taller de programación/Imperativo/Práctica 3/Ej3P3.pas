{
   Ej3P3.pas
   
   3.Implementar un programa que contenga:
a. Un módulo que lea información de alumnos de Taller de Programación y los almacene en
una estructura de datos. De cada alumno se lee legajo, DNI, año de ingreso y los códigos y
notas de los finales rendidos. La estructura generada debe ser eficiente para la búsqueda por
número de legajo. La lectura de los alumnos finaliza con legajo 0 y para cada alumno el ingreso
de las materias finaliza con el código de materia -1.
b. Un módulo que reciba la estructura generada en a. y retorne los DNI y año de ingreso de
aquellos alumnos cuyo legajo sea inferior a un valor ingresado como parámetro.
c. Un módulo que reciba la estructura generada en a. y retorne el legajo más grande.
d. Un módulo que reciba la estructura generada en a. y retorne el DNI más grande.
e. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con//hacer
legajo impar.
e. Un módulo que reciba la estructura generada en a. y retorne el legajo y el promedio del
alumno con mayor promedio.
f. Un módulo que reciba la estructura generada en a. y un valor entero. Este módulo debe//falta una lista de legajos y promedios
retornar los legajos y promedios de los alumnos cuyo promedio supera el valor ingresado.
   
   
}


program untitled;
const 
  FINALUMNO=0;
  FINMATERIA= -1;
type
  lista=^nodoL;
  nodoL=record
    nota:real;
    codMateria:integer;
    sig:lista;
   end;
  regAlumno=record
    legajo:integer;
    dni:integer;
    anioIngreso:integer;
    finales:lista;
   end;
  raiz=^nodoA;
  nodoA=record
    alumno:regAlumno;
    HI:raiz;
    HD:raiz;
   end;
  listaF=^nodoF;
  nodoF=record
    promedio:real;
    legajo:integer;
    sigA:listaF;
   end;
procedure imprimirF(l:listaF);
  begin
    while(l<>nil)do
      begin
        writeln('El promedio del alumno es: ',l^.promedio:2:2,' y su legajo es: ',l^.legajo);
        l:=l^.sigA;
      end;
  end;
procedure agregarF(var l:listaF;p:real;leg:integer);
  var
    nue:listaF;
  begin
    new(nue);
    nue^.promedio:=p;
    nue^.legajo:=leg;
    nue^.sigA:=l;
    l:=nue;
  end;
procedure leerMateria(var m:nodoL);//leo la info de la materia de la cual se dio final
  begin
    write('ingrese cod materia: ');readln(m.codMateria);
    if(m.codMateria<>FINMATERIA)then
      begin
        write('ingrese nota de la materia: ');readln(m.nota);
      end;
  end;
procedure agregarFinal(var l:lista;materia:nodoL);//agrego a la lista de finales
  var
    nue:lista;
  begin
    new(nue);
    nue^.nota:=materia.nota;
    nue^.codMateria:=materia.codMateria;
    nue^.sig:=l;
    l:=nue;
  end;
procedure leerFinales(var l:lista);//genera la lista de finales
  var
    materia:nodoL;
  begin
    leerMateria(materia);
    while(materia.codMateria<>FINMATERIA)do
      begin
        agregarFinal(l,materia);
        leerMateria(materia);
      end;
  end;
procedure leerAlumno(var alu:regAlumno);
  begin
    write('ingrese legajo: ');readln(alu.legajo);
    if(alu.legajo<>FINALUMNO)then
      begin
        write('ingrese dni: ');readln(alu.dni);
        write('ingrese anio ingreso: ');readln(alu.anioIngreso);
        alu.finales:=nil;
        leerFinales(alu.finales);
      end;
  end;
procedure agregarAlArbol(var a:raiz;alumno:regAlumno);
  begin
    if(a=nil)then
      begin
        new(a);
        a^.alumno:=alumno;
        a^.HD:=nil;a^.HI:=nil;
      end
    else
      if(alumno.legajo>a^.alumno.legajo)then
        agregarAlArbol(a^.HD,alumno)
      else
        if(alumno.legajo<=a^.alumno.legajo)then
          agregarAlArbol(a^.HI,alumno);
  end;
procedure generarArbol(var a:raiz);
  var
    alu:regAlumno;
  begin
    leerAlumno(alu);
    while(alu.legajo<>FINALUMNO)do
      begin
        agregarAlArbol(a,alu);
        leerAlumno(alu);
      end;
  end;
procedure imprimirFinales(l:lista);
  begin
    while(l<>nil)do
      begin
        write('|Cod:',l^.codMateria,'/Nota:',l^.nota:2:2,'|');
        l:=l^.sig;
      end;
  end;
procedure imprimirArbol(a:raiz);
  begin
    if(a<>nil)then
      begin
        imprimirArbol(a^.HI);
        writeln('|Legajo:',a^.alumno.legajo,'/Dni:',a^.alumno.dni,'/anio:',a^.alumno.anioIngreso,'|');
        write('Materias: ');imprimirFinales(a^.alumno.finales);writeln('|');
        writeln();
        imprimirArbol(a^.HD);
      end;
  end;
procedure incisoB(a:raiz;num:integer);
  begin
    if(a<>nil)then
      begin
        if(num>a^.alumno.legajo)then
          begin
            incisoB(a^.HI,num);
            write('dni: ',a^.alumno.dni,'/anioIngreso: ',a^.alumno.anioIngreso,'|');
            incisoB(a^.HD,num);
          end
        else
          if(num<=a^.alumno.legajo)then
            incisoB(a^.HI,num);
      end;
  end;
function incisoC(a:raiz):integer;//no tengo que comparar ya que el hijo derecho de la rama derecha siempre sera el mayor del arbol
  var
    max:integer;
  begin
    if(a<>nil)then
      begin
        max:=incisoC(a^.HD);
        if(max<a^.alumno.legajo)then
          max:=a^.alumno.legajo;
        incisoC:=max;
      end
    else
      incisoC:=-1;
  end;
procedure incisoD(a:raiz;var max:integer);
  begin
    if(a<>nil)then
      begin
        incisoD(a^.HI,max);
        if(a^.alumno.dni>max)then
          max:=a^.alumno.dni;
        incisoD(a^.HD,max);
      end;
  end;
function promedio(l:lista):real;
  var
    cant:integer;
    tot:real;
  begin
    cant:=0;tot:=0;
    while(l<>nil)do
      begin
        cant:=cant+1;
        tot:=tot+l^.nota;
        l:=l^.sig;
      end;
    promedio:=tot/cant;
  end;
procedure incisoE(a:raiz;var leg:integer;var prom:real);
  begin
    if(a<>nil)then
      begin
        incisoE(a^.HI,leg,prom);
        if(prom<promedio(a^.alumno.finales))then
          begin
            leg:=a^.alumno.legajo;
            prom:=promedio(a^.alumno.finales);
          end;
        incisoE(a^.HD,leg,prom);
      end;
  end;
function incisoEImpar(a:raiz):integer;
  var
    cant:integer;
  begin
    if(a<>nil)then
      begin
        cant:=incisoEImpar(a^.HI);
        if((a^.alumno.legajo MOD 2) = 1)then
          begin
            cant:=cant+1;
            incisoEImpar:=cant;
          end;
        cant:=incisoEImpar(a^.HD);
      end
    else
      incisoEImpar:=-1;
  end;
procedure incisoF(a:raiz;valor:integer;var l:listaF);
  var
    prom:real;
  begin
    if(a<>nil)then
      begin
        incisoF(a^.HI,valor,l);
        prom:=promedio(a^.alumno.finales);
        if(prom>valor)then
          agregarF(l,prom,a^.alumno.legajo);
        incisoF(a^.HD,valor,l);
      end;
  end;
var 
  arbol:raiz;
  valor,dni,legajoE,numF:integer;
  promE:real;
  listaA:listaF;
BEGIN
  arbol:=nil;legajoE:=0;promE:=0;listaA:=nil;
  generarArbol(arbol);
  imprimirArbol(arbol);	
  writeln('Inciso B');
  write('ingrese valor para informar los dni y anios de los alumnos con legajo menor a ese valor: ');readln(valor);
  incisoB(arbol,valor);writeln();
  writeln('Inciso C');
  writeln('el legajo mas grande es: ',incisoC(arbol));
  writeln('Inciso D');
  dni:=-1;
  incisoD(arbol,dni);
  writeln('el dni mas grande es: ',dni);
  writeln('Inciso E');
  incisoE(arbol,legajoE,promE);
  writeln('el legajo con mayor promedio es: ',legajoE,' y su promedio es: ',promE:2:2);
  writeln('Inciso E');
  writeln('ingrese promedio a superar: ');readln(numF);
  incisoF(arbol,numF,listaA);
  imprimirF(listaA);
END.

