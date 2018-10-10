package com.bluemine.service;

import java.util.LinkedList;
import java.util.List;

import javax.inject.Inject;
import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.bluemine.ExceptionMessageEnum;
import com.bluemine.common.EmployeeRequest;
import com.bluemine.common.EmployeeResponse;
import com.bluemine.common.HttpRestfulRequest;
import com.bluemine.common.RestfulPageRequest;
import com.bluemine.common.RestfulRequest;
import com.bluemine.common.SortRequest;
import com.bluemine.context.RequestContext;
import com.bluemine.domain.entity.ChannelEntity;
import com.bluemine.domain.entity.EmployeeEntity;
import com.bluemine.domain.util.EntityUtils;
import com.bluemine.repository.ChannelRepository;
import com.bluemine.repository.EmployeeRepository;
import com.bluemine.repository.EmployeeSpecification;
import com.bluemine.repository.proxy.RepositoryProxy;
import com.bluemine.util.AssertUtils;
import com.bluemine.util.IdWorker;

/**
 * Created by hechao on 2018/6/29.
 */
@Service
public class EmployeeService {

    @Inject
    private EntityService entityService;

    @Inject
    private ChannelRepository channelRepository;

    @Inject
    private EmployeeRepository empRepository;

    public List<EmployeeEntity> findAll(Long channelId) {
        List<EmployeeEntity> rules = empRepository.findAllByChannelId(channelId);
        return rules;
    }
    
    public Page<EmployeeResponse> findPageAll(RestfulPageRequest<EmployeeRequest, SortRequest> request) {

        EmployeeRequest data = request.getData();      
        Long groupId =data.getGroupId();
        AssertUtils.notNull(groupId, ExceptionMessageEnum.ILLEGAL_ARGUMENT);
        
        Long empId =data.getId();
        AssertUtils.notNull(empId, ExceptionMessageEnum.ILLEGAL_ARGUMENT);
        
        Long channelId = data.getChannelId();
        AssertUtils.notNull(channelId, ExceptionMessageEnum.ILLEGAL_ARGUMENT);

        Long[] deptIds = data.getDeptIds();
        AssertUtils.isTrue(deptIds != null, ExceptionMessageEnum.ILLEGAL_ARGUMENT);

        //分页
        PageRequest pageable = request.getPageRequest();

        Page<EmployeeEntity> page = empRepository.findAll(EmployeeSpecification.getInstance(data),pageable);
        List<EmployeeEntity> content = page.getContent();
        List<EmployeeResponse> responses = new LinkedList<>();
        for (EmployeeEntity entity : content) {
            responses.add(EntityUtils.toResponse(entity));
        }

        return new PageImpl<EmployeeResponse>(responses, pageable, page.getTotalElements());
    }

    @Transactional(rollbackOn = Exception.class)
    public EmployeeResponse create(HttpRestfulRequest<EmployeeRequest> request) {
    	EmployeeRequest data = request.getData();
        RequestContext<EmployeeRequest> context = request.getContext();
        IdWorker idWorker = context.getIdWorker();
        RepositoryProxy repository = context.getRepository();

        Long channelId = data.getChannelId();
        String employeeNo =data.getEmployeeNo();
        String employeeName =data.getEmployeeName();
        Long deptId = data.getDeptId();
        Long groupId = data.getGroupId();
        String mac = data.getMac();
        String userName = data.getUserName();
        String email = data.getEmail();
        Boolean activated =data.getActivated();

        ChannelEntity channelEntity = channelRepository.findOne(data.getChannelId());
        AssertUtils.notNull(channelEntity, ExceptionMessageEnum.DB_NO_SUCH_RESULT, "channelId", data.getChannelId());

        EmployeeEntity empEntity = new EmployeeEntity()
                .employeeId(idWorker.nextId())
                .employeeNo(employeeNo)
                .channelId(channelId)
                .employeeName(employeeName)
                .deptId(deptId)
                .groupId(groupId)
                .mac(mac)
                .email(email)
                .activated(activated)
                .userName(userName);
                

        empEntity.partitionKey(channelEntity.getPartitionKey());

        repository.commit(empEntity);

        EmployeeResponse response = EntityUtils.toResponse(empEntity);

        return response;
    }

    @Transactional(rollbackOn = Exception.class)
    public EmployeeResponse update(HttpRestfulRequest<EmployeeRequest> request) {
    	EmployeeRequest data = request.getData();
    	 Long employeeId =data.getId();
    	 Long channelId = data.getChannelId();
         String employeeNo =data.getEmployeeNo();
         String employeeName =data.getEmployeeName();
         Long deptId = data.getDeptId();
         Long groupId = data.getGroupId();
         String mac = data.getMac();
         String userName = data.getUserName();
         String email = data.getEmail();
         Boolean activated =data.getActivated();
        EmployeeEntity empEntity = empRepository.findOne(employeeId);
        AssertUtils.notNull(empEntity, ExceptionMessageEnum.DB_NO_SUCH_RESULT, "employeeId", employeeId);
        AssertUtils.isTrue(empEntity.getChannelId().compareTo(channelId) == 0, ExceptionMessageEnum.DB_UNAUTHORIZED_UNMATCH);

        empEntity.setEmployeeNo(employeeNo);
        empEntity.setEmployeeName(employeeName);
        empEntity.setDeptId(deptId);
        empEntity.setGroupId(groupId);
        empEntity.setMac(mac);
        empEntity.setEmail(email);
        empEntity.setUserName(userName);
        empEntity.setActivated(activated);
        empRepository.save(empEntity);
        EmployeeResponse response = EntityUtils.toResponse(empEntity);
        return response;
    }
    
    public List<EmployeeResponse> findAllBySearch(RestfulRequest<EmployeeRequest> request) {
    	EmployeeRequest data = request.getData();
    	List<EmployeeEntity> qua =null;
    	if(data.getStatus().equals("ALL")){
   		 	qua = empRepository.findAllByChannelId(data.getChannelId());
    	}else{
            qua = empRepository.findAllByChannelIdAndActivated(data.getChannelId(), data.getStatus().equals("Y")?true:false);
       }
        return EntityUtils.toEmpResponse(qua);
    }
}
