package com.google.sampling.experiential.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Logger;

import com.google.common.collect.Lists;
import com.google.sampling.experiential.cloudsql.columns.ExperimentIdVersionGroupNameColumns;
import com.google.sampling.experiential.dao.CSExperimentIdVersionDao;
import com.google.sampling.experiential.dao.dataaccess.ExperimentLite;
import com.google.sampling.experiential.server.CloudSQLConnectionManager;
import com.google.sampling.experiential.server.ExceptionUtil;
import com.google.sampling.experiential.server.QueryConstants;

public class CSExperimentIdVersionDaoImpl implements CSExperimentIdVersionDao {
  public static final Logger log = Logger.getLogger(CSExperimentIdVersionDaoImpl.class.getName());

  @Override
  public void insertExperimentIdVersionAndGroupName() throws SQLException {
    String insertTableSql2 = QueryConstants.INSERT_EXPERIMENT_ID_VERSION_GROUP_NAME.toString();
    String[] qry = new String[] { insertTableSql2} ;
                             
    Connection conn = null;
    PreparedStatement statementCreateTable = null;
    try {
      conn = CloudSQLConnectionManager.getInstance().getConnection();
      for ( int i = 0; i < qry.length; i++) {
        statementCreateTable = conn.prepareStatement(qry[i]);
        log.info(qry[i]);
        statementCreateTable.execute();
      }
    } catch (SQLException sqle) {
      log.warning("SQLException while populating exp id version tables" + ExceptionUtil.getStackTraceAsString(sqle));
      throw sqle;
    } catch (Exception e) {
      log.warning("GException while populating exp id version tables" + ExceptionUtil.getStackTraceAsString(e));
      throw e;
    } finally {
      try {
        if (statementCreateTable != null) {
          statementCreateTable.close();
        }

        if (conn != null) {
          conn.close();
        }
      } catch (SQLException e) {
        log.warning("Exception in finally block" + ExceptionUtil.getStackTraceAsString(e));
      }
    }    
  }

  @Override
  public List<Long> getExperimentIdsToBeDeleted() throws SQLException {
    List<Long> expIdsToBeDeleted = Lists.newArrayList();
    Connection conn = null;
    PreparedStatement statementCreateTable = null;
    ResultSet rs  = null;
    try {
      conn = CloudSQLConnectionManager.getInstance().getConnection();
        statementCreateTable = conn.prepareStatement(QueryConstants.GET_TO_BE_DELETED_EXPERIMENTS.toString());
        log.info(statementCreateTable.toString());
        rs = statementCreateTable.executeQuery();
        while (rs.next()) {
          expIdsToBeDeleted.add(rs.getLong(ExperimentIdVersionGroupNameColumns.EXPERIMENT_ID));
        }
    } catch (SQLException sqle) {
      log.warning("SQLException while populating exp id version tables" + ExceptionUtil.getStackTraceAsString(sqle));
      throw sqle;
    } catch (Exception e) {
      log.warning("GException while populating exp id version tables" + ExceptionUtil.getStackTraceAsString(e));
      throw e;
    } finally {
      try {
        if (rs != null) {
          rs.close();
        }
        if (statementCreateTable != null) {
          statementCreateTable.close();
        }
        if (conn != null) {
          conn.close();
        }
      } catch (SQLException e) {
        log.warning("Exception in finally block" + ExceptionUtil.getStackTraceAsString(e));
      }
    }
    return expIdsToBeDeleted;    
  }
 
  @Override
  public boolean deleteExperiments(List<Long> toBeDeletedExperiments) throws SQLException {
    String deleteFromExperimentIdVersion = QueryConstants.DELETE_EXPERIMENTS_IN_EXPERIMENT_ID_VERSION.toString();
    boolean allDeleted = false;                             
    Connection conn = null;
    PreparedStatement statementDeleteFromExpIdVersion = null;
    try {
      conn = CloudSQLConnectionManager.getInstance().getConnection();
      statementDeleteFromExpIdVersion = conn.prepareStatement(deleteFromExperimentIdVersion);
      for ( Long experimentId : toBeDeletedExperiments) {
        statementDeleteFromExpIdVersion.setLong(1, experimentId);
        statementDeleteFromExpIdVersion.addBatch();
        log.info("deleting from expid version" + statementDeleteFromExpIdVersion.toString());
      }
      statementDeleteFromExpIdVersion.executeBatch();
      allDeleted = true;
    } catch (SQLException sqle) {
      log.warning("SQLException while deletin exp id version tables" + ExceptionUtil.getStackTraceAsString(sqle));
      throw sqle;
    } catch (Exception e) {
      log.warning("GException while deleting exp id version tables" + ExceptionUtil.getStackTraceAsString(e));
      throw e;
    } finally {
      try {
        if (statementDeleteFromExpIdVersion != null) {
          statementDeleteFromExpIdVersion.close();
        }

        if (conn != null) {
          conn.close();
        }
      } catch (SQLException e) {
        log.warning("Exception in finally block" + ExceptionUtil.getStackTraceAsString(e));
      }
    } 
    return allDeleted;
  }
  
  @Override
  public boolean deleteExperiment(Long toBeDeletedExperimentId, Integer experimentVersion) throws SQLException {
    String deleteFromExperimentIdVersion = QueryConstants.DELETE_EXPERIMENTS_WITH_VERSION_IN_EXPERIMENT_ID_VERSION.toString();
    boolean allDeleted = false;                             
    Connection conn = null;
    PreparedStatement statementDeleteFromExpIdVersion = null;
    try {
      conn = CloudSQLConnectionManager.getInstance().getConnection();
      statementDeleteFromExpIdVersion = conn.prepareStatement(deleteFromExperimentIdVersion);
      statementDeleteFromExpIdVersion.setLong(1, toBeDeletedExperimentId);
      statementDeleteFromExpIdVersion.setInt(2, experimentVersion);
      statementDeleteFromExpIdVersion.execute();
      log.info("deleting from expid version" + statementDeleteFromExpIdVersion.toString());
      allDeleted = true;
    } catch (SQLException sqle) {
      log.warning("SQLException while deletin exp id version tables" + ExceptionUtil.getStackTraceAsString(sqle));
      throw sqle;
    } catch (Exception e) {
      log.warning("GException while deleting exp id version tables" + ExceptionUtil.getStackTraceAsString(e));
      throw e;
    } finally {
      try {
        if (statementDeleteFromExpIdVersion != null) {
          statementDeleteFromExpIdVersion.close();
        }

        if (conn != null) {
          conn.close();
        }
      } catch (SQLException e) {
        log.warning("Exception in finally block" + ExceptionUtil.getStackTraceAsString(e));
      }
    } 
    return allDeleted;
  }

  @Override
  public List<ExperimentLite> getAllExperimentLiteOfStatus(Integer status) throws SQLException {
    List<ExperimentLite> expLites = Lists.newArrayList();
    Connection conn = null;
    PreparedStatement statementCreateTable = null;
    ResultSet rs  = null;
    try {
      conn = CloudSQLConnectionManager.getInstance().getConnection();
        statementCreateTable = conn.prepareStatement(QueryConstants.GET_ALL_EXPERIMENT_LITE_IN_EXPERIMENT_ID_VERSION.toString());
        statementCreateTable.setInt(1, status);
        log.info("explite status"+ statementCreateTable.toString());
        rs = statementCreateTable.executeQuery();
        while (rs.next()) {
          expLites.add(new ExperimentLite(rs.getLong(ExperimentIdVersionGroupNameColumns.EXPERIMENT_ID), rs.getInt(ExperimentIdVersionGroupNameColumns.EXPERIMENT_VERSION), rs.getString(ExperimentIdVersionGroupNameColumns.GROUP_NAME)));
        }
        log.info("get all exp lite returned " + expLites.size());
    } catch (SQLException sqle) {
      log.warning("SQLException while populating exp id version tables" + ExceptionUtil.getStackTraceAsString(sqle));
      throw sqle;
    } catch (Exception e) {
      log.warning("GException while populating exp id version tables" + ExceptionUtil.getStackTraceAsString(e));
      throw e;
    } finally {
      try {
        if (rs != null) {
          rs.close();
        }
        if (statementCreateTable != null) {
          statementCreateTable.close();
        }
        if (conn != null) {
          conn.close();
        }
      } catch (SQLException e) {
        log.warning("Exception in finally block" + ExceptionUtil.getStackTraceAsString(e));
      }
    }
    return expLites;    
  }

  @Override
  public List<ExperimentLite> getDistinctExperimentIdAndVersion(Integer status) throws SQLException {
    List<ExperimentLite> expLites = Lists.newArrayList();
    Connection conn = null;
    PreparedStatement statementCreateTable = null;
    ResultSet rs  = null;
    try {
      conn = CloudSQLConnectionManager.getInstance().getConnection();
        statementCreateTable = conn.prepareStatement(QueryConstants.GET_DISTINCT_EXPERIMENT_ID_VERSION.toString());
        statementCreateTable.setInt(1, status);
        rs = statementCreateTable.executeQuery();
        while (rs.next()) {
          expLites.add(new ExperimentLite(rs.getLong(ExperimentIdVersionGroupNameColumns.EXPERIMENT_ID), rs.getInt(ExperimentIdVersionGroupNameColumns.EXPERIMENT_VERSION)));
        }
        log.info("get all exp lite returned " + expLites.size());
    } catch (SQLException sqle) {
      log.warning("SQLException while populating exp id version tables" + ExceptionUtil.getStackTraceAsString(sqle));
      throw sqle;
    } catch (Exception e) {
      log.warning("GException while populating exp id version tables" + ExceptionUtil.getStackTraceAsString(e));
      throw e;
    } finally {
      try {
        if (rs != null) {
          rs.close();
        }
        if (statementCreateTable != null) {
          statementCreateTable.close();
        }
        if (conn != null) {
          conn.close();
        }
      } catch (SQLException e) {
        log.warning("Exception in finally block" + ExceptionUtil.getStackTraceAsString(e));
      }
    }
    return expLites;    
  }

  @Override
  public boolean updateExperimentIdGroupNameStatus(Long expId, Integer expVersion,
                                                      String groupName, Integer status) throws SQLException {
    String incrementStatusInExperimentIdVersion = QueryConstants.UPDATE_EXPERIMENT_ID_VERSION_GROUP_NAME_STATUS_IN_EXPERIMENT_ID_VERSION.toString();
    if ( groupName == null ) { 
      incrementStatusInExperimentIdVersion = QueryConstants.UPDATE_EXPERIMENT_ID_VERSION_STATUS_IN_EXPERIMENT_ID_VERSION.toString();
    }
                                 
    Connection conn = null;
    PreparedStatement statementIncrementStatusExpIdVersion = null;
    int i = 1;
    try {
      conn = CloudSQLConnectionManager.getInstance().getConnection();
      statementIncrementStatusExpIdVersion = conn.prepareStatement(incrementStatusInExperimentIdVersion);
      statementIncrementStatusExpIdVersion.setInt(i++, status);
      statementIncrementStatusExpIdVersion.setLong(i++, expId);
      statementIncrementStatusExpIdVersion.setInt(i++, expVersion);
      if ( groupName != null) { 
        statementIncrementStatusExpIdVersion.setString(i++, groupName);
      }
      statementIncrementStatusExpIdVersion.execute();
      log.info("updating status "+ status +"for exp id  version" + statementIncrementStatusExpIdVersion.toString());

    } catch (SQLException sqle) {
      log.warning("SQLException while deletin exp id version tables" + ExceptionUtil.getStackTraceAsString(sqle));
      throw sqle;
    } catch (Exception e) {
      log.warning("GException while deleting exp id version tables" + ExceptionUtil.getStackTraceAsString(e));
      throw e;
    } finally {
      try {
        if (statementIncrementStatusExpIdVersion != null) {
          statementIncrementStatusExpIdVersion.close();
        }

        if (conn != null) {
          conn.close();
        }
      } catch (SQLException e) {
        log.warning("Exception in finally block" + ExceptionUtil.getStackTraceAsString(e));
      }
    } 
    return false;
  }
}
