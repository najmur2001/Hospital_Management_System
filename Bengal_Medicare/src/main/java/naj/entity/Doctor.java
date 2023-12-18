package naj.entity;

public class Doctor {
	
	private int id;
	private String fullName;
	private String dob;
	private String qualification;
	private String specialist;
	private String Email;
	private String Mobile;
	private String Password;
	public Doctor() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Doctor(String fullName, String dob, String qualification, String specialist, String email,
			String mobile, String password) {
		super();
		
		this.fullName = fullName;
		this.dob = dob;
		this.qualification = qualification;
		this.specialist = specialist;
		Email = email;
		Mobile = mobile;
		Password = password;
	}
	
	

	public Doctor(int id, String fullName, String dob, String qualification, String specialist, String email,
			String mobile, String password) {
		super();
		this.id = id;
		this.fullName = fullName;
		this.dob = dob;
		this.qualification = qualification;
		this.specialist = specialist;
		Email = email;
		Mobile = mobile;
		Password = password;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getQualification() {
		return qualification;
	}
	public void setQualification(String qualification) {
		this.qualification = qualification;
	}
	public String getSpecialist() {
		return specialist;
	}
	public void setSpecialist(String specialist) {
		this.specialist = specialist;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getMobile() {
		return Mobile;
	}
	public void setMobile(String mobile) {
		Mobile = mobile;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	@Override
	public String toString() {
		return "Doctor [id=" + id + ", fullName=" + fullName + ", dob=" + dob + ", qualification=" + qualification
				+ ", specialist=" + specialist + ", Email=" + Email + ", Mobile=" + Mobile + ", Password=" + Password
				+ "]";
	}
	
	
	
	
	
	

}
