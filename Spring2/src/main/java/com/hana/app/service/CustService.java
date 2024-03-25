package com.hana.app.service;

import com.hana.app.data.CustDto;
import com.hana.app.exception.DuplicatedIdException;
import com.hana.app.exception.IdNotFoundException;
import com.hana.app.exception.NotFoundException;
import com.hana.app.frame.Dao;
import com.hana.app.frame.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@org.springframework.stereotype.Service
public class CustService implements Service<String, CustDto> {
    @Autowired
    Dao<String, CustDto> dao;

    @Override
    public int add(CustDto custDto) throws DuplicatedIdException {
        System.out.println("Start Transaction ...");
        // Insert ...
        try {
            dao.insert(custDto); // throws Exception을 해줬기 때문에 Exception이 발생할 수 있음을 개발자에게 알려준다
            dao.insert(custDto);
            System.out.println("Commit ..."); // 계속 정상이면 Commit
        } catch (DuplicatedIdException e) {
            System.out.println("Rollback ...");
            throw e;
        } finally {
            System.out.println("End Transaction ...");
        }

        // LDAP Insert ...
        // SMS ...
        System.out.println("Send SMS ...");
        // Mail ...
        System.out.println("Send Mail ...");
        return 0;
    }

    @Override
    public int del(String s) throws IdNotFoundException {
        try {
            dao.delete(s);
        } catch (IdNotFoundException e) {
            throw e;
        }
        return 0;
    }

    @Override
    public int modify(CustDto custDto) throws IdNotFoundException {
        try {
            dao.update(custDto);
        } catch (IdNotFoundException e) {
            throw e;
        }
        return 0;
    }

    @Override
    public CustDto get(String s) throws NotFoundException {
        try {
            CustDto dto = dao.select(s);
            return dto;
        } catch (NotFoundException e) {
            throw e;
        }
    }

    @Override
    public List<CustDto> get() throws Exception {
        try {
            return dao.select();
        } catch (Exception e) {
            throw e;
        }
    }

}
