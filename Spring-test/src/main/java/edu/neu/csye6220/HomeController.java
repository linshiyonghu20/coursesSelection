package edu.neu.csye6220;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.annotation.Resource;
import javax.sql.DataSource;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("username", getPrincipal());
		return "home";
	}
	
    private String getPrincipal(){  
        String userName = null;  
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();  
   
        if (principal instanceof UserDetails) {  
            userName = ((UserDetails)principal).getUsername();  
        } else {  
            userName = principal.toString();  
        }  
        return userName;  
    }
	
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signup(Model model) {
		Users users = new Users();
		model.addAttribute("users", users);
		return "signup";
	}
	
	@Resource(name="dataSource")
	private DataSource dataSource;
	
	@Resource(name="infodao")
	private InfoDao infodao;
	
	@RequestMapping(value="views/users",method=RequestMethod.POST)
	public String showUser(Model model,@Valid Users users, BindingResult result) {
		if(result.hasErrors()) {
			return "signup";
		}
		UserDao userdao = new UserDao();
		String s = userdao.addUser(users,dataSource);
		
		Userinfo userinfo = new Userinfo(users.getUsername(),users.getFirstName(),
				users.getLastName(),users.getBirthDate(),users.getEmail(),users.getAddress(),
				users.getPhone());
		infodao.saveUser(userinfo);

		model.addAttribute("users", users);
		model.addAttribute("status", s);
		return "views/createuser";
	}
	
}
