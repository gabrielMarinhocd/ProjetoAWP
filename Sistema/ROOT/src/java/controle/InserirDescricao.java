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
import modelo.Pedido;
import modelo.PedidoDAO;

/**
 *
 * @author gabri
 */
public class InserirDescricao extends HttpServlet {

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
            out.println("<title>Servlet InserirDescricao</title>");
            out.println("</head>");
            out.println("<body>");
            try {
                out.println("ok");
                int id_pedido = Integer.parseInt(request.getParameter("id"));
                String descricao = request.getParameter("descricao");

                Pedido p = new Pedido();
                PedidoDAO pDAO = new PedidoDAO();
                
                pDAO.inserirDescricao(id_pedido, descricao);

                int op = Integer.parseInt(request.getParameter("op"));
                int login = Integer.parseInt(request.getParameter("login"));
                if (op == 0) {
                    response.sendRedirect("listar_material.jsp?id=" + id_pedido + "&op=" + op + "&login=" + login);
                } else if (op == 1) {
                    response.sendRedirect("listar_material.jsp?id=" + id_pedido + "&op=" + op + "&login=" + login);
                } else {
                    response.sendRedirect("listar_material.jsp?id=" + id_pedido + "&op=2&login=0");
                }

            } catch (Exception e) {
               out.print("<script type='text/javascript'>"
                                + "            alert('Erro: Tempo exedido.');"
                                + "            history.back();"
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
