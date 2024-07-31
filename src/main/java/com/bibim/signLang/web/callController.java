package com.bibim.signLang.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class callController {

	@GetMapping("/call")
	public String call() {
		return "call";
	}
}
