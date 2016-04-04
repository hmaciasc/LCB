package frontController;

import controller.BookFacadeLocal;
import entity.Book;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import util.ShoppingCart;

/**
 *
 * @author maxi
 */
public class AddToCartCommand extends FrontCommand{


    @Override
    public void process() {

        try {
            BookFacadeLocal books;
            HttpSession session = request.getSession();
            ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
            Integer isbn = Integer.parseInt(request.getParameter("bookIsbn"));
//            Integer isbn = Integer.parseInt(request.getParameter("bookIsbn"));
            books = InitialContext.doLookup("java:global/LCB/LCB-ejb/BookFacade");
            //Tratarlo como HashMap<Book, Integer>, donde integer es el numero
            //de copias/contador de los libros que se pueden añadir al carrito
            //cuando llegue a 0, cambiar el botón por reservar, o que no siga
            //metiendo mas en el carrito

            Book bookDB = books.find(isbn);
            if(bookDB != null){
                if(cart.getCart().isEmpty()){
                    cart.addBookToCart(bookDB);
                }else{
                    int index = -1;
                    for (int i = 0; i < cart.getCart().size(); i++) {
                        if(cart.getCart().get(i).getIsbn().equals(isbn)){
                            index = i;
                        }
                    }
                    if(index == -1){
                        cart.addBookToCart(bookDB);
                    }else{
                        Book modBook = cart.getCart().get(index);
                        Book clonedBook = (Book) modBook.clone();
                        clonedBook.setCopy(modBook.getCopy() - 1);
                        if(clonedBook.getCopy() > 0)
                            cart.addBookToCart(clonedBook);
                    }
                }
            }
            /*

            List<Book> bookList = books.findAll();
            for (Book book : bookList) {
                if (book.getIsbn().equals(isbn)) {
                    cart.addBoookToCart(book);
                    //session.setAttribute("cart", cart);
                }
            }
*/
            forward("/indexView.jsp");
        } catch (ServletException | IOException | NamingException ex) {
            Logger.getLogger(AddToCartCommand.class.getName()).log(Level.SEVERE, null, ex);
        } catch (CloneNotSupportedException ex) {
            Logger.getLogger(AddToCartCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
