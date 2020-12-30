/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iviettech.jv37_springmvc_product.service;

import com.iviettech.jv37_springmvc_product.entities.ImageEntity;
import com.iviettech.jv37_springmvc_product.repository.ImageRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author lamde
 */
@Service
public class ImageService {

    @Autowired
    private ImageRepository imageRepository;

    public List<ImageEntity> getImages() {
        return (List<ImageEntity>) imageRepository.findAll();
    }

    public void save(ImageEntity image) {
        imageRepository.save(image);
    }

}
