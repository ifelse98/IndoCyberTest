package com.indocyber.salt.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;


@javax.persistence.Entity
@Table(name="KONSUMEN")
public class Konsumen {

    @Id
    @GeneratedValue
    (strategy = GenerationType.AUTO)
    private Long id;
    @Column
    private String nama;
    
    @Column
    private String alamat;
    
    @Column
    private String kota;
    
    @Column
    private String provinsi;
    
    @Column
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date tglRegistrasi;
    
    @Column
    private boolean status;
    
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getNama() {
		return nama;
	}
	public void setNama(String nama) {
		this.nama = nama;
	}
	public String getAlamat() {
		return alamat;
	}
	public void setAlamat(String alamat) {
		this.alamat = alamat;
	}
	public String getKota() {
		return kota;
	}
	public void setKota(String kota) {
		this.kota = kota;
	}
	public String getProvinsi() {
		return provinsi;
	}
	public void setProvinsi(String provinsi) {
		this.provinsi = provinsi;
	}
	public Date getTglRegistrasi() {
		return tglRegistrasi;
	}
	public void setTglRegistrasi(Date tglRegistrasi) {
		this.tglRegistrasi = tglRegistrasi;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
}
