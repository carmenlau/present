@interface FluxReducer : NSObject

@property (strong, nonatomic) FluxStore *store;
- (void)didReceiveDispatcherNotification:(NSNotification *)notification;

@end
