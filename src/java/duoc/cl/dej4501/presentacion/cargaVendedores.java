
package duoc.cl.dej4501.presentacion;


import duoc.cl.dej4501.entidades.Vendedor;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "cargaVendedores", urlPatterns = {"/cargaVendedores"})
public class cargaVendedores extends HttpServlet {

  

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         HttpSession sesion = request.getSession();
            if(sesion.getAttribute("listadoVendedores")==null){
                List<Vendedor> listadoVendedor = new LinkedList<>();
                listadoVendedor.add(new Vendedor(1, "Pedro","Bustos",23));
                listadoVendedor.add(new Vendedor(2, "Juan","Perez",35));
                listadoVendedor.add(new Vendedor(3, "Alexander","Montes",40));
                listadoVendedor.add(new Vendedor(4, "Loco","Maikel",21));
              
                sesion.setAttribute("listadoVendedores", listadoVendedor);
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
