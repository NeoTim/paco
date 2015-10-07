//
//  OrgJodaTimeDateTime+PacoDateHelper.m
//  Paco
//
//  Authored by  Tim N. O'Brien on 8/31/15.
//  Copyright (c) 2015 Paco. All rights reserved.
//

#import "OrgJodaTimeDateTime+PacoDateHelper.h"
#include "DateTime.h"


@implementation OrgJodaTimeDateTime (PacoDateHelper)


-(NSDate*) nsDateValue
{
     long ll = [self getMillis];
     /* divide by one thousand to convert to seconds since epoch*/
     NSDate * date =  [NSDate dateWithTimeIntervalSince1970:[self getMillis]/1000];
     return  date;
}

-(BOOL) isGreaterThan:(OrgJodaTimeDateTime*) otherTime;
{
    
    return ([self getMillis] > [otherTime getMillis]);
}


-(BOOL) isLessThan:(OrgJodaTimeDateTime*) otherTime;
{
    
    return ([self getMillis] < [otherTime getMillis]);
}

@end



