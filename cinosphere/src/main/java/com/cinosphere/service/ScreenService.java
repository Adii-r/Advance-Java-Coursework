package com.cinosphere.service;

import java.util.List;

import com.cinosphere.dao.ScreenDAO;
import com.cinosphere.model.ScreenModel;

public class ScreenService {
	ScreenDAO screenDAO = new ScreenDAO();
		/**
		 * 
		 * @param theatreId
		 * @param screenName
		 * @param screenType
		 * @param screenStatus
		 * @param capacity
		 * @param basePrice
		 * @return
		 * @throws Exception
		 */
		public boolean insertScreen(int theatreId, String screenName, String screenType, String screenStatus, int capacity, double basePrice)  throws Exception{
			return screenDAO.insert(theatreId, screenName, screenType, screenStatus, capacity, basePrice);
		}
	
	
		/**
		 * 
		 * @param theatreId
		 * @return
		 * @throws Exception
		 */
		public List<ScreenModel> getScreensByTheatreId(int theatreId) throws Exception {
			return screenDAO.findBytheatreId(theatreId);
		}
		/**
		 * 
		 * @param screenId
		 * @return
		 * @throws Exception
		 */
		public ScreenModel getScreenById(int screenId) throws Exception {
			return screenDAO.findByScreenId(screenId);
		}
		/**
		 * 
		 * @param screenId
		 * @param screenStatus
		 * @return
		 * @throws Exception
		 */
		public boolean updateScreenStatus(int screenId, String screenStatus) throws Exception {
			return screenDAO.updateScreenStatus(screenId, screenStatus);
		}
		/**
		 * 
		 * @param screenId
		 * @param basePrice
		 * @return
		 * @throws Exception
		 */
		public boolean updateBasePrice(int screenId, double basePrice) throws Exception {
			return screenDAO.updateScreenBasePrice(screenId, basePrice);
		}
}
