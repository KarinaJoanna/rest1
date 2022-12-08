package com.alienexplorer.app.rest.Repository;

import com.alienexplorer.app.rest.Model.genero;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TodoRepository extends JpaRepository<genero, Long> {
}
