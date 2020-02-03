package com.m1;

import java.util.Date;

public class Reqdata {
int reqid,noemp;
Date st,et,rt;
String domain,sgt,training,city,status;
public int getReqid() {
	return reqid;
}
public void setReqid(int reqid) {
	this.reqid = reqid;
}
public int getNoemp() {
	return noemp;
}
public void setNoemp(int noemp) {
	this.noemp = noemp;
}
public String getDomain() {
	return domain;
}
public void setDomain(String domain) {
	this.domain = domain;
}
public String getSgt() {
	return sgt;
}
public void setSgt(String sgt) {
	this.sgt = sgt;
}
public String getTraining() {
	return training;
}
public void setTraining(String training) {
	this.training = training;
}
public String getCity() {
	return city;
}
public void setCity(String city) {
	this.city = city;
}
public Date getSt() {
	return st;
}
public void setSt(Date st) {
	this.st = st;
}
public Date getEt() {
	return et;
}
public void setEt(Date et) {
	this.et = et;
}
public Date getRt() {
	return rt;
}
public void setRt(Date rt) {
	this.rt = rt;
}

public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}

}
