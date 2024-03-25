package com.hana.app.repository;

import com.hana.app.data.CustDto;
import com.hana.app.exception.DuplicatedIdException;
import com.hana.app.exception.IdNotFoundException;
import com.hana.app.exception.NotFoundException;
import com.hana.app.frame.Dao;

import java.util.ArrayList;
import java.util.List;

public class CustDao implements Dao<String, CustDto> {
    @Override
    public int insert(CustDto custDto) throws DuplicatedIdException {
//        System.out.println("Duplicated ID Exception ");
        if(custDto.getId().equals("id01")) {
            throw new DuplicatedIdException("EX0001"); // 보통 직접적인 메시지 대신 에러코드를 넣는다
        }
        System.out.println("Oracle DB:Inserted ... " + custDto);
        return 0;
    }

    @Override
    public int delete(String s) throws IdNotFoundException {
        // DB에 key에 해당하는 데이터가 없다면
        if(!s.equals("CompareID")) {
            throw new IdNotFoundException("EX0002");
        }
        System.out.println("Oracle DB:Deleted ... " + s);
        return 0;
    }

    @Override
    public int update(CustDto custDto) throws IdNotFoundException {
        if(!custDto.getId().equals("CompareID")) {
            throw new IdNotFoundException("EX0002");
        }
        System.out.println("Oracle DB:Updated ... "+custDto);
        return 0;
    }

    @Override
    public CustDto select(String s) throws NotFoundException {
        // DB에 CustDto가 있다면
        if(!s.equals("CompareID")) {
            return CustDto.builder().id(s).pwd("pwd01").name("james").build();
        } else {
            throw new NotFoundException("EX0003");
        }
    }

    @Override
    public List<CustDto> select() throws Exception {
        List list = new ArrayList<CustDto>();
        list.add(CustDto.builder().id("id01").pwd("pwd01").name("james").build());
        list.add(CustDto.builder().id("id02").pwd("pwd02").name("james").build());
        list.add(CustDto.builder().id("id03").pwd("pwd03").name("james").build());
        return list;
    }
}