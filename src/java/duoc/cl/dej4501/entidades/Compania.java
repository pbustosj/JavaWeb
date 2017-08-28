package duoc.cl.dej4501.entidades;

public class Compania {

    private int id;
    private String nombre;
    private int costoPlanBase;

    public Compania() {
    }

    public Compania(int id, String nombre, int costoPlanBase) {
        this.id = id;
        this.nombre = nombre;
        this.costoPlanBase = costoPlanBase;
    }

  

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCostoPlanBase() {
        return costoPlanBase;
    }

    public void setCostoPlanBase(int costoPlanBase) {
        this.costoPlanBase = costoPlanBase;
    }
    
    
    
}
