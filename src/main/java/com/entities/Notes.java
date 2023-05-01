package com.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Notes {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Note_Id")
	private long id;
	@Column(name = "Note_Title", length = 30)
	private String Name;
	@Column( name = "Note_Content", length = 2000)
	private String Content;
	private Date addedDate;

	public Notes() {
		super();
	}

	public Notes(String name, String content, Date addedDate) {
		super();
		Name = name;
		Content = content;
		this.addedDate = addedDate;
	}

	@Override
	public String toString() {
		return "Notes [id=" + id + ", Name=" + Name + ", Content=" + Content + ", addedDate=" + addedDate + "]";
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getContent() {
		return Content;
	}

	public void setContent(String content) {
		Content = content;
	}

	public Date getAddedDate() {
		return addedDate;
	}

	public void setAddedDate(Date addedDate) {
		this.addedDate = addedDate;
	}

}
