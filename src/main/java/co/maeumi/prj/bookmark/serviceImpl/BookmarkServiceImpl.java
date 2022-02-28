package co.maeumi.prj.bookmark.serviceImpl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import co.maeumi.prj.bookmark.service.BookmarkMapper;
import co.maeumi.prj.bookmark.service.BookmarkService;

@Repository("bookmarkDao")
public class BookmarkServiceImpl implements BookmarkService {

	@Autowired
	private BookmarkMapper map;

}
