package pers.qingyu.book.manage.ajax.bean;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class AjaxResult {

	private Boolean success;
	private Object data;
}
