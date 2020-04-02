package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Pedido;
import modelo.PedidoDAO;

public class FinalizarPedido extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet FinalizarPedido</title>");
            out.println("</head>");
            out.println("<body>");
            HttpSession session = request.getSession();
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                Pedido carrinho = (Pedido) session.getAttribute("carrinho");
                PedidoDAO pDAO = new PedidoDAO();
                if (carrinho.getId() > 0) {
                    pDAO.alterar(carrinho);
                } else {
                    pDAO.inserir(carrinho);
                }
                session.removeAttribute("carrinho");

                int op = Integer.parseInt(request.getParameter("op"));
                int login = Integer.parseInt(request.getParameter("login"));
                if (op > 0) {
                    response.sendRedirect("listar_pedido_cf.jsp?id=" + login);
                } else {
                    response.sendRedirect("catalogo_servico.jsp?id=" + id + "&op=n");
                }
            } catch (Exception e) {
                out.print("<script type='text/javascript'>"
                        + "            alert('Erro não foi possivel efetuar a ação!');"
                        + "            history.back();"
                        + "        </script>");
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
