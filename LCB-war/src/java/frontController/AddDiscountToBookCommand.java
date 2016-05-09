/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package frontController;

import controller.BookFacadeLocal;
import controller.DiscountFacadeLocal;
import entity.Book;
import entity.Discount;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;

/**
 *
 * @author Famïa
 */
public class AddDiscountToBookCommand extends FrontCommand{

    @Override
    public void process() {
        try {
            DiscountFacadeLocal DBConnectionD = InitialContext.doLookup("java:global/LCB/LCB-ejb/DiscountFacade");
            BookFacadeLocal DBConnectionB = InitialContext.doLookup("java:global/LCB/LCB-ejb/BookFacade");
            
            Discount find_discount = new Discount();
            Book find_book = new Book();
            
            String discount = request.getParameter("discountID2");
            String isbn = request.getParameter("isbn3");
            
            find_discount = DBConnectionD.find(Integer.parseInt(discount));
            
            if(find_discount != null){
                find_book = DBConnectionB.find(Integer.parseInt(isbn));
                Double discount_price = find_book.getPrice() - (find_discount.getDiscount()/100 * find_book.getPrice());
                find_book.setDiscountPrice(discount_price);
                
                find_book.setDiscountId(find_discount);
                DBConnectionB.edit(find_book);
            }
                        
            forward("/FrontControllerServlet?command=HomeCommand");
           
        } catch (NamingException | ServletException | IOException ex) {
            Logger.getLogger(AddDiscountToBookCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
