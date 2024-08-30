package com.westernunion.service;


import com.westernunion.dto.UserDTO;
import com.westernunion.dto.VaccineDoseDTO;

import java.util.List;

public interface ClientService {
    UserDTO getCitizenDetailsById(int id) throws Exception;
    List<UserDTO> getAllCitizenDetails() throws Exception;
    UserDTO getCitizenById(int id) throws Exception;
    void saveCitizen(UserDTO dto) throws Exception;
    VaccineDoseDTO addDose(VaccineDoseDTO dto) throws Exception;
    void deleteCitizen(int id) throws Exception;
}
