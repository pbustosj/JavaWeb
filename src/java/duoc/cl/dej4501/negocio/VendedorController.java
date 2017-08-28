
package duoc.cl.dej4501.negocio;

import duoc.cl.dej4501.entidades.Vendedor;
import java.util.LinkedList;

public class VendedorController {
    private LinkedList<Vendedor> listaVendedor;

    public VendedorController() {
    }

    public VendedorController(LinkedList<Vendedor> listaVendedor) {
        this.listaVendedor = listaVendedor;
    }

    
   public Vendedor show(int id){
       Vendedor objVendedor=null;
       for (int i = 0; i<listaVendedor.size(); i++) {
           if(listaVendedor.get(i).getId() ==id){
               objVendedor = new Vendedor(listaVendedor.get(i).getId(), listaVendedor.get(i).getNombre(), listaVendedor.get(i).getApellido(),listaVendedor.get(i).getEdad());          }
       }
       return objVendedor;
   }
}
