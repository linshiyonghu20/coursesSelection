package edu.neu.csye6220;

import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Controller
@RequestMapping("/student/*")
public class StudentController {

	@GetMapping("/home")
	public String home(Model model) {
		Userinfo userinfo = infodao.findByname(getPrincipal());
		model.addAttribute("userinfo", userinfo);
		return "student/home";
	}
	@GetMapping("/addcourses")
	public String addcourse(Model model) {
		List<Course> courses = infodao.findAllCourse();
		model.addAttribute("courses", courses);
		return "student/addcourse";
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
    

    
    @RequestMapping(value="add",method= RequestMethod.POST)
	public String add(Model model) {
    	Userinfo userinfo = infodao.findByname(getPrincipal());
    	Set<Course> courses = userinfo.getCourse();
        HttpServletRequest request =
        		((ServletRequestAttributes)RequestContextHolder
        		                .currentRequestAttributes())
        		                .getRequest();
    	String[] courseId = request.getParameterValues("courseid");
    	if(courseId==null) {
    		return "student/home";
    	}
    	for(String cid : courseId) {
    		long id = Long.parseLong(cid);
    		Course course = infodao.findById(id);
    		courses.add(course);
    	}
    	userinfo.setCourse(courses);
    	infodao.saveUser(userinfo);
    	model.addAttribute("courses", courses);
    	return "student/show";
    }
}
