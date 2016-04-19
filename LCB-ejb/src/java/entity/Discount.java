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
@Table(name = "DISCOUNT")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Discount.findAll", query = "SELECT d FROM Discount d"),
    @NamedQuery(name = "Discount.findByDiscountname", query = "SELECT d FROM Discount d WHERE d.discountname = :discountname"),
    @NamedQuery(name = "Discount.findByDiscount", query = "SELECT d FROM Discount d WHERE d.discount = :discount")})
public class Discount implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "DISCOUNTNAME")
    private String discountname;
    @Column(name = "DISCOUNT")
    private Integer discount;

    public Discount() {
    }

    public Discount(String discountname) {
        this.discountname = discountname;
    }

    public String getDiscountname() {
        return discountname;
    }

    public void setDiscountname(String discountname) {
        this.discountname = discountname;
    }

    public Integer getDiscount() {
        return discount;
    }

    public void setDiscount(Integer discount) {
        this.discount = discount;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (discountname != null ? discountname.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Discount)) {
            return false;
        }
        Discount other = (Discount) object;
        if ((this.discountname == null && other.discountname != null) || (this.discountname != null && !this.discountname.equals(other.discountname))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Discount[ discountname=" + discountname + " ]";
    }
    
}
