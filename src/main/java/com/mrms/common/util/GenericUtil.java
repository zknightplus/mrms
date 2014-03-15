package com.mrms.common.util;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;

public class GenericUtil {

	public static Type[] getGenericTypes(Class clazz){
		ParameterizedType type = (ParameterizedType)clazz.getGenericSuperclass();
		if(type == null){
			return null;
		}
		return type.getActualTypeArguments();
	}
}
