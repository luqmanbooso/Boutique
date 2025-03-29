package com.customer.model;

public class Customer {
    private int id;
    private String name;
    private String email;
    private String password;
    private boolean utype;
    






	public Customer(int id, String name, String email, String password, boolean utype) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.utype = utype;
	}


	public boolean isUtype() {
		return utype;
	}


	public Customer() {
		// TODO Auto-generated constructor stub
	}

	public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }


    public String getPassword() {
        return password;
    }    
}
