package com.spring.reply;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.BoardVo;

@Service("replyService")
public class ReplyServiceimpl implements ReplyService {

	@Autowired
	private ReplyDao replyDao;
	
	@Override
	public List<ReplyVo> getList(HashMap<String, Object> map) {
		List<ReplyVo> replyList = replyDao.getList(map);
		return replyList;
	}

	@Override
	public void write(ReplyVo replyVo) {
		replyDao.write(replyVo);
	}

	@Override
	public void remove(ReplyVo replyVo) {
		replyDao.remove(replyVo);
	}

}
