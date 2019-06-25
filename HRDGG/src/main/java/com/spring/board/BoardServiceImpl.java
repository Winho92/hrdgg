package com.spring.board;

import java.io.File;
import java.io.IOException;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.board.file.CheckFileName;
import com.spring.board.file.FilesVo;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao boardDao;

	@Override
	public List<BoardVo> getList(HashMap<String, Object> map) {
		List<BoardVo> boardList = boardDao.getList(map);
		return boardList;
	}
	
	@Override
	public List<BoardVo> getListPaging(HashMap<String, Object> map) {
		List<BoardVo> boardList = boardDao.getListPaging(map);
		return boardList;
	}

	@Override
	public BoardVo getCont(HashMap<String, Object> map) {
		BoardVo boardVo = boardDao.getCont(map);
		return boardVo;
	}



	@Override
	public void remove(BoardVo vo) {
		boardDao.remove(vo);
	}


	@Override
	public List<BoardVo> serach(HashMap<String, Object> map) {
		List<BoardVo> boardList = boardDao.search(map);
		return boardList;
	}
	
	@Override
	public List<FilesVo> getFileList(HashMap<String, Object> map) {
		List<FilesVo> fileList = boardDao.getFileList(map);
		return fileList;
	}

	@Override
	public void write(HashMap<String, Object> map, HttpServletRequest request) {
		// 중복파일 처리
		CheckFileName checkFile = new CheckFileName();

		String filePath = "D:\\Upload";	// 저장된 경로 지정

		// 업로드된 파일의 처리(저장)
		MultipartHttpServletRequest multipartServletRequest
		= (MultipartHttpServletRequest) request;

		Iterator<String> iterator = multipartServletRequest.getFileNames();
		MultipartFile multipartFile = null;

		// 저장된 파일 목록 정보
		List<String> filenames 	= new ArrayList<String>();
		List<String> fileexts 	= new ArrayList<String>();
		List<String> sfilenames = new ArrayList<String>();

		String	fileName	= null;
		String	orgFileName	= null;
		String	fileExt		= null;
		String	sFileName	= null;

		int i = 0;
		while( iterator.hasNext()) {
			multipartFile = multipartServletRequest.getFile(iterator.next());

			HashMap<String, String> HashMap = new HashMap<String, String>();

			if(!multipartFile.isEmpty()) {
				fileName = multipartFile.getOriginalFilename();
				// upload 된 파일명

				int dotIdx 	= fileName.lastIndexOf('.');
				orgFileName	= fileName.substring(0, dotIdx);
				fileExt		= fileName.substring(dotIdx);


				//중복파일이 존재하면 번호추가 후 실제 파일명 처리
				sFileName 	= checkFile.getCheckFileName(
						filePath,orgFileName, fileExt );

				filenames.add(fileName);
				fileexts.add(fileExt);
				sfilenames.add(sFileName);

				map.put("filenames", filenames);
				map.put("fileexts", fileexts);
				map.put("sfilenames", sfilenames);

				System.out.println(map);

				// 저장
				File file = new File (filePath + "\\" + sFileName);
				i += 1;
				try {
					multipartFile.transferTo(file); // 실제 파일명으로 저장
				} catch (IllegalStateException e) {
					System.out.println(i + " " + file );
					e.printStackTrace();
				} catch (IOException e) {
					System.out.println("오류:" + e.getMessage());
					e.printStackTrace();
				}

			}

		}

		boardDao.write(map);

	}

	
	@Override
	public void update(HashMap<String, Object> map, HttpServletRequest request) {
		// 중복파일 처리
		CheckFileName checkFile = new CheckFileName();

		String filePath = "D:\\Upload";	// 저장된 경로 지정

		// 업로드된 파일의 처리(저장)
		MultipartHttpServletRequest multipartServletRequest
		= (MultipartHttpServletRequest) request;

		Iterator<String> iterator = multipartServletRequest.getFileNames();
		MultipartFile multipartFile = null;

		// 저장된 파일 목록 정보
		List<String> filenames 	= new ArrayList<String>();
		List<String> fileexts 	= new ArrayList<String>();
		List<String> sfilenames = new ArrayList<String>();

		String	fileName	= null;
		String	orgFileName	= null;
		String	fileExt		= null;
		String	sFileName	= null;

		int i = 0;
		while( iterator.hasNext()) {
			multipartFile = multipartServletRequest.getFile(iterator.next());

			HashMap<String, String> HashMap = new HashMap<String, String>();

			if(!multipartFile.isEmpty()) {
				fileName = multipartFile.getOriginalFilename();
				// upload 된 파일명

				int dotIdx 	= fileName.lastIndexOf('.');
				orgFileName	= fileName.substring(0, dotIdx);
				fileExt		= fileName.substring(dotIdx);


				//중복파일이 존재하면 번호추가 후 실제 파일명 처리
				sFileName 	= checkFile.getCheckFileName(
						filePath,orgFileName, fileExt );

				filenames.add(fileName);
				fileexts.add(fileExt);
				sfilenames.add(sFileName);

				map.put("filenames", filenames);
				map.put("fileexts", fileexts);
				map.put("sfilenames", sfilenames);

				System.out.println(map);

				// 저장
				File file = new File (filePath + "\\" + sFileName);
				i += 1;
				try {
					multipartFile.transferTo(file); // 실제 파일명으로 저장
				} catch (IllegalStateException e) {
					System.out.println(i + " " + file );
					e.printStackTrace();
				} catch (IOException e) {
					System.out.println("오류:" + e.getMessage());
					e.printStackTrace();
				}

			}

		}

		boardDao.update(map);
	}

	@Override
	public void fileDelete(HashMap<String, Object> map) {
		boardDao.fileDelete(map);
		
	}


}
