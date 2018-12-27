package com.gachon.mdm.domain;


import com.gachon.mdm.constraint.PasswordMatches;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Length;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import java.util.Collection;

@Getter
@Entity
@NoArgsConstructor
@Table(name = "MDM_member")
public class User implements UserDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_seq")
    private Long seq;

    @Column
    @NotEmpty
    private String name;

    @Column
    @NotEmpty(message="Please provide your password")
    @Length(min = 6, message = "Your password must have at least 6 characters")
    private String password;

    @Column(unique = true)
    @Email(message="Please provide an E-mail")
    @NotEmpty(message = "Please provide your E-mail")
    private String email;

    @Embedded
    private Account account;

    @Builder
    public User(String name, String email, String password, Account account) {
        this.name = name;
        this.password = password;
        this.email = email;
        this.account = account;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return null;
    }

    @Override
    public String getUsername() {
        return this.email;
    }

    @Override
    public String getPassword(){
        return this.password;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
}
