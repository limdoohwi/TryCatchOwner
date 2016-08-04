/*
 * 	Interfate: MaterialDAOImpl 
 *  Description: MaterialDAOImpl를 상속 받는 클래스로서 DB에 직접적인 연결을 담당하는 클래스
 *  Created: 2016­08­04
 *	Author: 손현민
 */

package com.trycatch.owner.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.trycatch.owner.domain.MaterialDTO;
import com.trycatch.owner.domain.MaterialPaymentDTO;

@Repository
public class MaterialDAOImpl implements MaterialDAO {
	@Inject
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.trycatch.owner.mappers.materialMapper";
	/**
	 * @author 손현민
	 * DB에 있는 커피재료를 리스트로 가져오는 함수
	 */
	@Override
	public List<MaterialDTO> showmaterial_coffee() {
		return sqlSession.selectList(NAMESPACE+".getmaterial_coffee");
	}
	/**
	 * @author 손현민
	 * DB에 있는 케이크재료를 리스트로 가져오는 함수
	 */
	@Override
	public List<MaterialDTO> showmaterial_cake() {
		return sqlSession.selectList(NAMESPACE+".getmaterial_cake");
	}
	/**
	 * @author 손현민
	 * 방금추가한 MaterialPayment 번호를 가져오는 함수
	 */
	@Override
	public MaterialPaymentDTO getNowMaterialPayment() {
		List<MaterialPaymentDTO> list = sqlSession.selectList(NAMESPACE + ".getNowMaterialPayment");
		return list.get(0);
	}
}
