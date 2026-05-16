package com.cinosphere.service;

import java.util.List;

import com.cinosphere.dao.SeatDAO;
import com.cinosphere.model.SeatModel;

public class SeatService {
	SeatDAO seatDAO = new SeatDAO();
	/**
	 * 
	 * @param screenId
	 * @param seatNumber
	 * @param rowNumber
	 * @param seatType
	 * @param seatStatus
	 * @return
	 * @throws Exception
	 */
	public boolean insertSeat(int screenId,String seatNumber,String rowNumber,String seatType,String seatStatus) throws Exception {
		return seatDAO.insert(screenId, seatNumber, rowNumber, seatType, seatStatus);
	}
	/**
	 * 
	 * @param screenId
	 * @return
	 * @throws Exception
	 */
	public List<SeatModel> getSeatsByScreenId(int screenId) throws Exception {
		return seatDAO.findByScreenId(screenId);
	}
	/**
	 * 
	 * @param seatId
	 * @return
	 * @throws Exception
	 */
	public SeatModel getSeatById(int seatId) throws Exception {
		return seatDAO.findBySeatId(seatId);
	}
	/**
	 * 
	 * @param seatId
	 * @param seatStatus
	 * @return
	 * @throws Exception
	 */
	public boolean updateSeatStatus(int seatId, String seatStatus) throws Exception {
		return seatDAO.updateSeatStatus(seatId, seatStatus);
	}
}
