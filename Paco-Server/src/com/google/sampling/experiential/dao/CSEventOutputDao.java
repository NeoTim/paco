package com.google.sampling.experiential.dao;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;

import com.google.sampling.experiential.model.Event;
import com.google.sampling.experiential.shared.EventDAO;

public interface CSEventOutputDao {

  JSONArray getResultSetAsJson(String query, List<String> dateColumns) throws SQLException, ParseException, JSONException;

  boolean insertEventAndOutputs(Event event) throws SQLException, ParseException;

  List<EventDAO> getEvents(String query, boolean withOutputs) throws SQLException, ParseException;

}
