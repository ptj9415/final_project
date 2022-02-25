package co.maeumi.prj.groupCounsel.service;

import java.util.List;

import co.maeumi.prj.pagination.Pagination;

public interface groupCounselMapper {
	int insertGroupCounsel(group_CounselVO vo);
	List<group_CounselVO> groupSelectList();
	int countGroupCounsel();
	int searchcountGroupCounsel(Pagination page);
	List<group_CounselVO> pageSelectList(Pagination page);
	List<group_CounselVO> searchpageSelectList(Pagination page);
}
