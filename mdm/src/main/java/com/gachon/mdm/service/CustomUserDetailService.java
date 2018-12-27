package com.gachon.mdm.service;

import com.gachon.mdm.constraint.PasswordMatches;
import com.gachon.mdm.domain.User;
import com.gachon.mdm.dto.UserRequestDto;
import com.gachon.mdm.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;
import java.util.Optional;

@Service
public class CustomUserDetailService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Override
    @Transactional(readOnly = true)
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        User user = this.userRepository.findUserByEmail(email)
                .orElseThrow(() -> new UsernameNotFoundException("유저가 존재하지 않습니다."));

        return new org.springframework.security.core.userdetails.User(user.getEmail(), user.getPassword(), Collections.singleton(new SimpleGrantedAuthority("USER")));
    }

    public User save(UserRequestDto userRequestDto) {
        Optional<User> user = this.userRepository.findUserByEmail(userRequestDto.getEmail());

        user.ifPresent(existUser -> {
            throw new RuntimeException("존재하는 유저");
        });

        return this.userRepository.save(User.builder()
                .name(userRequestDto.getName())
                .email(userRequestDto.getEmail())
                .password(passwordEncoder.encode(userRequestDto.getPassword()))
                .build());

    }
}