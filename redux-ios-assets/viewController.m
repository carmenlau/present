// 1 OMIT
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    // observing `self.store.currentUser` and `self.store.following`
    [self.store addObserver:self
                 forKeyPath:@"currentUser"
                    options:(NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew)
                    context:nil];
    [self.store addObserver:self
                 forKeyPath:@"following"
                    options:(NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew)
                    context:nil];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];

    [self.store removeObserver:self forKeyPath:@"currentUser"];
    [self.store removeObserver:self forKeyPath:@"following"];
}
// 2 OMIT
- (void)observeValueForKeyPath:(NSString *)keyPath 
                      ofObject:(id)object
                        change:(NSDictionary<NSString *,id> *)change 
                       context:(void *)context
{
    if ([@"currentUser" isEqualToString:keyPath]) {
        NSDictionary * newCurrentUser = [change objectForKey:NSKeyValueChangeNewKey];
        NSString *apiStatus = [newCurrentUser objectForKey:@"apiStatus"];

        if ([ApiStatusStart isEqualToString:apiStatus]) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [SVProgressHUD show];
            });
        } else if ([ApiStatusSuccess isEqualToString:apiStatus] ||
                 [ApiStatusFail isEqualToString:apiStatus]) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [SVProgressHUD dismiss];
            });
        }
    }
}
// 3 OMIT
- (void)observeValueForKeyPath:(NSString *)keyPath 
                      ofObject:(id)object
                        change:(NSDictionary<NSString *,id> *)change
                       context:(void *)context
{
    if ([@"following" isEqualToString:keyPath]) {
        NSDictionary *newFollowing = [change objectForKey:NSKeyValueChangeNewKey];
        NSString *apiStatus = [newFollowing objectForKey:@"apiStatus"];
        NSNumber *viewingFollowingID = [newFollowing objectForKey:@"viewingFollowingID"];

        self.followings = newFollowing;
        if ([ApiStatusSuccess isEqualToString:apiStatus]) {
            [self.refreshControl endRefreshing];
            [self.tableView reloadData];
        }
    }
}
// 4 OMIT
