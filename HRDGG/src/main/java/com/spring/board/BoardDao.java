package com.spring.board;

import java.util.HashMap;
import java.util.List;

import com.spring.board.file.FilesVo;

public interface BoardDao {

	public List<BoardVo> getList(HashMap<String, Object> map);

	public List<BoardVo> getListPaging(HashMap<String, Object> map);

	public BoardVo getCont(HashMap<String, Object> map);

	public void write(HashMap<String, Object> map);

	public void remove(BoardVo vo);

	public void update(HashMap<String, Object> map);

	public List<BoardVo> search(HashMap<String, Object> map);

	public List<FilesVo> getFileList(HashMap<String, Object> map);

	public void fileDelete(HashMap<String, Object> map);

	
}
