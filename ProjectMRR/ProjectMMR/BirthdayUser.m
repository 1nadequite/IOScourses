#import <Foundation/Foundation.h>
#import "BirthdayUser.h"

@implementation User (BirthdayUser)

- (void)happyBirthday {
    if ([self isTodayBirthday]) {
        NSLog(@"Happy Birthday %@ %@!!!", self.firstName, self.lastName);
    }
}
- (BOOL)isTodayBirthday {
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormat = [[[NSDateFormatter alloc] init] autorelease];
    [dateFormat setDateFormat:@"dd.MM"];
    return [[dateFormat stringFromDate:self.birthDate] isEqual:[dateFormat stringFromDate:today]];
}
- (void)setBirthdayDateFromString:(NSString *)date {
    NSDateFormatter *dateFormat = [[[NSDateFormatter alloc] init] autorelease];
    [dateFormat setDateFormat:@"dd.MM.yy"];
    [self setBirthDate:[dateFormat dateFromString:date]];
}

@end
