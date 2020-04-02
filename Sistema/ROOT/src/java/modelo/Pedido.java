package modelo;

import java.sql.Date;
import java.util.ArrayList;

public class Pedido {

    private int id;
    private Cliente cliente;
    private ArrayList<ItemPedido> itens;
    private Funcionario funcionario;
    private Date data;
    private String status;
    private Date dataPagamento;
    private Date dataEntrega;
    private double valor;
    private String situacao;
    private String okValor;
    private String aceitoValor;
    private Double maoObra;
    private String descricao;
    private String formaPagamento;
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public ArrayList<ItemPedido> getItens() {
        return itens;
    }

    public void setItens(ArrayList<ItemPedido> itens) {
        this.itens = itens;
    }

    public Funcionario getFuncionario() {
        return funcionario;
    }

    public void setFuncionario(Funcionario funcionario) {
        this.funcionario = funcionario;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getDataPagamento() {
        return dataPagamento;
    }

    public void setDataPagamento(Date dataPagamento) {
        this.dataPagamento = dataPagamento;
    }

    public Date getDataEntrega() {
        return dataEntrega;
    }

    public void setDataEntrega(Date dataEntrega) {
        this.dataEntrega = dataEntrega;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public String getSituacao() {
        return situacao;
    }

    public void setSituacao(String situacao) {
        this.situacao = situacao;
    }

    public String getAceitoValor() {
        return aceitoValor;
    }

    public void setAceitoValor(String aceitoValor) {
        this.aceitoValor = aceitoValor;
    }

    public String getOkValor() {
        return okValor;
    }

    public void setOkValor(String okValor) {
        this.okValor = okValor;
    }

    public Double getMaoObra() {
        return maoObra;
    }

    public void setMaoObra(Double maoObra) {
        this.maoObra = maoObra;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getFormaPagamento() {
        return formaPagamento;
    }

    public void setFormaPagamento(String formaPagamento) {
        this.formaPagamento = formaPagamento;
    }

}
