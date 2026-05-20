package com.cinosphere.service;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

import com.cinosphere.dao.ShowtimeDAO;
import com.cinosphere.model.ShowtimeModel;

public class ShowtimeService {
	ShowtimeDAO showtimeDAO = new ShowtimeDAO();
	/**
	 * 
	 * @param showtimeId
	 * @return
	 * @throws Exception
	 */
	public ShowtimeModel getShowtimeById(int showtimeId) throws Exception{
			return showtimeDAO.findByShowtimeId(showtimeId);

	}
	/**
	 * 
	 * @param screenId
	 * @return
	 * @throws Exception
	 */
	public List<ShowtimeModel> getShowtimesByScreenId(int screenId) throws Exception {
		return showtimeDAO.findByScreenId(screenId);
	}
	/**
	 * 
	 * @param movieId
	 * @return
	 * @throws Exception
	 */
	public List<ShowtimeModel> getShowtimesByMovieId(int movieId) throws Exception {
		return showtimeDAO.findByMovieId(movieId);
	}
	/**
	 * 
	 * @param showtimeId
	 * @param showtimeStatus
	 * @return
	 * @throws Exception
	 */
	public boolean updateShowtimeStatus(int showtimeId, String showtimeStatus) throws Exception {
		return showtimeDAO.updateShowtimeStatus(showtimeId, showtimeStatus);
	}
	/**
	 * 
	 * @param showtimeId
	 * @param showtimeType
	 * @return
	 * @throws Exception
	 */
	public boolean updateShowtimeType(int showtimeId, String showtimeType) throws Exception {
		return showtimeDAO.updateShowtimeType(showtimeId, showtimeType);
	}
	/**
	 * 
	 * @param screenId
	 * @param movieId
	 * @param showDate
	 * @param startTime
	 * @param endTime
	 * @param showStatus
	 * @param showType
	 * @return
	 * @throws Exception
	 */
	public boolean insertShowtime(int screenId, int movieId, LocalDate showDate, LocalTime startTime, LocalTime endTime, String showStatus, String showType) throws Exception {
		return showtimeDAO.insert(screenId, movieId, showDate, startTime, endTime, showStatus, showType);
	}
	public boolean deleteShowtimesByMovieId(int movieId) throws Exception {
		return showtimeDAO.deleteByMovieId(movieId);
		
	}
}
