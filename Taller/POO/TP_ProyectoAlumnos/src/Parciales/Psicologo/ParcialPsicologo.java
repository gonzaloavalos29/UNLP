/*
Un psicólogo necesita un sistema para organizar su agenda semanal. El sistema
mantiene para c/u de los 5 días de atención y c/u de los 6 turnos (horarios) del día, la
información del paciente que tomó el turno. De los pacientes guarda: nombre, si tiene
obra social y costo a abonar por la sesión.
a)Genere las clases necesarias. Implemente constructores para iniciar: el sistema sin
pacientes; los pacientes a partir de toda su información.
b)Lea atentamente y luego implemente métodos que permitan:
- Agendar al paciente P en un día D y turno T. Asuma que el turno está libre. D y T son
válidos.
- Dado el nombre de un paciente, liberar todos sus turnos.
- Dado un día D y el nombre de un paciente, devolver si el paciente tiene agendado un
turno ese día. Asuma que D es válido.
C) Realice un programa que instancie el sistema. Cargue varios pacientes al sistema.
Libere turnos agendados. Para finalizar, imprima el resultado del inciso b-.iii
 */
package Parciales.Psicologo;

/**
 *
 * @author Gonzalo
 */
public class ParcialPsicologo {
    
    public static void main(String[] args) {
        Sistema sistema = new Sistema();
        Paciente p1 = new Paciente("Ruperto", false, 15);
        Paciente p2 = new Paciente("Alberto", true, 12);
        Paciente p3 = new Paciente("Ricardo", true, 20);
        
        sistema.agendarPaciente(p1, 0, 1);
        sistema.agendarPaciente(p1, 0, 4);
        sistema.agendarPaciente(p1, 1, 1);
        sistema.agendarPaciente(p1, 2, 1);
        sistema.agendarPaciente(p1, 3, 1);
        sistema.agendarPaciente(p1, 4, 1);
        sistema.agendarPaciente(p1, 2, 3);
        System.out.println(sistema.toString());
        sistema.liberarPaciente("Ruperto");
        System.out.println(sistema.pacienteTieneTurno(0, "Ruperto"));
        System.out.println(sistema.toString());
    }
    
}
