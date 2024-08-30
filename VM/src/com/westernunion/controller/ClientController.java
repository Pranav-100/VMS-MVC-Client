package com.westernunion.controller;

import com.westernunion.dto.UserDTO;
import com.westernunion.dto.VaccineDoseDTO;
import com.westernunion.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/citizen")
public class ClientController {

    @Autowired
    private ClientService clientService;

    @GetMapping("/citizenDetails")
    public String getCitizenDetailsById(Model model) {
        try {
            UserDTO user = clientService.getCitizenDetailsById(3); // Make sure this ID is dynamic or handled properly
            model.addAttribute("citizen", user);
            return "list-citizen";
        } catch (Exception e) {
            model.addAttribute("errorMessage", "Error fetching citizen details.");
            return "error";
        }
    }

    @GetMapping("/allCitizenDetails")
    public String getAllCitizenDetails(Model model) {
        try {
            List<UserDTO> users = clientService.getAllCitizenDetails();
            model.addAttribute("citizens", users);
            return "all-citizen";
        } catch (Exception e) {
            model.addAttribute("errorMessage", "Error fetching citizen details.");
            return "error";
        }
    }

    @GetMapping("/getMoreDetails/{id}")
    public String getAllCitizenDetails(@PathVariable int id, Model model) {
        try {
            UserDTO user = clientService.getCitizenById(id);
            model.addAttribute("user", user);
            return "more-details";
        } catch (Exception e) {
            model.addAttribute("errorMessage", "Error fetching details.");
            return "error";
        }
    }

    @GetMapping("/addCitizen")
    public String addCitizenForm(Model model) {
        model.addAttribute("citizen", new UserDTO());
        return "add-citizen";
    }

    @PostMapping("/saveCitizen")
    public String saveCitizen(@ModelAttribute UserDTO dto) {
        try {
            clientService.saveCitizen(dto);
            return "redirect:/citizen/allCitizenDetails";
        } catch (Exception e) {
            return "error";
        }
    }

    @GetMapping("/addDose/{id}")
    public String getAddDoseForm(@PathVariable Long id, Model model) {
        try {
            VaccineDoseDTO doseDTO = new VaccineDoseDTO();
            doseDTO.setUserId(id);

            UserDTO user = clientService.getCitizenById(id.intValue());
            Optional<Integer> maxDose = user.getVaccineDoses().size() > 0 ? 
                user.getVaccineDoses().stream().map(VaccineDoseDTO::getDoseNumber).max(Integer::compare) : 
                Optional.of(0);

            doseDTO.setDoseNumber(maxDose.get() + 1);

            if (user.getVaccineDoses().size() > 0) {
                doseDTO.setVaccineType(user.getVaccineDoses().get(0).getVaccineType());
            }

            model.addAttribute("vaccineDto", doseDTO);
            return "add-dose";
        } catch (Exception e) {
            return "error";
        }
    }

    @PostMapping("/addDoseforUser")
    public String addDose(@ModelAttribute VaccineDoseDTO dto) {
        try {
            clientService.addDose(dto);
            return "redirect:/citizen/allCitizenDetails";
        } catch (Exception e) {
            return "error";
        }
    }

    @GetMapping("/delete/{id}")
    public String deleteCitizen(@PathVariable Long id, Model model) {
        try {
            clientService.deleteCitizen(id.intValue());
            model.addAttribute("message", "Citizen deleted successfully");
        } catch (Exception e) {
            model.addAttribute("message", "Failed to delete citizen: " + e.getMessage());
        }
        return "redirect:/citizen/allCitizenDetails";
    }
}
