package com.westernunion.service;
//package com.westernunion.service.impl;

import com.westernunion.dto.UserDTO;
import com.westernunion.dto.VaccineDoseDTO;
import com.westernunion.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.List;
import java.util.Optional;

@Service
public class ClientServiceImpl implements ClientService {

    @Autowired
    private RestTemplate restTemplate;

    private final String BASE_URL = "http://localhost:9090/vaccine";

    @Override
    public UserDTO getCitizenDetailsById(int id) throws Exception {
        String url = BASE_URL + "/userDetails/" + id;
        try {
            return restTemplate.getForObject(url, UserDTO.class);
        } catch (Exception e) {
            throw new Exception("Error fetching citizen details", e);
        }
    }

    @Override
    public List<UserDTO> getAllCitizenDetails() throws Exception {
        String url = BASE_URL + "/userDetails";
        try {
            ResponseEntity<List> response = restTemplate.exchange(url, HttpMethod.GET, null, List.class);
            return response.getBody();
        } catch (Exception e) {
            throw new Exception("Error fetching all citizen details", e);
        }
    }

    @Override
    public UserDTO getCitizenById(int id) throws Exception {
        String url = BASE_URL + "/userDetails/" + id;
        try {
            return restTemplate.getForObject(url, UserDTO.class);
        } catch (Exception e) {
            throw new Exception("Error fetching citizen by id", e);
        }
    }

    @Override
    public void saveCitizen(UserDTO dto) throws Exception {
        String url = BASE_URL + "/register";
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        HttpEntity<UserDTO> entity = new HttpEntity<>(dto, headers);
        try {
            restTemplate.exchange(url, HttpMethod.POST, entity, UserDTO.class);
        } catch (Exception e) {
            throw new Exception("Error saving citizen", e);
        }
    }

    @Override
    public VaccineDoseDTO addDose(VaccineDoseDTO dto) throws Exception {
        String url = BASE_URL + "/addDose";
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        HttpEntity<VaccineDoseDTO> entity = new HttpEntity<>(dto, headers);
        try {
            return restTemplate.postForObject(url, entity, VaccineDoseDTO.class);
        } catch (Exception e) {
            throw new Exception("Error adding dose", e);
        }
    }

    @Override
    public void deleteCitizen(int id) throws Exception {
        String url = BASE_URL + "/deleteUser/" + id;
        try {
            restTemplate.delete(url);
        } catch (Exception e) {
            throw new Exception("Error deleting citizen", e);
        }
    }
}

