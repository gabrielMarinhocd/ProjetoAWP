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
import modelo.Cliente;
import modelo.ClienteDAO;

/**
 *
 * @author gabri
 */
public class AlterarCliente extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AlterarCliente</title>");
            out.println("</head>");
            out.println("<body>");
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                String cpfCnpj = request.getParameter("cpfCnpj");
                String nome = request.getParameter("nome");
                String eMail = request.getParameter("eMail");
                String telefone = request.getParameter("telefone");
                String senha = request.getParameter("senha");
                String celular = request.getParameter("celular");
                if (id > 0) {
                    Cliente c = new Cliente();
                    ClienteDAO cDAO = new ClienteDAO();
                    c.setId(id);
                    c.setCpfCnpj(cpfCnpj);
                    c.setNome(nome);
                    c.seteMail(eMail);
                    c.setTelefone(telefone);
                    c.setSenha(senha);
                    c.setCelular(celular);
                    cDAO.alterar(c);
                    out.print("<script type='text/javascript'>"
                            + "            alert('Ação efetuada com sucesso!');"
                            + "            history.back();"
                            + "        </script>");
                } else {
                    out.print("<script type='text/javascript'>"
                            + "            alert('Erro: Ao alterar revise!');"
                            + "            history.back();"
                            + "        </script>");
                }
            } catch (Exception e) {
                out.print("<script type='text/javascript'>"
                        + "            alert('Erro: não foi possivel alterar! revise os campos);"
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
