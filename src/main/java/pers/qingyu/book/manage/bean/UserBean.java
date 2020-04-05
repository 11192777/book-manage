package pers.qingyu.book.manage.bean;

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
public class UserBean {
	
	private String userId;
	private String userPassword;
	private Integer manageBook;
	private Integer changePasswd;
}
