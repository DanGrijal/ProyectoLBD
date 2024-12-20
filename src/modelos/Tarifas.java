/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelos;

/**
 *
 * @author danny
 */
public class Tarifas {
    
    private int Monto;
    private String DescripcionTipoVehiculo;

    public Tarifas(int Monto, String DescripcionTipoVehiculo) {
        this.Monto = Monto;
        this.DescripcionTipoVehiculo = DescripcionTipoVehiculo;
    }
    
    public int getMonto() {
        return Monto;
    }

    public void setMonto(int Monto) {
        this.Monto = Monto;
    }

    public String getDescripcionTipoVehiculo() {
        return DescripcionTipoVehiculo;
    }

    public void setDescripcionTipoVehiculo(String DescripcionTipoVehiculo) {
        this.DescripcionTipoVehiculo = DescripcionTipoVehiculo;
    }
    
    
}
