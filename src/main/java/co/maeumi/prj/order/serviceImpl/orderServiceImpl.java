package co.maeumi.prj.order.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.maeumi.prj.order.service.orderMapper;
import co.maeumi.prj.order.service.orderService;
import co.maeumi.prj.order.service.order_datailVO;

@Service("orderDao")
public class orderServiceImpl implements orderService {
	@Autowired
	private orderMapper map;
	
	@Override
	public int orderInsert(order_datailVO vo) {
		// TODO Auto-generated method stub
		return map.orderInsert(vo);
	}

	@Override
	public order_datailVO selectorderList(order_datailVO vo) {
		// TODO Auto-generated method stub
		return map.selectorderList(vo);
	}
	
}
