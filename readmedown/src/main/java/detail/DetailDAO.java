package detail;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import board.BookmarkDTO;
import user.UserDTO;

@Mapper
@Repository
public interface DetailDAO {
	
	//글 조회
	DetailDTO detail(String board_id);
	UserDTO detailuser(String user_id);
	UserDTO getUserInfoByBoardId(String board_id);
	//북마크
 int addDBookmark(BookmarkDTO dto); 
 int deleteDBookmark(BookmarkDTO dto);
public Integer isDBookmarked(BookmarkDTO dto);


 int deleteBoard(DetailDTO dto);
 //댓글 조회
 List<CommentDTO> comment(String board_id);



	
	
}//class
