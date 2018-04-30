package com.jhta.delivery.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EventController {

	@RequestMapping("/event/eventlist")
	public String eventlist() {
		return ".event.eventlist";
	}

}
