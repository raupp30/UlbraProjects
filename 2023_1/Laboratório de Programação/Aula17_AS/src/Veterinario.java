// Subclasse de Funcionario: Veterinario
class Veterinario extends Funcionario {
    private String especialidade;

    public Veterinario(String nome, String cargo, double salario, String especialidade) {
        super(nome, cargo, salario);
        this.especialidade = especialidade;
    }

    public void realizarExame(Animal animal) {
        System.out.println("O veterinário está realizando um exame no animal " + animal.getNome());
    }
}