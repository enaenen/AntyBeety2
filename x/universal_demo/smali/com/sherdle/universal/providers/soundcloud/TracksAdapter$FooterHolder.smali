.class Lcom/sherdle/universal/providers/soundcloud/TracksAdapter$FooterHolder;
.super Lcom/sherdle/universal/providers/soundcloud/TracksAdapter$Holder;
.source "TracksAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sherdle/universal/providers/soundcloud/TracksAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FooterHolder"
.end annotation


# direct methods
.method private constructor <init>(Landroid/view/View;)V
    .locals 1

    const/4 v0, 0x3

    .line 228
    invoke-direct {p0, p1, v0}, Lcom/sherdle/universal/providers/soundcloud/TracksAdapter$Holder;-><init>(Landroid/view/View;I)V

    return-void
.end method

.method synthetic constructor <init>(Landroid/view/View;Lcom/sherdle/universal/providers/soundcloud/TracksAdapter$1;)V
    .locals 0

    .line 225
    invoke-direct {p0, p1}, Lcom/sherdle/universal/providers/soundcloud/TracksAdapter$FooterHolder;-><init>(Landroid/view/View;)V

    return-void
.end method
