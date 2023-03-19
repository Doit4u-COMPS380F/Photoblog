package comps380f.doit4u.photoblog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/Photoblog")
public class PageController {

    @GetMapping(value = {"", "/index"})
    public String list(ModelMap model) {
        return "index";
    }

}
