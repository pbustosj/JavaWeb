package duoc.cl.dej4501.presentacion;

import duoc.cl.dej4501.entidades.Compania;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "cargaCompaniaServlet", urlPatterns = {"/cargaCompaniaServlet","/cargaCompania"})
public class cargaCompaniaServlet extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            HttpSession sesion = request.getSession();
            if(sesion.getAttribute("listadoCompanias")==null){
                List<Compania> listadoCompanias = new LinkedList<>();
                listadoCompanias.add(new Compania(1, "Entel",30000));
                listadoCompanias.add(new Compania(2, "Claro",20000));
                listadoCompanias.add(new Compania(3, "Movistar",25000));
                listadoCompanias.add(new Compania(4, "Wom",20000));
                listadoCompanias.add(new Compania(5, "Virgin",10000)); 
                sesion.setAttribute("listadoCompanias", listadoCompanias);
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
