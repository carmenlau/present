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
