.class public Lcom/devbrackets/android/exomedia/ui/widget/VideoControlsMobile$SeekBarChanged;
.super Ljava/lang/Object;
.source "VideoControlsMobile.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/devbrackets/android/exomedia/ui/widget/VideoControlsMobile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "SeekBarChanged"
.end annotation


# instance fields
.field private seekToTime:J

.field final synthetic this$0:Lcom/devbrackets/android/exomedia/ui/widget/VideoControlsMobile;


# direct methods
.method protected constructor <init>(Lcom/devbrackets/android/exomedia/ui/widget/VideoControlsMobile;)V
    .locals 0

    .line 226
    iput-object p1, p0, Lcom/devbrackets/android/exomedia/ui/widget/VideoControlsMobile$SeekBarChanged;->this$0:Lcom/devbrackets/android/exomedia/ui/widget/VideoControlsMobile;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 0

    if-nez p3, :cond_0

    return-void

    :cond_0
    int-to-long p1, p2

    .line 235
    iput-wide p1, p0, Lcom/devbrackets/android/exomedia/ui/widget/VideoControlsMobile$SeekBarChanged;->seekToTime:J

    .line 236
    iget-object p1, p0, Lcom/devbrackets/android/exomedia/ui/widget/VideoControlsMobile$SeekBarChanged;->this$0:Lcom/devbrackets/android/exomedia/ui/widget/VideoControlsMobile;

    iget-object p1, p1, Lcom/devbrackets/android/exomedia/ui/widget/VideoControlsMobile;->currentTimeTextView:Landroid/widget/TextView;

    if-eqz p1, :cond_1

    .line 237
    iget-object p1, p0, Lcom/devbrackets/android/exomedia/ui/widget/VideoControlsMobile$SeekBarChanged;->this$0:Lcom/devbrackets/android/exomedia/ui/widget/VideoControlsMobile;

    iget-object p1, p1, Lcom/devbrackets/android/exomedia/ui/widget/VideoControlsMobile;->currentTimeTextView:Landroid/widget/TextView;

    iget-wide p2, p0, Lcom/devbrackets/android/exomedia/ui/widget/VideoControlsMobile$SeekBarChanged;->seekToTime:J

    invoke-static {p2, p3}, Lcom/devbrackets/android/exomedia/util/TimeFormatUtil;->formatMs(J)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_1
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 1

    .line 243
    iget-object p1, p0, Lcom/devbrackets/android/exomedia/ui/widget/VideoControlsMobile$SeekBarChanged;->this$0:Lcom/devbrackets/android/exomedia/ui/widget/VideoControlsMobile;

    const/4 v0, 0x1

    iput-boolean v0, p1, Lcom/devbrackets/android/exomedia/ui/widget/VideoControlsMobile;->userInteracting:Z

    .line 244
    iget-object p1, p0, Lcom/devbrackets/android/exomedia/ui/widget/VideoControlsMobile$SeekBarChanged;->this$0:Lcom/devbrackets/android/exomedia/ui/widget/VideoControlsMobile;

    iget-object p1, p1, Lcom/devbrackets/android/exomedia/ui/widget/VideoControlsMobile;->seekListener:Lcom/devbrackets/android/exomedia/listener/VideoControlsSeekListener;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/devbrackets/android/exomedia/ui/widget/VideoControlsMobile$SeekBarChanged;->this$0:Lcom/devbrackets/android/exomedia/ui/widget/VideoControlsMobile;

    iget-object p1, p1, Lcom/devbrackets/android/exomedia/ui/widget/VideoControlsMobile;->seekListener:Lcom/devbrackets/android/exomedia/listener/VideoControlsSeekListener;

    invoke-interface {p1}, Lcom/devbrackets/android/exomedia/listener/VideoControlsSeekListener;->onSeekStarted()Z

    move-result p1

    if-nez p1, :cond_1

    .line 245
    :cond_0
    iget-object p1, p0, Lcom/devbrackets/android/exomedia/ui/widget/VideoControlsMobile$SeekBarChanged;->this$0:Lcom/devbrackets/android/exomedia/ui/widget/VideoControlsMobile;

    iget-object p1, p1, Lcom/devbrackets/android/exomedia/ui/widget/VideoControlsMobile;->internalListener:Lcom/devbrackets/android/exomedia/ui/widget/VideoControls$InternalListener;

    invoke-virtual {p1}, Lcom/devbrackets/android/exomedia/ui/widget/VideoControls$InternalListener;->onSeekStarted()Z

    :cond_1
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 2

    .line 251
    iget-object p1, p0, Lcom/devbrackets/android/exomedia/ui/widget/VideoControlsMobile$SeekBarChanged;->this$0:Lcom/devbrackets/android/exomedia/ui/widget/VideoControlsMobile;

    const/4 v0, 0x0

    iput-boolean v0, p1, Lcom/devbrackets/android/exomedia/ui/widget/VideoControlsMobile;->userInteracting:Z

    .line 252
    iget-object p1, p0, Lcom/devbrackets/android/exomedia/ui/widget/VideoControlsMobile$SeekBarChanged;->this$0:Lcom/devbrackets/android/exomedia/ui/widget/VideoControlsMobile;

    iget-object p1, p1, Lcom/devbrackets/android/exomedia/ui/widget/VideoControlsMobile;->seekListener:Lcom/devbrackets/android/exomedia/listener/VideoControlsSeekListener;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/devbrackets/android/exomedia/ui/widget/VideoControlsMobile$SeekBarChanged;->this$0:Lcom/devbrackets/android/exomedia/ui/widget/VideoControlsMobile;

    iget-object p1, p1, Lcom/devbrackets/android/exomedia/ui/widget/VideoControlsMobile;->seekListener:Lcom/devbrackets/android/exomedia/listener/VideoControlsSeekListener;

    iget-wide v0, p0, Lcom/devbrackets/android/exomedia/ui/widget/VideoControlsMobile$SeekBarChanged;->seekToTime:J

    invoke-interface {p1, v0, v1}, Lcom/devbrackets/android/exomedia/listener/VideoControlsSeekListener;->onSeekEnded(J)Z

    move-result p1

    if-nez p1, :cond_1

    .line 253
    :cond_0
    iget-object p1, p0, Lcom/devbrackets/android/exomedia/ui/widget/VideoControlsMobile$SeekBarChanged;->this$0:Lcom/devbrackets/android/exomedia/ui/widget/VideoControlsMobile;

    iget-object p1, p1, Lcom/devbrackets/android/exomedia/ui/widget/VideoControlsMobile;->internalListener:Lcom/devbrackets/android/exomedia/ui/widget/VideoControls$InternalListener;

    iget-wide v0, p0, Lcom/devbrackets/android/exomedia/ui/widget/VideoControlsMobile$SeekBarChanged;->seekToTime:J

    invoke-virtual {p1, v0, v1}, Lcom/devbrackets/android/exomedia/ui/widget/VideoControls$InternalListener;->onSeekEnded(J)Z

    :cond_1
    return-void
.end method
