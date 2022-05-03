
package com.example.demo.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.model.User;
import com.example.demo.dao.PriceDaoRepo;
import com.example.demo.dao.daoUserRepository;
import com.example.demo.model.CheckInAndCheckOut;
import com.example.demo.model.Mall;
import com.example.demo.model.Vehicle;
import com.example.demo.model.VehiclePrice;
import com.example.demo.services.DemoService;


@Controller
public class HomeController {

	@Autowired
	DemoService demoService;

	@Autowired
	daoUserRepository userRepo;

	@Autowired
	PriceDaoRepo priceDaoRepo;

	@GetMapping("/admin")
	public String showLoginPage() {
		return "login";
	}

	@GetMapping("/priceUpdateForm")
	public String priceUpdate(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession(false);
		if (session != null) {
			String email = (String) session.getAttribute("email");
			User user = userRepo.findByEmail(email);
			model.addAttribute("user", user);
		}
		return "priceUpdate";
	}

	@PostMapping("/priceUpdation")
	public String priceUpdation(@ModelAttribute("vehiclePrice") VehiclePrice vehiclePrice, HttpServletRequest req,
			Model model) {
		System.out.println("done");
		if (checkSession(req, "email")) {
			VehiclePrice oldvehiclePrice = demoService.findByVehicleName(vehiclePrice.getVehicleName());
			System.out.println(oldvehiclePrice);
			if (oldvehiclePrice != null) {
				oldvehiclePrice.setPrice(vehiclePrice.getPrice());
				demoService.priceUpdation(oldvehiclePrice);
			} else {
				demoService.priceUpdation(vehiclePrice);
			}
			model.addAttribute("saved", true);
			return "priceUpdate";

		} else {
			return "superAdminLogin";
		}
	}

	@GetMapping({ "/", "superadmin" })
	public String showSuperAdminLoginPage(Model model, HttpServletRequest req) {
		model.addAttribute("error", "");
		if (checkSession(req, "error")) {
			model.addAttribute("error", "Login Failed");

		}
		return "superAdminLogin";
	}

	@GetMapping("/getReports")
	public String getReports(Model model, HttpServletRequest req) {
		if (checkSession(req, "email")) {
			HttpSession session = req.getSession(false);
			String mallId = (String) session.getAttribute("mallId");
			model.addAttribute("reportsList", demoService.getAllReports(mallId));
			return "reports";
		} else {
			return "redirect:/login";
		}
	}

	@GetMapping("/getMallList")
	public String getMallList(Model model, HttpServletRequest req) {
		if (checkSession(req, "email")) {
			List<Mall> kk = demoService.getAllMallDeatails();
			System.out.println(kk);
			model.addAttribute("malls", kk);
			return "mallList";
		} else {
			return "redirect:/superadmin";
		}
	}

	@GetMapping("/vehicleRegistration")
	public String vehicleRegistration(HttpServletRequest req) {
		if (checkSession(req, "email")) {
			return "vehicleRegistration";
		} else {
			return "superAdminLogin";
		}
	}

	@PostMapping({ "/superadminlogin", "/login" })
	public String getHomePage(@RequestParam String loginEmail, @RequestParam String loginPassword,
			@RequestParam String role, Model model, HttpServletRequest req) {
		String res = demoService.checkUser(loginEmail, loginPassword, role);
		if (role.equalsIgnoreCase("superadmin")) {
			if (res.equals("true")) {
				HttpSession resp = req.getSession(true);
				resp.setAttribute("email", loginEmail);
				model.addAttribute("usersList", demoService.getUsersByRole("admin"));
				return "showSuperAdminHome";
			} else {
				HttpSession resp = req.getSession(true);
				resp.setAttribute("error", res);
				model.addAttribute("result", res);
				return "redirect:/superadmin";
			}
		} else {
			if (res.equals("true")) {
				HttpSession resp = req.getSession(true);
				resp.setAttribute("email", loginEmail);
				User user = demoService.getUserByEmail(loginEmail);
				resp.setAttribute("mallId", user.getMall_id());
				model.addAttribute("vehiclesList", demoService.getAllVehicles(user.getMall_id()));
				return "adminHomePage";
			} else {
				model.addAttribute("result", res);
				return "login";
			}
		}
	}

	@GetMapping("/getcheckinForm")
	public String getcheckinForm(HttpServletRequest req) {
		if (checkSession(req, "email")) {
			return "checkin";
		} else {
			return "redirect:/superadmin";
		}
	}

	@GetMapping("/getcheckOutForm")
	public String getcheckOutForm(HttpServletRequest req) {
		if (checkSession(req, "email")) {
			req.getSession().setAttribute("checkoutForm", true);
			return "checkout";
		} else {
			return "redirect:/superadmin";
		}
	}
	
	@GetMapping("/getSlots")
	public String getSlots(HttpServletRequest req) {
		if (checkSession(req, "email")) {
			String level = req.getParameter("parkingLevel");
			System.out.println(level);
			return "checkin";
		} else {
			return "redirect:/superadmin";
		}
	}

	@GetMapping(value = "/getVehicleByRegId")
	public String getVehicleByRegId(@RequestParam String type, @RequestParam String regId, Model model,
			HttpServletRequest req) throws Exception {
		if (checkSession(req, "email")) {
			HttpSession session = req.getSession(false);
			if (session != null) {
				String email = (String) session.getAttribute("email");
				User user = userRepo.findByEmail(email);
				model.addAttribute("user", user);
				String mallId = user.getMall_id();
				Vehicle vehicle = demoService.getVehicleByRegId(regId, mallId);
				if (vehicle == null) {
					model.addAttribute("userNotFound", true);
					return type;
				}
				model.addAttribute("vehicle", vehicle);
				VehiclePrice vp = priceDaoRepo.getPriceOfVehicle(vehicle.getVehicle_type());
				model.addAttribute("vehiclePrice", vp);
				CheckInAndCheckOut ci = new CheckInAndCheckOut();
				// getting checkin date
				ci = demoService.getCheckInDetailsByRegId(vehicle.getRegId());
				model.addAttribute("checkin", ci);
				
				// getting parking levels
				try {
					List<Mall> malls = demoService.getAllMallDeatails();
					
					List<Mall> result = malls.stream()
				    .filter(a -> Objects.equals(a.getMall_registration_number(), mallId))
				    .collect(Collectors.toList());
					model.addAttribute("malls", result.get(0));
				}catch(Exception e) {
					System.out.println(e);
				}
				
			

			
//				req.getSession().setAttribute("checkedin_dt",vehicle.getCheckin_dt());
				req.getSession().setAttribute("price", vp == null ? 50 : vp.getPrice());
				req.getSession().setAttribute("checkoutForm", false);
			}

			return type;
		} else {
			return "redirect:/superadmin";
		}
	}

	@PostMapping(path = "/registerVehicle")
	public String registerVehicle(@ModelAttribute("vehicle") Vehicle vehicle, Model model, HttpServletRequest req) {
		if (checkSession(req, "email")) {

			if (vehicle.getModel().equalsIgnoreCase(null)) {
				vehicle.setModel("");
			}
			if (vehicle.getOwner_name().equalsIgnoreCase(null)) {
				vehicle.setOwner_name("");
			}
			if (vehicle.getContact() == null) {
				vehicle.setContact("");
			}
			if (vehicle.getAge() == null) {
				vehicle.setAge("");
			}

			HttpSession session = req.getSession(false);
			String mallId = (String) session.getAttribute("mallId");
			Vehicle updatedVehicle = demoService.getVehicleByRegId(vehicle.getRegId(), mallId);

			if (updatedVehicle != null) {
				model.addAttribute("exist", true);
				return "vehicleRegistration";
			}

			SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
			Date date = new Date();
			vehicle.setRegister_dt(formatter.format(date));
			model.addAttribute("saved", true);
			vehicle.setMall_id(mallId);
			demoService.registerVehicle(vehicle);
			return "vehicleRegistration";
		} else {
			return "redirect:/superadmin";
		}
	}

	@PostMapping(path = "/saveadmin")
	public String saveAdmin(@ModelAttribute("user") User user, HttpServletRequest req, Model model) {
		if (checkSession(req, "email")) {
			if (demoService.checkUser(user.getEmail(), user.getPassword(), user.getRole())
					.endsWith("User does not exist.*")) {
				demoService.addAdmin(user);
				model.addAttribute("usersList", demoService.getUsersByRole("admin"));
				model.addAttribute("result", "");
			} else {
				model.addAttribute("result", "User Already Exits");
				return "addAdmin";
			}
			return "showSuperAdminHome";
		} else {
			return "redirect:/superadmin";
		}
	}

	public boolean checkSession(HttpServletRequest req, String key) {
		HttpSession session = req.getSession(false);
		if (session != null) {
			String email = (String) session.getAttribute(key);
			if (email != null) {
				return true;
			}
			return false;
		}
		return false;
	}

	@GetMapping(path = "/getAdminHome")
	public String getAllVehicles(Model model, HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		String mallId = (String) session.getAttribute("mallId");
		model.addAttribute("vehiclesList", demoService.getAllVehicles(mallId));
		return "adminHomePage";
	}

	@GetMapping(path = "/getSuperAdminHome")
	public String getAllUsers(Model model, HttpServletRequest req) {
		if (checkSession(req, "email")) {
			model.addAttribute("usersList", demoService.getUsersByRole("admin"));
			return "showSuperAdminHome";
		} else {
			return "redirect:/superadmin";
		}
	}

	@PostMapping(path = "/checkinVehicle")
	public String checkInVehicle(@ModelAttribute("vehicle") Vehicle updatedVehicle, Model model,
			HttpServletRequest req) {
		
//		getting mall id
		HttpSession session = req.getSession(false);
		String email = (String) session.getAttribute("email");
		User user = userRepo.findByEmail(email);
		model.addAttribute("user", user);
		String mallId = user.getMall_id();
		
		// checking parking level and slot exist or not
		CheckInAndCheckOut check = demoService.getParkingLevelAndSlot(updatedVehicle.getParkingLevel(),updatedVehicle.getSlot());
		if(check != null) {
			// getting parking levels
			try {
				List<Mall> malls = demoService.getAllMallDeatails();
				
				List<Mall> result = malls.stream()
			    .filter(a -> Objects.equals(a.getMall_registration_number(), mallId))
			    .collect(Collectors.toList());
				model.addAttribute("malls", result.get(0));
			}catch(Exception e) {
				System.out.println(e);
			}
			model.addAttribute("booked",true);
			return "checkin";
		}

		SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		Date date = new Date();
//	
		Vehicle vehicle = (Vehicle) demoService.getVehicleByRegId(updatedVehicle.getRegId(), mallId);
		vehicle.setStatus(1);
		CheckInAndCheckOut ci = new CheckInAndCheckOut();
		System.out.println(updatedVehicle);
		ci.setCheckin_dt(formatter.format(date));
		ci.setVehicleRegId(vehicle.getRegId());
		ci.setMallId(mallId);
		ci.setParkingLevel(updatedVehicle.getParkingLevel());
		ci.setSlot(updatedVehicle.getSlot());
		demoService.checkInVehicle(ci);
		model.addAttribute("saved", true);
		model.addAttribute("checkin", ci);
		return "checkin";
	}

	@PostMapping(path = "/checkoutVehicle")
	public String checkOutVehicle(@ModelAttribute("vehicle") Vehicle updatedVehicle, Model model,
			HttpServletRequest req) throws Exception {

		HttpSession session = req.getSession(false);
		String mallId = (String) session.getAttribute("mallId");
		Vehicle vehicle = (Vehicle) demoService.getVehicleByRegId(updatedVehicle.getRegId(), mallId);
		vehicle.setStatus(2);
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		Date date = new Date();
		CheckInAndCheckOut co = demoService.getCheckInDetailsByRegId(vehicle.getRegId());
		co.setCheckout_dt(formatter.format(date));

//		calculating total time
		int totalHours;
		Date endTime = new Date();
		SimpleDateFormat parser = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		Date startTime = parser.parse(co.getCheckin_dt());
		final int MILLI_TO_HOUR = 1000 * 60 * 60;
		totalHours = (int) (endTime.getTime() - startTime.getTime()) / MILLI_TO_HOUR;

		VehiclePrice vp = priceDaoRepo.getPriceOfVehicle(vehicle.getVehicle_type());
		co.setTotalTime(totalHours);
		co.setPrice(totalHours * vp.getPrice());
		co.setParkingLevel(0);
		co.setSlot(0);
		demoService.checkOutVehicle(co);
		model.addAttribute("saved", true);
		return "checkout";
	}

	@GetMapping("/addadmin")
	public String addAdmin(Model model, HttpServletRequest req) {
		if (checkSession(req, "email")) {
			List<Mall> kk = demoService.getAllMallDeatails();
			model.addAttribute("malls", kk);
			return "addAdmin";
		} else {
			return "redirect:/superadmin";
		}
	}

	@GetMapping("/adminLogout")
	public String adminLogout(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		return "login";

	}

	@GetMapping("/superAdminLogout")
	public String superAdminLogout(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		return "redirect:/superadmin";
	}

	@GetMapping("/addmall")
	public String addMall(Model model, HttpServletRequest req) {
		if (checkSession(req, "email")) {
			return "addMall";
		} else {
			return "redirect:/superadmin";
		}
	}

	@PostMapping(path = "/saveMallRegistration")
	public String saveMallRegistration(@ModelAttribute("mall") Mall mall, HttpServletRequest req, Model model) {
		if (checkSession(req, "email")) {
			demoService.saveMallRegistration(mall);
			model.addAttribute("usersList", demoService.getUsersByRole("admin"));
			return "showSuperAdminHome";
		} else {
			return "redirect:/superadmin";
		}
	}
}
