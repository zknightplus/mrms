/**
 * 
 */
package com.mrms.common;

/**
 * @author hubin
 *
 */
public class BaseException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	public BaseException() {
	}

	/**
	 * @param message
	 */
	public BaseException(String message) {
		super(message);
	}

	/**
	 * @param cause
	 */
	public BaseException(Throwable cause) {
		super(cause);
	}

	/**
	 * @param message
	 * @param cause
	 */
	public BaseException(String message, Throwable cause) {
		super(message, cause);
	}

}
