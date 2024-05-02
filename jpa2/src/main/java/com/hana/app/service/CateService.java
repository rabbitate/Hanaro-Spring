package com.hana.app.service;

import com.hana.app.data.entity.CateEntity;
import com.hana.app.frame.HanaService;
import com.hana.app.repository.CateRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class CateService implements HanaService<CateEntity, Integer> {
    private final CateRepository cateRepository;
    @Override
    public CateEntity insert(CateEntity cateEntity) {
        return cateRepository.save(cateEntity);
    }

    @Override
    public Boolean delete(Integer integer) {
        cateRepository.deleteById(integer);
        return true;
    }

    @Override
    public CateEntity update(CateEntity cateEntity) {
        return cateRepository.save(cateEntity);
    }

    @Override
    public Optional<CateEntity> get(Integer integer) {
        return cateRepository.findById(integer);
    }

    @Override
    public List<CateEntity> get() {
        return cateRepository.findAll();
    }
}
