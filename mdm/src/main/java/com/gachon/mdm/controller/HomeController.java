package com.gachon.mdm.controller;

import com.gachon.mdm.dto.UserRequestDto;
import com.gachon.mdm.service.CustomUserDetailService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;

//mapping
@RequestMapping("/")
@Controller
@RequiredArgsConstructor
public class HomeController {

    @Autowired
    private CustomUserDetailService customUserDetailService;

    @GetMapping
    public String home(Model model, Principal principal) {
        model.addAttribute("auth", principal);
        return "index";
    }

    @PostMapping("/login")
    public String doLogin(){
        return "redirect:/";
    }

    @GetMapping("/login")
    public String login(){
        return "login";
    }

    @GetMapping("/join")
    public String join() {
        return "join";
    }

    @PostMapping("/join")
    public String doJoin(UserRequestDto userRequestDto){
        this.customUserDetailService.save(userRequestDto);
        return "redirect:/join";
    }
    @GetMapping("/donation")
    public String donation(Model model, Principal principal){
        model.addAttribute("auth", principal);
        return "donation";
    }

    @GetMapping("/mypage")
    public String mypage(Model model, Principal principal) {
        model.addAttribute("auth", principal);
        return "mypage";
    }

    @GetMapping("/transaction")
    public String transaction(Model model, Principal principal) {
        model.addAttribute("auth", principal);
        return "transaction";
    }
}
