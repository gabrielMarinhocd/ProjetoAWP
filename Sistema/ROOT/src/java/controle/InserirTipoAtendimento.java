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
import modelo.TipoAtendimento;
import modelo.TipoAtendimentoDAO;

/**
 *
 * @author gabri
 */
public class InserirTipoAtendimento extends HttpServlet {

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
            out.println("<title>Servlet InserirTipoAtendimento</title>");            
            out.println("</head>");
            out.println("<body>");
            
               try {
                String nome = request.getParameter("nome");
                String descricao = request.getParameter("descricao");
                int idFuncionario = Integer.parseInt(request.getParameter("idFuncionario"));

                if (idFuncionario > 0) {
                    TipoAtendimento tp = new TipoAtendimento();
                    TipoAtendimentoDAO uDAO = new TipoAtendimentoDAO();
                    tp.setNome(nome);
                    tp.setDescricao(descricao);
                    Funcionario p = new Funcionario();
                    p.setId(idFuncionario);
                    tp.setFuncionario(p);
                    uDAO.inserir(tp);
                    response.sendRedirect("gerenciamento.jsp");
                } else {
                    out.print("Algum campo obrigatório não foi preenchido!");
                    out.print("Algum campo obrigatório não foi preenchido!");
                     out.print("<script type='text/javascript'>");
                    out.print("Erro: tipo de atendimento ja cadastrado'); ");
                    out.print("history.back();");
                    out.print("</script>");
                }
            } catch (Exception e) {
                    out.print("<script type='text/javascript'>"
                                + "            alert('Erro: Estes dados ja tinham sido cadastrados. Insira dados diferentes! ');"
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
