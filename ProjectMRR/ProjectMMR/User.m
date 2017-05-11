#import <Foundation/Foundation.h>
#import "User.h"

@interface User() {
    NSMutableArray *_followers;
    NSMutableArray *_following;
}
@end

@implementation User

@synthesize userId = _userId;
@synthesize firstName = _firstName;
@synthesize lastName = _lastName;
@synthesize birthDate = _birthDate;
@synthesize followers = _followers;
@synthesize following = _following;
@synthesize address = _address;
@synthesize city = _city;
@synthesize country = _country;
@synthesize contactUser = _contactUser;

#pragma mark - Constructor-methods

+ (instancetype)userWithUserId:(NSNumber *)newUserId {
    return [[[self alloc] initWithUserId:newUserId FirstName:nil LastName:nil] autorelease];
}
+ (instancetype)userWithFirstName:(NSString *)newFirstName
                         LastName:(NSString *)newLastName {
    return [[[self alloc] initWithUserId:nil FirstName:newFirstName LastName:newLastName] autorelease];
}
- (id)initWithUserId:(id)newUserId
           FirstName:(id)newFirstName
            LastName:(id)newLastName {
    if (self = [super init]) {
        _userId = newUserId;
        _firstName = newFirstName;
        _lastName = newLastName;
        _followers = [[NSMutableArray alloc] init];
        _following = [[NSMutableArray alloc] init];
    }
    return self;
}

#pragma mark - Methods

- (NSNumber *)userId {
    @synchronized (self) {
        return [[_userId retain] autorelease];
    }
}
- (NSString *)firstName {
    return _firstName;
}
- (NSString *)lastName {
    return [[_lastName mutableCopy] autorelease];
}
- (NSArray *)followers {
    @synchronized (self) {
        return [[_followers copy] autorelease];
    }
}
- (NSMutableArray *)city {
    return _address[@"city"];
}
- (NSMutableArray *)country {
    return _address[@"country"];
}
- (BOOL)isContactUser {
    return _contactUser;
}
- (void)setUserId:(NSNumber *)newUserId {
    @synchronized (self) {
        if (_userId != newUserId) {
            [newUserId retain];
            [_userId release];
            _userId = newUserId;
        }
    }
}
- (void)setFirstName:(NSMutableString *)newFirstName {
    [newFirstName retain];
    [_firstName release];
    _firstName = newFirstName;
}
- (void)setLastName:(NSMutableString *)newLastName {
    if (_lastName != newLastName) {
        [_lastName release];
        _lastName = [newLastName mutableCopy];
    }
}
- (void)setFollowers:(NSArray *)newFollowers {
    @synchronized (self) {
        if (_followers != newFollowers) {
            [_followers release];
            _followers = [newFollowers copy];
        }
    }
}
- (void)setAddress:(NSDictionary *)newAddress {
    [newAddress retain];
    [_address release];
    _address = newAddress;
}
- (void)setContactUser:(BOOL)newContactUser {
    _contactUser = newContactUser;
}

- (void)setFirstName:(id)newFirstName andLastName:(id)newLastName {
    [self setFirstName:newFirstName];
    [self setLastName:newLastName];
}
- (void)printFullName {
    NSLog(@"%@ %@", self.firstName, self.lastName);
}

- (NSString*)description {
    NSMutableString *userInfo = [[[NSMutableString alloc] init] autorelease];
    NSDateFormatter *dateFormat = [[[NSDateFormatter alloc] init] autorelease];
    [dateFormat setDateFormat:@"dd.MM.yy"];
    [userInfo appendString:[NSString stringWithFormat:@"(id: %@) - %@ %@\n", self.userId, self.firstName, self.lastName]];
    [userInfo appendString:[NSString stringWithFormat:@"Birth date: %@\n", [dateFormat stringFromDate:self.birthDate]]];
    [userInfo appendString:@"Address:\n"];
    for (NSString* key in self.address) {
        [userInfo appendString:[NSString stringWithFormat:@"    %@: %@\n", key, [self.address objectForKey:key]]];
    }
    [userInfo appendString:@"Followers:\n"];
    for (User *user in self.followers) {
        [userInfo appendString:[NSString stringWithFormat:@"    (id: %@) - %@ %@\n", user.userId, user.firstName, user.lastName]];
    }
    [userInfo appendString:@"Followings:\n"];
    for (User *user in self.following) {
        [userInfo appendString:[NSString stringWithFormat:@"    (id: %@) - %@ %@\n", user.userId, user.firstName, user.lastName]];
    }
    return userInfo;
}

- (void)dealloc {
    [_userId release];
    [_firstName release];
    [_lastName release];
    [_birthDate release];
    [_followers release];
    [_following release];
    [_address release];
    [_city release];
    [_country release];
    [super dealloc];
}

@end

@implementation User (FollowerUser)

- (void)addFollower:(User *)user {
    [_followers addObject:user];
}
- (void)removeFollower:(User *)user {
    [_followers removeObject:user];
}
- (BOOL)isFollowerPerson:(User *)user {
    return [_followers containsObject:(user)];
}

@end

@implementation User (FollowingUser)

- (void)addFollowing:(User *)user {
    [_following addObject:user];
}
- (void)removeFollowing:(User *)user {
    [_following removeObject:user];
}
- (BOOL)isFollowingPerson:(User *)user {
    return [_following containsObject:(user)];
}

@end
