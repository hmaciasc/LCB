/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author noe_s_000
 */
@Embeddable
public class BookValuesPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 200)
    @Column(name = "CLIENTMAIL")
    private String clientmail;
    @Basic(optional = false)
    @NotNull
    @Column(name = "BOOKISBN")
    private int bookisbn;

    public BookValuesPK() {
    }

    public BookValuesPK(String clientmail, int bookisbn) {
        this.clientmail = clientmail;
        this.bookisbn = bookisbn;
    }

    public String getClientmail() {
        return clientmail;
    }

    public void setClientmail(String clientmail) {
        this.clientmail = clientmail;
    }

    public int getBookisbn() {
        return bookisbn;
    }

    public void setBookisbn(int bookisbn) {
        this.bookisbn = bookisbn;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (clientmail != null ? clientmail.hashCode() : 0);
        hash += (int) bookisbn;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof BookValuesPK)) {
            return false;
        }
        BookValuesPK other = (BookValuesPK) object;
        if ((this.clientmail == null && other.clientmail != null) || (this.clientmail != null && !this.clientmail.equals(other.clientmail))) {
            return false;
        }
        if (this.bookisbn != other.bookisbn) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.BookValuesPK[ clientmail=" + clientmail + ", bookisbn=" + bookisbn + " ]";
    }
    
}
