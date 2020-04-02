/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.ItemPedido;
import modelo.Pedido;

/**
 *
 * @author gabri
 */
public class GerenciarCarrinho extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GerenciarCarrinho</title>");            
            out.println("</head>");
            out.println("<body>");
                 HttpSession session = request.getSession();
            try {
                Pedido carrinho = (Pedido) session.getAttribute("carrinho");
                ArrayList<ItemPedido> itens = carrinho.getItens();
                String op = request.getParameter("op");
                if (op.equals("add")) {
                    String red = request.getParameter("red");
                    String local = request.getParameter("local");
                    String fabricante = request.getParameter("fabricante");
                    String modelo = request.getParameter("modelo");
                    String potencia = request.getParameter("potencia");
                    String tensaoEntrada = request.getParameter("tensaoEntrada");
                    String tensaoSaida = request.getParameter("tensaoSaida");
                    String numeroSerie = request.getParameter("numeroSerie");
                    String problema = request.getParameter("problema");
                    String meioPagamento = request.getParameter("meioPagamento");                                        
                    ItemPedido item = new ItemPedido();
                    item.setFabricante(fabricante);
                    item.setModelo(modelo);
                    item.setPotencia(potencia);
                    item.setTensaoEntrada(tensaoEntrada);
                    item.setTensaoSaida(tensaoSaida);
                    item.setNumeroSerie(numeroSerie);
                    item.setProblema(problema);
                    item.setMeioPagamento(meioPagamento);
                    item.setLocal(local);
                    
                                        
                    boolean achou = false;
                    int i = 0;
                    for (ItemPedido ip : itens) {
                        if (ip.getQuantidade() >= 0) {
                            item.setQuantidade(ip.getQuantidade() + 1);
                            achou = true;
                            break;
                        }
                        i++;
                    }
                    if (!achou) {
                        itens.add(item);
                    } else {
                        itens.get(i).setQuantidade(item.getQuantidade());
                    }
                    carrinho.setItens(itens);
                    session.setAttribute("carrinho", carrinho);
                    if (red.equals("catalogo")) {
                        response.sendRedirect("resumo_pedido.jsp");
                    } else if (red.equals("resumo")) {
                        response.sendRedirect("resumo_pedido.jsp");
                    }
                } else if (op.equals("remove")) {
                    out.println("op");
                    int index = Integer.parseInt(request.getParameter("item"));
                    itens.remove(index - 1);
                    carrinho.setItens(itens);
                    session.setAttribute("carrinho", carrinho);
                    response.sendRedirect("catalogo_servico.jsp?op=c");
                }
            } catch (Exception e) {
                 out.print("<script type='text/javascript'>"
                        + "            alert('Erro: Não foi possivel efetuar a ação!');"
                        + "           window.location.href = 'login.jsp';"
                        + "        </script>");
                out.print("Erro:" + e);
            }
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
