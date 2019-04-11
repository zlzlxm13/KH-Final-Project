package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dto.ReplyDTO;

public interface ReplyService {
	public int count(ReplyDTO rdto);
	public List<ReplyDTO> replyList(ReplyDTO rdto);
	public void replyInsert(ReplyDTO rdto);
	public ReplyDTO replyUpdateStart(ReplyDTO rdto);
	public void replyUpdate(ReplyDTO rdto, HttpServletRequest request);
	public void decreaseRnum(ReplyDTO rdto);
	public void replyDelete(ReplyDTO rdto);
}