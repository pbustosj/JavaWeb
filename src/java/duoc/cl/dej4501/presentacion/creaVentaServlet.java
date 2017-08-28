/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package duoc.cl.dej4501.presentacion;

import duoc.cl.dej4501.entidades.Compania;
import duoc.cl.dej4501.entidades.Marcas;
import duoc.cl.dej4501.entidades.Venta;
import duoc.cl.dej4501.negocio.CompaniaController;
import duoc.cl.dej4501.negocio.MarcaController;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "creaVentaServlet", urlPatterns = {"/creaVentaServlet", "/add"})
public class creaVentaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession sesion = request.getSession();
        LinkedList<Marcas> listaMarcas = (LinkedList<Marcas>) sesion.getAttribute("listadoMarcas");
        LinkedList<Compania> listaCompa = (LinkedList<Compania>) sesion.getAttribute("listadoCompanias");
        Random codigo = new Random();
        MarcaController mC = new MarcaController(listaMarcas);
        CompaniaController cC = new CompaniaController(listaCompa);

        String nombreComprador = request.getParameter("txtComprador");
        int codVendedor = Integer.parseInt(request.getParameter("ddlVendedor"));
        int codMarcas = Integer.parseInt(request.getParameter("ddlMarcas"));
        int codCompa = Integer.parseInt(request.getParameter("ddlCompanias"));
        //String cantidad=request.getParameter("txtCantidad");
        int cantidad = Integer.parseInt(request.getParameter("txtCantidad"));
        Marcas objMarca = mC.show(codMarcas);
        Compania objCompa = cC.show(codCompa);
        Venta objVenta = new Venta(nombreComprador, codVendedor, (int) (codigo.nextDouble() * 100 + 0), codMarcas, codCompa,(int)(objCompa.getCostoPlanBase()+objMarca.getCosto()), cantidad);

        if (sesion.getAttribute("listadoVentas") == null) {
            List<Venta> listadoVentas = new ArrayList<Venta>();
            listadoVentas.add(objVenta);
            sesion.setAttribute("listadoVentas", listadoVentas);
        } else {
            List<Venta> listadoVentas = (ArrayList<Venta>) sesion.getAttribute("listadoVentas");
            listadoVentas.add(objVenta);
            sesion.setAttribute("listadoVentas", listadoVentas);
        }

        sesion.setAttribute("menOk", true);
        response.sendRedirect("ingresoVenta.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
