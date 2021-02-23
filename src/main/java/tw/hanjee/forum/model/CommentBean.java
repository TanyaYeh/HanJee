package tw.hanjee.forum.model;

import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;

import tw.hanjee.model.MemberBean;

@Entity
@Table(name="Comment")
public class CommentBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer com_no;
	private String com_text;
	private java.sql.Timestamp com_time;
	@Transient
	private String commenter;
	@Transient
	private Integer post_no;
	@ManyToOne(fetch = FetchType.EAGER,cascade = CascadeType.REFRESH)
	@JsonIgnore
	@JoinColumn(name = "post_no")
	private PostBean postBean;
	@ManyToOne(cascade = CascadeType.REFRESH)
	@JsonIgnore
	@JoinColumn(name = "commenter")
	private MemberBean mb;
	
	public CommentBean() {
	
	}
	
	public Integer getCom_no() {
		return com_no;
	}
	public void setCom_no(Integer com_no) {
		this.com_no = com_no;
	}
	public String getCom_text() {
		return com_text;
	}
	public void setCom_text(String com_text) {
		this.com_text = com_text;
	}
	public java.sql.Timestamp getCom_time() {
		return com_time;
	}
	public void setCom_time(java.sql.Timestamp com_time) {
		this.com_time = com_time;
	}
	public String getCommenter() {
		return commenter;
	}
	public void setCommenter(String commenter) {
		this.commenter = commenter;
	}
	public Integer getPost_no() {
		return post_no;
	}
	public void setPost_no(Integer post_no) {
		this.post_no = post_no;
	}
	public PostBean getPostBean() {
		return postBean;
	}
	public void setPostBean(PostBean postBean) {
		this.postBean = postBean;
	}
	public CommentBean(PostBean postBean) {
		super();
		this.postBean = postBean;
	}
	public CommentBean(String com_text, Timestamp com_time, String commenter) {
		super();
		this.com_text = com_text;
		this.com_time = com_time;
		this.commenter = commenter;
	}
	public CommentBean(String com_text, Timestamp com_time, String commenter, PostBean postBean) {
		super();
		this.com_text = com_text;
		this.com_time = com_time;
		this.commenter = commenter;
		this.postBean = postBean;
	}
	public CommentBean(String com_text, String commenter, PostBean postBean) {
		super();
		this.com_text = com_text;
		this.commenter = commenter;
		this.postBean = postBean;
	}
	public CommentBean(String com_text, PostBean postBean) {
		super();
		this.com_text = com_text;
		this.postBean = postBean;
	}
	
}
