package com.controller;

import java.util.*;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.entity.Todo;


@Controller
public class HomeController {
	
	@Autowired
	ServletContext context;
	
	@RequestMapping("/home")
	public String home(Model m) {
		
//		String stringData = "views";
		m.addAttribute("page","views");
		
		List<Todo> list = (List<Todo>)context.getAttribute("list");
		m.addAttribute("todos",list);
		return "home";
	}

	@RequestMapping("/add")
	public String addTodo(Model m) {
//		String stringData = "add";
		
		Todo t = new Todo();
		m.addAttribute("page","add");
		m.addAttribute("todo",t);
		   
		return "home";
	}
	
	@RequestMapping(value = "/saveTodo",method = RequestMethod.POST)
	public String saveTodo(@ModelAttribute("todo")Todo todo, Model m) {
		System.out.println(todo);
		todo.setTodoDate(new Date());
		//getting todo list from context
		List<Todo> list = (List<Todo>)context.getAttribute("list");
		list.add(todo);
		m.addAttribute("message","Successfully added boss...");
		
		return "home";
	}
	
	
	
	
	
	
	

}
