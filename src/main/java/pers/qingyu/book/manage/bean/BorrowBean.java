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
@Accessors(chain=true)
public class BorrowBean {
	
	private Integer borrowId;
	private Date borrowDate;
	private String userId;
	private String bookId;
}
