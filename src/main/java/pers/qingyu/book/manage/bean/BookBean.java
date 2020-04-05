package pers.qingyu.book.manage.bean;


import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.Accessors;

@Data
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
public class BookBean {

	private String bookId;
	private String bookName;
	private Float bookPrice;
	private String bookAuthor;
	private String bookCategory;
	private String bookIssn;
	private String bookPress;
	private Date publicationDate;
	private Integer bookRepertory;
//	private PressBean press;

}
