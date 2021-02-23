package tw.hanjee.friend.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Sen_machine")
public class Sen_MachineBean {
	@Id 
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer sentence_id;

	private String sentence;
	
	
	public Sen_MachineBean() {
		
	}
	public Integer getSentence_id() {
		return sentence_id;
	}
	public void setSentence_id(Integer sentence_id) {
		this.sentence_id = sentence_id;
	}
	public String getSentence() {
		return sentence;
	}
	public void setSentence(String sentence) {
		this.sentence = sentence;
	}
	
}
