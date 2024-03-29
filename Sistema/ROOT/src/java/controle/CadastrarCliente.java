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
public class CadastrarCliente extends HttpServlet {

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
            out.println("<title>Servlet CadastrarCliente</title>");
            out.println("</head>");
            out.println("<body>");

            String cpfCnpj = request.getParameter("cpfCnpj");
            String nome = request.getParameter("nome");
            String eMail = request.getParameter("eMail");
            String telefone = request.getParameter("telefone");
            String senha = request.getParameter("senha");
            String celular = request.getParameter("celular");
            try {

                if (cpfCnpj != null) {
                    Cliente c = new Cliente();
                    ClienteDAO cDAO = new ClienteDAO();
                    if (cpfCnpj != null) {

                    }
                    c.setCpfCnpj(cpfCnpj);
                    c.setNome(nome);
                    c.seteMail(eMail);
                    c.setTelefone(telefone);
                    c.setSenha(senha);
                    c.setCelular(celular);
                    cDAO.cadastrar(c);
                    out.print("<script type='text/javascript'>"
                            + "            alert('Cadastro feito com sucesso!');"
                            + " window.location.href = 'login.jsp'; "
                            + "        </script>");
                } else {
                    out.print("Algum campo obrigatório não foi preenchido!");

                }
            } catch (Exception e) {

                Cliente c1 = new Cliente();
                Cliente c2 = new Cliente();
                ClienteDAO cDAO = new ClienteDAO();
                try {
                    
                    c2 = cDAO.carregarPorCPF(cpfCnpj);
                    c1 = cDAO.carregarPorEmail(eMail);
                    if (c2.getCpfCnpj() != null) {

                        out.print("<script type='text/javascript'>"
                                + "            alert('ERRO: Este CPF ou CNPJ já existe cadastrado.');"
                                + "            history.back();"
                                + "        </script>");
                    } else if (c1.geteMail() != null) {
                        out.print("<script type='text/javascript'>"
                                + "            alert('ERRO: Este e-mail já existe cadastrado.');"
                                + "            history.back();"
                                + "        </script>");
                    }
                } catch (Exception e1) {
                    out.print("Erro:" + e1);
                     out.print("<script type='text/javascript'>"
                                + "            alert('Erro: Não foi possivel cadastrar!');"
                                + "            history.back();"
                                + "        </script>");
                }

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
