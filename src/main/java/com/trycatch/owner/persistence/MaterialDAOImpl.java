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
	
	@Override
	public List<MaterialDTO> showmaterial_coffee() {
		return sqlSession.selectList(NAMESPACE+".getmaterial_coffee");
	}

	@Override
	public List<MaterialDTO> showmaterial_cake() {
		return sqlSession.selectList(NAMESPACE+".getmaterial_cake");
	}
	
	@Override
	public MaterialPaymentDTO getNowMaterialPayment() {
		List<MaterialPaymentDTO> list = sqlSession.selectList(NAMESPACE + ".getNowMaterialPayment");
		return list.get(0);
	}
}
