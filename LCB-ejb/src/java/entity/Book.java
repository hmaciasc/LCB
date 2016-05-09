/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Famïa
 */
@Entity
@Table(name = "BOOK")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Book.findAll", query = "SELECT b FROM Book b"),
    @NamedQuery(name = "Book.findByTitle", query = "SELECT b FROM Book b WHERE b.title = :title"),
    @NamedQuery(name = "Book.findByAuthor", query = "SELECT b FROM Book b WHERE b.author = :author"),
    @NamedQuery(name = "Book.findByPublisher", query = "SELECT b FROM Book b WHERE b.publisher = :publisher"),
    @NamedQuery(name = "Book.findByPrice", query = "SELECT b FROM Book b WHERE b.price = :price"),
    @NamedQuery(name = "Book.findByDiscountPrice", query = "SELECT b FROM Book b WHERE b.discountPrice = :discountPrice"),
    @NamedQuery(name = "Book.findByCopy", query = "SELECT b FROM Book b WHERE b.copy = :copy"),
    @NamedQuery(name = "Book.findByValue", query = "SELECT b FROM Book b WHERE b.value = :value"),
    @NamedQuery(name = "Book.findByIsbn", query = "SELECT b FROM Book b WHERE b.isbn = :isbn"),
    @NamedQuery(name = "Book.findByCategory", query = "SELECT b FROM Book b WHERE b.category = :category"),
    @NamedQuery(name = "Book.findByPublishyear", query = "SELECT b FROM Book b WHERE b.publishyear = :publishyear"),
    @NamedQuery(name = "Book.findByUsersvalue", query = "SELECT b FROM Book b WHERE b.usersvalue = :usersvalue")})
public class Book implements Serializable {

    private static final long serialVersionUID = 1L;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "TITLE")
    private String title;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "AUTHOR")
    private String author;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "PUBLISHER")
    private String publisher;
    @Basic(optional = false)
    @NotNull
    @Column(name = "PRICE")
    private int price;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "DISCOUNT_PRICE")
    private Double discountPrice;
    @Basic(optional = false)
    @NotNull
    @Column(name = "COPY")
    private int copy;
    @Column(name = "VALUE")
    private Double value;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "ISBN")
    private Integer isbn;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "CATEGORY")
    private String category;
    @Basic(optional = false)
    @NotNull
    @Column(name = "PUBLISHYEAR")
    private int publishyear;
    @Column(name = "USERSVALUE")
    private Integer usersvalue;
    @JoinColumn(name = "DISCOUNT_ID", referencedColumnName = "ID")
    @ManyToOne(optional = false)
    private Discount discountId;

    public Book() {
    }

    public Book(Integer isbn) {
        this.isbn = isbn;
    }

    public Book(Integer isbn, String title, String author, String publisher, int price, int copy, String category, int publishyear) {
        this.isbn = isbn;
        this.title = title;
        this.author = author;
        this.publisher = publisher;
        this.price = price;
        this.copy = copy;
        this.category = category;
        this.publishyear = publishyear;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public Double getDiscountPrice() {
        return discountPrice;
    }

    public void setDiscountPrice(Double discountPrice) {
        this.discountPrice = discountPrice;
    }

    public int getCopy() {
        return copy;
    }

    public void setCopy(int copy) {
        this.copy = copy;
    }

    public Double getValue() {
        return value;
    }

    public void setValue(Double value) {
        this.value = value;
    }

    public Integer getIsbn() {
        return isbn;
    }

    public void setIsbn(Integer isbn) {
        this.isbn = isbn;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getPublishyear() {
        return publishyear;
    }

    public void setPublishyear(int publishyear) {
        this.publishyear = publishyear;
    }

    public Integer getUsersvalue() {
        return usersvalue;
    }

    public void setUsersvalue(Integer usersvalue) {
        this.usersvalue = usersvalue;
    }

    public Discount getDiscountId() {
        return discountId;
    }

    public void setDiscountId(Discount discountId) {
        this.discountId = discountId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (isbn != null ? isbn.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Book)) {
            return false;
        }
        Book other = (Book) object;
        if ((this.isbn == null && other.isbn != null) || (this.isbn != null && !this.isbn.equals(other.isbn))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Book[ isbn=" + isbn + " ]";
    }
    
    @Override
    public Object clone() throws CloneNotSupportedException{
        return super.clone();
    }
    
}
