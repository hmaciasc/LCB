package pdf;


import com.itextpdf.text.BadElementException;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.draw.LineSeparator;
import entity.Book;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URL;
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
    private final String title = "Factura de compra: ";
    public static final String path = "factura.pdf";
    public static String absolutePath;
    private static final String imageUrl = "http://www.david-edward-byrd.com/gallery/warners7-2-lrg.jpg";
    
    private static final Font titleFont = new Font(Font.FontFamily.COURIER, 18,Font.NORMAL);
    private static final Font thankFont = new Font(Font.FontFamily.HELVETICA, 20, Font.ITALIC);
    private static final Font normalFont = new Font(Font.FontFamily.COURIER, 12, Font.NORMAL);

    public PdfHandler(ShoppingCart cart) {
        this.cart = cart;
        this.pdf = new Document(PageSize.A4);
        try {
            String dir = System.getProperty("user.home") + "/Desktop";
            File file = new File(dir+"/"+path);
            PdfWriter.getInstance(pdf, new FileOutputStream(file));
            absolutePath = file.getAbsolutePath();
            Logger.getLogger(PdfHandler.class.getName()).log(Level.INFO, absolutePath);
        } catch (DocumentException | FileNotFoundException ex) {
            Logger.getLogger(PdfHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
        createBill(cart);
    }

    public String getAbsolutePath() {
        return absolutePath;
    }
    
    private Document createBill(ShoppingCart cart){
        try {
            addTitle();
            addCartItems(cart);
            addBillFooter();
        } catch (DocumentException ex) {
            Logger.getLogger(PdfHandler.class.getName()).log(Level.SEVERE, "Fallo al generar pdf");
        }
        return pdf;
    }
    
    
    private void addTitle() throws DocumentException{
        pdf.open();
        
        
        Image logo = null;
        try {
            logo = Image.getInstance(new URL(imageUrl));
            logo.scaleAbsolute(100f, 125f);
        } catch (BadElementException | IOException ex) {
            Logger.getLogger(PdfHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
        pdf.add(logo);
        
        pdf.add(new Paragraph(title, titleFont));
        LineSeparator ls = new LineSeparator();
        pdf.add(new Chunk(ls));
    }
    
    private void addCartItems(ShoppingCart cart) throws DocumentException{
        PdfPTable table = new PdfPTable(2);
        table.getDefaultCell().setBorder(Rectangle.NO_BORDER);
        for (Book book : cart.getCart()) {
            pdf.add(createParagraphWithSpaces(normalFont, book));
        }
        LineSeparator ls = new LineSeparator();
        pdf.add(new Chunk(ls));
        createTotal(cart);
        pdf.add(new Chunk(ls));
        pdf.add(table);
        pdf.add(new Chunk(ls));
    }
    
    public Paragraph createParagraphWithSpaces(Font font, Book book) {
        Paragraph p = new Paragraph();
        p.setFont(font);
        p.add(String.format("%-60s", book.getTitle()));
        p.add(String.valueOf(book.getDiscountPrice()));
        return p;
    }
    
    private void addBillFooter() throws DocumentException{
        pdf.add(new Chunk());
        pdf.add(new Paragraph("Gracias por comprar en LCB", thankFont));
        pdf.close();
    }
    
    private void createTotal(ShoppingCart cart1) throws DocumentException {
        Paragraph p = new Paragraph();
        p.setFont(normalFont);
        p.add(String.format("%-60s", "Total a pagar: ", titleFont));
        p.add(String.valueOf(cart1.getCost()));
        pdf.add(p);
    }
    
}
