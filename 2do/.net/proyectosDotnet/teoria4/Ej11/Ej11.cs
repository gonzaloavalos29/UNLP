/*
 ...
 if (st1 == null)
 {
 if (st2 == null)
 {
 st = st3;
 }
 else
 {
 st = st2;
 }
 }
 else
 {
 st = st1;
 }
 if (st4 == null)
 {
 st4 = "valor por defecto";
 }
 ...
 */

/* 
st = st1 ?? st2 ?? st3;
st4 ??= "valor por defecto";

st = st1 ?? st2 ?? st3;: Este código asigna a st el primer valor no nulo entre st1, st2 y st3. Si st1 no es nulo, se asigna a st; de lo contrario, se evalúa st2, y así sucesivamente.​
st4 ??= "valor por defecto";: Este código asigna "valor por defecto" a st4 solo si st4 es nulo. Si st4 ya tiene un valor, no se realiza ninguna asignación.​ 
*/
