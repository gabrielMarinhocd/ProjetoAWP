/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Pedido;
import modelo.PedidoDAO;
import modelo.SendEmail;

/**
 *
 * @author gabri
 */
public class PrecoFinal extends HttpServlet {

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
            out.println("<title>Servlet PrecoFinal</title>");
            out.println("</head>");
            out.println("<body>");
            DecimalFormat df = new DecimalFormat("R$ ###,##0.00");
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                String recipient = request.getParameter("email");
                String titulo = "O preço e do seu serviço ja foi adicionado!";
                String numSerie = request.getParameter("numSerie");
                String modelo = request.getParameter("modelo");
                double valor = Double.parseDouble(request.getParameter("valor"));
                Pedido p = new Pedido();
                PedidoDAO pDAO = new PedidoDAO();
                p = pDAO.carregarPorId(id);
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
                    texto.append("<a href='https://atcawpbrasil.com.br' style='background-color:black; color:white;  display: block; border-radius:3px; border-style: none !important; border: 0 !important;'>");

                    texto.append("<h1 style='padding: 10px 10px;' >Assistência Técnica AWP</h1></a>");

                    texto.append("</td>");
                    texto.append("</tr>");
                    texto.append("<tr>");
                    texto.append(" <td align='center'>");
                    texto.append("<table width='360 ' border='0' cellpadding='0' cellspacing='0' style='border-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt;' class='container590 hide'>");
                    texto.append(" <tr>");

                    texto.append("<th width='120' align='center' style='font-size: 14px; font-family: 'Work Sans', Calibri, sans-serif; line-height: 24px;'>");
                    texto.append("<a href='https://atcawpbrasil.com.br' style='color: #312c32; text-decoration: none;'>Codigo OS</a>");

                    texto.append("</th>");
                    texto.append("<th width='120' align='center' style='font-size: 14px; font-family: 'Work Sans', Calibri, sans-serif; line-height: 24px;'>");
                    texto.append(" <a href='https://atcawpbrasil.com.br' style='color: #312c32; text-decoration: none;'>Numero de série</a>");

                    texto.append(" </th>");
                    texto.append("<th width='120' align='center' style='font-size: 14px; font-family: 'Work Sans', Calibri, sans-serif; line-height: 24px;'>");
                    texto.append("<a href='https://atcawpbrasil.com.br' style='color: #312c32; text-decoration: none;'> Modelo </a>");
                    texto.append("</th>");
                    texto.append("</tr>");
                    texto.append("<tr>");

                    texto.append("<td width='120' align='center' style='font-size: 14px; font-family: 'Work Sans', Calibri, sans-serif; line-height: 24px;'>");
                    texto.append(id);
                    texto.append("</td>");

                    texto.append("<td width='120' align='center' style='font-size: 14px; font-family: 'Work Sans', Calibri, sans-serif; line-height: 24px;'>");
                    texto.append("<a href='' style='color: #312c32; text-decoration: none;'> ").append(numSerie).append(" </a>");
                    texto.append("</td>");

                    texto.append("<td width='120' align='center' style='font-size: 14px; font-family: 'Work Sans', Calibri, sans-serif; line-height: 24px;'>");
                    texto.append("<a href='https://atcawpbrasil.com.br' style='color: #312c32; text-decoration: none;'>").append(modelo).append("</a>");

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
                    texto.append("O preço do seu serviço é: <span style='color: #BDBDBD;'>").append(df.format(valor)).append("</span>");
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
                    texto.append("Descrição do serviço: ").append(p.getDescricao()).append("<br/>");
                    texto.append("Acesse o site para aceitar o valor!<br/>");
                    texto.append("Acesse também para verificar as peças que precisaram ser trocadas.");
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

                    texto.append(" <a href='https://atcawpbrasil.com.br' style='color: #ffffff; text-decoration: none;'>Ir para o site</a>");

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
                    texto.append("Telefone:<br/><span style='color: #888888; font-size: 14px; font-family: 'Work Sans', Calibri, sans-serif; '>+55 61 4104-9371</span> <br/>");
                    texto.append("Endereço:<br/><span style='color: #888888; font-size: 14px; font-family: 'Work Sans', Calibri, sans-serif; '>CLSW 102 Bloco A Loja 39-41 Setor Sudoeste - Brasilia - DF</span>");
                    texto.append("</div>");
                    texto.append(" </td>");
                    texto.append("<td>");

                    texto.append("<a href='https://atcawpbrasil.com.br'><img style=' max-width: 200px; max-height: 150px;' src='https://atcawpbrasil.com.br/imagens/AWP_LOGO.png' alt=''/></a> ");

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
                
                p.setValor(valor);
                pDAO.precoFinal(id, valor);

                int op = Integer.parseInt(request.getParameter("op"));
                int login = Integer.parseInt(request.getParameter("login"));
                if (op == 0) {
                    response.sendRedirect("listar_pedido.jsp");
                } else if (op == 1) {
                    response.sendRedirect("listar_pedido_cliente_fc.jsp?id=" + login);
                } else if (op == 2) {
                    response.sendRedirect("listar_pedido_gerente.jsp");
                }
            } catch (Exception e) {
                out.print("Erro:" + e);
                out.print("Algum campo obrigatório não foi preenchido!");
                out.print("<script type='text/javascript'>");
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
