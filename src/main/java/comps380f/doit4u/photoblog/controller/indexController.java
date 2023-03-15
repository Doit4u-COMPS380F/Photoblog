package comps380f.doit4u.photoblog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class indexController {
    @GetMapping("/")
    public String index() {
        return "redirect:/Photoblog/index";
    }
}
