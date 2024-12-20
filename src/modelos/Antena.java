/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelos;

/**
 *
 * @author danny
 */
public class Antena {
    
    private int IdAntena;
    private String RutaPeaje;

    public Antena(int IdAntena, String RutaPeaje) {
        this.IdAntena = IdAntena;
        this.RutaPeaje = RutaPeaje;
    }

    public int getIdAntena() {
        return IdAntena;
    }

    public void setIdAntena(int IdAntena) {
        this.IdAntena = IdAntena;
    }

    public String getRutaPeaje() {
        return RutaPeaje;
    }

    public void setRutaPeaje(String RutaPeaje) {
        this.RutaPeaje = RutaPeaje;
    }

   
    
    
    
}
