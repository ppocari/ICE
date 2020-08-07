package com.will.ice.payment.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.will.ice.common.PaymentSearchVO;
import com.will.ice.document.model.DocumentviewVO;
import com.will.ice.member.model.MemberVO;
import com.will.ice.paycomment.model.PaycommentVO;
import com.will.ice.payline.model.PaylineVO;
import com.will.ice.paymentfile.model.PaymentfileVO;

@Repository
public class PaymentDAOMybatis implements PaymentDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="com.mybatis.mapper.oracle.payment.";

	/* ---------------결재함------------------- */
	@Override
	public int insertPaydoc(PaylinedocVO pldVo) {
		return sqlSession.insert(namespace+"insertPaydoc",pldVo);
	}

	@Override
	public List<PaylistViewVO> selectSent(PaymentSearchVO paysearchVo) {
		return sqlSession.selectList(namespace+"selectSent",paysearchVo);
	}

	@Override
	public List<PaymentviewVO> selectImsy(PaymentSearchVO paysearchVo) {
		return sqlSession.selectList(namespace+"selectImsy",paysearchVo);
	}

	@Override
	public int insertPayline(PaylinedocVO pldVo) {
		return sqlSession.update(namespace+"insertPayline",pldVo);
	}

	@Override
	public PaymentviewVO selectDocument(int docNo) {
		return sqlSession.selectOne(namespace+"selectDocument",docNo);
	}

	@Override
	public List<DocumentviewVO> selectPayLine(int docNo) {
		return sqlSession.selectList(namespace+"selectPayLine",docNo);
	}

	@Override
	public int deletePayLine(int docNo) {
		return sqlSession.update(namespace+"deletePayLine",docNo);
	}
	
	@Override
	public List<MemberVO> selectAllMem(int poscode) {
		return sqlSession.selectList(namespace+"selectAllMem",poscode);
	}

	@Override
	public List<PaylineVO> isRead(int docNo) {
		return sqlSession.selectList(namespace+"isRead",docNo);
	}

	@Override
	public int insertOnePay(PaylinedocVO pldVo) {
		return sqlSession.insert(namespace+"insertOnePay",pldVo);
	}

	@Override
	public int updateImsy(int docNo) {
		return sqlSession.update(namespace+"updateImsy",docNo);
	}

	@Override
	public int updatePaydoc(PaylinedocVO pldVo) {
		return sqlSession.update(namespace+"updatePaydoc",pldVo);
	}

	@Override
	public int updatePayline(PaylinedocVO pldVo) {
		return sqlSession.insert(namespace+"updatePayline",pldVo);
	}

	@Override
	public int reallydeletePayLine(int docNo) {
		return sqlSession.delete(namespace+"reallydeletePayLine",docNo);
	}

	@Override
	public int saveFile(PaymentfileVO fileVo) {
		return sqlSession.insert(namespace+"saveFile",fileVo);
	}

	@Override
	public int isFile(PaylinedocVO pldVo) {
		return sqlSession.update(namespace+"isFile",pldVo);
	}

	@Override
	public PaymentfileVO getFile(int docNo) {
		return sqlSession.selectOne(namespace+"getFile",docNo);
	}

	@Override
	public int updateFile(PaymentfileVO fileVo) {
		return sqlSession.update(namespace+"updateFile",fileVo);
	}
	
	/* ---------------기안함------------------- */
	@Override
	public PaylistViewVO selectUndecided(PaymentSearchVO paysearchVo) {
		return sqlSession.selectOne(namespace+"selectUndecided",paysearchVo);
	}

	@Override
	public int insertComment(PaycommentVO comVo) {
		return sqlSession.insert(namespace+"insertComment",comVo);
	}

	@Override
	public int updatePaydate(PaycommentVO comVo) {
		return sqlSession.update(namespace+"updatePaydate",comVo);
	}

	@Override
	public List<Integer> docNolist() {
		return sqlSession.selectList(namespace+"docNolist");
	}

	@Override
	public int updateRead(PaylineVO plVo) {
		return sqlSession.update(namespace+"updateRead",plVo);
	}

	@Override
	public int countPayline(int docNo) {
		return sqlSession.selectOne(namespace+"countPayline",docNo);
	}

	@Override
	public int updateProgress(PaymentviewVO vo) {
		return sqlSession.update(namespace+"updateProgress",vo);
	}

	@Override
	public List<PaycommentVO> selectSign(int docNo) {
		return sqlSession.selectList(namespace+"selectSign",docNo);
	}

}
