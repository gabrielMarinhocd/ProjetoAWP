package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class FuncionarioDAO extends DataBaseDAO{
    public void inserir(Funcionario f) throws Exception{
        String sql = "INSERT INTO funcionario (nome,login,senha,situacao,id_perfil) VALUES(?,?,?,'ativo',?)";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, f.getNome());
        pstm.setString(2, f.getLogin());
        pstm.setString(3, f.getSenha());
        pstm.setInt(4, f.getPerfil().getId());
        pstm.execute();
        this.desconectar();
    }
    
    public ArrayList<Funcionario> listar() throws Exception{
        ArrayList<Funcionario> lista = new ArrayList<Funcionario>();
        String sql = "SELECT * FROM funcionario";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Funcionario f = new Funcionario();
            f.setId(rs.getInt("id"));
            f.setNome(rs.getString("nome"));
            f.setLogin(rs.getString("login"));
            f.setSenha(rs.getString("senha"));
            f.setSituacao(rs.getString("situacao"));
            PerfilDAO pDAO = new PerfilDAO();
            f.setPerfil(pDAO.carregarPorId(rs.getInt("id_perfil")));
            lista.add(f);
        }
        this.desconectar();
        return lista;
    }
    
     public void desativarFuncionario(int id) throws Exception {
        String sql = "UPDATE funcionario SET situacao = 'desativado' WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }
      public void excluir(int id) throws Exception {
        String sql = "DELETE FROM funcionario WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }
    public void AtivarFuncionario(int id) throws Exception {
        String sql = "UPDATE funcionario SET situacao = 'ativo' WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }
    
    public Funcionario carregarPorId(int id) throws Exception{
        Funcionario f = new Funcionario();
        String sql = "SELECT * FROM funcionario WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            f.setId(rs.getInt("id"));
            f.setNome(rs.getString("nome"));
            f.setLogin(rs.getString("login"));
            f.setSenha(rs.getString("senha"));
            f.setSituacao(rs.getString("situacao"));
            PerfilDAO pDAO = new PerfilDAO();
            f.setPerfil(pDAO.carregarPorId(rs.getInt("id_perfil")));
        }
        this.desconectar();
        return f;
    }
    
    public void alterar(Funcionario f) throws Exception{
        String sql = "UPDATE funcionario SET nome=?,login=?,senha=?,id_perfil=? WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, f.getNome());
        pstm.setString(2, f.getLogin());
        pstm.setString(3, f.getSenha());
        pstm.setInt(4, f.getPerfil().getId());
        pstm.setInt(5, f.getId());
        pstm.execute();
        this.desconectar();
    }
    
     public Funcionario logar(String login, String senha) throws Exception {
        Funcionario f = new Funcionario();
        String sql = "SELECT * FROM funcionario WHERE login=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, login);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            if (senha.equals(rs.getString("senha"))) {
                f.setId(rs.getInt("id"));
                f.setNome(rs.getString("nome"));
                f.setLogin(rs.getString("login"));
                f.setSenha(rs.getString("senha"));
                f.setSituacao(rs.getString("situacao"));
                PerfilDAO pDAO = new PerfilDAO();
                f.setPerfil(pDAO.carregarPorId(rs.getInt("id_perfil")));
            }
        }
        this.desconectar();
        return f;
    }
}
