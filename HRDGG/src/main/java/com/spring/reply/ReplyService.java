package com.spring.reply;

import java.util.HashMap;
import java.util.List;

public interface ReplyService {

	public List<ReplyVo> getList(HashMap<String, Object> map);

	public void write(ReplyVo replyVo);

	public void remove(ReplyVo replyVo);

}
