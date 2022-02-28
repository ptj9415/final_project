package co.maeumi.prj.banner.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.maeumi.prj.banner.service.BannerMapper;
import co.maeumi.prj.banner.service.BannerService;

@Repository("bannerDao")
public class BannerServiceImpl implements BannerService {

	@Autowired
	private BannerMapper map;

}
