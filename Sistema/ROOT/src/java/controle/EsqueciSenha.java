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
import modelo.Cliente;
import modelo.ClienteDAO;
import modelo.SendEmail;

/**
 *
 * @author gabri
 */
public class EsqueciSenha extends HttpServlet {

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
            out.println("<title>Servlet EsqueciSenha</title>");
            out.println("</head>");
            out.println("<body>");
            HttpSession session = request.getSession();
            String cpf = request.getParameter("cpf");
            String email = request.getParameter("email");
            try {

                ClienteDAO cDAO = new ClienteDAO();
                Cliente c = cDAO.EsqueciSenha(cpf, email);
                if (c.getId() > 0) {
                    Cliente p = new Cliente();
                    ClienteDAO pDAO = new ClienteDAO();
                    session.setAttribute("cliente", c);
                    pDAO.AlterarSenha(c.getId(), String.valueOf(c.getId()) + "GMdS" + String.valueOf(c.getId()));

                    int id = c.getId();
                    String recipient = c.geteMail();
                    String titulo = "Sua senha foi alterada com suceso";
                    if (id > 0) {
                        request.setCharacterEncoding("UTF-8");
                        SendEmail se = new SendEmail();
                        StringBuilder texto = new StringBuilder();

                        texto.append("<div align='center'>");
                        texto.append("<table border='0' width='550px' cellpadding='0' cellspacing='0' bgcolor='ffffff'>");
                        texto.append("<tr>");
                        texto.append("<td align='center'>");
                        texto.append("<table border='0' align='center' width='550px' cellpadding='0' cellspacing='0' class='container590'>");
                        texto.append("<tr>");
                        texto.append(" <td height='25' style='font-size: 25px; line-height: 25px;'>&nbsp;</td>");
                        texto.append("</tr>");
                        texto.append("<tr>");

                        texto.append("<td align='center'>");
                        texto.append("<table border='0' align='center' width='550px' cellpadding='0' cellspacing='0' class='container590'>");
                        texto.append(" <tr>");
                        texto.append("<td align='center' height='70' style='height:50px;'>");
                        texto.append("<a href='http://atcawpbrasil.com.br' style='background-color:black; color:white;  display: block; border-radius:3px; border-style: none !important; border: 0 !important;'>");

                        texto.append("<h1 style='padding: 10px 10px;' >Assistência Técnica AWP</h1></a>");

                        texto.append("</td>");
                        texto.append("</tr>");
                        texto.append("<tr>");
                        texto.append(" <td align='center'>");
                        texto.append("<table width='360 ' border='0' cellpadding='0' cellspacing='0' style='border-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt;' class='container590 hide'>");
                        texto.append(" <tr>");

                        texto.append("<th width='120' align='center' style='font-size: 14px; font-family: 'Work Sans', Calibri, sans-serif; line-height: 24px;'>");
                        texto.append("<a href='http://atcawpbrasil.com.br' style='color: #312c32; text-decoration: none;'> </a>");

                        texto.append("</th>");
                        texto.append("<th width='120' align='center' style='font-size: 14px; font-family: 'Work Sans', Calibri, sans-serif; line-height: 24px;'>");
                        texto.append(" <a href='http://atcawpbrasil.com.br' style='color: #312c32; text-decoration: none;'> </a>");

                        texto.append(" </th>");
                        texto.append("<th width='120' align='center' style='font-size: 14px; font-family: 'Work Sans', Calibri, sans-serif; line-height: 24px;'>");
                        texto.append("<a href='http://atcawpbrasil.com.br' style='color: #312c32; text-decoration: none;'> </a>");
                        texto.append("</th>");
                        texto.append("</tr>");
                        texto.append("<tr>");

                        texto.append("<td width='120' align='center' style='font-size: 14px; font-family: 'Work Sans', Calibri, sans-serif; line-height: 24px;'>");
                        texto.append(id);
                        texto.append("</td>");

                        texto.append("<td width='120' align='center' style='font-size: 14px; font-family: 'Work Sans', Calibri, sans-serif; line-height: 24px;'>");
                        texto.append("<a href='' style='color: #312c32; text-decoration: none;'>  </a>");
                        texto.append("</td>");

                        texto.append("<td width='120' align='center' style='font-size: 14px; font-family: 'Work Sans', Calibri, sans-serif; line-height: 24px;'>");
                        texto.append("<a href='http://atcawpbrasil.com.br' style='color: #312c32; text-decoration: none;'>   </a>");

                        texto.append(" </td>");
                        texto.append(" </tr>");
                        texto.append("</table>");
                        texto.append("</td>");
                        texto.append("</tr>");
                        texto.append("</table>");
                        texto.append("</td>");
                        texto.append(" </tr>");
                        texto.append("</table>");
                        texto.append("</td>");
                        texto.append("</tr>");
                        texto.append(" </table>");
                        texto.append("<table border='0' width='400px' cellpadding='0' cellspacing='0' bgcolor='ffffff' class='bg_color'>");
                        texto.append(" <tr>");
                        texto.append("<td align='center'>");
                        texto.append("<table border='0' align='center' width='450px' cellpadding='0' cellspacing='0' class='container590'>");
                        texto.append("<tr>");
                        texto.append("<td height='20' style='font-size: 20px; line-height: 20px;'>&nbsp;</td>");
                        texto.append("</tr>");
                        texto.append("<tr>");
                        texto.append("<td align='center' style='color: #343434; font-size: 24px; font-family: Quicksand, Calibri, sans-serif; font-weight:700;letter-spacing: 3px; line-height: 35px;'class='main-header'>");
                        texto.append(" <div style='line-height: 35px'>");

                        texto.append("Sua nova senha é:").append(String.valueOf(c.getId())).append("GMdS").append(String.valueOf(c.getId()));

                        texto.append("</div>");
                        texto.append("</td>");
                        texto.append("</tr>");
                        texto.append("<tr>");
                        texto.append("<td height='10' style='font-size: 10px; line-height: 10px;'>&nbsp;</td>");
                        texto.append("</tr>");
                        texto.append("<tr>");
                        texto.append("<td align='center'>");
                        texto.append("<table border='0' width='40' align='center' cellpadding='0' cellspacing='0' bgcolor='eeeeee'>");
                        texto.append(" <tr>");
                        texto.append(" <td height='2' style='font-size: 2px; line-height: 2px;'>&nbsp;</td>");
                        texto.append(" </tr>");
                        texto.append(" </table>");
                        texto.append("</td>");
                        texto.append("</tr>");
                        texto.append("<tr>");
                        texto.append("<td height='20' style='font-size: 20px; line-height: 20px;'>&nbsp;</td>");
                        texto.append("</tr>");
                        texto.append("<tr>");
                        texto.append("<td align='center'>");
                        texto.append("<table border='0' width='400' align='center' cellpadding='0' cellspacing='0' class='container590'>");
                        texto.append("<tr>");
                        texto.append("<td align='center' style='color: #888888; font-size: 16px; font-family: 'Work Sans', Calibri, sans-serif; line-height: 24px;'>");
                        texto.append("<div style='line-height: 24px'>");

                        texto.append("<br/>");
                        texto.append("");

                        texto.append("</div>");
                        texto.append("</td>");
                        texto.append("</tr>");
                        texto.append("</table>");
                        texto.append("</td>");
                        texto.append("</tr>");
                        texto.append("<tr>");
                        texto.append(" <td height='25' style='font-size: 25px; line-height: 25px;'>&nbsp;</td>");
                        texto.append("</tr>");
                        texto.append("<tr>");
                        texto.append("<td align='center'>");
                        texto.append("<table border='0' align='center' width='160' cellpadding='0' cellspacing='0' bgcolor='black' style=''>");
                        texto.append(" <tr>");
                        texto.append("<td height='10' style='font-size: 10px; line-height: 10px;'>&nbsp;</td>");
                        texto.append(" </tr>");
                        texto.append("<tr>");
                        texto.append("<td align='center' style='color: #ffffff; font-size: 14px; font-family: 'Work Sans', Calibri, sans-serif; line-height: 26px;'>");
                        texto.append("<div style='line-height: 26px;'>");

                        texto.append(" <a href='http://atcawpbrasil.com.br' style='color: #ffffff; text-decoration: none;'>Ir para o site</a>");

                        texto.append("</div>");
                        texto.append("</td>");
                        texto.append("</tr>");
                        texto.append("<tr>");
                        texto.append("<td height='10' style='font-size: 10px; line-height: 10px;'>&nbsp;</td>");
                        texto.append("</tr>");
                        texto.append("</table>");
                        texto.append("</td>");
                        texto.append(" </tr>");
                        texto.append(" </table>");
                        texto.append(" </td>");
                        texto.append("</tr>");
                        texto.append(" </table>");
                        texto.append("<table border='0' width='100%' cellpadding='0' cellspacing='0' bgcolor='ffffff' class='bg_color'>");
                        texto.append(" <tr class='hide'>");
                        texto.append("<td height='25' style='font-size: 25px; line-height: 25px;'>&nbsp;</td>");
                        texto.append("</tr>");
                        texto.append("<tr>");
                        texto.append("<td height='40' style='font-size: 40px; line-height: 40px;'>&nbsp;</td>");
                        texto.append("</tr>");
                        texto.append("<tr>");
                        texto.append(" <td height='60' style='border-top: 1px solid #e0e0e0;font-size: 60px; line-height: 60px;'>&nbsp;</td>");
                        texto.append(" </tr>");
                        texto.append("<tr>");
                        texto.append("<td align='center'>");
                        texto.append("<table border='0' align='center' width='590' cellpadding='0' cellspacing='0' class='container590 bg_color'>");
                        texto.append("<tr>");
                        texto.append("<td>");
                        texto.append("<table border='0' width='600' align='left' cellpadding='0' cellspacing='0' style='border-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt;' class='container590'>");
                        texto.append("<tr>");
                        texto.append("<td height='25' style='font-size: 25px; line-height: 25px;'>&nbsp;</td>");
                        texto.append("</tr>");
                        texto.append(" <tr>");
                        texto.append("<td align='left' style='color: #888888; font-size: 14px; font-family: 'Work Sans'; Calibri sans-serif; line-height: 23px;'class='text_color'>");
                        texto.append("<div style='color: #333333; font-size: 14px; font-family: 'Work Sans', Calibri, sans-serif; font-weight: 600; mso-line-height-rule: exactly; line-height: 23px;'>");
                        texto.append(" Email de Contato: <br/> <a href='mailto:' style='color: #888888; font-size: 14px; font-family: 'Hind Siliguri', Calibri, Sans-serif; font-weight: 400;'>financeiro@upsquality.com.br</a><br/>");
                        texto.append("Telefone:<br/><span style='color: #888888; font-size: 14px; font-family: 'Work Sans', Calibri, sans-serif; '>+55 (61) 3046-8118 // +55 (61) 99373-5050</span> <br/>");
                        texto.append("Endereço:<br/><span style='color: #888888; font-size: 14px; font-family: 'Work Sans', Calibri, sans-serif; '>CLSW 102 Bloco A Loja 39-41 Setor Sudoeste - Brasilia - DF</span>");
                        texto.append("</div>");
                        texto.append(" </td>");
                        texto.append("<td>");

                        texto.append("<a href='http://atcawpbrasil.com.br'><img style=' max-width: 200px; max-height: 150px;' src='http://atcawpbrasil.com.br/imagens/logo-ups.png' alt=''/></a> ");

                        texto.append(" </td>");
                        texto.append("</tr>");
                        texto.append("</table>");
                        texto.append("<table border='0' width='2' align='left' cellpadding='0' cellspacing='0' style='border-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt;'class='container590'>");
                        texto.append("<tr>");
                        texto.append(" <td width='2' height='10' style='font-size: 10px; line-height: 10px;'></td>");
                        texto.append("</tr>");
                        texto.append("</table>");
                        texto.append("</td>");
                        texto.append("</tr>");
                        texto.append("</table>");
                        texto.append("</td>");
                        texto.append("</tr>");
                        texto.append("<tr>");
                        texto.append("<td height='60' style='font-size: 60px; line-height: 60px;'>&nbsp;</td>");
                        texto.append("</tr>");
                        texto.append("</table>");
                        texto.append("<table border='0' width='100%' cellpadding='0' cellspacing='0' bgcolor='f4f4f4'>");
                        texto.append("<tr>");
                        texto.append("<td align='center'>");
                        texto.append("<table border='0' align='center' width='590' cellpadding='0' cellspacing='0' class='container590'>");
                        texto.append("<tr>");
                        texto.append("<td>");
                        texto.append("<table border='0' align='left' cellpadding='0' cellspacing='0' style='border-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt;'class='container590'>");
                        texto.append("<tr>");
                        texto.append("<td align='left' style='color: #aaaaaa; font-size: 14px; font-family: 'Work Sans', Calibri, sans-serif; line-height: 24px;'>");
                        texto.append("<div style='line-height: 24px;'>");

                        texto.append("<span style='color: #333333;'>Material produzido por Gabriel Marinho </span><br/>");
                        texto.append("<span style='color: #333333;'>E-mail de contato: gabrielmarinhodossantoscd@gmail.com</span>");

                        texto.append("</div>");
                        texto.append("</td>");
                        texto.append("</tr>");
                        texto.append(" </table>");
                        texto.append("</td>");
                        texto.append("</tr>");
                        texto.append("</table>");
                        texto.append("</td>");
                        texto.append("</tr>");
                        texto.append("<tr>");
                        texto.append("<td height='25' style='font-size: 25px; line-height: 25px;'>&nbsp;</td>");
                        texto.append(" </tr>");
                        texto.append("</table>");
                        texto.append(" </div>");
                        texto.append("");

                        se.setTexto(texto.toString());
                        String checking = se.sendEmailTLS(recipient, titulo);
                    } else {
                        out.print("Algum campo obrigatório não foi preenchido!");
                    }

                    response.sendRedirect("login.jsp");
                } else {
                    Cliente c1 = new Cliente();
                    Cliente c2 = new Cliente();
                    ClienteDAO cDAO1 = new ClienteDAO();
                    try {

                        c2 = cDAO1.carregarPorCPF(cpf);
                        c1 = cDAO1.carregarPorEmail(email);
                        if (c2.getCpfCnpj() == null) {

                            out.print("<script type='text/javascript'>"
                                    + "            alert('ERRO: Este CPF ou CNPJ não esta cadastrado.');"
                                    + "            history.back();"
                                    + "        </script>");
                        } else if (c1.geteMail() == null) {
                            out.print("<script type='text/javascript'>"
                                    + "            alert('ERRO: Este e-mail não esta cadastrado.');"
                                    + "            history.back();"
                                    + "        </script>");
                        } else {
                             out.print("<script type='text/javascript'>"
                                    + "            alert('ERRO: Este e-mail não correspode ao seu CPF/CNPJ .');"
                                    + "            history.back();"
                                    + "        </script>");
                        }
                    } catch (Exception e1) {
                        out.print("Erro:" + e1);
                        out.print("<script type='text/javascript'>"
                                + "            alert('Erro: Não foi possivel  efetuar ação!');"
                                + "            history.back();"
                                + "        </script>");
                    }
                }
            } catch (Exception e) {

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
