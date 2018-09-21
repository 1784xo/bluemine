package com.bluemine.repository;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.apache.commons.lang3.StringUtils;
import org.springframework.data.jpa.domain.Specification;

import com.bluemine.common.QualityRowRequest;
import com.bluemine.domain.entity.QualityRowEntity;

public class QualityRowSpecification implements Specification<QualityRowEntity> {

	private static QualityRowSpecification specification = new QualityRowSpecification();
	
	private static ThreadLocal<QualityRowRequest> querys = new ThreadLocal();
	
	private QualityRowSpecification(){
		
	}
	
	public static Specification<QualityRowEntity> getInstance(QualityRowRequest query){
		 querys.set(query);
		 return specification;
	}
	
	@Override
	public Predicate toPredicate(Root<QualityRowEntity> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
		QualityRowRequest query=querys.get();
		List<Predicate> list =new ArrayList<>();
		
		long groupId = query.getGroupId();	
		if(groupId>0){
			list.add(criteriaBuilder.equal(root.get("groupId"),groupId));
		}
		String actived =query.getStatus();
		if(!actived.equals("ALL")){
			list.add(criteriaBuilder.equal(root.get("activated"),actived.equals("Y")?true:false));	
		}
			
		String rowname =query.getName();
		if(rowname!=null&&rowname.length()>0&&!"请输入质检项".equals(rowname)){
			list.add(criteriaBuilder.equal(root.get("rowName"),rowname));
		}
		criteriaQuery.where(list.toArray(new Predicate[list.size()]));
		return criteriaQuery.getRestriction();
	}

	public static void remove(){
		querys.remove();
	}
}
