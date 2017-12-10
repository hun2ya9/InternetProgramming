package Base;

public class MemberVO {
	private String userid;
	private String pwd;
	private String pwd_check;
	private String name;
	private String age;
	private String email;
	public int getAdmin() {
		return admin;
	}
	public void setAdmin(int admin) {
		this.admin = admin;
	}
	private String phone;
	private int admin;

	public String getUserid() {
		return userid;
	}
	
	@Override
	public String toString() {
		return "MemberVO [userid=" + userid + ", pwd=" + pwd + ", pwd_check="
				+ pwd_check + ", name=" + name + ", age=" + age + ", email=" + email + ", phone=" + phone + ", admin="
				+ admin + "]";
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getPwd_check() {
		return pwd_check;
	}
	public void setPwd_check(String pwd_check) {
		this.pwd_check = pwd_check;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}


}
