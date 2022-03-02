package co.maeumi.prj.banner.serviceImpl;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.maeumi.prj.banner.service.BannerMapper;
import co.maeumi.prj.banner.service.BannerService;
import co.maeumi.prj.banner.service.BannerVO;
import co.maeumi.prj.service.Search;

@Repository("bannerDao")
public class BannerServiceImpl implements BannerService {

	@Autowired
	private BannerMapper map;

	@Override
	public int getBannerListCnt(Search svo) throws Exception {
		// TODO Auto-generated method stub
		return map.getBannerListCnt(svo);
	}

	@Override
	public List<BannerVO> bannerSelectList(Search svo) throws Exception {
		// TODO Auto-generated method stub
		return map.bannerSelectList(svo);
	}

	@Override
	public BannerVO bannerSelect(BannerVO vo) {
		// TODO Auto-generated method stub
		return map.bannerSelect(vo);
	}

	@Override
	public int bannerUpdate(BannerVO vo) {
		// TODO Auto-generated method stub
		return map.bannerUpdate(vo);
	}

	@Override
	public int bannerDelete(BannerVO vo) {
		// TODO Auto-generated method stub
		return map.bannerDelete(vo);
	}

	@Override
	public int bannerInsert(BannerVO vo) {
		// TODO Auto-generated method stub
		return map.bannerInsert(vo);
	}

	@Override
	public List<BannerVO> bannerList(BannerVO vo) {
		// TODO Auto-generated method stub
		return map.bannerList(vo);
	}
	
	

}
