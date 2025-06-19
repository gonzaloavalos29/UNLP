class Examen
{
    public int AlumnoId { get; private set; }
    public string Materia { get; private set; }
    public double Nota { get; private set; }
    public Examen(int alumnoid, string materia, double nota)
    {
        AlumnoId = alumnoid;
        Materia = materia;
        Nota = nota;
    }
}