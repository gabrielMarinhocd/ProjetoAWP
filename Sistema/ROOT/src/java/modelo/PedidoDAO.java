package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class PedidoDAO extends DataBaseDAO {

    public void inserir(Pedido p) throws Exception {
        String sql = "INSERT INTO pedido (data,id_cliente,status) VALUES(now(),?,'Aguardando entrada na loja')";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        pstm.setInt(1, p.getCliente().getId());
        pstm.execute();
        ResultSet rs = pstm.getGeneratedKeys();
        if (rs.next()) {
            System.out.println("ID:" + rs.getInt(1));
            p.setId(rs.getInt(1));
        }
        for (ItemPedido ip : p.getItens()) {
            String sql_item = "INSERT INTO item_pedido (fabricante, modelo,potencia,tensao_entrada,tensao_saida,numero_serie,problema,"
                    + " meio_pagamento, local,quantidade,id_pedido) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement pstm_item = conn.prepareStatement(sql_item);
            pstm_item.setString(1, ip.getFabricante());
            pstm_item.setString(2, ip.getModelo());
            pstm_item.setString(3, ip.getPotencia());
            pstm_item.setString(4, ip.getTensaoEntrada());
            pstm_item.setString(5, ip.getTensaoSaida());
            pstm_item.setString(6, ip.getNumeroSerie());
            pstm_item.setString(7, ip.getProblema());
            pstm_item.setString(8, ip.getMeioPagamento());
            pstm_item.setString(9, ip.getLocal());
            pstm_item.setInt(10, ip.getQuantidade());
            pstm_item.setInt(11, p.getId());
            pstm_item.execute();
        }

        this.desconectar();
    }

    public ArrayList<Pedido> listar() throws Exception {
        this.conectar();
        ArrayList<Pedido> lista = new ArrayList<Pedido>();
        String sql = "SELECT * FROM pedido order by id desc";
        
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Pedido p = new Pedido();
            p.setId(rs.getInt("id"));
            p.setData(rs.getDate("data"));
            p.setStatus(rs.getString("status"));
            p.setDataEntrega(rs.getDate("data_entrega"));
            p.setDataPagamento(rs.getDate("data_pagamento"));
            p.setValor(rs.getDouble("valor"));
            p.setSituacao(rs.getString("situacao"));
            p.setAceitoValor(rs.getString("aceito_valor"));
            p.setOkValor(rs.getString("preco_final"));
            p.setMaoObra(rs.getDouble("mao_obra"));
            p.setDescricao(rs.getString("descricao"));
            p.setFormaPagamento(rs.getString("forma_pagamento"));
            FuncionarioDAO fDAO = new FuncionarioDAO();
            p.setFuncionario(fDAO.carregarPorId(rs.getInt("id_funcionario")));
            ClienteDAO pDAO = new ClienteDAO();
            p.setCliente(pDAO.carregarPorId(rs.getInt("id_cliente")));
            lista.add(p);
        }
        this.desconectar();
        return lista;
    }

    public void inserirDescricao(int id, String descricao) throws Exception {
        String sql = "UPDATE pedido SET descricao = ? WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, descricao);
        pstm.setInt(2, id);
        pstm.execute();
        this.desconectar();
    }

    public void precoFinal(int id, double valor) throws Exception {
        String sql = "UPDATE pedido SET preco_final = ?, status = 'Aguardando confirmação!' WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setDouble(1, valor);
        pstm.setInt(2, id);
        pstm.execute();
        this.desconectar();
    }

    public void registrarValor(int id, double valor) throws Exception {
        String sql = "UPDATE pedido SET valor = ? WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setDouble(1, valor);
        pstm.setInt(2, id);
        pstm.execute();
        this.desconectar();
    }

    public void maoObra(int id, double mao_obra) throws Exception {
        String sql = "UPDATE pedido SET mao_obra = ? WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setDouble(1, mao_obra);
        pstm.setInt(2, id);
        pstm.execute();
        this.desconectar();
    }

    public void registrarPag(int id, String formaPagamento) throws Exception {
        String sql = "UPDATE  pedido SET forma_pagamento = ?, data_pagamento = now(), status='Finalizado', situacao='Finalizado' WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, formaPagamento);
        pstm.setInt(2, id);
        pstm.execute();
        this.desconectar();
    }
    
     public void valorRecusado(int id) throws Exception {
        String sql = "UPDATE pedido SET status = 'Valor não aprovado', situacao = 'Valor não aprovado'  WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }

    public void cancelarPedido(int id) throws Exception {
        String sql = "UPDATE pedido SET status = 'Cancelado', situacao = 'Cancelado'  WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }

    public void AceitoValor(int id) throws Exception {
        String sql = "UPDATE pedido SET aceito_valor = 'aceito', status='Produto esta recebendo assistência' WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }

    public void ConfirmaServiço(int id, int id_funcionario) throws Exception {
        String sql = "UPDATE pedido SET status = 'Produto PRONTO! Aguardando retirada na loja', id_funcionario = ? WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id_funcionario);
        pstm.setInt(2, id);
        pstm.execute();
        this.desconectar();
    }

    public void DataRecebimento(int id) throws Exception {
        String sql = "UPDATE pedido SET data_entrega = now(), status='Entregue' WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }

    public Pedido carregarPorId(int id) throws Exception { 
        this.conectar();
        Pedido p = new Pedido();
        String sql = "SELECT * FROM pedido WHERE id=?";
       
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            p.setId(rs.getInt("id"));
            p.setData(rs.getDate("data"));
            p.setStatus(rs.getString("status"));
            p.setDataEntrega(rs.getDate("data_entrega"));
            p.setDataPagamento(rs.getDate("data_pagamento"));
            p.setValor(rs.getDouble("valor"));
            p.setAceitoValor(rs.getString("aceito_valor"));
            p.setOkValor(rs.getString("preco_final"));
            p.setSituacao(rs.getString("situacao"));
            p.setMaoObra(rs.getDouble("mao_obra"));
            p.setDescricao(rs.getString("descricao"));
            p.setFormaPagamento(rs.getString("forma_pagamento"));
            FuncionarioDAO fDAO = new FuncionarioDAO();
            p.setFuncionario(fDAO.carregarPorId(rs.getInt("id_funcionario")));
            ClienteDAO pDAO = new ClienteDAO();
            p.setCliente(pDAO.carregarPorId(rs.getInt("id_cliente")));
        }
        this.desconectar();
        return p;
    }

    public ArrayList<ItemPedido> carregarItensPedido(int id_pedido) throws Exception {
       this.conectar();
       ArrayList<ItemPedido> lista = new ArrayList<ItemPedido>();
        String sql = "SELECT * FROM item_pedido WHERE id_pedido = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id_pedido);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            ItemPedido ip = new ItemPedido();
            ip.setId(rs.getInt("id"));
            ip.setFabricante(rs.getString("fabricante"));
            ip.setModelo(rs.getString("modelo"));
            ip.setPotencia(rs.getString("potencia"));
            ip.setTensaoEntrada(rs.getString("tensao_entrada"));
            ip.setTensaoSaida(rs.getString("tensao_saida"));
            ip.setNumeroSerie(rs.getString("numero_serie"));
            ip.setProblema(rs.getString("problema"));
            ip.setMeioPagamento(rs.getString("meio_pagamento"));
            ip.setLocal(rs.getString("local"));
            ip.setQuantidade(rs.getInt("quantidade"));
            lista.add(ip);
        }
        this.desconectar();
        return lista;
    }

    public void alterar(Pedido p) throws Exception {
        this.conectar();
        String sql = "UPDATE pedido SET data = now(),id_cliente=? WHERE id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, p.getFuncionario().getId());
        pstm.setInt(2, p.getId());
        pstm.execute();

        String sql_limpa_itens = "DELETE FROM item_pedido WHERE id_pedido=?";
        PreparedStatement pstm_limpa_itens = conn.prepareStatement(sql_limpa_itens);
        pstm_limpa_itens.setInt(1, p.getId());
        pstm_limpa_itens.execute();

        for (ItemPedido ip : p.getItens()) {
            String sql_item = "INSERT INTO item_pedido (id_pedido,fabricante, modelo,potencia,tensao_entrada,tensao_saida,numero_serie,problema,"
                    + " meio_pagamento, local_recebimento,quantidade) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement pstm_item = conn.prepareStatement(sql_item);
            pstm_item.setInt(1, p.getId());
            pstm_item.setString(2, ip.getFabricante());
            pstm_item.setString(3, ip.getModelo());
            pstm_item.setString(4, ip.getPotencia());
            pstm_item.setString(5, ip.getTensaoEntrada());
            pstm_item.setString(6, ip.getTensaoSaida());
            pstm_item.setString(7, ip.getNumeroSerie());
            pstm_item.setString(8, ip.getProblema());
            pstm_item.setString(9, ip.getMeioPagamento());
            pstm_item.setString(10, ip.getLocal());
            pstm_item.setInt(11, ip.getQuantidade());
        }

        this.desconectar();
    }
}
