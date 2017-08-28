
package duoc.cl.dej4501.negocio;

import duoc.cl.dej4501.entidades.Compania;
import java.util.LinkedList;


public class CompaniaController {
      private LinkedList<Compania> listaCompania;

    public CompaniaController() {
    }

    public CompaniaController(LinkedList<Compania> listaCompania) {
        this.listaCompania = listaCompania;
    }

   

    
   public Compania show(int id){
       Compania objCompania=null;
       for (int i = 0; i<listaCompania.size(); i++) {
           if(listaCompania.get(i).getId() ==id){
               objCompania = new Compania(listaCompania.get(i).getId(), listaCompania.get(i).getNombre(), listaCompania.get(i).getCostoPlanBase());          }
      
       }
       return objCompania;
   }
}
