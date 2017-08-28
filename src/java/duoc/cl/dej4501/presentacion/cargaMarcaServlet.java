
package duoc.cl.dej4501.presentacion;

import duoc.cl.dej4501.entidades.Marcas;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "cargaMarca", urlPatterns = {"/cargaMarcaServlet","/cargaMarca"})
public class cargaMarcaServlet extends HttpServlet {

  
 

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         HttpSession sesion = request.getSession();
            if(sesion.getAttribute("listadoMarcas")==null){
                List<Marcas> listadoMarcas = new LinkedList<>();
                listadoMarcas.add(new Marcas(1, "Samsung",25000));
                listadoMarcas.add(new Marcas(2, "Alcatel",20000));
                listadoMarcas.add(new Marcas(3, "Huawei",22000));
                listadoMarcas.add(new Marcas(4, "Apple",150000));
                listadoMarcas.add(new Marcas(5, "LG",25000)); 
                listadoMarcas.add(new Marcas(6, "Motorola",25000)); 
                listadoMarcas.add(new Marcas(7, "Azumi",18000)); 
                listadoMarcas.add(new Marcas(8, "Lenovo",23000)); 
                listadoMarcas.add(new Marcas(9, "Öwn",19000)); 
                listadoMarcas.add(new Marcas(10, "ZTE",17000)); 
                sesion.setAttribute("listadoMarcas", listadoMarcas);
            }
            response.sendRedirect("./ingresoVenta.jsp");
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
