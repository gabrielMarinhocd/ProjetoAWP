/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Administrador
 */
public class ClienteDAO extends DataBaseDAO {

    public void cadastrar(Cliente c) throws Exception {
        String sql = "INSERT INTO cliente (cpf_cnpj,nome,email,telefone,senha,celular,situacao) VALUES(?,?,?,?,?,?,'ativo')";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, c.getCpfCnpj());
        pstm.setString(2, c.getNome());
        pstm.setString(3, c.geteMail());
        pstm.setString(4, c.getTelefone());
        pstm.setString(5, c.getSenha());
        pstm.setString(6, c.getCelular());
        pstm.execute();
        this.desconectar();
    }

    public ArrayList<Cliente> listar() throws Exception {
        ArrayList<Cliente> lista = new ArrayList<Cliente>();
        String sql = "SELECT * FROM cliente ORDER BY nome ASC";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Cliente c = new Cliente();
            c.setId(rs.getInt("id"));
            c.setCpfCnpj(rs.getString("cpf_cnpj"));
            c.setNome(rs.getString("nome"));
            c.seteMail(rs.getString("email"));
            c.setTelefone(rs.getString("telefone"));
            c.setSenha(rs.getString("senha"));
            c.setCelular(rs.getString("celular"));
            c.setSituacao(rs.getString("situacao"));
            lista.add(c);
        }
        this.desconectar();
        return lista;
    }

    public void ativarCliente(int id) throws Exception {
        String sql = "UPDATE cliente SET situacao = 'ativo' WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }

    public void desativarCliente(int id) throws Exception {
        String sql = "UPDATE cliente SET situacao = 'desativado' WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }

    public Cliente carregarPorId(int id) throws Exception {
        Cliente c = new Cliente();
        String sql = "SELECT * FROM cliente WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            c.setId(rs.getInt("id"));
            c.setCpfCnpj(rs.getString("cpf_cnpj"));
            c.setNome(rs.getString("nome"));
            c.seteMail(rs.getString("email"));
            c.setTelefone(rs.getString("telefone"));
            c.setSenha(rs.getString("senha"));
            c.setCelular(rs.getString("celular"));
            c.setSituacao(rs.getString("situacao"));
        }
        this.desconectar();
        return c;
    }

    public void alterar(Cliente c) throws Exception {
        String sql = "UPDATE cliente SET cpf_cnpj=?, nome=?,email=?,telefone=?,senha=?,celular=? WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, c.getCpfCnpj());
        pstm.setString(2, c.getNome());
        pstm.setString(3, c.geteMail());
        pstm.setString(4, c.getTelefone());
        pstm.setString(5, c.getSenha());
        pstm.setString(6, c.getCelular());
        pstm.setInt(7, c.getId());
        pstm.execute();
        this.desconectar();
    }

    public Cliente logar(String cpfCnpj, String senha) throws Exception {
        Cliente c = new Cliente();
        String sql = "SELECT * FROM cliente WHERE email=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, cpfCnpj);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            if (senha.equals(rs.getString("senha"))) {
                c.setId(rs.getInt("id"));
                c.setCpfCnpj(rs.getString("cpf_cnpj"));
                c.setNome(rs.getString("nome"));
                c.seteMail(rs.getString("email"));
                c.setTelefone(rs.getString("telefone"));
                c.setSenha(rs.getString("senha"));
                c.setCelular(rs.getString("celular"));
                c.setSituacao(rs.getString("situacao"));
            }
        }
        this.desconectar();
        return c;
    }

    public Cliente EsqueciSenha(String cpfCnpj, String email) throws Exception {
        Cliente c = new Cliente();
        String sql = "SELECT * FROM cliente WHERE cpf_cnpj=? ";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, cpfCnpj);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            if (email.equals(rs.getString("email"))) {
                c.setId(rs.getInt("id"));
                c.setCpfCnpj(rs.getString("cpf_cnpj"));
                c.setNome(rs.getString("nome"));
                c.seteMail(rs.getString("email"));
                c.setTelefone(rs.getString("telefone"));
                c.setSenha(rs.getString("senha"));
                c.setCelular(rs.getString("celular"));
                c.setSituacao(rs.getString("situacao"));
            }
        }
        this.desconectar();
        return c;
    }

    public void AlterarSenha(int id, String senha) throws Exception {
        String sql = "UPDATE cliente SET senha = ? WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, senha);
        pstm.setInt(2, id);
        pstm.execute();
        this.desconectar();
    }

    public Cliente carregarPorCPF(String cpfCnpj) throws Exception {
        Cliente c = new Cliente();
        String sql = "SELECT * FROM cliente WHERE cpf_cnpj=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, cpfCnpj);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            c.setCpfCnpj(rs.getString("cpf_cnpj"));
        }
        this.desconectar();
        return c;
    }

    public Cliente carregarPorEmail(String email) throws Exception {
        Cliente c = new Cliente();
        String sql = "SELECT * FROM cliente WHERE email = ?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, email);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            c.seteMail(rs.getString("email"));
        }
        this.desconectar();
        return c;
    }
}
