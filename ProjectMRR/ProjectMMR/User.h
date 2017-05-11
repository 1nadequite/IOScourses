#ifndef User_h
#define User_h

//@class Friend;

@interface User : NSObject

@property (atomic, retain) NSNumber *userId;
@property (nonatomic, retain) NSMutableString *firstName;
@property (nonatomic, copy) NSMutableString *lastName;
@property (nonatomic, retain) NSDate *birthDate;
@property (atomic, copy) NSArray *followers;
@property (nonatomic, copy) NSArray *following;
@property (nonatomic, retain) NSDictionary *address;
@property (nonatomic, copy, readonly) NSString *city;
@property (nonatomic, copy, readonly) NSString *country;
@property (nonatomic, assign, readonly, getter=isContactUser) BOOL contactUser;

+ (instancetype)userWithUserId:(NSNumber *)userId;
+ (instancetype)userWithFirstName:(NSMutableString *)firstName
                         LastName:(NSMutableString *)lastName;
- (id)initWithUserId:(id)userId
           FirstName:(id)firstName
            LastName:(id)lastName;

- (void)setFirstName:(id)firstName andLastName:(id)lastName;
- (void)printFullName;

@end

@interface User (FollowerUser)

- (void)addFollower:(User *)user;
- (void)removeFollower:(User *)user;
- (BOOL)isFollowerPerson:(User *)user;

@end

@interface User (FollowingUser)

- (void)addFollowing:(User *)user;
- (void)removeFollowing:(User *)user;
- (BOOL)isFollowingPerson:(User *)user;

@end

#endif
