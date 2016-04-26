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
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Famïa
 */
@Entity
@Table(name = "STARRED")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Starred.findAll", query = "SELECT s FROM Starred s"),
    @NamedQuery(name = "Starred.findById", query = "SELECT s FROM Starred s WHERE s.id = :id")})
public class Starred implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Column(name = "STARRED")
    private Serializable starred;
    @JoinColumn(name = "MAIL", referencedColumnName = "MAIL")
    @ManyToOne(optional = false)
    private Client mail;

    public Starred() {
    }

    public Starred(Integer id) {
        this.id = id;
    }

    public Starred(Integer id, Serializable starred) {
        this.id = id;
        this.starred = starred;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Serializable getStarred() {
        return starred;
    }

    public void setStarred(Serializable starred) {
        this.starred = starred;
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
        if (!(object instanceof Starred)) {
            return false;
        }
        Starred other = (Starred) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Starred[ id=" + id + " ]";
    }
    
}
