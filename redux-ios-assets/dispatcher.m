// 1 OMIT
- (void)addReducer:(FluxReducer *)reducer {
    if (![_reducerMutableList containsObject:reducer]) {
        [_reducerMutableList addObject:reducer];

        [self.notificationCenter addObserver:reducer
                                    selector:@selector(didReceiveDispatcherNotification:)
                                        name:(NSString *)DispatcherNotification
                                      object:self];
    }
}

- (void)dispatchNotification:(NSString *)notificatioName
                  parameters:(NSDictionary *)parameters
{
    [self.notificationCenter postNotificationName:DispatcherNotification
                                           object:self
                                         userInfo:@{
                                          @"notificatioName": notificatioName,
                                          @"parameters": parameters
                                         }];
}
// 2 OMIT
// dispatcher.m
- (instancetype)initWithDefaultReducers {
    return [self initWithReducers:@[
        [[UserReducer alloc] init],
        [[FollowingReducer alloc] init],
        [[InstallationReducer alloc] init],
        [[SharingReducer alloc] init],
        [[TopicReducer alloc] init],
        [[CommentReducer alloc] init]
    ]];
}
// 3 OMIT