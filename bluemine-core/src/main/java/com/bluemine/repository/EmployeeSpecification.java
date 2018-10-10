package com.bluemine.repository;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaBuilder.In;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.data.jpa.domain.Specification;

import com.bluemine.common.EmployeeRequest;
import com.bluemine.domain.entity.EmployeeEntity;

public class EmployeeSpecification implements Specification<EmployeeEntity> {

	private static EmployeeSpecification specification = new EmployeeSpecification();
	
	private static ThreadLocal<EmployeeRequest> querys = new ThreadLocal();
	
	private EmployeeSpecification(){
		
	}
	
	public static Specification<EmployeeEntity> getInstance(EmployeeRequest query){
		 querys.set(query);
		 return specification;
	}
	
	@Override
	public Predicate toPredicate(Root<EmployeeEntity> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
		EmployeeRequest query=querys.get();
		List<Predicate> list =new ArrayList<>();
		
		long groupId = query.getGroupId();	
		if(groupId>0){
			list.add(criteriaBuilder.equal(root.get("groupId"),groupId));
		}
		long empId  =query.getId();
		if(empId>0){
			list.add(criteriaBuilder.equal(root.get("employeeId"),empId));
		}
		
		Long[] deptIds =query.getDeptIds();
		if(deptIds.length!=0){
			In<Long> in = criteriaBuilder.in(root.get("deptId"));
			for(Long deptId:deptIds){
				in.value(deptId);
			}
			list.add(in);
		}
		criteriaQuery.where(list.toArray(new Predicate[list.size()]));
		return criteriaQuery.getRestriction();
	}

	public static void remove(){
		querys.remove();
	}
}
