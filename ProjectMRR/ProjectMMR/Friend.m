#import <Foundation/Foundation.h>
#import "Friend.h"

@implementation Friend

@synthesize blocked = _blocked;

#pragma mark - Methods

- (BOOL)isBlocked {
    return self.blocked.boolValue;
}

- (NSString*)description {
    NSString *userInfo = [NSString stringWithFormat:@"%@\nUser is%@ blocked\n", [super description], [self isBlocked] ? @"" : @"'n"];
    return userInfo;
}

- (void)dealloc {
    [_blocked release];
    [super dealloc];
}

@end
