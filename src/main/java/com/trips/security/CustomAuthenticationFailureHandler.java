package com.trips.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Component;

@Component
public class CustomAuthenticationFailureHandler extends SimpleUrlAuthenticationFailureHandler {

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception)
            throws IOException, ServletException {
        
        setDefaultFailureUrl("/login?error=true");
        
        System.out.println("Exception: " + exception.getClass());	
        
        super.onAuthenticationFailure(request, response, exception);

        String errorMessage = "Invalid";
       
        if (exception.getClass().isAssignableFrom(BadCredentialsException.class)) {
            errorMessage = "유효하지 않은 ID 또는 비밀번호입니다.";
        } else if (exception.getClass().isAssignableFrom(DisabledException.class)) {
            errorMessage = "해당 계정은 탈퇴한 계정입니다.";
        } else

        request.getSession().setAttribute("errorMessage", errorMessage);
    }
}
