package com.naver.jaebee2002;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TargetController {
	@RequestMapping(value = "/target", method = RequestMethod.GET)
	public String target(Locale locale, Model model) {
		return "test/target";
	}
	@RequestMapping(value = "/bootstrap", method = RequestMethod.GET)
	public String bootstrap() {
		return "test/bootstrap";
	}
}
