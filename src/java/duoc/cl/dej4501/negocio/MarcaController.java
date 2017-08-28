
package duoc.cl.dej4501.negocio;

import duoc.cl.dej4501.entidades.Marcas;
import java.util.LinkedList;
import java.util.List;


public class MarcaController {
    
    private LinkedList<Marcas> listaMarcas;

    public MarcaController() {
    }

    public MarcaController(LinkedList<Marcas> listaMarcas) {
        this.listaMarcas = listaMarcas;
    }

   public Marcas show(int id){
       Marcas objMarcas=null;
       for (int i = 0; i<listaMarcas.size(); i++) {
           if(listaMarcas.get(i).getId()==id){
               objMarcas = new Marcas(listaMarcas.get(i).getId(), listaMarcas.get(i).getNombre(),listaMarcas.get(i).getCosto());
           }
       }
       return objMarcas;
   }
   
   
    
}
