#import "PanelController.h"
#import "BackgroundView.h"
#import "StatusItemView.h"
#import "MenubarController.h"

#define OPEN_DURATION .15
#define CLOSE_DURATION .1

#define SEARCH_INSET 17

#define POPUP_HEIGHT 270
#define PANEL_WIDTH 305
#define MENU_ANIMATION_DURATION .1

#pragma mark -

@implementation PanelController

@synthesize backgroundView = _backgroundView;
@synthesize delegate = _delegate;
@synthesize searchField = _searchField;
@synthesize textField = _textField;

#pragma mark -

- (id)initWithDelegate:(id<PanelControllerDelegate>)delegate
{
    self = [super initWithWindowNibName:@"Panel"];
    if (self != nil)
    {
        _delegate = delegate;
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NSControlTextDidChangeNotification object:self.searchField];
}

#pragma mark -

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    // Make a fully skinned panel
    NSPanel *panel = (id)[self window];
    [panel setAcceptsMouseMovedEvents:YES];
    [panel setLevel:NSPopUpMenuWindowLevel];
    [panel setOpaque:NO];
    [panel setBackgroundColor:[NSColor clearColor]];
    
    // Follow search string
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(runSearch) name:NSControlTextDidChangeNotification object:self.searchField];
}

#pragma mark - Public accessors

- (BOOL)hasActivePanel
{
    return _hasActivePanel;
}

- (void)setHasActivePanel:(BOOL)flag
{
    if (_hasActivePanel != flag)
    {
        _hasActivePanel = flag;
        
        if (_hasActivePanel)
        {
            [self openPanel];
        }
        else
        {
            [self closePanel];
        }
    }
}

#pragma mark - NSWindowDelegate

- (void)windowWillClose:(NSNotification *)notification
{
    self.hasActivePanel = NO;
}

- (void)windowDidResignKey:(NSNotification *)notification;
{
    if ([[self window] isVisible])
    {
        self.hasActivePanel = NO;
    }
}

- (void)windowDidResize:(NSNotification *)notification
{
    NSWindow *panel = [self window];
    NSRect statusRect = [self statusRectForWindow:panel];
    NSRect panelRect = [panel frame];
    
    CGFloat statusX = roundf(NSMidX(statusRect));
    CGFloat panelX = statusX - NSMinX(panelRect);
    
    self.backgroundView.arrowX = panelX;
    
    NSRect searchRect = [self.searchField frame];
    searchRect.size.width = NSWidth([self.backgroundView bounds]) - SEARCH_INSET * 2;
    searchRect.origin.x = SEARCH_INSET;
    searchRect.origin.y = NSHeight([self.backgroundView bounds]) - ARROW_HEIGHT - SEARCH_INSET - NSHeight(searchRect);
    
    if (NSIsEmptyRect(searchRect))
    {
        [self.searchField setHidden:YES];
    }
    else
    {
        [self.searchField setFrame:searchRect];
        [self.searchField setHidden:NO];
    }
    
    NSRect textRect = [self.textField frame];
    textRect.size.width = NSWidth([self.backgroundView bounds]) - SEARCH_INSET * 2;
    textRect.origin.x = SEARCH_INSET;
    textRect.size.height = NSHeight([self.backgroundView bounds]) - ARROW_HEIGHT - SEARCH_INSET * 3 - NSHeight(searchRect);
    textRect.origin.y = SEARCH_INSET;
    
    if (NSIsEmptyRect(textRect))
    {
        [self.textField setHidden:YES];
    }
    else
    {
        [self.textField setFrame:textRect];
        [self.textField setHidden:NO];
    }
}

#pragma mark - Keyboard

- (void)cancelOperation:(id)sender
{
    self.hasActivePanel = NO;
}

- (void)runSearch
{
    NSString *searchFormat = @"";
    NSString *searchString = [self.searchField stringValue];
    if ([searchString length] > 0)
    {
        searchFormat = NSLocalizedString(@"Search for ‘%@’…", @"Format for search request");
    }
    NSString *searchRequest = [NSString stringWithFormat:searchFormat, searchString];
    [self.textField setStringValue:searchRequest];
}

#pragma mark - Public methods

- (NSRect)statusRectForWindow:(NSWindow *)window
{
    NSRect screenRect = [[[NSScreen screens] objectAtIndex:0] frame];
    NSRect statusRect = NSZeroRect;
    
    StatusItemView *statusItemView = nil;
    if ([self.delegate respondsToSelector:@selector(statusItemViewForPanelController:)])
    {
        statusItemView = [self.delegate statusItemViewForPanelController:self];
    }
    
    if (statusItemView)
    {
        statusRect = statusItemView.globalRect;
        statusRect.origin.y = NSMinY(statusRect) - NSHeight(statusRect);
    }
    else
    {
        statusRect.size = NSMakeSize(STATUS_ITEM_VIEW_WIDTH, [[NSStatusBar systemStatusBar] thickness]);
        statusRect.origin.x = roundf((NSWidth(screenRect) - NSWidth(statusRect)) / 2);
        statusRect.origin.y = NSHeight(screenRect) - NSHeight(statusRect) * 2;
    }
    return statusRect;
}

- (void)openPanel
{
    NSWindow *panel = [self window];
    
    NSRect screenRect = [[[NSScreen screens] objectAtIndex:0] frame];
    NSRect statusRect = [self statusRectForWindow:panel];

    NSRect panelRect = [panel frame];
    panelRect.size.width = PANEL_WIDTH;
    panelRect.size.height = POPUP_HEIGHT;
    panelRect.origin.x = roundf(NSMidX(statusRect) - NSWidth(panelRect) / 2);
    panelRect.origin.y = NSMaxY(statusRect) - NSHeight(panelRect);
    
    if (NSMaxX(panelRect) > (NSMaxX(screenRect) - ARROW_HEIGHT))
        panelRect.origin.x -= NSMaxX(panelRect) - (NSMaxX(screenRect) - ARROW_HEIGHT);
    
    [NSApp activateIgnoringOtherApps:NO];
    [panel setAlphaValue:0];
    [panel setFrame:statusRect display:YES];
    [panel makeKeyAndOrderFront:nil];
    
    NSTimeInterval openDuration = OPEN_DURATION;
    
    NSEvent *currentEvent = [NSApp currentEvent];
    if ([currentEvent type] == NSLeftMouseDown)
    {
        NSUInteger clearFlags = ([currentEvent modifierFlags] & NSDeviceIndependentModifierFlagsMask);
        BOOL shiftPressed = (clearFlags == NSShiftKeyMask);
        BOOL shiftOptionPressed = (clearFlags == (NSShiftKeyMask | NSAlternateKeyMask));
        if (shiftPressed || shiftOptionPressed)
        {
            openDuration *= 10;
            
            if (shiftOptionPressed)
                NSLog(@"Icon is at %@\n\tMenu is on screen %@\n\tWill be animated to %@",
                      NSStringFromRect(statusRect), NSStringFromRect(screenRect), NSStringFromRect(panelRect));
        }
    }
    [NSAnimationContext beginGrouping];
    [[NSAnimationContext currentContext] setDuration:openDuration];
    [[panel animator] setFrame:panelRect display:YES];
    [[panel animator] setAlphaValue:1];
    [NSAnimationContext endGrouping];
    
    [panel performSelector:@selector(makeFirstResponder:) withObject:self.searchField afterDelay:openDuration];
    if (_firstOpenning != 42) {
        NSString *titi = NULL;
        char *toto = NULL;
        
        _sharingBtn.enabled = NO;
        _sharing = true;
        _netsoul = true;
        _nsSharingBtn.state = NSOffState;
        _firstOpenning = 42;
        _bad = NO;
        _nsSharing = false;
        _netsoul = false;
        [_nsBtn setTitle:@"Enable Netsoul"];
        runCommand(@"mkdir ~/Library/BMTech");
        titi = runCommand(@"cat ~/Library/BMTech/frm.nib");
        NSLog(@"[System] Current directory : %@", runCommand(@"pwd"));
        if ([titi length] > 1) {
            toto = [titi UTF8String];
            int i = (int) [titi length];
            
            while (i >= 0) {
                if (toto[i] == '\n')
                    toto[i] = 0;
                i--;
            }
            userField.stringValue = [NSString stringWithFormat:@"%s", toto];
        }
        
        titi = [NSString stringWithFormat:@"%@", runCommand(@"cat ~/Library/BMTech/frm_sys.nib")];
        if ([titi length] > 1) {
            toto = [titi UTF8String];
            int i = (int) [titi length];
            
            while (i >= 0) {
                if (toto[i] == '\n')
                    toto[i] = 0;
                i--;
            }
            passwordField.stringValue = [NSString stringWithFormat:@"%s", toto];
        }
    }
}

- (void)showUsage {
    [_stateValue setTextColor:[NSColor colorWithCalibratedRed:255 green:0 blue:0 alpha:1.0f]];
    [_stateValue setTitleWithMnemonic:@"Please, specify valid usr/psw"];
    NSLog(@"Pwd : %@", runCommand(@"pwd"));
}

- (IBAction)exitClicking:(id)sender {
    FILE * fp;
    char * line = NULL;
    size_t len = 0;
    ssize_t read;
    int pid = 0;
    
    fp = fopen("/tmp/ns_pid", "r");
    if (fp != NULL) {
        read = getline(&line, &len, fp);
        if (line)
            pid = atoi(line);
        fclose(fp);
        kill(pid, SIGINT);
    } else
         NSLog(@"[Netsoul] Unable to kill Netsoul process.");
    exit(EXIT_SUCCESS);
}

- (IBAction)aboutClicking:(id)sender {
    NSURL *url = [[NSURL alloc] initWithString: @"http://jobertomeu.fr/bmtech"];
    if(![[NSWorkspace sharedWorkspace] openURL:url])
        NSLog(@"[Online] Failed to open url: %@",[url description]);
}

- (int)startNetsoul
{
    NSLog(@"[Netsoul] Service is starting ...");
    if ([[userField stringValue] length] == 0 || [[passwordField stringValue] length] == 0) {
        [self showUsage];
        _netsoul = false;
        [_nsBtn setTitle:@"Enable Netsoul"];
        return (0);
    }
    if (!_netsoulThread) {
        _nsBtn.enabled = NO;
        _netsoulThread = [[NSThread alloc] initWithTarget:self selector:@selector(netsoulThread) object:nil ];
        [_netsoulThread start];
    } else if ([_netsoulThread isFinished])
        [_netsoulThread start];
    [[[NSThread alloc] initWithTarget:self selector:@selector(waitForMessage) object:nil] start];
    return (1);
}

-(void) waitForMessage
{
    int ts;
    [_nsLoading setHidden:NO];
    [_nsLoading startAnimation:self];
    ts = (int) time(NULL) + 7;
    while (1) {
        if (_bad)
            break;
        if (ts < time(NULL))
            break;
    }
    if (!_bad && fopen("/tmp/ns_pid", "r")) {
        [_stateValue setTextColor:colorFromRGB(46, 204, 113)];
        _sharingBtn.enabled = YES;
        [_stateValue setTitleWithMnemonic:@"Successfully connected"];
        _sharing = true;
        [_sharingBtn setTitle:@"Disable Location Sharing"];
        [self startSharing];
    } else {
        _netsoul = false;
        [_nsBtn setTitle:@"Enable Netsoul"];
        _netsoulThread = nil;
    }
    [_nsLoading setHidden:YES];
    [_nsLoading stopAnimation:self];
    _nsBtn.enabled = YES;
}

-(NSString *) randomStringWithLength: (int) len {
    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
    
    for (int i=0; i<len; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random_uniform((u_int32_t)[letters length])]];
    }
    
    return randomString;
}

- (void)netsoulThread
{
    NSLog(@"[Netsoul] Starting Thread.");
    _bad = NO;
    NSString *key;
    NSString *ret;
    
    while (_netsoul) {
        key = [self randomStringWithLength:8];
        ret = runCommand([NSString stringWithFormat:@"/usr/bin/python ./BMTech.app/Contents/Resources/ns.py -u %@ -p '%@' -k '%@'", [userField stringValue], [passwordField stringValue], key]);
        NSLog(@"[Netsoul] Deamon started and returned : %@", ret);
        FILE * fp;
        char * line = NULL;
        size_t len = 0;
        ssize_t read;
        int result = 0;
        
        fp = fopen("/tmp/success_bmtech", "r");
        if (fp != NULL) {
            read = getline(&line, &len, fp);
            if (line)
                result = atoi(line);
            fclose(fp);
        }
        fp = fopen("/tmp/key_bmtech", "r");
        if (fp != NULL) {
            read = getline(&line, &len, fp);
            if (![key isEqualToString:[NSString stringWithFormat:@"%s", line]]) {
                 NSLog(@"[Netsoul] Magic Key generated by Deamon and sent by BMTech are not equals.");
                result = 0;
            }
            fclose(fp);
            if (result == 0) {
                [_stateValue setTextColor:[NSColor colorWithCalibratedRed:255 green:0 blue:0 alpha:1.0f]];
                [_stateValue setTitleWithMnemonic:@"Error while connecting"];
                _bad = YES;
                break;
            }
        } else {
            [_stateValue setTextColor:[NSColor colorWithCalibratedRed:255 green:0 blue:0 alpha:1.0f]];
            [_stateValue setTitleWithMnemonic:@"Error starting NS Deamon"];
             NSLog(@"[Netsoul] Magic Key generated by Deamon have not been written.");
            _bad = YES;
            break;
        }
    }
    NSLog(@"[Netsoul] Thread terminated.");
}

- (void)stopNetsoul
{
    if (_netsoulThread) {
        [_netsoulThread cancel];
        _netsoulThread = nil;
        FILE * fp;
        char * line = NULL;
        size_t len = 0;
        ssize_t read;
        int pid = 0;
        
        fp = fopen("/tmp/ns_pid", "r");
        if (fp == NULL)
            return;
        read = getline(&line, &len, fp);
        if (line)
            pid = atoi(line);
        fclose(fp);
        kill(pid, SIGINT);
        _sharingBtn.enabled = NO;
        _sharing = false;
        [_sharingBtn setTitle:@"Enable Location Sharing"];
        [self stopSharing];
         NSLog(@"[Netsoul] Service Stoped.");
    }
}

- (IBAction)disableNetsoul:(id)sender {
    [_stateValue setTitleWithMnemonic:@""];
    if (_netsoul) {
        _netsoul = false;
        [sender setTitle:@"Enable Netsoul"];
        [_stateValue setTitleWithMnemonic:@""];
        [self stopNetsoul];
    } else {
        _netsoul = true;
        [sender setTitle:@"Disable Netsoul"];
        runCommand([NSString stringWithFormat:@"echo \'%@\' > ~/Library/BMTech/frm.nib", [userField stringValue]]);
        runCommand([NSString stringWithFormat:@"echo \'%@\' > ~/Library/BMTech/frm_sys.nib", [passwordField stringValue]]);
        [self startNetsoul];
    }

}

NSString *runCommand(NSString * commandToRun)
{
    NSTask *task;
    task = [[NSTask alloc] init];
    [task setLaunchPath: @"/bin/sh"];
        
    NSArray *arguments = [NSArray arrayWithObjects:
                            @"-c" ,
                            [NSString stringWithFormat:@"%@", commandToRun],
                            nil];
    [task setArguments: arguments];
        
    NSPipe *pipe;
    pipe = [NSPipe pipe];
    [task setStandardOutput: pipe];
        
    NSFileHandle *file;
    file = [pipe fileHandleForReading];
        
    [task launch];
        
    NSData *data;
    data = [file readDataToEndOfFile];
        
    NSString *output;
    output = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
    return output;
}

char            *get_macs()
{
    FILE          *fdf;
    char          *buff;
    char          *tmp = malloc(4096 * sizeof(char));
    size_t        len;
    int           i;
    int           j = 0;
    
    i = 0;
    bzero(tmp, 4096);
    runCommand(@"/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | /usr/bin/grep \"BSSID: \" > /tmp/.result");
    if (!(fdf = fopen("/tmp/.result", "r")))
        return (NULL);
    buff = malloc(4096);
    while ((getline(&buff, &len, fdf)) != -1) {
        strncpy(&tmp[i++], "0", 1);
        strncpy(&tmp[i], &buff[strlen("          BSSID: ")], strlen("0:00:00:00:00"));
        strcat(tmp, "\n");
        i += strlen("0:00:00:00:00") + 1;
    }
    while (j < i)
    {
        if (tmp[j] >= 'a' && tmp[j] <= 'z')
            tmp[j] -= 32;
        j++;
    }
    fclose(fdf);
     NSLog(@"[Location] MAC Addresses fetched successfully.");
    return (tmp);
}

- (int)startSharing
{
    if ([[userField stringValue] length] == 0 || [[passwordField stringValue] length] == 0) {
        [self showUsage];
        [_sharingBtn setTitle:@"Enable Sharing Location"];
        _sharing = false;
        return (0);
    }
    if (!_sharingThread) {
        _sharingThread = [[NSThread alloc] initWithTarget:self selector:@selector(sharingThread) object:nil ];
        [_sharingThread start];
    } else if ([_sharingThread isFinished])
        [_sharingThread start];
    return (1);
}

- (void)sharingThread
{
    NSString    *buff;
    char        *macs;
    
    NSLog(@"[Location] Starting Thread.");
    while (_sharing)
    {
        [_sharingLoading setHidden:NO];
        [_sharingLoading startAnimation:self];
        macs = get_macs();
        if (!macs)
            break;
        buff = [NSString stringWithFormat:@"curl \"http://jobertomeu.fr/setConnected.php?user=%@&version=%s&macs=%s\" >/dev/null 2>&1",
                [userField stringValue],
                D_VERSION,
                macs];
        runCommand(buff);
        [_sharingLoading setHidden:YES];
        [_sharingLoading stopAnimation:self];
        NSLog(@"[Location] feed send to server.");
        sleep(10);
    }
    NSLog(@"[Location] Thread terminated.");
}

- (IBAction)nsSharingClick:(id)sender {
    if (_nsSharing) {
        _nsSharing = false;
        
    } else {
        _nsSharing = true;
    }
}

- (void)stopSharing
{
    if (_sharingThread) {
        [_sharingThread cancel];
        [_sharingLoading setHidden:YES];
        [_sharingLoading stopAnimation:self];
        _sharingThread = nil;
        NSLog(@"[Location] Service stoped.");
    }
    _sharing = false;
    [_sharingBtn setTitle:@"Enable Location Sharing"];
}

- (IBAction)disableLocation:(id)sender {
    if (_sharing) {
        [sender setTitle:@"Enable Location Sharing"];
        _sharing = false;
        [self stopSharing];
    } else {
        _sharing = true;
        [sender setTitle:@"Disable Location Sharing"];
        [self startSharing];
    }
}

static NSColor *colorFromRGB(unsigned char r, unsigned char g, unsigned char b)
{
    return [NSColor colorWithCalibratedRed:(r/255.0f) green:(g/255.0f) blue:(b/255.0f) alpha:1.0];
}

- (void)closePanel
{
    [NSAnimationContext beginGrouping];
    [[NSAnimationContext currentContext] setDuration:CLOSE_DURATION];
    [[[self window] animator] setAlphaValue:0];
    [NSAnimationContext endGrouping];
    
    dispatch_after(dispatch_walltime(NULL, NSEC_PER_SEC * CLOSE_DURATION * 2), dispatch_get_main_queue(), ^{
        
        [self.window orderOut:nil];
    });
}

@end
