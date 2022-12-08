package com.alienexplorer.app.rest.Model;

import javax.persistence.*;

@Entity
@Table(schema = "genero")
public class genero {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    //vamos a crear los 3 componentes de la entidad que son id, titulo, descripcion

    private long id;

    @Column
    private String nombre;

    @Column
    private String descripcion;

    public long getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setId(long id) {
        this.id = id;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
}
