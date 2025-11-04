package ar.edu.unlp.objetos.uno.ejercicio16;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

import ar.edu.unlp.objetos.uno.ejercicio16.Date;

public class DateLapse implements Date {
	private LocalDate from;
	private LocalDate to;
	
	public DateLapse(LocalDate primera, LocalDate segunda) {
		this.from = primera;
		this.to = segunda;
	}
	
	public LocalDate getFrom() {
		return this.from;
	}
	
	public LocalDate getTo() {
		return this.to;
	}
	
	public int sizeInDays() {
		return (int) ChronoUnit.DAYS.between(this.from, this.to);
	}
	
	public boolean includesDate(LocalDate other) {
		return (other.equals(this.from) || other.equals(this.to)) || (other.isBefore(this.to) && other.isAfter(this.from));
	}
	
	public boolean overlapse(DateLapse periodo) {
		return !((this.from.isAfter(periodo.to)) || (this.to.isBefore(periodo.from)));
	}
}
