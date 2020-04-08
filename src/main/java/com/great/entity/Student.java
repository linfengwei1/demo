package com.great.entity;

public class Student
{
	private int id;
	private String account;
	private String pwd;
	private String name;
	private String sex;
	private String age;
	private String idNumber;
	private String phone;
	private int student_state_id;
	private int school_id;

	public Student()
	{
	}

	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public String getAccount()
	{
		return account;
	}

	public void setAccount(String account)
	{
		this.account = account;
	}

	public String getPwd()
	{
		return pwd;
	}

	public void setPwd(String pwd)
	{
		this.pwd = pwd;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getSex()
	{
		return sex;
	}

	public void setSex(String sex)
	{
		this.sex = sex;
	}

	public String getAge()
	{
		return age;
	}

	public void setAge(String age)
	{
		this.age = age;
	}

	public String getIdNumber()
	{
		return idNumber;
	}

	public void setIdNumber(String idNumber)
	{
		this.idNumber = idNumber;
	}

	public String getPhone()
	{
		return phone;
	}

	public void setPhone(String phone)
	{
		this.phone = phone;
	}

	public int getStudent_state_id()
	{
		return student_state_id;
	}

	public void setStudent_state_id(int student_state_id)
	{
		this.student_state_id = student_state_id;
	}

	public int getSchool_id()
	{
		return school_id;
	}

	public void setSchool_id(int school_id)
	{
		this.school_id = school_id;
	}

	@Override
	public String toString()
	{
		return "Student{" + "id=" + id + ", account='" + account + '\'' + ", pwd='" + pwd + '\'' + ", name='" + name + '\'' + ", sex='" + sex + '\'' + ", age='" + age + '\'' + ", idNumber='" + idNumber + '\'' + ", phone='" + phone + '\'' + ", student_state_id=" + student_state_id + ", school_id=" + school_id + '}';
	}
}
