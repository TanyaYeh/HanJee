package tw.hanjee.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Manager")
public class ManagerBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer manager_id;
	private String manager_Name;
	private String manager_Pwd;
	private String manager_Table;
	private String manager_Email;
	
	
	public String getManager_Email() {
		return manager_Email;
	}
	public void setManager_Email(String manager_Email) {
		this.manager_Email = manager_Email;
	}
	public Integer getManager_id() {
		return manager_id;
	}
	public void setManager_id(Integer manager_id) {
		this.manager_id = manager_id;
	}
	public String getManager_Name() {
		return manager_Name;
	}
	public void setManager_Name(String manager_Name) {
		this.manager_Name = manager_Name;
	}
	public String getManager_Pwd() {
		return manager_Pwd;
	}
	public void setManager_Pwd(String manager_Pwd) {
		this.manager_Pwd = manager_Pwd;
	}
	public String getManager_Table() {
		return manager_Table;
	}
	public void setManager_Table(String manager_Table) {
		this.manager_Table = manager_Table;
	}
	public ManagerBean() {
		
	}
	
}
