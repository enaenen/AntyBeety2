.class Lcom/devbrackets/android/exomedia/ui/widget/VideoControls$4;
.super Ljava/lang/Object;
.source "VideoControls.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/devbrackets/android/exomedia/ui/widget/VideoControls;->registerListeners()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/devbrackets/android/exomedia/ui/widget/VideoControls;


# direct methods
.method constructor <init>(Lcom/devbrackets/android/exomedia/ui/widget/VideoControls;)V
    .locals 0

    .line 588
    iput-object p1, p0, Lcom/devbrackets/android/exomedia/ui/widget/VideoControls$4;->this$0:Lcom/devbrackets/android/exomedia/ui/widget/VideoControls;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 591
    iget-object p1, p0, Lcom/devbrackets/android/exomedia/ui/widget/VideoControls$4;->this$0:Lcom/devbrackets/android/exomedia/ui/widget/VideoControls;

    invoke-virtual {p1}, Lcom/devbrackets/android/exomedia/ui/widget/VideoControls;->onPreviousClick()V

    return-void
.end method
