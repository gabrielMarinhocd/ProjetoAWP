package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MaterialDAO extends DataBaseDAO {

    public void inserir(Material m) throws Exception {
        String sql = "INSERT INTO material (nome,quantidade,id_pedido,valor) VALUES(?,?,?,?)";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, m.getNome());
        pstm.setInt(2, m.getQuantidade());
        pstm.setInt(3, m.getPedido().getId());
        pstm.setDouble(4, m.getValor());
        pstm.execute();
        this.desconectar();
    }

    public ArrayList<Material> listar() throws Exception {
        ArrayList<Material> lista = new ArrayList<Material>();
        String sql = "SELECT * FROM material";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Material m = new Material();
            m.setId(rs.getInt("id"));
            m.setNome(rs.getString("nome"));
            m.setQuantidade(rs.getInt("quantidade"));
            m.setValor(rs.getDouble("valor"));
            PedidoDAO pDAO = new PedidoDAO();
            m.setPedido(pDAO.carregarPorId(rs.getInt("id_pedido")));
            lista.add(m);
        }
        this.desconectar();
        return lista;
    }

    public void calcula(int id, double valor) throws Exception {
        String sql = "DELETE FROM material WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }

    public void excluir(int id) throws Exception {
        String sql = "DELETE FROM material WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }

    public Material carregarPorId(int id) throws Exception {
        Material m = new Material();
        String sql = "SELECT * FROM material WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            m.setId(rs.getInt("id"));
            m.setNome(rs.getString("nome"));
            m.setQuantidade(rs.getInt("quantidade"));
            m.setValor(rs.getDouble("valor"));
            PedidoDAO pDAO = new PedidoDAO();
            m.setPedido(pDAO.carregarPorId(rs.getInt("id_pedido")));
        }
        this.desconectar();
        return m;
    }

    public void alterar(Material m) throws Exception {
        String sql = "UPDATE material SET nome=?, quantidade=?, valor=? WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, m.getNome());
        pstm.setInt(2, m.getQuantidade());
        pstm.setDouble(3, m.getValor());
        pstm.setInt(4, m.getId());
        pstm.execute();
        this.desconectar();
    }

}
