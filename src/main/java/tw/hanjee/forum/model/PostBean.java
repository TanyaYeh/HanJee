package tw.hanjee.forum.model;

import java.sql.Blob;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

import tw.hanjee.model.MemberBean;

@Entity
@Table(name="Post")
public class PostBean {
	public MemberBean getMb() {
		return mb;
	}

	public void setMb(MemberBean mb) {
		this.mb = mb;
	}
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer post_no;
	@Transient
	private String poster;
	private String post_tit;
	private Timestamp post_time;
	private String post_content;
	@JsonIgnore
	private Blob post_img; // 放圖片
	private String fileName; // 放檔案名
	@Transient
	private MultipartFile productImage; // 暫時存檔區
	
	@ManyToOne(fetch = FetchType.EAGER,cascade = CascadeType.DETACH)
	@JoinColumn(name = "forum_no")
	private ForumBean forumBean;
	@Transient
	private Integer forum_no;
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "postBean", cascade = CascadeType.ALL,orphanRemoval=true)
	private List<CommentBean> comment;
	@ManyToOne
	@JoinColumn(name = "poster")
	private MemberBean mb;
	
	
	public PostBean(MemberBean mb, ForumBean forumBean) {
		
		this.forumBean = forumBean;
		this.mb = mb;
	}

	public PostBean() {}
	
	public Integer getPost_no() {
		return post_no;
	}
	public void setPost_no(Integer post_no) {
		this.post_no = post_no;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getPost_tit() {
		return post_tit;
	}
	public void setPost_tit(String post_tit) {
		this.post_tit = post_tit;
	}
	public java.sql.Timestamp getPost_time() {
		return post_time;
	}
	public void setPost_time(java.sql.Timestamp post_time) {
		this.post_time = post_time;
	}
	public String getPost_content() {
		return post_content;
	}
	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}
	public ForumBean getForumBean() {
		return forumBean;
	}
	public void setForumBean(ForumBean forumBean) {
		this.forumBean = forumBean;
	}
	public Integer getForum_no() {
		return forum_no;
	}
	public void setForum_no(Integer forum_no) {
		this.forum_no = forum_no;
	}
	public List<CommentBean> getComment() {
		return comment;
	}
	public void setComment(List<CommentBean> comment) {
		this.comment = comment;
	}
	
	public PostBean(String poster, String post_tit, Timestamp post_time, String post_content,
			List<CommentBean> comment) {
		super();
		this.poster = poster;
		this.post_tit = post_tit;
		this.post_time = post_time;
		this.post_content = post_content;
		this.comment = comment;
	}
	public PostBean(ForumBean forumBean, Integer forum_no) {
		super();
		this.forumBean = forumBean;
		this.forum_no = forum_no;
	}
	public PostBean(ForumBean forumBean) {
		super();
		this.forumBean = forumBean;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	/**
	 * @return the post_img
	 */
	public Blob getPost_img() {
		return post_img;
	}

	/**
	 * @param post_img the post_img to set
	 */
	public void setPost_img(Blob post_img) {
		this.post_img = post_img;
	}

	/**
	 * @return the productImage
	 */
	public MultipartFile getProductImage() {
		return productImage;
	}

	/**
	 * @param productImage the productImage to set
	 */
	public void setProductImage(MultipartFile productImage) {
		this.productImage = productImage;
	}
	
}
