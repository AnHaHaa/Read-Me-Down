package editor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EditorService {
	@Autowired
	EditorDAO dao;
	
	List<BadgeDTO> getBadges(String keyword){
		return dao.getBadges(keyword);
	}

}
