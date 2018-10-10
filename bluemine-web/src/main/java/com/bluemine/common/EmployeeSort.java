package com.bluemine.common;

import java.io.Serializable;

import com.bluemine.struct.EmployeeSortEnum;

/**
 * Created by yxghero2
 */
public class EmployeeSort extends SortRequest implements Serializable{

	private static final long serialVersionUID = 2197489764561293444L;

	@Override
    public String getProperty() {
        return EmployeeSortEnum.valueOf(property).getValue();
    }
}
