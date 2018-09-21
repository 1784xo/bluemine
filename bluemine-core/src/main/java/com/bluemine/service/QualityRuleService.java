package com.bluemine.service;

import java.util.List;

import javax.inject.Inject;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.bluemine.ExceptionMessageEnum;
import com.bluemine.common.HttpRestfulRequest;
import com.bluemine.common.QualityGroupRequest;
import com.bluemine.common.QualityGroupResponse;
import com.bluemine.common.QualityItemRequest;
import com.bluemine.common.QualityItemResponse;
import com.bluemine.common.QualityRowRequest;
import com.bluemine.common.QualityRowResponse;
import com.bluemine.common.RestfulRequest;
import com.bluemine.common.RuleRequest;
import com.bluemine.context.RequestContext;
import com.bluemine.domain.entity.QualityGroupEntity;
import com.bluemine.domain.entity.QualityItemEntity;
import com.bluemine.domain.entity.QualityRowEntity;
import com.bluemine.domain.util.EntityUtils;
import com.bluemine.repository.QualityGroupRepository;
import com.bluemine.repository.QualityItemRepository;
import com.bluemine.repository.QualityRowRepository;
import com.bluemine.repository.QualityRowSpecification;
import com.bluemine.repository.proxy.RepositoryProxy;
import com.bluemine.util.AssertUtils;
import com.bluemine.util.IdWorker;

/**
 * Created by yxghero2
 */
@Service
public class QualityRuleService {

    @Inject
    private QualityGroupRepository quaRepository;

    @Inject
    private QualityRowRepository quarRepository;
    
    @Inject
    private QualityItemRepository quaiRepository;

    public List<QualityGroupResponse> findAll(long channelId) {
        List<QualityGroupEntity> qua = quaRepository.findAll(channelId);
        return EntityUtils.toResponse(qua);
    }
    
    public List<QualityRowResponse> findRowAll(long channelId) {
        List<QualityRowEntity> qua = quarRepository.findAll(channelId);
        List<QualityItemEntity> quai = quaiRepository.findAll(channelId);
        return EntityUtils.toAddItem(qua, quai);
    }
    
    public List<QualityItemResponse> findItemAllByRowID(RestfulRequest<QualityItemRequest> request) {
    	QualityItemRequest data = request.getData();
        List<QualityItemEntity> qua = quaiRepository.findAllByChannelIdAndRowId(data.getChannelId(), data.getRowId());
        return EntityUtils.toItemResponse(qua);
    }

    public List<QualityGroupResponse> findAllBySearch(RestfulRequest<QualityGroupRequest> request) {
    	QualityGroupRequest data = request.getData();
    	List<QualityGroupEntity> qua =null;
    	if(data.getStatus().equals("ALL")){
    		 qua = quaRepository.findAll(data.getChannelId());
    	}else{
             qua = quaRepository.findAll(data.getChannelId(), data.getStatus().equals("Y")?true:false);
        }
        return EntityUtils.toResponse(qua);
    }
    
    public List<QualityRowResponse> findAllRowBySearch(RestfulRequest<QualityRowRequest> request) {
    	QualityRowRequest data = request.getData();
    	List<QualityRowEntity> qua = quarRepository.findAll(QualityRowSpecification.getInstance(data));   	
        return EntityUtils.toRowResponse(qua);
    }
    
    @Transactional(rollbackOn = Exception.class)
    public QualityGroupResponse create(RestfulRequest<QualityGroupRequest> request) {
    	QualityGroupRequest data = request.getData();

        String descText = data.getText();
        Long channelId = data.getChannelId();
        String groupName =data.getName();
        Boolean activated = data.getActivated();
        
        RequestContext<QualityGroupRequest> context = request.getContext();
        RepositoryProxy repository = context.getRepository();
        IdWorker idWorker = context.getIdWorker();
        QualityGroupEntity quaEntity = new QualityGroupEntity()
        		.groupId(idWorker.nextId())
                .descText(descText)
                .groupName(groupName)
                .activated(activated)
                .channelId(channelId);
        QualityGroupResponse response = EntityUtils.toResponse(quaEntity);
        repository.commit(quaEntity);
        return response;
    }

    @Transactional(rollbackOn = Exception.class)
    public QualityRowResponse createRow(RestfulRequest<QualityRowRequest> request) {
    	QualityRowRequest data = request.getData();

        String descText = data.getText();
        Long channelId = data.getChannelId();
        String rowName =data.getName();
        Boolean activated = data.getActivated();
        Long groupId =data.getGroupId();
        String rowType =data.getRowType();
        Integer weight =data.getWeight();
        Integer point = data.getPoint();
        
        RequestContext<QualityRowRequest> context = request.getContext();
        RepositoryProxy repository = context.getRepository();
        IdWorker idWorker = context.getIdWorker();
        QualityRowEntity quaEntity = new QualityRowEntity()
        		.rowId(idWorker.nextId())
        		.groupId(groupId)
                .descText(descText)
                .activated(activated)
                .channelId(channelId)
                .rowType(rowType)
                .weight(weight)
                .point(point)
                .rowName(rowName);
        QualityRowResponse response = EntityUtils.toResponse(quaEntity);
        repository.commit(quaEntity);
        return response;
    }
    
    @Transactional(rollbackOn = Exception.class)
    public QualityItemResponse createItem(RestfulRequest<QualityItemRequest> request) {
    	QualityItemRequest data = request.getData();
    	String logicvalue =data.getLogicvalue();
    	Long rowId = data.getRowId();
    	Long channelId =data.getChannelId();
    	Integer logicsort =data.getLogicsort();
    	Integer logicrelation =data.getLogicrelation();
    	Integer logicunit=data.getLogicunit();
    	RequestContext<QualityItemRequest> context = request.getContext();
        RepositoryProxy repository = context.getRepository();
        IdWorker idWorker = context.getIdWorker();
    	QualityItemEntity quaEntity = new QualityItemEntity()
        		.itemId(idWorker.nextId())
        		.rowId(rowId)
        		.channelId(channelId)
        		.activated(true)
        		.logicsort(logicsort)
        		.logicrelation(logicrelation)
        		.logicif(0)
        		.logicunit(logicunit)
                .logicvalue(logicvalue);
    	QualityItemResponse response = EntityUtils.toResponse(quaEntity);
        repository.commit(quaEntity);
        return response;
    }
    
    @Transactional(rollbackOn = Exception.class)
    public QualityGroupResponse update(RestfulRequest<QualityGroupRequest> request) {
    	QualityGroupRequest data = request.getData();
        String descText = data.getText();
        Long channelId = data.getChannelId();
        String groupName =data.getName();
        Boolean activated = data.getActivated();
        Long groupId =data.getId();

        QualityGroupEntity quaEntity = quaRepository.findOneByChannelIdAndGroupId(channelId, groupId);
        AssertUtils.notNull(quaEntity, ExceptionMessageEnum.DB_NO_SUCH_RESULT);

        if (descText != null) {
        	quaEntity.setDescText(descText);
        }

        if (activated != null) {
        	quaEntity.setActivated(activated);
        }

        if (groupName != null) {
        	quaEntity.setGroupName(groupName);
        }
        
        quaRepository.save(quaEntity);
        QualityGroupResponse response = EntityUtils.toResponse(quaEntity);
        return response;
    }

    @Transactional(rollbackOn = Exception.class)
    public QualityRowResponse updateRow(RestfulRequest<QualityRowRequest> request) {
    	QualityRowRequest data = request.getData();
        Long rowId = data.getId();
        String descText = data.getText();
        Long channelId = data.getChannelId();
        String rowName =data.getName();
        Boolean activated = data.getActivated();
        Long groupId =data.getGroupId();
        String rowType =data.getRowType();
        Integer weight =data.getWeight();
        Integer point = data.getPoint();

        QualityRowEntity quaEntity = quarRepository.findOneByChannelIdAndRowId(channelId, rowId);
        AssertUtils.notNull(quaEntity, ExceptionMessageEnum.DB_NO_SUCH_RESULT);

        if (descText != null) {
        	quaEntity.setDescText(descText);
        }

        if (activated != null) {
        	quaEntity.setActivated(activated);
        }

        if (rowName != null) {
        	quaEntity.setRowName(rowName);
        }
   
        if(groupId !=null){
        	quaEntity.setGroupId(groupId);
        }
        
        if(rowType!=null){
        	quaEntity.setRowType(rowType);
        }
        
        if(weight!=null&&weight.intValue()>0){
        	quaEntity.setWeight(weight);
        }
        
        if(point!=null&&point.intValue()>0){
        	quaEntity.setPoint(point);
        }
        
        quarRepository.save(quaEntity);

        QualityRowResponse response = EntityUtils.toResponse(quaEntity);
        return response;
    }
    
    
    @Transactional(rollbackOn = Exception.class)
    public QualityItemResponse updateItem(RestfulRequest<QualityItemRequest> request) {
    	QualityItemRequest data = request.getData();
    	Long itemId= data.getId();
    	String logicvalue =data.getLogicvalue();
    	Integer logicsort =data.getLogicsort();
    	Integer logicrelation =data.getLogicrelation();
    	Integer logicunit=data.getLogicunit();
    	QualityItemEntity quaEntity = quaiRepository.findOne(itemId);
        AssertUtils.notNull(quaEntity, ExceptionMessageEnum.DB_NO_SUCH_RESULT);
    	if(logicvalue!=null){
    		quaEntity.setLogicvalue(logicvalue);
    	}
    	if(logicsort!=null){
    		quaEntity.setLogicsort(logicsort);
    	}
    	if(logicrelation!=null){
    		quaEntity.setLogicrelation(logicrelation);
    	}
    	if(logicunit!=null){
    		quaEntity.setLogicunit(logicunit);
    	}
    	quaiRepository.save(quaEntity);

    	QualityItemResponse response = EntityUtils.toResponse(quaEntity);
        return response;
    }
    
    @Transactional(rollbackOn = Exception.class)
    public int delete(RestfulRequest<QualityItemRequest> restfulRequest) {
    	QualityItemRequest data = restfulRequest.getData();
        Long channelId = data.getChannelId();
        Long itemId = data.getId();
        return quaiRepository.delete(channelId,itemId);
    }
}
