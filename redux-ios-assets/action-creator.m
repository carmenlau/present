// 1 OMIT
[self.dispatcher dispatchNotification:DispatcherEventViewFollowingTopic
                           parameters:@{ @"followingID": followingID }];

// 2 OMIT
[self.dispatcher dispatchNotification:DispatcherEventUserLoginStart parameters:nil];

__weak typeof(self) wself = self;
[self.apiManager loginWithUserName:userName password:password
    success:^(NSDictionary *response) {
        if (/* do some validation */) {
            [wself.dispatcher dispatchNotification:DispatcherEventUserLoginSuccess
                parameters:@{ /* Some Params */ }];
        }
        else {
            [wself.dispatcher dispatchNotification:DispatcherEventUserLoginFail parameters:@{
                NSLocalizedDescriptionKey: @"Some Error Message"
            }];
        }

}
fail:^(NSError *error) {
  [wself.dispatcher dispatchNotification:DispatcherEventUserLoginFail
      parameters:@{ NSLocalizedDescriptionKey: error.localizedDescription }];
}];
// 3 OMIT
