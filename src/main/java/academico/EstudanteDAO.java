package academico;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

public class EstudanteDAO {

    private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("database-atividade");

    public static void adicionar(String matricula, String nome) {
        // Obter "conexão".
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();

        Estudante estudante = new Estudante();
        estudante.setMatricula(matricula);
        estudante.setNome(nome);

        // Grava o objeto no banco de dados.
        em.persist(estudante);
        em.getTransaction().commit();
        em.close();
    }

    public static void alterar(String matricula, String nome) {
        // Obter "conexão".
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();

        Estudante estudante = new Estudante();
        estudante.setMatricula(matricula);
        estudante.setNome(nome);

        // Grava o objeto no banco de dados.
        em.merge(estudante);
        em.getTransaction().commit();
        em.close();
    }

    public static void excluir(String matricula) {
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();

        Estudante estudante = em.find(Estudante.class, matricula);
        em.remove(estudante);

        em.getTransaction().commit();
        em.close();
    }

    public static List<Estudante> listar() {
        EntityManager em = emf.createEntityManager();
        String jpql = "from Estudante";
        TypedQuery<Estudante> query = em.createQuery(jpql, Estudante.class);
        List<Estudante> result = query.getResultList();
        em.close();
        return result;
    }
}