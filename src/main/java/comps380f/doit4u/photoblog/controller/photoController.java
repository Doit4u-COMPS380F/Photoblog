import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class photoController {
    @GetMapping("/")
    public String index() {
        return "redirect:/photo/list";
    }
}