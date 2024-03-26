package com.hana.app.frame;

import com.hana.app.exception.DuplicatedIdException;
import com.hana.app.exception.IdNotFoundException;
import com.hana.app.exception.NotFoundException;

import java.util.List;

public interface Dao<K,V> {
    /**
     * 2024.3.13
     * MINPYO KIM
     * @param v: CustDto
     * @return int
     */
    int insert(V v) throws DuplicatedIdException;
    int delete(K k) throws IdNotFoundException;
    int update(V v) throws IdNotFoundException;
    V select(K k) throws NotFoundException;

    List<V> select() throws Exception; // 선택한 것을 리스트에 담는다
}
