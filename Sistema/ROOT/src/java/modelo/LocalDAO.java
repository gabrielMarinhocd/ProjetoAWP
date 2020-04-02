package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class LocalDAO extends DataBaseDAO {

    public void inserir(Local l) throws Exception {
        String sql = "INSERT INTO local (nome,endereco,link,id_funcionario,situacao) VALUES(?,?,?,?,'ativo')";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, l.getNome());
        pstm.setString(2, l.getEndereco());
        pstm.setString(3, l.getLink());
        pstm.setInt(4, l.getFuncionario().getId());
        pstm.execute();
        this.desconectar();
    }

    public ArrayList<Local> listar() throws Exception {
        ArrayList<Local> lista = new ArrayList<Local>();
        String sql = "SELECT * FROM local";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Local l = new Local();
            l.setId(rs.getInt("id"));
            l.setNome(rs.getString("nome"));
            l.setEndereco(rs.getString("endereco"));
            l.setLink(rs.getString("link"));
            FuncionarioDAO pDAO = new FuncionarioDAO();
            l.setFuncionario(pDAO.carregarPorId(rs.getInt("id_funcionario")));
            l.setSituacao(rs.getString("situacao"));

            lista.add(l);
        }
        this.desconectar();
        return lista;
    }

    public Local carregarPorId(int id) throws Exception {
        Local l = new Local();
        String sql = "SELECT * FROM local WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            l.setId(rs.getInt("id"));
            l.setNome(rs.getString("nome"));
            l.setEndereco(rs.getString("endereco"));
            l.setLink(rs.getString("link"));
            FuncionarioDAO pDAO = new FuncionarioDAO();
            l.setFuncionario(pDAO.carregarPorId(rs.getInt("id_funcionario")));
        }
        this.desconectar();
        return l;
    }

    public void alterar(Local l) throws Exception {
        String sql = "UPDATE local SET nome=?, endereco=?, link=?, id_funcionario=? WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, l.getNome());
        pstm.setString(2, l.getEndereco());
        pstm.setString(3, l.getLink());
        pstm.setInt(4, l.getFuncionario().getId());
        pstm.setInt(5, l.getId());
        pstm.execute();
        this.desconectar();
    }

    public void desativarLocal(int id) throws Exception {
        String sql = "UPDATE local SET situacao = 'desativado' WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }

    public void ativarLocal(int id) throws Exception {
        String sql = "UPDATE local SET situacao = 'ativo' WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }
}
