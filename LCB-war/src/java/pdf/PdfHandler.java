package pdf;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import entity.Book;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.ShoppingCart;

/**
 *
 * @author maxi
 */
public class PdfHandler {

    private final ShoppingCart cart;
    private final Document pdf;
    public static final String path = "factura.pdf";
    public static String absolutePath;
    
    
    private static Font titleFont = new Font(Font.FontFamily.TIMES_ROMAN, 18,Font.BOLD);
    private static Font thankFont = new Font(Font.FontFamily.TIMES_ROMAN, 14, Font.BOLD);

    public PdfHandler(ShoppingCart cart) {
        this.cart = cart;
        this.pdf = new Document(PageSize.A4);
        try {
            File file = new File(path);
            PdfWriter.getInstance(pdf, new FileOutputStream(new File(path)));
            absolutePath = file.getAbsolutePath();
            //Logger.getLogger(PdfHandler.class.getName()).log(Level.INFO, file.getAbsolutePath());
        } catch (DocumentException | FileNotFoundException ex) {
            Logger.getLogger(PdfHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
        createBill(cart);
    }
    
    
    private Document getPdf(){
        return pdf;
    }

    public String getAbsolutePath() {
        return absolutePath;
    }
    
    private Document createBill(ShoppingCart cart){
        try {
            addTitle("Factura");
            addCartItems(cart);
            addBillFooter();
        } catch (DocumentException ex) {
            Logger.getLogger(PdfHandler.class.getName()).log(Level.SEVERE, "Fallo al generar pdf");
        }
        return pdf;
    }
    
    
    private void addTitle(String title) throws DocumentException{
        pdf.open();
        pdf.add(new Paragraph(title, titleFont));
        pdf.addTitle("Factura");
    }
    
    private void addCartItems(ShoppingCart cart) throws DocumentException{
        PdfPTable table = new PdfPTable(cart.getCart().size());
        for (Book book : cart.getCart()) {
            table.addCell(book.getTitle()+ "..................." + book.getDiscountPrice());
        }
        pdf.add(new Paragraph(String.valueOf(cart.getCost()), titleFont));
        pdf.add(table);
    }
    
    private void addBillFooter() throws DocumentException{
        pdf.add(new Paragraph("Gracias por comprar en LCB", thankFont));
        pdf.close();
    }
    
    
}
