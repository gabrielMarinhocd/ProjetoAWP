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
import javax.servlet.http.HttpSession;
import modelo.Funcionario;
import modelo.FuncionarioDAO;

/**
 *
 * @author gabri
 */
public class ValidaLogin extends HttpServlet {

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
            out.println("<title>Servlet ValidaLogin</title>");
            out.println("</head>");
            out.println("<body>");
            HttpSession session = request.getSession();
            try {
                String login = request.getParameter("login");
                String senha = request.getParameter("senha");
                FuncionarioDAO fDAO = new FuncionarioDAO();
                Funcionario f = fDAO.logar(login, senha);
                if (f.getSituacao().equals("ativo")){
                     if (f.getPerfil().getNome().equals("Gerente")) {
                    session.setAttribute("funcionario", f);
                    response.sendRedirect("listar_pedido_gerente.jsp");
                } else if (f.getPerfil().getNome().equals("Funcionário")) {
                    session.setAttribute("funcionario", f);
                    response.sendRedirect("listar_pedido.jsp");
                } else if (f.getPerfil().getNome().equals("admin")) {
                    session.setAttribute("funcionario", f);
                    response.sendRedirect("listar_pedido.jsp");
                }
                } else if(f.getSituacao().equals("desativado")) {
                    out.print("<script type='text/javascript'>");
                    out.print("alert('Funcionario DESATIVADO!'); ");
                    out.print("history.back();");
                    out.print("</script>");
                } else {
                    out.print("<script type='text/javascript'>"
                                + "            alert('Funcionario e/ou senha inválidos!');"
                                + "            history.back();"
                                + "        </script>");
                
                }
            } catch (Exception e) {
                out.print("<script type='text/javascript'>"
                                + "            alert('Funcionario e/ou senha inválidos!');"
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
