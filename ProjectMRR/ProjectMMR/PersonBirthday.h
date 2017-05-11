#ifndef PersonBirthday_h
#define PersonBirthday_h

@protocol PersonBirthday <NSObject>

@optional
- (void)happyBirthday;

@required
- (BOOL)isTodayBirthday;
- (void)setBirthdayDateFromString:(NSString *)date;

@end

#endif
