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
import modelo.FuncionarioDAO;
import modelo.Perfil;

/**
 *
 * @author gabri
 */
public class AlterarFuncionario extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AlterarFuncionario</title>");
            out.println("</head>");
            out.println("<body>");
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                String nome = request.getParameter("nome");
                String login = request.getParameter("login");
                String senha = request.getParameter("senha");
                int id_perfil = Integer.parseInt(request.getParameter("perfil"));

                if (!nome.isEmpty() && !login.isEmpty() && !senha.isEmpty()) {
                    Funcionario f = new Funcionario();
                    FuncionarioDAO fDAO = new FuncionarioDAO();
                    f.setId(id);
                    f.setNome(nome);
                    f.setLogin(login);
                    f.setSenha(senha);
                    Perfil p = new Perfil();
                    p.setId(id_perfil);
                    f.setPerfil(p);
                    fDAO.alterar(f);
                     out.print("<script type='text/javascript'>"
                                + "            alert('Ação efetuada com sucesso!');"
                                + "            history.back();"
                                + "        </script>");
                } else {
                    out.print("Algum campo obrigatório não foi preenchido!");
                }
            } catch (Exception e) {
                 out.print("<script type='text/javascript'>"
                                + "            alert('Erro: não foi possivel alterar! revise os campos');"
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
