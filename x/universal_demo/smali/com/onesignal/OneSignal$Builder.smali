.class public Lcom/onesignal/OneSignal$Builder;
.super Ljava/lang/Object;
.source "OneSignal.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/onesignal/OneSignal;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field mContext:Landroid/content/Context;

.field mDisableGmsMissingPrompt:Z

.field mDisplayOption:Lcom/onesignal/OneSignal$OSInFocusDisplayOption;

.field mDisplayOptionCarryOver:Z

.field mFilterOtherGCMReceivers:Z

.field mNotificationOpenedHandler:Lcom/onesignal/OneSignal$NotificationOpenedHandler;

.field mNotificationReceivedHandler:Lcom/onesignal/OneSignal$NotificationReceivedHandler;

.field mPromptLocation:Z

.field mUnsubscribeWhenNotificationsAreDisabled:Z


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 220
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 218
    sget-object v0, Lcom/onesignal/OneSignal$OSInFocusDisplayOption;->InAppAlert:Lcom/onesignal/OneSignal$OSInFocusDisplayOption;

    iput-object v0, p0, Lcom/onesignal/OneSignal$Builder;->mDisplayOption:Lcom/onesignal/OneSignal$OSInFocusDisplayOption;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 222
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 218
    sget-object v0, Lcom/onesignal/OneSignal$OSInFocusDisplayOption;->InAppAlert:Lcom/onesignal/OneSignal$OSInFocusDisplayOption;

    iput-object v0, p0, Lcom/onesignal/OneSignal$Builder;->mDisplayOption:Lcom/onesignal/OneSignal$OSInFocusDisplayOption;

    .line 223
    iput-object p1, p0, Lcom/onesignal/OneSignal$Builder;->mContext:Landroid/content/Context;

    return-void
.end method

.method synthetic constructor <init>(Landroid/content/Context;Lcom/onesignal/OneSignal$1;)V
    .locals 0

    .line 203
    invoke-direct {p0, p1}, Lcom/onesignal/OneSignal$Builder;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/onesignal/OneSignal$1;)V
    .locals 0

    .line 203
    invoke-direct {p0}, Lcom/onesignal/OneSignal$Builder;-><init>()V

    return-void
.end method

.method private setDisplayOptionCarryOver(Z)V
    .locals 0

    .line 227
    iput-boolean p1, p0, Lcom/onesignal/OneSignal$Builder;->mDisplayOptionCarryOver:Z

    return-void
.end method


# virtual methods
.method public autoPromptLocation(Z)Lcom/onesignal/OneSignal$Builder;
    .locals 0

    .line 279
    iput-boolean p1, p0, Lcom/onesignal/OneSignal$Builder;->mPromptLocation:Z

    return-object p0
.end method

.method public disableGmsMissingPrompt(Z)Lcom/onesignal/OneSignal$Builder;
    .locals 0

    .line 291
    iput-boolean p1, p0, Lcom/onesignal/OneSignal$Builder;->mDisableGmsMissingPrompt:Z

    return-object p0
.end method

.method public filterOtherGCMReceivers(Z)Lcom/onesignal/OneSignal$Builder;
    .locals 0

    .line 328
    iput-boolean p1, p0, Lcom/onesignal/OneSignal$Builder;->mFilterOtherGCMReceivers:Z

    return-object p0
.end method

.method public inFocusDisplaying(Lcom/onesignal/OneSignal$OSInFocusDisplayOption;)Lcom/onesignal/OneSignal$Builder;
    .locals 2

    .line 296
    invoke-static {}, Lcom/onesignal/OneSignal;->getCurrentOrNewInitBuilder()Lcom/onesignal/OneSignal$Builder;

    move-result-object v0

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/onesignal/OneSignal$Builder;->mDisplayOptionCarryOver:Z

    .line 297
    iput-object p1, p0, Lcom/onesignal/OneSignal$Builder;->mDisplayOption:Lcom/onesignal/OneSignal$OSInFocusDisplayOption;

    return-object p0
.end method

.method public init()V
    .locals 0

    .line 333
    invoke-static {p0}, Lcom/onesignal/OneSignal;->access$000(Lcom/onesignal/OneSignal$Builder;)V

    return-void
.end method

.method public setNotificationOpenedHandler(Lcom/onesignal/OneSignal$NotificationOpenedHandler;)Lcom/onesignal/OneSignal$Builder;
    .locals 0

    .line 244
    iput-object p1, p0, Lcom/onesignal/OneSignal$Builder;->mNotificationOpenedHandler:Lcom/onesignal/OneSignal$NotificationOpenedHandler;

    return-object p0
.end method

.method public setNotificationReceivedHandler(Lcom/onesignal/OneSignal$NotificationReceivedHandler;)Lcom/onesignal/OneSignal$Builder;
    .locals 0

    .line 261
    iput-object p1, p0, Lcom/onesignal/OneSignal$Builder;->mNotificationReceivedHandler:Lcom/onesignal/OneSignal$NotificationReceivedHandler;

    return-object p0
.end method

.method public unsubscribeWhenNotificationsAreDisabled(Z)Lcom/onesignal/OneSignal$Builder;
    .locals 0

    .line 311
    iput-boolean p1, p0, Lcom/onesignal/OneSignal$Builder;->mUnsubscribeWhenNotificationsAreDisabled:Z

    return-object p0
.end method
