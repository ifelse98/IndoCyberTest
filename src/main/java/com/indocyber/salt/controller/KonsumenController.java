package com.indocyber.salt.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.indocyber.salt.model.Konsumen;
import com.indocyber.salt.service.KonsumenService;

@Controller
public class KonsumenController {

	@Autowired
	private KonsumenService konsumenService;

	@InitBinder
	public void initBinder(WebDataBinder webDataBinder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		webDataBinder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}

	@GetMapping({ "/", "/viewKonsumenList" })
	public String viewKonsumenList(@ModelAttribute("message") String message, Model model) {
		model.addAttribute("konsumenList", konsumenService.getAllKonsumen());
		model.addAttribute("message", message);

		return "ViewKonsumenList";
	}

	@GetMapping("/addKonsumen")
	public String addKonsumen(@ModelAttribute("message") String message, Model model) {
		model.addAttribute("konsumen", new Konsumen());
		model.addAttribute("message", message);

		return "AddKonsumen";
	}

	@PostMapping("/saveKonsumen")
	public String saveKonsumen(Konsumen konsumen, RedirectAttributes redirectAttributes) {
		System.out.println("TANGGAL APA " + konsumen.getTglRegistrasi());
		if (konsumenService.saveOrUpdateKonsumen(konsumen)) {
			redirectAttributes.addFlashAttribute("message", "Save Success");
			return "redirect:/viewKonsumenList";
		}

		redirectAttributes.addFlashAttribute("message", "Save Failure");
		return "redirect:/addKonsumen";
	}

	@GetMapping("/editKonsumen/{id}")
	public String editKonsumen(@PathVariable Long id, Model model) {
		model.addAttribute("konsumen", konsumenService.getKonsumenById(id));

		return "EditKonsumen";
	}

	@PostMapping("/editSaveKonsumen")
	public String editSaveKonsumen(Konsumen konsumen, RedirectAttributes redirectAttributes) {
		if (konsumenService.saveOrUpdateKonsumen(konsumen)) {
			redirectAttributes.addFlashAttribute("message", "Edit Success");
			return "redirect:/viewKonsumenList";
		}

		redirectAttributes.addFlashAttribute("message", "Edit Failure");
		return "redirect:/editKonsumen/" + konsumen.getId();
	}

	@GetMapping("/deleteKonsumen/{id}")
	public String deleteKonsumen(@PathVariable Long id, RedirectAttributes redirectAttributes) {
		if (konsumenService.deleteKonsumen(id)) {
			redirectAttributes.addFlashAttribute("message", "Delete Success");
		} else {
			redirectAttributes.addFlashAttribute("message", "Delete Failure");
		}

		return "redirect:/viewKonsumenList";
	}

}
