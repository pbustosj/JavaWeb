
package duoc.cl.dej4501.entidades;

public class Venta {

    
    private String nombreComprador;
    private int codVendedor;
    private int codigo;
    private int codigoMarca;
    private int codigoCompania;
    
    private int precioVentaSI;
    private int cantTelefonos;

    public Venta(String nombreComprador, int codVendedor, int codigo, int codigoMarca, int codigoCompania, int precioVentaSI, int cantTelefonos) {
        this.nombreComprador = nombreComprador;
        this.codVendedor = codVendedor;
        this.codigo = codigo;
        this.codigoMarca = codigoMarca;
        this.codigoCompania = codigoCompania;
        this.precioVentaSI = precioVentaSI;
        this.cantTelefonos = cantTelefonos;
    }

    public Venta() {
    }


    public String getNombreComprador() {
        return nombreComprador;
    }

    public void setNombreComprador(String nombreComprador) {
        this.nombreComprador = nombreComprador;
    }

    public int getCodVendedor() {
        return codVendedor;
    }

    public void setCodVendedor(int codVendedor) {
        this.codVendedor = codVendedor;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public int getCodigoMarca() {
        return codigoMarca;
    }

    public void setCodigoMarca(int codigoMarca) {
        this.codigoMarca = codigoMarca;
    }

    public int getPrecioVentaSI() {
        return precioVentaSI;
    }

    public void setPrecioVentaSI(int precioVentaSI) {
        this.precioVentaSI = precioVentaSI;
    }

    public int getCantTelefonos() {
        return cantTelefonos;
    }

    public void setCantTelefonos(int cantTelefonos) {
        this.cantTelefonos = cantTelefonos;
    }
    
   /**
     * @return the codigoCompania
     */
    public int getCodigoCompania() {
        return codigoCompania;
    }

    /**
     * @param codigoCompania the codigoCompania to set
     */
    public void setCodigoCompania(int codigoCompania) {
        this.codigoCompania = codigoCompania;
    }
    
}
