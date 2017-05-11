#import <Foundation/Foundation.h>
#import "User.h"
#import "Friend.h"
#import "Address.h"
#import "BirthdayUser.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        User *user1 = [[User alloc] initWithUserId:@1 FirstName:@"Alex" LastName:@"Yarets"];
        NSDictionary *address1 = @{@"city": @"Gomel", @"country": @"Belarus", @"cityCode": @"246000"};
        if ([User instancesRespondToSelector:@selector(setBirthdayDateFromString:)]) {
            [user1 setBirthdayDateFromString:@"12.05.1990"];
        }
        [user1 setAddress:address1];
        
        User *user2 = [[User alloc] initWithUserId:@2 FirstName:@"Dima" LastName:@"Petrov"];
        NSDictionary *address2 = @{@"country": @"Belarus", @"cityCode": @"246000"};
        [user2 setAddress:address2];
        User *user3 = [[User alloc] initWithUserId:@3 FirstName:@"Kolya" LastName:@"Sinitcin"];
        User *user4 = [[User alloc] initWithUserId:@4 FirstName:@"Anton" LastName:@"Sidorov"];
        User *user5 = [[User alloc] initWithUserId:@5 FirstName:@"Andrey" LastName:@"Ivanov"];
        User *user6 = [[User alloc] initWithUserId:@6 FirstName:@"Ilya" LastName:@"Rybov"];
        User *user7 = [[User alloc] initWithUserId:@7 FirstName:@"Igor" LastName:@"Illyk"];
        User *user8 = [[User alloc] initWithUserId:@8 FirstName:@"Ivan" LastName:@"Emelianov"];
        User *user9 = [[User alloc] initWithUserId:@9 FirstName:@"Petya" LastName:@"Serikov"];
        User *user10 = [[User alloc] initWithUserId:@10 FirstName:@"Kostya" LastName:@"Zaitsev"];
        
        NSArray *array = @[user1, user2, user3, user4, user5, user6, user7, user8, user9, user10];
        
        [array[0] addFollower:array[1]];
        [array[0] addFollower:array[2]];
        [array[0] addFollower:array[3]];
        [array[0] addFollower:array[4]];
        
        [array[0] addFollowing:array[5]];
        [array[0] addFollowing:array[6]];
        [array[0] addFollowing:array[7]];
        [array[0] addFollowing:array[8]];
        [array[0] addFollowing:array[9]];
        
        NSLog(@"%hhd", [array[0] isFollowerPerson:array[1]]);
        NSLog(@"%hhd", [array[0] isFollowerPerson:array[6]]);
        NSLog(@"%hhd", [array[0] isFollowingPerson:array[8]]);
        
        NSLog(@"Composite address user1: %@", [array[0] compositeAddress]);
        NSLog(@"Composite address user2: %@", [array[1] compositeAddress]);
        NSLog(@"Composite address user3: %@", [array[2] compositeAddress]);
        
        [user1 happyBirthday];
        
        NSLog(@"%@", array[0]);
        [array[0] removeFollower:array[2]];
        [array[0] removeFollowing:array[6]];
        NSLog(@"%@", array[0]);
        
        [user1 release];
        [user2 release];
        [user3 release];
        [user4 release];
        [user5 release];
        [user6 release];
        [user7 release];
        [user8 release];
        [user9 release];
        [user10 release];
    }
    return 0;
}
