package com.gachon.mdm.constraint;

import com.gachon.mdm.dto.UserRequestDto;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class PasswordMatchesValidator implements ConstraintValidator<PasswordMatches, Object> {

    @Override
    public void initialize(PasswordMatches constraintAnnotation) {
    }

    @Override
    public boolean isValid(Object value, ConstraintValidatorContext context) {
        UserRequestDto userRequestDto = (UserRequestDto)value;
        return userRequestDto.getPassword().equals(userRequestDto.getCheckPassword());
    }
}

