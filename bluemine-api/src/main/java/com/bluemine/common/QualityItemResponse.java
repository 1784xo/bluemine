package com.bluemine.common;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by yxghero2 on 2018/09/10.
 */
public class QualityItemResponse implements Serializable {

	private static final long serialVersionUID = 1754190258661926594L;

	private long id;
	
	private long rowId;

    private boolean activated;

    private long channelId;
    
    private int logicrelation;
    
    private int logicsort;
    
    private int logicif;
    
    private String logicvalue;
    
    private int logicunit;

    private String name;

    private String text;
    

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getRowId() {
		return rowId;
	}

	public void setRowId(long rowId) {
		this.rowId = rowId;
	}

	public boolean isActivated() {
		return activated;
	}

	public void setActivated(boolean activated) {
		this.activated = activated;
	}

	public long getChannelId() {
		return channelId;
	}

	public void setChannelId(long channelId) {
		this.channelId = channelId;
	}

	public int getLogicrelation() {
		return logicrelation;
	}

	public void setLogicrelation(int logicrelation) {
		this.logicrelation = logicrelation;
	}

	public int getLogicsort() {
		return logicsort;
	}

	public void setLogicsort(int logicsort) {
		this.logicsort = logicsort;
	}

	public int getLogicif() {
		return logicif;
	}

	public void setLogicif(int logicif) {
		this.logicif = logicif;
	}

	public String getLogicvalue() {
		return logicvalue;
	}

	public void setLogicvalue(String logicvalue) {
		this.logicvalue = logicvalue;
	}

	public int getLogicunit() {
		return logicunit;
	}

	public void setLogicunit(int logicunit) {
		this.logicunit = logicunit;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	@Override
	public String toString() {
		return "QualityItemResponse [id=" + id + ", rowId=" + rowId + ", activated=" + activated + ", channelId="
				+ channelId + ", logicrelation=" + logicrelation + ", logicsort=" + logicsort + ", logicif=" + logicif
				+ ", logicvalue=" + logicvalue + ", logicunit=" + logicunit + ", name=" + name + ", text=" + text + "]";
	}


}
