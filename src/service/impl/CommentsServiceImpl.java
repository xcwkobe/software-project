package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapper.CommentsMapper;
import pojo.Comments;
import pojo.CommentsExample;
import service.CommentsService;

@Service
public class CommentsServiceImpl implements CommentsService{
	
	@Autowired
	CommentsMapper commentsMapper;

	@Override
	public void addComments(Comments comments) {
		commentsMapper.insert(comments);
	}

	@Override
	public void deleteComments(int id) {
		commentsMapper.deleteByPrimaryKey(id);
	}

	@Override
	public List<Comments> listCommentsByToDo(int tid) {
		CommentsExample example = new CommentsExample();
		example.createCriteria().andTidEqualTo(tid);
		example.setOrderByClause("id desc");
		return commentsMapper.selectByExample(example);
	}

	@Override
	public List<Comments> listCommentsByFrom(String from) {
		CommentsExample example = new CommentsExample();
		example.createCriteria().andFromEqualTo(from);
		return commentsMapper.selectByExample(example);
	}

	@Override
	public List<Comments> listCommentsByFromToDo(String from, int tid) {
		CommentsExample example = new CommentsExample();
		example.createCriteria().andFromEqualTo(from).andTidEqualTo(tid);
		return commentsMapper.selectByExample(example);
	}

	
}
