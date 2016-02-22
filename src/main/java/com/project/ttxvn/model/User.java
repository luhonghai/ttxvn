package com.project.ttxvn.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.util.Date;

@Entity(name="user")
public class User implements IBaseEntity {
	/**
	 * 
	 */
	private static final long serialVersionUID = 5707592087976014522L;

	public enum Role {
		ADMINISTRATOR(0),
		AUTHOR(1)
		;
		int id;
		Role(int id) {
			this.id = id;
		}

		public int getId() {
			return id;
		}

		public static Role fromId(int id) {
			for (Role r : values()) {
				if (r.id == id) {
					return r;
				}
			}
			return null;
		}
	}
	
	@Id
	private long id;

	@Column
	private int role;
	
	@Column(name="first_name")
	private String firstName;
	
	@Column(name="last_name")
	private String lastName;

	@Column
	private String email;

	@Column
	private String password;

	@Column
	private boolean gender;

	@Column
	private Date dob;

	@Column
	private String phone;

	@Column
	private String address;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	public Role getRoleEnum() {
		return Role.fromId(role);
	}

	public void setRoleEnum(Role role) {
		this.role = role.getId();
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isGender() {
		return gender;
	}

	public void setGender(boolean gender) {
		this.gender = gender;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
}
