package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class TipoAtendimentoDAO extends DataBaseDAO {
        public void inserir(TipoAtendimento l) throws Exception {
        String sql = "INSERT INTO tipo_atendimento (nome,descricao,id_funcionario,situacao) VALUES(?,?,?,'ativo')";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, l.getNome());
        pstm.setString(2, l.getDescricao());
        pstm.setInt(3, l.getFuncionario().getId());
        pstm.execute();
        this.desconectar();
    }

    public ArrayList<TipoAtendimento> listar() throws Exception { 
        this.conectar();
        ArrayList<TipoAtendimento> lista = new ArrayList<TipoAtendimento>();
        String sql = "SELECT * FROM tipo_atendimento";
       
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            TipoAtendimento l = new TipoAtendimento();
            l.setId(rs.getInt("id"));
            l.setNome(rs.getString("nome"));
            l.setDescricao(rs.getString("descricao"));
            FuncionarioDAO pDAO = new FuncionarioDAO();
            l.setFuncionario(pDAO.carregarPorId(rs.getInt("id_funcionario")));
            l.setSituacao(rs.getString("situacao"));

            lista.add(l);
        }
        this.desconectar();
        return lista;
    }

    public TipoAtendimento carregarPorId(int id) throws Exception {
        TipoAtendimento l = new TipoAtendimento();
        String sql = "SELECT * FROM tipo_atendimento WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            l.setId(rs.getInt("id"));
            l.setNome(rs.getString("nome"));
            l.setDescricao(rs.getString("descricao"));
            FuncionarioDAO pDAO = new FuncionarioDAO();
            l.setFuncionario(pDAO.carregarPorId(rs.getInt("id_funcionario")));
        }
        this.desconectar();
        return l;
    }

    public void alterar(TipoAtendimento l) throws Exception {
        String sql = "UPDATE tipo_atendimento SET nome=?, descricao=?,  id_funcionario=? WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, l.getNome());
        pstm.setString(2, l.getDescricao());
        pstm.setInt(3, l.getFuncionario().getId());
        pstm.setInt(4, l.getId());
        pstm.execute();
        this.desconectar();
    }

    public void desativarTipoAtendimento(int id) throws Exception {
        String sql = "UPDATE tipo_atendimento SET situacao = 'desativado' WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }

    public void ativarTipoAtendimento(int id) throws Exception {
        String sql = "UPDATE tipo_atendimento SET situacao = 'ativo' WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }
}
