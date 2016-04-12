/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author noe_s_000
 */
@Entity
@Table(name = "BOOK_VALUES")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "BookValues.findAll", query = "SELECT b FROM BookValues b"),
    @NamedQuery(name = "BookValues.findByClientmail", query = "SELECT b FROM BookValues b WHERE b.bookValuesPK.clientmail = :clientmail"),
    @NamedQuery(name = "BookValues.findByBookisbn", query = "SELECT b FROM BookValues b WHERE b.bookValuesPK.bookisbn = :bookisbn"),
    @NamedQuery(name = "BookValues.findByValue", query = "SELECT b FROM BookValues b WHERE b.value = :value")})
public class BookValues implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected BookValuesPK bookValuesPK;
    @Column(name = "VALUE")
    private Integer value;

    public BookValues() {
    }

    public BookValues(BookValuesPK bookValuesPK) {
        this.bookValuesPK = bookValuesPK;
    }

    public BookValues(String clientmail, int bookisbn) {
        this.bookValuesPK = new BookValuesPK(clientmail, bookisbn);
    }

    public BookValuesPK getBookValuesPK() {
        return bookValuesPK;
    }

    public void setBookValuesPK(BookValuesPK bookValuesPK) {
        this.bookValuesPK = bookValuesPK;
    }

    public Integer getValue() {
        return value;
    }

    public void setValue(Integer value) {
        this.value = value;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (bookValuesPK != null ? bookValuesPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof BookValues)) {
            return false;
        }
        BookValues other = (BookValues) object;
        if ((this.bookValuesPK == null && other.bookValuesPK != null) || (this.bookValuesPK != null && !this.bookValuesPK.equals(other.bookValuesPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.BookValues[ bookValuesPK=" + bookValuesPK + " ]";
    }
    
}
