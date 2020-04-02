package modelo;

import java.sql.Date;

public class ItemPedido {
    private int id;
    private String fabricante;
    private String modelo;
    private String potencia;
    private String tensaoEntrada;
    private String tensaoSaida;
    private String numeroSerie;
    private String problema;
    private String meioPagamento;
    private String local;
    private int quantidade;
    private Pedido pedido;
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFabricante() {
        return fabricante;
    }

    public void setFabricante(String fabricante) {
        this.fabricante = fabricante;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getPotencia() {
        return potencia;
    }

    public void setPotencia(String potencia) {
        this.potencia = potencia;
    }

    public String getTensaoEntrada() {
        return tensaoEntrada;
    }

    public void setTensaoEntrada(String tensaoEntrada) {
        this.tensaoEntrada = tensaoEntrada;
    }

    public String getTensaoSaida() {
        return tensaoSaida;
    }

    public void setTensaoSaida(String tensaoSaida) {
        this.tensaoSaida = tensaoSaida;
    }

    public String getNumeroSerie() {
        return numeroSerie;
    }

    public void setNumeroSerie(String numeroSerie) {
        this.numeroSerie = numeroSerie;
    }

    public String getProblema() {
        return problema;
    }

    public void setProblema(String problema) {
        this.problema = problema;
    }

    public String getMeioPagamento() {
        return meioPagamento;
    }

    public void setMeioPagamento(String meioPagamento) {
        this.meioPagamento = meioPagamento;
    }

    public String getLocal() {
        return local;
    }

    public void setLocal(String local) {
        this.local = local;
    }


    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public Pedido getPedido() {
        return pedido;
    }

    public void setPedido(Pedido pedido) {
        this.pedido = pedido;
    }

}
