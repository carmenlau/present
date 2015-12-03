@interface FluxStore : NSObject

@property (strong, nonatomic) NSDictionary *user;
@property (strong, nonatomic) NSDictionary *following;
@property (strong, nonatomic) NSDictionary *topic;
@property (strong, nonatomic) NSDictionary *sharing;
@property (strong, nonatomic) NSDictionary *comment;

+ (instancetype)sharedStore;

#pragma mark - Persistent Store
- (void)restoreFromPersistentStore;
- (void)saveToPersistentStore;

@end
