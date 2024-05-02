package com.hana.app.service;

import com.hana.app.data.entity.ItemEntity;
import com.hana.app.frame.HanaService;
import com.hana.app.repository.CateRepository;
import com.hana.app.repository.ItemRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class ItemService implements HanaService<ItemEntity, Integer> {
    private final ItemRepository itemRepository;

    @Override
    public ItemEntity insert(ItemEntity itemEntity) {
        return itemRepository.save(itemEntity);
    }

    @Override
    public Boolean delete(Integer integer) {
        itemRepository.deleteById(integer);
        return true;
    }

    @Override
    public ItemEntity update(ItemEntity itemEntity) {
        return itemRepository.save(itemEntity);
    }

    @Override
    public Optional<ItemEntity> get(Integer integer) {
        return itemRepository.findById(integer);
    }

    @Override
    public List<ItemEntity> get() {
        return itemRepository.findAll();
    }
}
