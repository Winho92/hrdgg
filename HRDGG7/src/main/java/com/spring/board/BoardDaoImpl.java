package com.spring.board;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.board.file.FilesVo;

@Repository("boardDao")
public class BoardDaoImpl implements BoardDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<BoardVo> getList(HashMap<String, Object> map) {
		sqlSession.selectList("Board.List", map);
		List<BoardVo> boardList = (List<BoardVo>) map.get("result");
		return boardList;
	}
	
	@Override
	public List<BoardVo> getListPaging(HashMap<String, Object> map) {
		sqlSession.selectList("Board.ListPaging", map);
		List<BoardVo> boardList = (List<BoardVo>) map.get("result");
		return boardList;
	}

	@Override
	public BoardVo getCont(HashMap<String, Object> map) {
		sqlSession.selectOne("Board.Cont", map);
		List<BoardVo> list = (List<BoardVo>) map.get("result");
		BoardVo boardVo = list.get(0);
		return boardVo;
	}

	@Override
	public void write(HashMap<String, Object> map) {
		sqlSession.insert("Board.Write", map);
		
	}

	@Override
	public void remove(BoardVo vo) {
		sqlSession.delete("Board.Remove", vo);
	}

	@Override
	public void update(HashMap<String, Object> map) {
		sqlSession.update("Board.Update", map);
	}

	@Override
	public List<BoardVo> search(HashMap<String, Object> map) {
		sqlSession.selectList("Board.Search", map);
		List<BoardVo> boardList = (List<BoardVo>) map.get("result");
		return boardList;
	}
	
	@Override
	public List<FilesVo> getFileList(HashMap<String, Object> map) {
		sqlSession.selectList("Board.FileList", map);
		List<FilesVo> fileList = (List<FilesVo>) map.get("result");
		return fileList;
	}

	@Override
	public void fileDelete(HashMap<String, Object> map) {
		sqlSession.delete("Board.FileDelete", map);
		
	}

	
}
