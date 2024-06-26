package com.hana.exception;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class CustomExceptionController {
    @ExceptionHandler(Exception.class)
    public String except(Exception e, Model model){
        model.addAttribute("msg", e.getMessage());
        model.addAttribute("center", "error");

        return "index";
    }
}
