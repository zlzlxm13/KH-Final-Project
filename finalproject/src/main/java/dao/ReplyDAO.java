package dao;

import java.util.List;

import dto.ReplyDTO;

public interface ReplyDAO {
	public int count(ReplyDTO rdto);
	public List<ReplyDTO> replyList(ReplyDTO rdto);
	public void replyInsert(ReplyDTO rdto);
	public ReplyDTO replyUpdateStart(ReplyDTO rdto);
	public void replyUpdate(ReplyDTO rdto);
	public void replyDelete(ReplyDTO rdto);
	public String getFile(ReplyDTO rdto);
	public void decreaseRnum(ReplyDTO rdto);
}