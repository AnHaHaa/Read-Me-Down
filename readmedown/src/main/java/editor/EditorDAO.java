package editor;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface EditorDAO {
	List<BadgeDTO> getBadges(String keyword);
	List<StatsThemeDTO> getStatsThemes(String keyword);
	
	boolean isBoardIdExist(String new_id);

}
