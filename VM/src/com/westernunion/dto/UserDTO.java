package com.westernunion.dto;

import java.time.LocalDate;
import java.util.List;
//package com.westernunion.dto;

import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;
import java.util.List;

public class UserDTO {

    private Long userId;
    private String name;
    private String email;
    private String phoneNumber;
    private String address;
    
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate dateOfBirth;
    private List<VaccineDoseDTO> vaccineDoses;
    private String status;

    // Getters and setters
    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public LocalDate getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(LocalDate dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public List<VaccineDoseDTO> getVaccineDoses() {
        return vaccineDoses;
    }

    public void setVaccineDoses(List<VaccineDoseDTO> vaccineDoses) {
        this.vaccineDoses = vaccineDoses;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

	@Override
	public String toString() {
		return "UserDTO [userId=" + userId + ", name=" + name + ", email=" + email + ", phoneNumber=" + phoneNumber
				+ ", address=" + address + ", dateOfBirth=" + dateOfBirth + ", vaccineDoses=" + vaccineDoses
				+ ", status=" + status + "]";
	}
    
    
}

