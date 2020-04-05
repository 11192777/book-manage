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
public class PressBean {
	
	private Integer pressId;
	private String pressName;
	private String pressLocation;
	private String pressPhone;
	private String pressEmial;
}
