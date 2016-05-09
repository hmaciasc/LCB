/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Famïa
 */
@Entity
@Table(name = "SHOPPING")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Shopping.findAll", query = "SELECT s FROM Shopping s"),
    @NamedQuery(name = "Shopping.findById", query = "SELECT s FROM Shopping s WHERE s.id = :id"),
    @NamedQuery(name = "Shopping.findByDate", query = "SELECT s FROM Shopping s WHERE s.date = :date")})
public class Shopping implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Column(name = "DATE")
    @Temporal(TemporalType.DATE)
    private Date date;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Column(name = "SHOPPING")
    private Serializable shopping;
    @JoinColumn(name = "MAIL", referencedColumnName = "MAIL")
    @ManyToOne(optional = false)
    private Client mail;

    public Shopping() {
    }

    public Shopping(Integer id) {
        this.id = id;
    }

    public Shopping(Integer id, Date date, Serializable shopping) {
        this.id = id;
        this.date = date;
        this.shopping = shopping;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Serializable getShopping() {
        return shopping;
    }

    public void setShopping(Serializable shopping) {
        this.shopping = shopping;
    }

    public Client getMail() {
        return mail;
    }

    public void setMail(Client mail) {
        this.mail = mail;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Shopping)) {
            return false;
        }
        Shopping other = (Shopping) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Shopping[ id=" + id + " ]";
    }
    
}
