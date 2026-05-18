package com.cinosphere.service;

import com.cinosphere.dao.TheatreDAO;
import com.cinosphere.model.TheatreModel;

public class TheatreService {
	TheatreDAO theatreDAO = new TheatreDAO();
	public TheatreModel getTheatreById(int theatreId) throws Exception {
		return theatreDAO.findById(theatreId);
	}
}
