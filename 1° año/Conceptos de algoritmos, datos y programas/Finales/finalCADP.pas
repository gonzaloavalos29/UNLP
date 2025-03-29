program finalCADP
	
type
	r_sucursal = 1..5;
	
	v_suc = array[r_sucursal] of integer // vector de montos por sucursal
	
	factura = record
		numero: integer;
		cliente: integer;
		sucursal: v_suc;
	end;
	
	lista = ^nodo
	nodo = record
		dato: factura;
		sig: lista;
	end;
	
procedure cargarLista(var l: lista); // SE DISPONE

procedure eliminarFactura(c: integer; var cant_eliminada: integer);
begin
	
end

VAR
	l: lista
	cod_suc: integer;
	f_eliminadas: integer;
BEGIN
	cargarLista(l); // SE DISPONE
	eliminarFactura(cod_suc, f_eliminadas)
END.
