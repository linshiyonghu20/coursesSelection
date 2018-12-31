package edu.neu.csye6220;

import static javax.persistence.GenerationType.IDENTITY;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.validation.constraints.NotNull;

@Entity(name = "course")
@NamedQueries({
	@NamedQuery(name="Course.findById",
			query="select distinct c from course c where c.id = :id"),
	@NamedQuery(name="Course.findAll",
			query="select distinct c from course c left join fetch c.userinfo u")
})
public class Course implements Serializable {

	private long id;
	private String coursename;
	private String description;
	
	private Set<Userinfo> userinfo = new HashSet<Userinfo>();

	
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "ID")
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	@NotNull
	@Column(name = "coursename")
	public String getCoursename() {
		return coursename;
	}
	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}
	@Column(name="description")
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	@ManyToMany
	@JoinTable(name = "user_course_detail", 
	      joinColumns = @JoinColumn(name = "COURSE_ID"), 
	      inverseJoinColumns = @JoinColumn(name = "USER_ID"))
	public Set<Userinfo> getUserinfo() {
		return userinfo;
	}
	public void setUserinfo(Set<Userinfo> userinfo) {
		this.userinfo = userinfo;
	}
	@Override
	public String toString() {
		return "Course [id=" + id + ", coursename=" + coursename + ", description=" + description + "]";
	}
	
}
