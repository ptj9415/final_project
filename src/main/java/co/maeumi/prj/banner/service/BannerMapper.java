package co.maeumi.prj.banner.service;

import java.util.List;

import co.maeumi.prj.service.Search;

public interface BannerMapper {

	int getBannerListCnt(Search svo) throws Exception;
	public List<BannerVO> bannerSelectList(Search svo) throws Exception;
	List<BannerVO> bannerList(BannerVO vo);
	BannerVO bannerSelect(BannerVO vo);
	int bannerUpdate(BannerVO vo);
	int bannerDelete(BannerVO vo);
	int bannerInsert(BannerVO vo);
	
}
