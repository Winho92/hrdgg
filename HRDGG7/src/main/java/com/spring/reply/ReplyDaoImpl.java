package com.spring.reply;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.board.BoardVo;

@Repository("replyDao")
public class ReplyDaoImpl implements ReplyDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ReplyVo> getList(HashMap<String, Object> map) {
		sqlSession.selectList("Reply.List", map);
		List<ReplyVo> replyList = (List<ReplyVo>) map.get("result");
		return replyList;
	}

	@Override
	public void write(ReplyVo replyVo) {
		sqlSession.insert("Reply.Write", replyVo);
	}

	@Override
	public void remove(ReplyVo replyVo) {
		sqlSession.insert("Reply.Remove", replyVo);		
	}

}
