package com.indocyber.salt.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.indocyber.salt.model.Konsumen;
import com.indocyber.salt.repository.KonsumenRepository;

@Service
public class KonsumenService {

	@Autowired
	private KonsumenRepository konsumenRepository;

	public List<Konsumen> getAllKonsumen() {
        List<Konsumen> konsumenList = new ArrayList<>();
        konsumenRepository.findAll().forEach(konsumen -> konsumenList.add(konsumen));

        return konsumenList;
    }

    public Konsumen getKonsumenById(Long id) {
        return konsumenRepository.findById(id).get();
    }

    public boolean saveOrUpdateKonsumen(Konsumen konsumen) {
        Konsumen updatedKonsumen = konsumenRepository.save(konsumen);

        if (konsumenRepository.findById(updatedKonsumen.getId()) != null) {
            return true;
        }

        return false;
    }

    public boolean deleteKonsumen(Long id) {
    	konsumenRepository.deleteById(id);

        if (konsumenRepository.findById(id) != null) {
            return true;
        }

        return false;
    }
	
}
