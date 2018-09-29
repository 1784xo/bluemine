package com.bluemine.service;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.bluemine.ExceptionMessageEnum;
import com.bluemine.common.DeptRequest;
import com.bluemine.common.DeptResponse;
import com.bluemine.common.QualityItemRequest;
import com.bluemine.common.QualityItemResponse;
import com.bluemine.common.RestfulRequest;
import com.bluemine.context.RequestContext;
import com.bluemine.domain.entity.DeptControlEntity;
import com.bluemine.domain.entity.DeptEntity;
import com.bluemine.domain.entity.EmployeeEntity;
import com.bluemine.domain.entity.QualityItemEntity;
import com.bluemine.domain.entity.RuleEntity;
import com.bluemine.domain.util.EntityUtils;
import com.bluemine.repository.DeptRepository;
import com.bluemine.repository.proxy.RepositoryProxy;
import com.bluemine.util.AssertUtils;
import com.bluemine.util.IdWorker;

/**
 * Created by yxghero2
 */
@Service
public class DeptService {
    @Inject
    private EntityService entityService;

    @Inject
    private DeptRepository deptRepository;

    @Inject
    private EmployeeService empService;

    private static Comparator DEPT_DESC = new Comparator<DeptEntity>() {
        @Override
        public int compare(DeptEntity o1, DeptEntity o2) {
            return o2.getDeptNo().compareTo(o1.getDeptNo());
        }
    };
    
    public List<DeptResponse> findAll(long channelId) {
        List<DeptEntity> deps = deptRepository.findAll(channelId,true,null);
        return EntityUtils.toDeptResponse(deps);
    }
    
    public Map<Long, DeptResponse> findAllWithEmp(long channelId) {
        List<DeptEntity> deps = deptRepository.findAll(channelId);
        List<EmployeeEntity> emps = empService.findAll(channelId);

        Collections.sort(deps, DEPT_DESC);

        return EntityUtils.mergeToDeptMap(deps, emps);
    }

    public List<DeptResponse> findTreeWithEmp(long channelId) {
        List<DeptEntity> deps = deptRepository.findAll(channelId);
        List<EmployeeEntity> emps = empService.findAll(channelId);
        List<DeptResponse> tagTree = EntityUtils.toDeptTree(deps, emps);
        return tagTree;
    }

    public List<DeptResponse> findTreeWithRule(RestfulRequest<DeptRequest> request) {
        DeptRequest data = request.getData();
        Long channelId = data.getChannelId();
        return findTreeWithEmp(channelId);
    }

    public List<DeptResponse> findAllSub(RestfulRequest<DeptRequest> request) {
        DeptRequest data = request.getData();
        Long channelId = data.getChannelId();
        Long parentId = data.getParentId();
        List<DeptEntity> tags = deptRepository.findAllSub(channelId, parentId);
        List<DeptResponse> responses = EntityUtils.toDeptTree(tags);
        return responses;
    }

    @Transactional(rollbackOn = Exception.class)
    public DeptResponse create(RestfulRequest<DeptRequest> request) {
        DeptRequest data = request.getData();

        String deptText = data.getDeptText();
        Long parentId = data.getParentId();
        if(parentId==null){parentId=0L;}
        Long channelId = data.getChannelId();
        String descText =data.getDescText();
        Boolean activated =data.getActivated();
        
        RequestContext<DeptRequest> context = request.getContext();
        IdWorker idWorker = context.getIdWorker();
        RepositoryProxy repository = context.getRepository();

        DeptControlEntity deptControl = entityService.findDeptControlWithCache(channelId, repository);
        Integer deptNo = deptControl.getNextDeptNo();

        deptControl.nextDeptNo(deptNo + 1).markModified();

        DeptEntity deptEntity = new DeptEntity()
                .deptNo(deptNo)
                .deptId(idWorker.nextId())
                .deptText(deptText)
                .activated(activated)
                .channelId(channelId)
                .parentId(parentId)
                .customizable(parentId==0?false:true);
        deptEntity.setDescText(descText);

        DeptResponse response = EntityUtils.toResponse(deptEntity);

        repository.commit(deptEntity);
        return response;
    }

    @Transactional(rollbackOn = Exception.class)
    public DeptResponse update(RestfulRequest<DeptRequest> request) {
        DeptRequest data = request.getData();
        Long deptId = data.getDeptId();
        Long channelId = data.getChannelId();
        Long parentId = data.getParentId();
        Boolean activated = data.getActivated();
        String deptText = data.getDeptText();
        String descText =data.getDescText();

        DeptEntity deptEntity = deptRepository.findOneByChannelIdAndDeptId(channelId, deptId);
        AssertUtils.notNull(deptEntity, ExceptionMessageEnum.DB_NO_SUCH_RESULT, "dept", channelId+", "+channelId);

        if (deptText != null) {
            deptEntity.setDeptText(deptText);
        }

        if (activated != null) {
            deptEntity.setActivated(activated);
        }

        if (parentId != null) {
            deptEntity.setParentId(parentId);
            if(parentId==0){
            	deptEntity.setCustomizable(false);
            }
        }

        if(descText!=null){
        	deptEntity.setDescText(descText);
        }
        
        deptRepository.save(deptEntity);

        DeptResponse response = EntityUtils.toResponse(deptEntity);
        return response;
    }


}
