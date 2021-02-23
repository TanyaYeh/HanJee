package tw.hanjee.forum.model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Forum")
public class ForumBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer forum_no;
	private String forum_name;
	private Timestamp forum_lastupdate;
	private String forum_des;
	private Integer forum_status;
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "forumBean", cascade = CascadeType.DETACH, orphanRemoval=true)
	private List<PostBean> post;
	
	public ForumBean() {
		
	}
	
	public ForumBean(String forum_name, Timestamp froum_lastupdate, String forum_des, Integer forum_status,
			List<PostBean> post) {
		super();
		this.forum_name = forum_name;
		this.forum_lastupdate = froum_lastupdate;
		this.forum_des = forum_des;
		this.forum_status = forum_status;
		this.post = post;
	}
	public ForumBean(Integer forum_no, String forum_name, Timestamp froum_lastupdate, String forum_des,
			Integer forum_status, List<PostBean> post) {
		super();
		this.forum_no = forum_no;
		this.forum_name = forum_name;
		this.forum_lastupdate = froum_lastupdate;
		this.forum_des = forum_des;
		this.forum_status = forum_status;
		this.post = post;
	}
	public Integer getForum_no() {
		return forum_no;
	}
	public void setForum_no(Integer forum_no) {
		this.forum_no = forum_no;
	}
	public String getForum_name() {
		return forum_name;
	}
	public void setForum_name(String forum_name) {
		this.forum_name = forum_name;
	}
	public java.sql.Timestamp getFroum_lastupdate() {
		return forum_lastupdate;
	}
	public void setFroum_lastupdate(java.sql.Timestamp froum_lastupdate) {
		this.forum_lastupdate = froum_lastupdate;
	}
	public String getForum_des() {
		return forum_des;
	}
	public void setForum_des(String forum_des) {
		this.forum_des = forum_des;
	}
	public Integer getForum_status() {
		return forum_status;
	}
	public void setForum_status(Integer forum_status) {
		this.forum_status = forum_status;
	}
	public List<PostBean> getPost() {
		return post;
	}
	public void setPost(List<PostBean> post) {
		this.post = post;
	}
}
