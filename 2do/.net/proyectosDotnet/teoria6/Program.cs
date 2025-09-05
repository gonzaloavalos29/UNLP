using System;

//Ej1.Ejecutar();
//Ej2.Ejecutar();
//Ej7.Ejecutar();

// 8
Empleado[] empleados = new Empleado[] {
    new Administrativo("Ana", 20000000, DateTime.Parse("26/04/2018"), 10000) {Premio=1000},
    new Vendedor("Diego", 30000000, DateTime.Parse("02/04/2010"), 10000) {Comision=2000},
    new Vendedor("Luis", 33333333, DateTime.Parse("30/12/2011"), 10000) {Comision=2000}
};