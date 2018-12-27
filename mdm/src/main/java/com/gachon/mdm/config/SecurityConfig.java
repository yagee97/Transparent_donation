package com.gachon.mdm.config;

import com.gachon.mdm.service.CustomUserDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.authentication.configuration.EnableGlobalAuthentication;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@EnableWebSecurity
@EnableGlobalAuthentication
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private CustomUserDetailService customUserDetailService;

    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/join/**", "/findMember/");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()
                .antMatchers("/","/donation/**","/transaction/**","/mypage/**", "/static/**", "/h2-console/**").permitAll()
                .anyRequest().authenticated()
                .and()
                .formLogin()
                .loginPage("/login")
                .usernameParameter("email")
                .passwordParameter("password")
                .failureForwardUrl("/")
                .successForwardUrl("/login").permitAll()
                .and()
                .logout().logoutUrl("/logout").logoutSuccessUrl("/").invalidateHttpSession(true).deleteCookies("JSESSIONID").permitAll()
                .and()
                .headers().frameOptions().sameOrigin()
                .and()
                .csrf().disable()
                .headers().frameOptions().disable();
    }

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(this.customUserDetailService).passwordEncoder(passwordEncoder());
    }
}
