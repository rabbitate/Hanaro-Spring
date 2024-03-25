import com.hana.app.data.CustDto;
import com.hana.app.exception.DuplicatedIdException;
import com.hana.app.frame.Service;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {
    public static void main(String[] args) {
//        Service<String, CustDto> service = new CustService();
//        CustDto custDto = CustDto.builder().id("id02").pwd("pwd02").name("james").build();
//        try {
//            service.add(custDto);
//        } catch (DuplicatedIdException e) {
//            throw new RuntimeException(e);
//        }
//        System.out.println("OK");
        ApplicationContext factory =
                new ClassPathXmlApplicationContext("spring.xml");

        Service<String, CustDto> service =
                (Service<String, CustDto>) factory.getBean("custService");

        CustDto u = new CustDto("id02", "pwd02", "lee");
        try {
            service.add(u);
        } catch (DuplicatedIdException e) {
            throw new RuntimeException(e);
        }
    }
}