#ifndef Friend_h
#define Friend_h

#import "User.h"

@interface Friend : User

@property (nonatomic, copy) NSNumber *blocked;

- (BOOL)isBlocked;

@end

#endif
