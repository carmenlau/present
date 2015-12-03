@interface Dispatcher : NSObject

@property (strong, nonatomic, readonly) NSArray<FluxReducer *> *reducers;

#pragma mark - Init
+ (instancetype)sharedDispatcher;
- (instancetype)initWithReducers:(NSArray<FluxReducer *> *)reducers;

#pragma mark - Reducers
- (void)addReducer:(FluxReducer *)reducer;
- (void)removeReducer:(FluxReducer *)reducer;

#pragma mark - Dispatch
- (void)dispatchNotification:(NSString *)notificatioName
                  parameters:(NSDictionary *)parameters;

@end
