package pdf;


import com.itextpdf.text.BadElementException;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.draw.LineSeparator;
import entity.Book;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.math.RoundingMode;
import java.net.URL;
import java.text.DecimalFormat;
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
    private static final String info = "Web: www.lcb.com";
    
    private static final Font titleFont = new Font(Font.FontFamily.COURIER, 18,Font.NORMAL);
    private static final Font thankFont = new Font(Font.FontFamily.HELVETICA, 20, Font.ITALIC);
    private static final Font normalFont = new Font(Font.FontFamily.COURIER, 12, Font.NORMAL);
    private Double discount;
    private Double priceWithDiscount;

    public PdfHandler(ShoppingCart cart, Double discount, Double priceWithDiscount) {
        this.cart = cart;
        this.pdf = new Document(PageSize.A4);
        this.discount = discount;
        this.priceWithDiscount = priceWithDiscount;
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
            createHeader();
            addCartItems(cart);
            addBillFooter();
        } catch (DocumentException ex) {
            Logger.getLogger(PdfHandler.class.getName()).log(Level.SEVERE, "Fallo al generar pdf");
        }
        return pdf;
    }
    
    private void createHeader() throws DocumentException{
        pdf.open();
        PdfPTable table = new PdfPTable(2);
        table.setWidthPercentage(100);
        
        Image logo = null;
        try {
            logo = Image.getInstance(new URL(imageUrl));
            logo.scaleAbsolute(100f, 125f);
        } catch (BadElementException | IOException ex) {
            Logger.getLogger(PdfHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
        PdfPCell cell = new PdfPCell(logo, true);
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setFixedHeight(140);
        table.addCell(cell);
        Paragraph p = new Paragraph(info, normalFont);
        PdfPCell rightCell = new PdfPCell(p);
        p.add("\nContacto: contact@lcb.com");
        rightCell.setBorder(Rectangle.NO_BORDER);
        table.addCell(rightCell);
        pdf.add(table);
        pdf.add(new Paragraph(title, titleFont));
        LineSeparator ls = new LineSeparator();
        pdf.add(new Chunk(ls));
    }
    
    private void addCartItems(ShoppingCart cart) throws DocumentException{
        PdfPTable table = new PdfPTable(2);
        table.setWidthPercentage(100);
        table.getDefaultCell().setBorder(Rectangle.NO_BORDER);
        for (Book book : cart.getCart()) {
            pdf.add(createParagraphWithSpaces(normalFont, book));
        }
        LineSeparator ls = new LineSeparator();
        pdf.add(new Chunk(ls));
        addTax(cart);
        createTotal(cart);
        if (!discount.equals(0.0) && discount != null) {
            createTotalWithDiscount(cart);
        }
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
        Paragraph p = new Paragraph("Gracias por comprar en LCB", thankFont);
        p.setAlignment(Element.ALIGN_CENTER);
        pdf.add(p);
        pdf.close();
    }
    
    private void createTotal(ShoppingCart cart1) throws DocumentException {
        Paragraph p = new Paragraph();
        p.setFont(normalFont);
        p.add(String.format("%-60s", "Total a pagar: ", titleFont));
        p.add(String.valueOf(cart1.getCost() + cart1.getCost() * 0.07));
        pdf.add(p);
    }
    
    private void addTax(ShoppingCart cart) throws DocumentException{
        Paragraph p = new Paragraph();
        p.setFont(normalFont);
        p.add(String.format("%-60s", "IGIC", titleFont));
        DecimalFormat df = new DecimalFormat("#.##");
        df.setRoundingMode(RoundingMode.FLOOR);
        p.add(String.valueOf(df.format(cart.getCost()* 0.07)));
        pdf.add(p);
    }
    
    private void createTotalWithDiscount(ShoppingCart cart) throws DocumentException{
        Paragraph p = new Paragraph();
        p.setFont(normalFont);
        p.add(String.format("%-60s", "Total a pagar con descuento del " + discount + "%: ", titleFont));
        DecimalFormat df = new DecimalFormat("#.##");
        df.setRoundingMode(RoundingMode.FLOOR);
        
        p.add(String.valueOf((double) Math.round((priceWithDiscount + (priceWithDiscount * 0.07)) * 100) / 100));
       // p.add(String.valueOf(cart.getCost() + cart.getCost() * 0.07));
        pdf.add(p);
    }
    
}
