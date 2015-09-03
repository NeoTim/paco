//
//  ScheduleTestViewController.m
//  Paco
//
//  Created by northropo on 8/10/15.
//  Copyright (c) 2015 Paco. All rights reserved.
//

#import "ScheduleTestViewController.h"
#import "PacoNotificationManager.h"
#import "UILocalNotification+Paco.h"
#import "PAActionSpecification+PacoActionSpecification.h"


//
//  PacoScheduleGeneratorj2ObjC.m
//  Paco
//
//  Created by northropo on 8/19/15.
//  Copyright (c) 2015 Paco. All rights reserved.

#import <UIKit/UIKit.h>
#import "PacoSerializer.h"
#import "PacoExtendedClient.h"
#import "ActionScheduleGenerator.h"
#import "NSObject+J2objcKVO.h"


#include "ExperimentDAO.h"
#include "ExperimentDAOCore.h"
#include "ExperimentGroup.h"
#include "IOSClass.h"
#include "J2ObjC_source.h"
#include "ListMaker.h"
#include "Validator.h"
#include "java/lang/Boolean.h"
#include "java/lang/Integer.h"
#include "java/lang/Long.h"
#include "java/util/ArrayList.h"
#include "java/util/ArrayList.h"
#include "java/util/Arrays.h"
#include "java/util/List.h"
#import "ExperimentDAO.h"
#import <objc/runtime.h>
#include "ActionScheduleGenerator.h"
#include "ActionSpecification.h"
#include "ActionTrigger.h"
#include "DateMidnight.h"
#include "DateTime.h"
#include "EsmGenerator2.h"
#include "EsmSignalStore.h"
#include "EventStore.h"
#include "ExperimentDAO.h"
#include "ExperimentGroup.h"
#include "Interval.h"
#include "J2ObjC_source.h"
#include "NonESMSignalGenerator.h"
#include "PacoAction.h"
#include "PacoNotificationAction.h"
#include "Schedule.h"
#include "ScheduleTrigger.h"
#include "SignalTime.h"
#include "TimeUtil.h"
#include "java/lang/Boolean.h"
#include "java/lang/IllegalStateException.h"
#include "java/lang/Integer.h"
#include "java/lang/Long.h"
#include "java/util/ArrayList.h"
#include "java/util/Collections.h"
#include "java/util/List.h"
#include "org/joda/time/Hours.h"
#include "org/joda/time/Duration.h"
#include "EsmGenerator2.h"
#include "PacoSerializeUtil.h"
#import  "PacoSignalStore.h"
#import   "PacoEventStore.h"
#import   "DateTime.h"
#import  "NSObject+J2objcKVO.h"
#import  "OrgJodaTimeDateTime+PacoDateHelper.h"




@interface ScheduleTestViewController ()

@property (nonatomic,strong)   NSMutableDictionary* processing;

@end

@implementation ScheduleTestViewController
{
    PacoNotificationManager*  notificationManager;
    
}

static NSString *def2 =
@" {\r\n  \"title\": \"How Many Conversations\",\r\n  \"description\": \"How many conversations are going on around you\",\r\n  \"creator\": \"northropo@google.com\",\r\n  \"organization\": \"Google\",\r\n  \"contactEmail\": \"northropo@google.com\",\r\n  \"id\": 5717865130885120,\r\n  \"recordPhoneDetails\": false,\r\n  \"extraDataCollectionDeclarations\": [],\r\n  \"deleted\": false,\r\n  \"modifyDate\": \"2015\/09\/02\",\r\n  \"published\": false,\r\n  \"admins\": [\r\n    \"northropo@google.com\"\r\n  ],\r\n  \"publishedUsers\": [],\r\n  \"version\": 7,\r\n  \"groups\": [\r\n    {\r\n      \"name\": \"New Group\",\r\n      \"customRendering\": false,\r\n      \"fixedDuration\": true,\r\n      \"startDate\": \"2015\/9\/1\",\r\n      \"endDate\": \"2015\/9\/10\",\r\n      \"logActions\": false,\r\n      \"backgroundListen\": false,\r\n      \"actionTriggers\": [\r\n        {\r\n          \"type\": \"scheduleTrigger\",\r\n          \"actions\": [\r\n            {\r\n              \"actionCode\": 1,\r\n              \"id\": 1441060623472,\r\n              \"type\": \"pacoNotificationAction\",\r\n              \"snoozeCount\": 0,\r\n              \"snoozeTime\": 600000,\r\n              \"timeout\": 15,\r\n              \"delay\": 5000,\r\n              \"msgText\": \"Time to participate\",\r\n              \"snoozeTimeInMinutes\": 10,\r\n              \"nameOfClass\": \"com.pacoapp.paco.shared.model2.PacoNotificationAction\"\r\n            }\r\n          ],\r\n          \"id\": 1441060623471,\r\n          \"schedules\": [\r\n            {\r\n              \"scheduleType\": 4,\r\n              \"esmFrequency\": 8,\r\n              \"esmPeriodInDays\": 0,\r\n              \"esmStartHour\": 32400000,\r\n              \"esmEndHour\": 61200000,\r\n              \"signalTimes\": [\r\n                {\r\n                  \"type\": 0,\r\n                  \"fixedTimeMillisFromMidnight\": 0,\r\n                  \"missedBasisBehavior\": 1,\r\n                  \"nameOfClass\": \"com.pacoapp.paco.shared.model2.SignalTime\"\r\n                }\r\n              ],\r\n              \"repeatRate\": 1,\r\n              \"weekDaysScheduled\": 0,\r\n              \"nthOfMonth\": 1,\r\n              \"byDayOfMonth\": true,\r\n              \"dayOfMonth\": 1,\r\n              \"esmWeekends\": true,\r\n              \"minimumBuffer\": 59,\r\n              \"joinDateMillis\": 0,\r\n              \"id\": 1441060623473,\r\n              \"onlyEditableOnJoin\": false,\r\n              \"userEditable\": true,\r\n              \"nameOfClass\": \"com.pacoapp.paco.shared.model2.Schedule\"\r\n            }\r\n          ],\r\n          \"nameOfClass\": \"com.pacoapp.paco.shared.model2.ScheduleTrigger\"\r\n        }\r\n      ],\r\n      \"inputs\": [],\r\n      \"endOfDayGroup\": false,\r\n      \"feedback\": {\r\n        \"text\": \"Thanks for Participating!\",\r\n        \"type\": 0,\r\n        \"nameOfClass\": \"com.pacoapp.paco.shared.model2.Feedback\"\r\n      },\r\n      \"feedbackType\": 0,\r\n      \"nameOfClass\": \"com.pacoapp.paco.shared.model2.ExperimentGroup\"\r\n    }\r\n  ],\r\n  \"ringtoneUri\": \"\/assets\/ringtone\/Paco Bark\",\r\n  \"postInstallInstructions\": \"<b>You have successfully joined the experiment!<\/b><br\/><br\/>No need to do anything else for now.<br\/><br\/>Paco will send you a notification when it is time to participate.<br\/><br\/>Be sure your ringer\/buzzer is on so you will hear the notification.\",\r\n  \"nameOfClass\": \"com.pacoapp.paco.shared.model2.ExperimentDAO\"\r\n}";


static NSString *def1 =
@"{\r\n  \"title\": \"Drink Water\",\r\n  \"description\": \"tim obrien\",\r\n  \"creator\": \"northropo@google.com\",\r\n  \"organization\": \"Self\",\r\n  \"contactEmail\": \"northropo@google.com\",\r\n  \"id\": 5755617021001728,\r\n  \"recordPhoneDetails\": false,\r\n  \"extraDataCollectionDeclarations\": [],\r\n  \"deleted\": false,\r\n  \"modifyDate\": \"2015\/09\/02\",\r\n  \"published\": false,\r\n  \"admins\": [\r\n    \"northropo@google.com\"\r\n  ],\r\n  \"publishedUsers\": [],\r\n  \"version\": 26,\r\n  \"groups\": [\r\n    {\r\n      \"name\": \"New Group\",\r\n      \"customRendering\": false,\r\n      \"fixedDuration\": true,\r\n      \"startDate\": \"2015\/8\/29\",\r\n      \"endDate\": \"2015\/9\/10\",\r\n      \"logActions\": false,\r\n      \"backgroundListen\": false,\r\n      \"actionTriggers\": [\r\n        {\r\n          \"type\": \"scheduleTrigger\",\r\n          \"actions\": [\r\n            {\r\n              \"actionCode\": 1,\r\n              \"id\": 1440120356423,\r\n              \"type\": \"pacoNotificationAction\",\r\n              \"snoozeCount\": 0,\r\n              \"snoozeTime\": 600000,\r\n              \"timeout\": 15,\r\n              \"delay\": 5000,\r\n              \"msgText\": \"Time to participate\",\r\n              \"snoozeTimeInMinutes\": 10,\r\n              \"nameOfClass\": \"com.pacoapp.paco.shared.model2.PacoNotificationAction\"\r\n            }\r\n          ],\r\n          \"id\": 1440120356422,\r\n          \"schedules\": [\r\n            {\r\n              \"scheduleType\": 0,\r\n              \"esmFrequency\": 3,\r\n              \"esmPeriodInDays\": 0,\r\n              \"esmStartHour\": 32400000,\r\n              \"esmEndHour\": 61200000,\r\n              \"signalTimes\": [\r\n                {\r\n                  \"type\": 0,\r\n                  \"fixedTimeMillisFromMidnight\": 32400000,\r\n                  \"missedBasisBehavior\": 1,\r\n                  \"label\": \"Nine AM\",\r\n                  \"nameOfClass\": \"com.pacoapp.paco.shared.model2.SignalTime\"\r\n                },\r\n                {\r\n                  \"type\": 0,\r\n                  \"fixedTimeMillisFromMidnight\": 36000000,\r\n                  \"missedBasisBehavior\": 1,\r\n                  \"label\": \"Three PM\",\r\n                  \"nameOfClass\": \"com.pacoapp.paco.shared.model2.SignalTime\"\r\n                },\r\n                {\r\n                  \"type\": 0,\r\n                  \"fixedTimeMillisFromMidnight\": 57600000,\r\n                  \"missedBasisBehavior\": 1,\r\n                  \"label\": \"4 PM\",\r\n                  \"nameOfClass\": \"com.pacoapp.paco.shared.model2.SignalTime\"\r\n                }\r\n              ],\r\n              \"repeatRate\": 1,\r\n              \"weekDaysScheduled\": 0,\r\n              \"nthOfMonth\": 1,\r\n              \"byDayOfMonth\": true,\r\n              \"dayOfMonth\": 1,\r\n              \"esmWeekends\": false,\r\n              \"minimumBuffer\": 59,\r\n              \"joinDateMillis\": 0,\r\n              \"id\": 1440120356424,\r\n              \"onlyEditableOnJoin\": false,\r\n              \"userEditable\": false,\r\n              \"nameOfClass\": \"com.pacoapp.paco.shared.model2.Schedule\"\r\n            }\r\n          ],\r\n          \"nameOfClass\": \"com.pacoapp.paco.shared.model2.ScheduleTrigger\"\r\n        }\r\n      ],\r\n      \"inputs\": [],\r\n      \"endOfDayGroup\": false,\r\n      \"feedback\": {\r\n        \"text\": \"Thanks for Participating!\",\r\n        \"type\": 0,\r\n        \"nameOfClass\": \"com.pacoapp.paco.shared.model2.Feedback\"\r\n      },\r\n      \"feedbackType\": 0,\r\n      \"nameOfClass\": \"com.pacoapp.paco.shared.model2.ExperimentGroup\"\r\n    }\r\n  ],\r\n  \"ringtoneUri\": \"\/assets\/ringtone\/Paco Bark\",\r\n  \"postInstallInstructions\": \"<b>You have successfully joined the experiment!<\/b><br\/><br\/>No need to do anything else for now.<br\/><br\/>Paco will send you a notification when it is time to participate.<br\/><br\/>Be sure your ringer\/buzzer is on so you will hear the notification.\",\r\n  \"nameOfClass\": \"com.pacoapp.paco.shared.model2.ExperimentDAO\"\r\n}";


static NSString *def0 =
@"{\r\n  \"title\": \"Is Odds Changed\",\r\n  \"description\": \"Find check if odds have been recalculated\",\r\n  \"creator\": \"northropo@google.com\",\r\n  \"organization\": \"Pennies and Dimes\",\r\n  \"contactEmail\": \"northropo@google.com\",\r\n  \"id\": 5739463179239424,\r\n  \"recordPhoneDetails\": false,\r\n  \"extraDataCollectionDeclarations\": [],\r\n  \"deleted\": false,\r\n  \"modifyDate\": \"2015\/09\/02\",\r\n  \"published\": false,\r\n  \"admins\": [\r\n    \"northropo@google.com\"\r\n  ],\r\n  \"publishedUsers\": [],\r\n  \"version\": 15,\r\n  \"groups\": [\r\n    {\r\n      \"name\": \"New Group\",\r\n      \"customRendering\": false,\r\n      \"fixedDuration\": true,\r\n      \"startDate\": \"2015\/8\/31\",\r\n      \"endDate\": \"2015\/9\/10\",\r\n      \"logActions\": false,\r\n      \"backgroundListen\": false,\r\n      \"actionTriggers\": [\r\n        {\r\n          \"type\": \"scheduleTrigger\",\r\n          \"actions\": [\r\n            {\r\n              \"actionCode\": 1,\r\n              \"id\": 1441060481422,\r\n              \"type\": \"pacoNotificationAction\",\r\n              \"snoozeCount\": 0,\r\n              \"snoozeTime\": 600000,\r\n              \"timeout\": 15,\r\n              \"delay\": 5000,\r\n              \"msgText\": \"Time to participate\",\r\n              \"snoozeTimeInMinutes\": 10,\r\n              \"nameOfClass\": \"com.pacoapp.paco.shared.model2.PacoNotificationAction\"\r\n            }\r\n          ],\r\n          \"id\": 1441060481421,\r\n          \"schedules\": [\r\n            {\r\n              \"scheduleType\": 0,\r\n              \"esmFrequency\": 3,\r\n              \"esmPeriodInDays\": 0,\r\n              \"esmStartHour\": 32400000,\r\n              \"esmEndHour\": 61200000,\r\n              \"signalTimes\": [\r\n                {\r\n                  \"type\": 0,\r\n                  \"fixedTimeMillisFromMidnight\": 28800000,\r\n                  \"missedBasisBehavior\": 1,\r\n                  \"label\": \"Eight AM\",\r\n                  \"nameOfClass\": \"com.pacoapp.paco.shared.model2.SignalTime\"\r\n                },\r\n                {\r\n                  \"type\": 0,\r\n                  \"fixedTimeMillisFromMidnight\": 39600000,\r\n                  \"missedBasisBehavior\": 1,\r\n                  \"label\": \"Eleven AM\",\r\n                  \"nameOfClass\": \"com.pacoapp.paco.shared.model2.SignalTime\"\r\n                },\r\n                {\r\n                  \"type\": 0,\r\n                  \"fixedTimeMillisFromMidnight\": 56700000,\r\n                  \"missedBasisBehavior\": 1,\r\n                  \"label\": \"Three Forty Five PM\",\r\n                  \"nameOfClass\": \"com.pacoapp.paco.shared.model2.SignalTime\"\r\n                },\r\n                {\r\n                  \"type\": 0,\r\n                  \"fixedTimeMillisFromMidnight\": 75600000,\r\n                  \"missedBasisBehavior\": 1,\r\n                  \"label\": \"Nine PM\",\r\n                  \"nameOfClass\": \"com.pacoapp.paco.shared.model2.SignalTime\"\r\n                },\r\n                {\r\n                  \"type\": 0,\r\n                  \"fixedTimeMillisFromMidnight\": 82800000,\r\n                  \"missedBasisBehavior\": 1,\r\n                  \"label\": \"eleven pm\",\r\n                  \"nameOfClass\": \"com.pacoapp.paco.shared.model2.SignalTime\"\r\n                }\r\n              ],\r\n              \"repeatRate\": 1,\r\n              \"weekDaysScheduled\": 0,\r\n              \"nthOfMonth\": 1,\r\n              \"byDayOfMonth\": true,\r\n              \"dayOfMonth\": 1,\r\n              \"esmWeekends\": false,\r\n              \"minimumBuffer\": 59,\r\n              \"joinDateMillis\": 0,\r\n              \"id\": 1441060481423,\r\n              \"onlyEditableOnJoin\": false,\r\n              \"userEditable\": true,\r\n              \"nameOfClass\": \"com.pacoapp.paco.shared.model2.Schedule\"\r\n            }\r\n          ],\r\n          \"nameOfClass\": \"com.pacoapp.paco.shared.model2.ScheduleTrigger\"\r\n        }\r\n      ],\r\n      \"inputs\": [],\r\n      \"endOfDayGroup\": false,\r\n      \"feedback\": {\r\n        \"text\": \"Thanks for Participating!\",\r\n        \"type\": 0,\r\n        \"nameOfClass\": \"com.pacoapp.paco.shared.model2.Feedback\"\r\n      },\r\n      \"feedbackType\": 0,\r\n      \"nameOfClass\": \"com.pacoapp.paco.shared.model2.ExperimentGroup\"\r\n    }\r\n  ],\r\n  \"ringtoneUri\": \"\/assets\/ringtone\/Paco Bark\",\r\n  \"postInstallInstructions\": \"<b>You have successfully joined the experiment!<\/b><br\/><br\/>No need to do anything else for now.<br\/><br\/>Paco will send you a notification when it is time to participate.<br\/><br\/>Be sure your ringer\/buzzer is on so you will hear the notification.\",\r\n  \"nameOfClass\": \"com.pacoapp.paco.shared.model2.ExperimentDAO\"\r\n}";




- (void)viewDidLoad {
    [super viewDidLoad];
    
    _processing  = [[NSMutableDictionary  alloc] init];
    
}
- (IBAction)firePointFive:(id)sender
{
   
   
    notificationManager =[PacoNotificationManager managerWithDelegate:self firstLaunchFlag:NO];
    [_firstTime.text intValue];
    NSDate* firstFireDate = [NSDate dateWithTimeIntervalSinceNow:[_firstTime.text intValue]]; //active
    
    /* schedule nofitification */
    NSTimeInterval timeoutInterval = 479*60;
    NSDate* secondFireDate = [NSDate dateWithTimeIntervalSinceNow:[_secondTime.text intValue]]; //active
    NSDate* secondTimeout = [NSDate dateWithTimeInterval:timeoutInterval sinceDate:firstFireDate];
    NSString* experimentId3 = @"3";
    NSString* title3 = @"title3";
    UILocalNotification* secondNoti = [UILocalNotification pacoNotificationWithExperimentId:experimentId3
                                                                            experimentTitle:title3
                                                                                   fireDate:secondFireDate
                                                                                timeOutDate:secondTimeout];
    
    /* end this */
    
    
    [notificationManager scheduleNotifications:@[secondNoti]];
    
    
    
    
    /*
    UILocalNotification *localNotif = [[UILocalNotification alloc] init];
    if (localNotif == nil) return;
    NSDate *fireTime = [[NSDate date] addTimeInterval:.5]; // adds 10 secs
    localNotif.fireDate = fireTime;
    localNotif.alertBody = @"Alert!";
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotif];
     */
    
}


-(PAExperimentDAO*) experimentDAO
{
    
    NSData* data = [def0 dataUsingEncoding:NSUTF8StringEncoding];
    PacoSerializer* serializer =
    [[PacoSerializer alloc] initWithArrayOfClasses:nil
                          withNameOfClassAttribute:@"nameOfClass"];
    
    JavaUtilArrayList  *  resultArray  = (JavaUtilArrayList*) [serializer buildObjectHierarchyFromJSONOBject:data];
    IOSObjectArray * iosArray = [resultArray toArray];
    
    PAExperimentDAO * dao =  [iosArray objectAtIndex:0];
    return dao;
    
}

-(PAExperimentDAO*) experimentDAO1
{
    
    NSData* data = [def1 dataUsingEncoding:NSUTF8StringEncoding];
    PacoSerializer* serializer =
    [[PacoSerializer alloc] initWithArrayOfClasses:nil
                          withNameOfClassAttribute:@"nameOfClass"];
    
    JavaUtilArrayList  *  resultArray  = (JavaUtilArrayList*) [serializer buildObjectHierarchyFromJSONOBject:data];
    IOSObjectArray * iosArray = [resultArray toArray];
    
    PAExperimentDAO * dao =  [iosArray objectAtIndex:0];
    return dao;
    
}

-(PAExperimentDAO*) experimentDAO2
{
    
    NSData* data = [def2 dataUsingEncoding:NSUTF8StringEncoding];
    PacoSerializer* serializer =
    [[PacoSerializer alloc] initWithArrayOfClasses:nil
                          withNameOfClassAttribute:@"nameOfClass"];
    
    JavaUtilArrayList  *  resultArray  = (JavaUtilArrayList*) [serializer buildObjectHierarchyFromJSONOBject:data];
    IOSObjectArray * iosArray = [resultArray toArray];
    
    PAExperimentDAO * dao =  [iosArray objectAtIndex:0];
    return dao;
    
}





- (IBAction)Test:(id)sender
{
    
    
    PAExperimentDAO      * dao            = [self experimentDAO];
    PAExperimentDAO      * dao1          = [self experimentDAO1];
    PAExperimentDAO      * dao2           = [self experimentDAO2];
    JavaUtilArrayList* list               = [[JavaUtilArrayList  alloc]    init];
    PacoSignalStore * signalStore         = [[PacoSignalStore alloc] init];
    PacoEventStore * eventStore           = [[PacoEventStore  alloc] init];
    
    
    [list addWithId:dao];
    [list addWithId:dao1];
    [list addWithId:dao2];
    
    
    
     NSMutableDictionary * results = [[NSMutableDictionary alloc] init];
     [results setObject:[NSMutableArray new] forKey:[self uniqueId:dao]];
     [results setObject:[NSMutableArray new] forKey:[self uniqueId:dao1]];
     [results setObject:[NSMutableArray new] forKey:[self uniqueId:dao2]];
    
     dispatch_group_t d_group = dispatch_group_create();
    dispatch_queue_t bg_queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

   /* is odds changed */
   // dispatch_group_async(d_group, bg_queue, ^{
        
        
           [self getFireTimes:dao results:results SignalStore:signalStore EventStore: eventStore];
   // });
   
// 
    /* drink water */ 
   // dispatch_group_async(d_group, bg_queue, ^{
    
        [self getFireTimes:dao1 results:results SignalStore:signalStore EventStore: eventStore];
    
     //});
    
//      [self getFireTimes:dao2 results:results SignalStore:signalStore EventStore: eventStore];
    
    
      NSArray* array =  [self processFireTimes:results];
      NSLog(@" FIRE TIMES -> %@", array);
    
//   /* count conversations */
//    dispatch_group_async(d_group, bg_queue, ^{
//        
//        [self getFireTimes:dao2 results:results SignalStore:signalStore EventStore: eventStore];
//        
//    });
  
    /* is odds changed*/
     dispatch_group_wait(d_group, DISPATCH_TIME_FOREVER);
 
      NSLog(@" show events %@", results);
 
}

-(NSArray*) processFireTimes:(NSDictionary*) fireTimes
{
    
    NSMutableArray * unionOfAllTimes = [[NSMutableArray alloc] init];
    NSArray* allValues = [fireTimes allValues];
   
    for(NSMutableArray * definitions in allValues)
    {
        [unionOfAllTimes  addObjectsFromArray:definitions];
    }
    
    
    NSArray *sortedArray;
    sortedArray = [unionOfAllTimes sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
    
          PAActionSpecification *actionDefinitionA =(PAActionSpecification*) a;
          PAActionSpecification *actionDefinitionB =(PAActionSpecification*) b;
           if( [actionDefinitionA->time_ isGreaterThan:actionDefinitionB->time_] )
           {
               
               return  NSOrderedDescending;
               
           }
        else
        {
            return  NSOrderedAscending;
            
            
            
        }
        
    }];
    
    return sortedArray;
}

-(void ) getFireTimes:(PAExperimentDAO*)  definition  results:(NSMutableDictionary*) results  SignalStore:( id<PAEsmSignalStore>)signalStore EventStore:( id<PAEventStore>)eventStore
{
    
 

        OrgJodaTimeDateTime *  nextTime =  [OrgJodaTimeDateTime  now];
        PAActionSpecification *actionDefinition;
        int count  =0;
         do {
      
          PAActionScheduleGenerator *actionScheduleGenerator = [[PAActionScheduleGenerator alloc] initWithPAExperimentDAO:definition];
             
             
          actionDefinition   = [actionScheduleGenerator getNextTimeFromNowWithOrgJodaTimeDateTime:nextTime withPAEsmSignalStore:signalStore withPAEventStore:eventStore];
             
            if( actionDefinition|| count++ >=60)
            {
                
                nextTime = [actionDefinition->time_ plusMinutesWithInt:1];
                NSMutableArray* mArray =[results objectForKey:[self uniqueId:definition]];
                [mArray  addObject:actionDefinition];
                NSLog(@" added  %@", actionDefinition);
            }
          
            
        } while (actionDefinition !=nil  );
        
    
    
    
}


-(NSDictionary*) getNextTimes:(id<JavaUtilList>)  definitions  SignalStore:( id<PAEsmSignalStore>)signalStore EventStore:( id<PAEventStore>)eventStore
{
    
    NSMutableDictionary* processing = [[NSMutableDictionary  alloc] init];
    for(NSObject* object in definitions)
    {
          NSMutableArray* mutableArray= [[NSMutableArray alloc] init];
          [processing setObject:mutableArray forKey:[self uniqueId:object] ];
    }
    
    id<JavaUtilList>   specificationList=nil;
    OrgJodaTimeDateTime *  nextTime =  [OrgJodaTimeDateTime  now];
    
    /*
    
    PAActionScheduleGenerator *actionScheduleGenerator = [[PAActionScheduleGenerator alloc] initWithPAExperimentDAO:experiment];
    PAActionSpecification *nextTimeFromNow = [actionScheduleGenerator getNextTimeFromNowWithOrgJodaTimeDateTime:now withPAEsmSignalStore:alarmStore withPAEventStore:eventStore];
     
     */
    
    
    do {
        
       specificationList   =   [PAActionScheduleGenerator arrangeExperimentsByNextTimeFromWithJavaUtilList:definitions withOrgJodaTimeDateTime:nextTime withPAEsmSignalStore:signalStore withPAEventStore:eventStore];
        
        
        NSLog(@" specification list %@", specificationList);

        for(int i =0; i <[specificationList size]; i ++)
        {
            PAActionSpecification*  action = [specificationList getWithInt:i];
            NSObject * descriptionKey =action->experiment_;
            
           if(  [[processing allKeys] containsObject:[self uniqueId:descriptionKey]] )
           {
                NSMutableArray* mArray =[processing objectForKey:[self uniqueId:descriptionKey]];
                [mArray  addObject:action];
                [self handleOngoing:processing Definitions:definitions];
           }
            else
            {
                assert(NO);
            }
        }
   
     nextTime =  [self nextTime:specificationList];
        
        
       // NSLog(@"NEXT TIME -> %@", nextTime.description);
        
        
        
        
    } while ([specificationList size] > 0 );
    
   NSLog(@"processing %@", processing);

    return processing;
}

-(OrgJodaTimeDateTime*) nextTime:(id<JavaUtilList>)  list
{
     PAActionSpecification* specification;
     OrgJodaTimeDateTime* iterTimeTime;
     OrgJodaTimeDateTime* previousEarliestTime;
    
    NSLog(@" next times %@ \n\n", list);
    
    for(specification in list)
    {
        if(  previousEarliestTime ==nil ||  ([previousEarliestTime  isGreaterThan:specification->time_] ))
        {
            previousEarliestTime = specification->time_;
        }
 
    }
    
    NSLog(@" next time %@", previousEarliestTime);
    return [previousEarliestTime plusMinutesWithInt:1];
    
}



-(void) handleOngoing :(NSDictionary*) actionSpecifications Definitions:(id<JavaUtilList>) definitions
{
    
    NSArray * keys = [actionSpecifications allKeys];
    NSValue* value =nil;
    
    for(value in keys)
    {
        PAExperimentDAO * dao = (PAExperimentDAO*)   [value pointerValue];
        JavaUtilArrayList* groups =  [dao valueForKeyEx:@"groups"];
        BOOL isOngoing = NO;
        
        for(int i=0; i < [groups size]; i++)
        {
            PAExperimentGroup * group = [groups getWithInt:i];
            bool b  = [group getFixedDuration].booleanValue;
            isOngoing = b;
        }
        
        if(/*isOngoing &&*/ [[actionSpecifications objectForKey:value] count] >= 60)
        {
            [definitions removeWithId:dao];
        }
 
    }
}


/*
 Logic 
 
 
 looping over all experiments  until we have
 
 for type running get   60
 for type fixed get  60
 
 merge sort
 
 
 
 
 */

/*
 
 - (instancetype)initWithOrgJodaTimeDateTime:(OrgJodaTimeDateTime *)nextTime
 withPAExperimentDAO:(PAExperimentDAO *)experiment
 withPAExperimentGroup:(PAExperimentGroup *)experimentGroup
 withPAActionTrigger:(PAActionTrigger *)actionTrigger
 withPAPacoNotificationAction:(PAPacoNotificationAction *)action
 withJavaLangLong:(JavaLangLong *)actionTriggerSpecId;
 
 */


-(NSValue*) uniqueId:(NSObject*) actionSpecification
{
    return [NSValue valueWithPointer:(__bridge const void *)(actionSpecification)];
}





- (void)handleExpiredNotifications:(NSArray*)expiredNotifications
{
    
    NSLog(@" handle expired notification");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
