/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Material;
import modelo.MaterialDAO;
import modelo.Pedido;
import modelo.PedidoDAO;

/**
 *
 * @author gabri
 */
public class AlterarMaterial extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AlterarMaterial</title>");
            out.println("</head>");
            out.println("<body>");
            try {
                out.println("ok");
                int id = Integer.parseInt(request.getParameter("id"));
                out.println(request.getParameter("id") + "/");
                int id_pedido = Integer.parseInt(request.getParameter("id_pedido"));
                out.println(request.getParameter("id_pedido") + "/");
                String nome = request.getParameter("nome");
                out.println(request.getParameter("nome") + "/");
                int quantidade = Integer.parseInt(request.getParameter("quantidade"));
                out.println(request.getParameter("quantidade") + "/");
                double valor = Double.parseDouble(request.getParameter("valor"));
                out.println(request.getParameter("valor") + "/");
                double preco = Double.parseDouble(request.getParameter("preco1"));
                out.println(request.getParameter("preco1") + "/");
                double vAntigo = Double.parseDouble(request.getParameter("vAntigo"));
                out.println(request.getParameter("vAntigo") + "/");

                int qtdAntigo = Integer.parseInt(request.getParameter("qtdAntigo"));

                preco = preco - ((vAntigo * qtdAntigo));

                double calcula = (valor * quantidade);
                preco = preco + calcula;

                if (id > 0) {
                    Material m = new Material();
                    MaterialDAO mDAO = new MaterialDAO();
                    m.setId(id);
                    m.setNome(nome);
                    m.setQuantidade(quantidade);
                    m.setValor(valor);
                    Pedido p = new Pedido();
                    p.setId(id_pedido);
                    m.setPedido(p);
                    mDAO.alterar(m);
                } else {
                     out.print("<script type='text/javascript'>"
                                + "            alert('Algum campo obrigatório não foi preenchido!');"
                                + "            history.back();"
                                + "        </script>");
                    out.print("!");
                }

                Pedido p = new Pedido();
                PedidoDAO pDAO = new PedidoDAO();
                pDAO.registrarValor(id_pedido, preco);
                int op = Integer.parseInt(request.getParameter("op"));
                int login = Integer.parseInt(request.getParameter("login"));
                if (op == 0) {
                    response.sendRedirect("listar_material.jsp?id="+id_pedido+"&op="+op+"&login="+login);
                } else if (op == 1) {
                    response.sendRedirect("listar_material.jsp?id=" + login+"&op="+op+"&login="+login);
                } else {
                    response.sendRedirect("listar_material.jsp?id=" + id_pedido + "&op=2&login=0");
                }

            } catch (Exception e) {
                out.print("Erro:" + e);
                out.print("Algum campo obrigatório não foi preenchido!");
                out.print("<script type='text/javascript'>");
                out.print("Erro: Verifique se usou ponto no lugar da virgula!'); ");
                out.print("history.back();");
                out.print("</script>");
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
