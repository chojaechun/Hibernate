package com.spring.mvc.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.spring.mvc.vo.BoardVO;

@Repository("boardDAO")
public class BoardDAO extends AbstractDAO{

    @SuppressWarnings("unchecked")
    public List<BoardVO> selectBoardList(Map<String, Object> map) throws Exception{
        return selectList("board.selectBoardList", map);
    }

    public BoardVO selectBoardContent(int boardSeq) throws Exception{
    	return (BoardVO) selectOne("board.selectBoardContent", boardSeq);
    }

	public int getCount(HashMap<String, Object> map) {
		return (Integer) selectOne("board.getCount", map);
	}

}
