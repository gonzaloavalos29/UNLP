package ar.edu.unlp.objetos.uno.ejercicio12;

import java.util.ArrayList;
import java.util.List;

/**
 * De esta forma crearemos las clases del ejercicio
 *
 */
public class JobScheduler {
	protected Strategy strategy;
	protected List<JobDescription> jobs;
	
	public JobScheduler() {
		this.jobs = new ArrayList<>();
	}
	
	public Strategy getStrategy() {
		return this.strategy;
	}
	
	public List<JobDescription> getJobs() {
		return this.jobs;
	}
	
	public void setStrategy(Strategy strategy) {
		this.strategy = strategy;
	}
	
	public void schedule(JobDescription job) {
		this.jobs.add(job);
	}
	
	public void unschedule(JobDescription job) {
		if (job != null) {
			this.jobs.remove(job);
		}
	}
	
	public JobDescription next() {
		JobDescription nextJob = this.strategy.next(this.jobs);
		this.unschedule(nextJob);
		return nextJob;
	}
}
