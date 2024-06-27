package studentzone.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import studentzone.model.User;
import studentzone.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {

    @Autowired
    private UserService userService;

    @RequestMapping("/register")
    public String register() {
        return "register";
    }

    @PostMapping("/registerUser")
    public String registerUser(@RequestParam("name") String name, 
                               @RequestParam("email") String email,
                               @RequestParam("dob") String dob, 
                               @RequestParam("password") String password,
                               Model model) {
        try {
            userService.registerUser(name, email, dob, password, 0);
            return "redirect:/registerSuccess";
        } catch (RuntimeException e) {
            model.addAttribute("errorMessage", e.getMessage());
            return "register";
        }
    }
    
    @GetMapping("/registerSuccess")
    public String showRegistrationSuccessPage() {
        return "registerSuccess";
    }
    
    @GetMapping("/login")
    public String login() {
    	System.out.println("Login Invoked");
        return "login";
    }

    @PostMapping("/loginUser")
    public String loginUser(@RequestParam("email") String email, 
                            @RequestParam("password") String password, 
                            @RequestParam("usertype") int userType,
                            HttpServletRequest request, Model model) {
        User user = userService.validateUser(email, password, userType);
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            return "redirect:/index.jsp";
        } else {
            model.addAttribute("errorMessage", "Invalid email, password, or user type.");
            return "login";
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/index.jsp";
    }
}
