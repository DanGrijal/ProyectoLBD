/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelos;

/**
 *
 * @author danny
 */
public class Quickpass {
    
    private int IdQuickpass;
    private String NombreBanco;
    private boolean Activo;

    public Quickpass(int IdQuickpass, String NombreBanco, boolean Activo) {
        this.IdQuickpass = IdQuickpass;
        this.NombreBanco = NombreBanco;
        this.Activo = Activo;
    }

    public int getIdQuickpass() {
        return IdQuickpass;
    }

    public void setIdQuickpass(int IdQuickpass) {
        this.IdQuickpass = IdQuickpass;
    }

    public String getNombreBanco() {
        return NombreBanco;
    }

    public void setNombreBanco(String NombreBanco) {
        this.NombreBanco = NombreBanco;
    }

    public boolean isActivo() {
        return Activo;
    }

    public void setActivo(boolean Activo) {
        this.Activo = Activo;
    }
    
    
    
}
