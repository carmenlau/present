// 1 OMIT
- (void)didReceiveDispatcherNotification:(NSNotification *)notification
{
    NSString *notificatioName = [notification.userInfo objectForKey:@"notificatioName"];
    NSDictionary *parameters = [notification.userInfo objectForKey:@"parameters"];

    if ([DispatcherEventUserLoginStart isEqualToString:notificatioName]) {
        /* Store Modification */
    } else if ([DispatcherEventUserLoginSuccess isEqualToString:notificatioName]) {
        /* Store Modification */
    } else if ([DispatcherEventUserLoginFail isEqualToString:notificatioName]) {
        /* Store Modification */
    } else if ([DispatcherEventUserSignupStart isEqualToString:notificatioName]) {
        /* Store Modification */
    } else if ([DispatcherEventUserSignupSuccess isEqualToString:notificatioName]) {
        /* Store Modification */
    } else if ([DispatcherEventUserSignupFail isEqualToString:notificatioName]) {
        /* Store Modification */
    } // ... More
}
// 2 OMIT
NSString *notificatioName = [notification.userInfo objectForKey:@"notificatioName"];
NSDictionary *parameters = [notification.userInfo objectForKey:@"parameters"];

if ([DispatcherEventUserLoginSuccess isEqualToString:notificatioName]) {
    // 1. mutable copy
    NSMutableDictionary *currentUser = [self.store.currentUser mutableCopy];

    // 2. update
    [currentUser setObject:[parameters objectForKey:@"token"] forKey:@"token"];
    [currentUser setObject:[parameters objectForKey:@"username"] forKey:@"username"];
    [currentUser setObject:[parameters objectForKey:@"name"] forKey:@"name"];
    [currentUser setObject:ApiStatusSuccess forKey:@"apiStatus"];

    // 3. assign
    self.store.currentUser = currentUser;
}
// 3 OMIT
