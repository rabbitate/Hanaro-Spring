package com.hana.app.frame;

import com.hana.app.exception.DuplicatedIdException;
import com.hana.app.exception.IdNotFoundException;
import com.hana.app.exception.NotFoundException;

import java.util.List;

public interface Service<K, V> {
    int add(V v) throws DuplicatedIdException;
    int del(K k) throws IdNotFoundException;
    int modify(V v) throws IdNotFoundException;
    V get(K k) throws NotFoundException;
    List<V> get() throws Exception;
}
