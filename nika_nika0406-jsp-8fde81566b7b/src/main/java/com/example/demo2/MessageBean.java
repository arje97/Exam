package com.example.demo2;

public class MessageBean {

    private String message = "No Message";

    public MessageBean() {
    }

    public MessageBean(String message) {
        this.message = message;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

}