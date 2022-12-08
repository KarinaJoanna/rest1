package com.alienexplorer.app.rest.Controller;

import com.alienexplorer.app.rest.Model.genero;
import com.alienexplorer.app.rest.Repository.TodoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class TodoController {

    @Autowired
    private TodoRepository todoRepository;
    @GetMapping(value = "/")
    public String holaMundo(){
        return "Hola mundo";
    }

    @GetMapping(value = "/generos")
    public List <genero> getTasks(){
        return todoRepository.findAll();
    }

    @PostMapping(value = "/savegeneros")
    public String saveTask(@RequestBody genero genero){
        todoRepository.save(genero);
        return "save genero";
    }

    @PutMapping(value = "/update/{id}")
    public String updateTask(@PathVariable long id, @RequestBody genero genero){
        genero updateGenero = todoRepository.findById(id).get();
        updateGenero.setNombre(genero.getNombre());
        updateGenero.setDescripcion(genero.getDescripcion());
        todoRepository.save(updateGenero);
        return "updated genero";
    }

    @DeleteMapping(value = "delete/{id}")
    public String deleteTask(@PathVariable long id) {
        genero deleteGenero = todoRepository.findById(id).get();
        todoRepository.delete(deleteGenero);
        return "delete genero";
    }
}
