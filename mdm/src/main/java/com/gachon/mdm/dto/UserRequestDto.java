package com.gachon.mdm.dto;

import com.gachon.mdm.constraint.PasswordMatches;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Setter
@Getter
@NoArgsConstructor
@PasswordMatches
public class UserRequestDto {
    private String name;
    private String email;
    private String password;
    private String checkPassword;

    @Builder
    public UserRequestDto(String name,String email, String password, String checkPassword) {
        setName(name);
        setEmail(email);
        setPassword(password);
        setCheckPassword(checkPassword);
    }

}
