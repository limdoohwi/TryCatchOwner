package com.trycatch.owner.persistence;

import java.sql.SQLException;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.trycatch.owner.domain.MaterialCartDTO;
import com.trycatch.owner.domain.MemberDTO;

@Repository
public class MaterialCartDAOImpl implements MaterialCartDAO {
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.trycatch.owner.mappers.materialcartMapper";
	@Override
	public List<MaterialCartDTO> getCartList(MaterialCartDTO cartdto) {
		try{
			return sqlSession.selectList(NAMESPACE+".getCartList", cartdto);
		}
		catch(Exception err){
			err.printStackTrace();
			return null;
		}
	}

	@Override
	public boolean checkCart(MaterialCartDTO cartdto) {
		try{
			MaterialCartDTO dto = sqlSession.selectOne(NAMESPACE+".getCartList", cartdto);
			System.out.println(dto.toString());
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}
	
	@Override
	public boolean insertCart(MaterialCartDTO cartdto) {
		try{
			sqlSession.insert(NAMESPACE+".insertCart", cartdto);
			return true;
		}catch(Exception err){
			return false;			
		}
	}

	@Override
	public boolean updateCart(MaterialCartDTO cartdto) {
		try{
			sqlSession.update(NAMESPACE+".updateCart", cartdto);
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean deleteCart(MaterialCartDTO cartdto) {
		try{ 
			sqlSession.delete(NAMESPACE+".deleteCart", cartdto);
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}

}

