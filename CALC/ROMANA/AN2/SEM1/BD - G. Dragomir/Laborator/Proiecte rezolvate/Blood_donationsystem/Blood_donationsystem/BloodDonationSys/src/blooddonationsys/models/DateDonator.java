/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package blooddonationsys.models;

import java.sql.Date;

/**
 *
 * @author Iulia
 */
public class DateDonator {
    private int idDonator;
    private String nume;
    private String prenume;
    private String cnp;
    private Date dataNasterii;
    private String grupaSanguina;
    private String sex;
    private boolean fromDatabase;

    public DateDonator(int id) {
        idDonator = id;
        nume = "(Nespecificat)";
        prenume = "(Nespecificat)";
        cnp = "(Nespecificat)";
        dataNasterii = java.sql.Date.valueOf("1900-01-01");
        grupaSanguina = "(Nespecificat)";
        sex = "(Nespecificat)";
        this.fromDatabase = false;
    }
    
    public DateDonator(int id,String nume, String prenume, String cnp, Date dataNasterii, String grupaSanguina, String sex){
        this.idDonator = id;
        this.nume= nume;
        this.prenume= prenume;
        this.cnp= cnp;
        this.dataNasterii= dataNasterii;
        this.grupaSanguina= grupaSanguina;
        this.sex= sex;
        this.fromDatabase = true;
        
    }
    /**
     * @return the nume
     */
    public String getNume() {
        return nume;
    }

    /**
     * @param nume the nume to set
     */
    public void setNume(String nume) {
        this.nume = nume;
    }

    /**
     * @return the prenume
     */
    public String getPrenume() {
        return prenume;
    }

    /**
     * @param prenume the prenume to set
     */
    public void setPrenume(String prenume) {
        this.prenume = prenume;
    }

    /**
     * @return the cnp
     */
    public String getCnp() {
        return cnp;
    }

    /**
     * @param cnp the cnp to set
     */
    public void setCnp(String cnp) {
        this.cnp = cnp;
    }

    /**
     * @return the dataNasterii
     */
    public Date getDataNasterii() {
        return dataNasterii;
    }

    /**
     * @param dataNasterii the dataNasterii to set
     */
    public void setDataNasterii(Date dataNasterii) {
        this.dataNasterii = dataNasterii;
    }

    /**
     * @return the grupaSanguina
     */
    public String getGrupaSanguina() {
        return grupaSanguina;
    }

    /**
     * @param grupaSanguina the grupaSanguina to set
     */
    public void setGrupaSanguina(String grupaSanguina) {
        this.grupaSanguina = grupaSanguina;
    }

    /**
     * @return the rh
     */
    public String getSex() {
        return sex;
    }

    /**
     * @param rh the rh to set
     */
    public void setSex(String sex) {
        this.sex = sex;
    }

    /**
     * @return the idDonator
     */
    public int getIdDonator() {
        return idDonator;
    }

    /**
     * @return the fromDatabase
     */
    public boolean isFromDatabase() {
        return fromDatabase;
    }

    /**
     * @param fromDatabase the fromDatabase to set
     */
    public void setFromDatabase(boolean fromDatabase) {
        this.fromDatabase = fromDatabase;
    }
    
}
