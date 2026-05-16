package com.cinosphere.service;

import java.time.LocalDate;
import java.time.LocalTime;

import com.cinosphere.dao.PaymentDAO;
import com.cinosphere.model.PaymentModel;

public class PaymentService {
	PaymentDAO paymentDAO = new PaymentDAO();
	/**
	 * 
	 * @param bookingId
	 * @param paymentMethod
	 * @param paymentAmount
	 * @return
	 * @throws Exception
	 */
	public boolean createPayment(int bookingId, String paymentMethod, double paymentAmount) throws Exception {
		return paymentDAO.insert(bookingId,paymentMethod,paymentAmount,LocalDate.now(),LocalTime.now(),"COMPLETED");
	}
	/**
	 * 
	 * @param bookingId
	 * @return
	 * @throws Exception
	 */
	public PaymentModel getPaymentByBookingId(int bookingId) throws Exception {
		return paymentDAO.findByBookingId(bookingId);
	}
	/**
	 * 
	 * @param paymentId
	 * @return
	 * @throws Exception
	 */
	public PaymentModel getPaymentById(int paymentId) throws Exception {
		return paymentDAO.findByPaymentId(paymentId);
	}
	/**
	 * 
	 * @param paymentId
	 * @param paymentStatus
	 * @return
	 * @throws Exception
	 */
	public boolean updatePaymentStatus(int paymentId, String paymentStatus) throws Exception {
		return paymentDAO.updatePaymentStatus(paymentId, paymentStatus);
	}
}
