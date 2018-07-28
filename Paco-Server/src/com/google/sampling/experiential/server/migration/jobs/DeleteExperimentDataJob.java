package com.google.sampling.experiential.server.migration.jobs;

import java.sql.SQLException;
import java.util.List;
import java.util.logging.Logger;

import org.joda.time.DateTime;

import com.google.common.collect.Lists;
import com.google.sampling.experiential.server.ExceptionUtil;
import com.google.sampling.experiential.server.migration.MigrationJob;
import com.google.sampling.experiential.server.migration.dao.DeleteExperimentDataDao;
import com.google.sampling.experiential.server.migration.dao.impl.DeleteExperimentDataDaoImpl;

public class DeleteExperimentDataJob implements MigrationJob {

  public static final Logger log = Logger.getLogger(DeleteExperimentDataJob.class.getName());

  @Override
  public boolean doMigration(String cursor, DateTime startTime, DateTime endTime) {
    Boolean success = false;
    try {
      String successMsg = deleteAllExperimentData(cursor);
      if ("All Done".equals(successMsg)) { 
        success = true;
      } else {
        success = false;
      }
    } catch (Exception e) { 
      log.warning(ExceptionUtil.getStackTraceAsString(e));
      success = false;
    }
    return success;
  }
  
  private String deleteAllExperimentData(String cursor) throws Exception {
    String returnString = "";
    Boolean doAll = false;
    List<Long> expIds = Lists.newArrayList();
    // TODO add exp ids here or create table and store ids in that table
    expIds.add(5552926096359424L);
    DeleteExperimentDataDao delExpDataDaoImpl = new DeleteExperimentDataDaoImpl();
    
    if (cursor == null) {
      doAll = true;
    }  
    for (Long expId : expIds) {
      if (doAll || (cursor != null && cursor.equalsIgnoreCase("step1"))) {
        try {
          log.info("------------------------------------------------Step 1 Begin------------------------------------------------");
          delExpDataDaoImpl.deleteEventsAndOutputs(expId);
          log.info("------------------------------------------------Step 1 End------------------------------------------------");
          returnString += "Verification of experiment version  Done. Step1 complete.";
          doAll = true;
        } catch (SQLException e) {
          returnString += "Verify experiment version failed. Restart job from step1";
          throw new SQLException(returnString, e);
        }
      }
      
      if (doAll || (cursor != null && cursor.equalsIgnoreCase("step2"))) {
        try {
          log.info("------------------------------------------------Step 2 Begin------------------------------------------------");
          delExpDataDaoImpl.deleteInputCollectionInputAndChoiceCollection(expId);
          log.info("------------------------------------------------Step 2 End------------------------------------------------");
          returnString += "Verification of experiment name  Done. Step2 complete.";
          doAll = true;
        } catch (SQLException e) {
          returnString += "Verify experiment name failed. Restart job from step2";
          throw new SQLException(returnString, e);
        }
      }

      if (doAll || (cursor != null && cursor.equalsIgnoreCase("step4"))) {
        try {
          log.info("------------------------------------------------Step 4 Begin------------------------------------------------");
          delExpDataDaoImpl.deleteExperimentGroupDetailAndInformedConsent(expId);
          log.info("------------------------------------------------Step 4 End------------------------------------------------");
          returnString += "Verification of experiment group name  Done. Step4 complete.";
          doAll = true;
        } catch (SQLException e) {
          returnString += "Verify experiment group name failed. Restart job from step4";
          throw new SQLException(returnString, e);
        }
      }
      
      if (doAll || (cursor != null && cursor.equalsIgnoreCase("step5"))) {
        try {
          log.info("------------------------------------------------Step 5 Begin------------------------------------------------");
          delExpDataDaoImpl.deleteExperimentUser(expId);
          log.info("------------------------------------------------Step 5 End------------------------------------------------");
          returnString += "Verification of anon who  Done. Step5 complete.";
          doAll = true;
        } catch (SQLException e) {
          returnString += "Verify anon who failed. Restart job from step5";
          throw new SQLException(returnString, e);
        }
      }
      
      if (doAll || (cursor != null && cursor.equalsIgnoreCase("step6"))) {
        try {
          log.info("------------------------------------------------Step 6 Begin------------------------------------------------");
          delExpDataDaoImpl.deleteUser(expId);
          log.info("------------------------------------------------Step 6 End------------------------------------------------");
          returnString += "Verification of  input name  Done. Step6 complete.";
          doAll = true;
        } catch (SQLException e) {
          returnString += "Verify input name failed. Restart job from step6";
          throw new SQLException(returnString, e);
        }
      }
    }
    return returnString;
  }
}
