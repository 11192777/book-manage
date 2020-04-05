package pers.qingyu.book.manage.ajax.bean;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PageBean<T> {

	private List<T> datas;
	private Integer totalSize;
	private Integer totalNo;
	private Integer pageNo;
	private Integer pageSize;
}
