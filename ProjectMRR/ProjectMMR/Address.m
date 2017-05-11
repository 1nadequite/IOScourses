#import <Foundation/Foundation.h>
#import "Address.h"

@implementation User (AddressUser)

- (NSString *)compositeAddress {
    NSString *userAddress;
    if (self.country && self.city) {
        userAddress = [NSString stringWithFormat:@"%@, %@", self.country, self.city];
    } else if (self.city) {
        userAddress = [NSString stringWithFormat:@"%@", self.city];
    } else if (self.country) {
        userAddress = [NSString stringWithFormat:@"%@", self.country];
    } else {
        userAddress = @"unknown";
    }
    return userAddress;
}

@end
