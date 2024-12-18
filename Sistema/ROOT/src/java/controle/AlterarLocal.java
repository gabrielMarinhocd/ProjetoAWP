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
import modelo.Funcionario;
import modelo.Local;
import modelo.LocalDAO;

/**
 *
 * @author gabri
 */
public class AlterarLocal extends HttpServlet {

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
            out.println("<title>Servlet AlterarLocal</title>");            
            out.println("</head>");
            out.println("<body>");
             try {
                int id = Integer.parseInt(request.getParameter("id"));
                String nome = request.getParameter("nome");
                String endereco = request.getParameter("endereco");
                String link = request.getParameter("link");
                int idFuncionario = Integer.parseInt(request.getParameter("idFuncionario"));

                if (id > 0) {
                    Local l = new Local();
                    LocalDAO fDAO = new LocalDAO();
                    l.setId(id);
                    l.setNome(nome);
                    l.setEndereco(endereco);
                    l.setLink(link);         
                    Funcionario f = new Funcionario();
                    f.setId(idFuncionario);
                    l.setFuncionario(f);
                    fDAO.alterar(l);
                    response.sendRedirect("gerenciamento.jsp");
                } else {
                     out.print("<script type='text/javascript'>"
                                + "            alert('Ação efetuada com sucesso!');"
                                + "            history.back();"
                                + "        </script>");
                }
                
            } catch (Exception e) {
                 out.print("<script type='text/javascript'>"
                                + "            alert('Erro: não foi possivel efetuar a ação!');"
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
