package edu.neu.csye6220;

import java.util.Set;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/teacher/*")
public class TeacherController {

	@GetMapping("/home")
	public String home(Model model) {
		Userinfo userinfo = infodao.findByname(getPrincipal());
		model.addAttribute("userinfo", userinfo);
		return "teacher/home";
	}
	@GetMapping("/addcourses")
	public String addcourse(Model model) {
		model.addAttribute("course", new Course());
		return "teacher/addcourse";
	}
	@Resource(name="infodao")
	private InfoDao infodao;
	
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
	
	@RequestMapping(value="add",method=RequestMethod.POST)
	public String add(Model model,@Valid Course course,BindingResult result) {
		if(result.hasErrors()) {
			return "teacher/addcourses";
		}
		model.addAttribute("course", course);
		infodao.saveCourse(course);
		Userinfo userinfo = infodao.findByname(getPrincipal());
		Set<Course> courses = userinfo.getCourse();
		courses.add(course);
		userinfo.setCourse(courses);
		infodao.saveUser(userinfo);
		return "teacher/show";
	}
}
