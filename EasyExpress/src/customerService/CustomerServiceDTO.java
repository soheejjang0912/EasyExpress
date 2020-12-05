package customerService;

public class CustomerServiceDTO { 
	private int csID;
	private String csUserID;
	private String csUserName;
	private int csUserTell;
	private String csUserEmail;
	private String csDepartment;
	private String csContents; 
	private String csAnswer;
	public int getCsID() {
		return csID;
	}
	public void setCsID(int csID) {
		this.csID = csID;
	}
	public String getCsUserID() {
		return csUserID;
	}
	public void setCsUserID(String csUserID) {
		this.csUserID = csUserID;
	}
	public String getCsUserName() {
		return csUserName;
	}
	public void setCsUserName(String csUserName) {
		this.csUserName = csUserName;
	}
	public int getCsUserTell() {
		return csUserTell;
	}
	public void setCsUserTell(int csUserTell) {
		this.csUserTell = csUserTell;
	}
	public String getCsUserEmail() {
		return csUserEmail;
	}
	public void setCsUserEmail(String csUserEmail) {
		this.csUserEmail = csUserEmail;
	}
	public String getCsDepartment() {
		return csDepartment;
	}
	public void setCsDepartment(String csDepartment) {
		this.csDepartment = csDepartment;
	}
	public String getCsContents() {
		return csContents;
	}
	public void setCsContents(String csContents) {
		this.csContents = csContents;
	}
	public String getCsAnswer() {
		return csAnswer;
	}
	public void setCsAnswer(String csAnswer) {
		this.csAnswer = csAnswer;
	}


	public CustomerServiceDTO() { 
	}
	public CustomerServiceDTO(int csID, String csUserID, String csUserName, int csUserTell, String csUserEmail,
			String csDepartment, String csContents, String csAnswer) {
		super();
		this.csID = csID;
		this.csUserID = csUserID;
		this.csUserName = csUserName;
		this.csUserTell = csUserTell;
		this.csUserEmail = csUserEmail;
		this.csDepartment = csDepartment;
		this.csContents = csContents;
		this.csAnswer = csAnswer;
	}
	
	 	
}
