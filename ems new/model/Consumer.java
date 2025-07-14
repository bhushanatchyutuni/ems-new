package com.ems.model;



public class Consumer {

    private String consumerId;
    private String name;
    private String email;
    private String mobile;
    private String pass;
    private String status;


    public Consumer() {
    }

    public Consumer(String consumerId, String name, String email, String mobile, String pass) {
        this.consumerId = consumerId;
        this.name = name;
        this.email = email;
        this.mobile = mobile;
        this.pass = pass;
    }
    public Consumer(String consumerId, String name, String email, String mobile) {
        this.consumerId = consumerId;
        this.name = name;
        this.email = email;
        this.mobile = mobile;

    }

    public String getConsumerId() {
        return consumerId;
    }

    public void setConsumerId(String consumerId) {
        this.consumerId = consumerId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }


    @Override
    public String toString() {
        return "Consumer{" +
                "consumerId='" + consumerId + '\'' +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", mobile='" + mobile + '\'' +
                ", address='" + pass + '\'' +
                '}';
    }
    public String getStatus() {
    	  return status;
    	}

    	public void setStatus(String status) {
    	  this.status = status;
    	}
}