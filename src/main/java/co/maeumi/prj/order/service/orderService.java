package co.maeumi.prj.order.service;

public interface orderService {
	int orderInsert(order_datailVO vo);
	order_datailVO selectorderList(order_datailVO vo);
	int orderPersonalInsert(order_datailVO vo);
	int MaxGroupOrder();
}
