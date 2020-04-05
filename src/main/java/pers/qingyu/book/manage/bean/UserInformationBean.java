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
public class UserInformationBean {

	private String userId;
	private String userName;
	private String userSex;
	private String userMajor;
	private String userPhone;
	private String userEmial;
	private String userLocation;
	
}
