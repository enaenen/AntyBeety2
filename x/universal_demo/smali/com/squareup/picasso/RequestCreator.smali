.class public Lcom/squareup/picasso/RequestCreator;
.super Ljava/lang/Object;
.source "RequestCreator.java"


# static fields
.field private static final nextId:Ljava/util/concurrent/atomic/AtomicInteger;


# instance fields
.field private final data:Lcom/squareup/picasso/Request$Builder;

.field private deferred:Z

.field private errorDrawable:Landroid/graphics/drawable/Drawable;

.field private errorResId:I

.field private memoryPolicy:I

.field private networkPolicy:I

.field private noFade:Z

.field private final picasso:Lcom/squareup/picasso/Picasso;

.field private placeholderDrawable:Landroid/graphics/drawable/Drawable;

.field private placeholderResId:I

.field private setPlaceholder:Z

.field private tag:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 58
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    sput-object v0, Lcom/squareup/picasso/RequestCreator;->nextId:Ljava/util/concurrent/atomic/AtomicInteger;

    return-void
.end method

.method constructor <init>()V
    .locals 3
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation

    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 65
    iput-boolean v0, p0, Lcom/squareup/picasso/RequestCreator;->setPlaceholder:Z

    const/4 v0, 0x0

    .line 84
    iput-object v0, p0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    .line 85
    new-instance v1, Lcom/squareup/picasso/Request$Builder;

    const/4 v2, 0x0

    invoke-direct {v1, v0, v2, v0}, Lcom/squareup/picasso/Request$Builder;-><init>(Landroid/net/Uri;ILandroid/graphics/Bitmap$Config;)V

    iput-object v1, p0, Lcom/squareup/picasso/RequestCreator;->data:Lcom/squareup/picasso/Request$Builder;

    return-void
.end method

.method constructor <init>(Lcom/squareup/picasso/Picasso;Landroid/net/Uri;I)V
    .locals 1

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 65
    iput-boolean v0, p0, Lcom/squareup/picasso/RequestCreator;->setPlaceholder:Z

    .line 75
    iget-boolean v0, p1, Lcom/squareup/picasso/Picasso;->shutdown:Z

    if-eqz v0, :cond_0

    .line 76
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Picasso instance already shut down. Cannot submit new requests."

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 79
    :cond_0
    iput-object p1, p0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    .line 80
    new-instance v0, Lcom/squareup/picasso/Request$Builder;

    iget-object p1, p1, Lcom/squareup/picasso/Picasso;->defaultBitmapConfig:Landroid/graphics/Bitmap$Config;

    invoke-direct {v0, p2, p3, p1}, Lcom/squareup/picasso/Request$Builder;-><init>(Landroid/net/Uri;ILandroid/graphics/Bitmap$Config;)V

    iput-object v0, p0, Lcom/squareup/picasso/RequestCreator;->data:Lcom/squareup/picasso/Request$Builder;

    return-void
.end method

.method private createRequest(J)Lcom/squareup/picasso/Request;
    .locals 7

    .line 756
    sget-object v0, Lcom/squareup/picasso/RequestCreator;->nextId:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v0

    .line 758
    iget-object v1, p0, Lcom/squareup/picasso/RequestCreator;->data:Lcom/squareup/picasso/Request$Builder;

    invoke-virtual {v1}, Lcom/squareup/picasso/Request$Builder;->build()Lcom/squareup/picasso/Request;

    move-result-object v1

    .line 759
    iput v0, v1, Lcom/squareup/picasso/Request;->id:I

    .line 760
    iput-wide p1, v1, Lcom/squareup/picasso/Request;->started:J

    .line 762
    iget-object v2, p0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    iget-boolean v2, v2, Lcom/squareup/picasso/Picasso;->loggingEnabled:Z

    if-eqz v2, :cond_0

    const-string v3, "Main"

    const-string v4, "created"

    .line 764
    invoke-virtual {v1}, Lcom/squareup/picasso/Request;->plainId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1}, Lcom/squareup/picasso/Request;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v3, v4, v5, v6}, Lcom/squareup/picasso/Utils;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 767
    :cond_0
    iget-object v3, p0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    invoke-virtual {v3, v1}, Lcom/squareup/picasso/Picasso;->transformRequest(Lcom/squareup/picasso/Request;)Lcom/squareup/picasso/Request;

    move-result-object v3

    if-eq v3, v1, :cond_1

    .line 770
    iput v0, v3, Lcom/squareup/picasso/Request;->id:I

    .line 771
    iput-wide p1, v3, Lcom/squareup/picasso/Request;->started:J

    if-eqz v2, :cond_1

    const-string p1, "Main"

    const-string p2, "changed"

    .line 774
    invoke-virtual {v3}, Lcom/squareup/picasso/Request;->logId()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "into "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, p2, v0, v1}, Lcom/squareup/picasso/Utils;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    return-object v3
.end method

.method private getPlaceholderDrawable()Landroid/graphics/drawable/Drawable;
    .locals 4

    .line 739
    iget v0, p0, Lcom/squareup/picasso/RequestCreator;->placeholderResId:I

    if-eqz v0, :cond_2

    .line 740
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    .line 741
    iget-object v0, p0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    iget-object v0, v0, Lcom/squareup/picasso/Picasso;->context:Landroid/content/Context;

    iget v1, p0, Lcom/squareup/picasso/RequestCreator;->placeholderResId:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0

    .line 742
    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_1

    .line 743
    iget-object v0, p0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    iget-object v0, v0, Lcom/squareup/picasso/Picasso;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iget v1, p0, Lcom/squareup/picasso/RequestCreator;->placeholderResId:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0

    .line 745
    :cond_1
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 746
    iget-object v1, p0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    iget-object v1, v1, Lcom/squareup/picasso/Picasso;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget v2, p0, Lcom/squareup/picasso/RequestCreator;->placeholderResId:I

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v0, v3}, Landroid/content/res/Resources;->getValue(ILandroid/util/TypedValue;Z)V

    .line 747
    iget-object v1, p0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    iget-object v1, v1, Lcom/squareup/picasso/Picasso;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget v0, v0, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0

    .line 750
    :cond_2
    iget-object v0, p0, Lcom/squareup/picasso/RequestCreator;->placeholderDrawable:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method private performRemoteViewInto(Lcom/squareup/picasso/RemoteViewsAction;)V
    .locals 2

    .line 782
    iget v0, p0, Lcom/squareup/picasso/RequestCreator;->memoryPolicy:I

    invoke-static {v0}, Lcom/squareup/picasso/MemoryPolicy;->shouldReadFromMemoryCache(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 783
    iget-object v0, p0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    invoke-virtual {p1}, Lcom/squareup/picasso/RemoteViewsAction;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/squareup/picasso/Picasso;->quickMemoryCacheCheck(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 785
    sget-object v1, Lcom/squareup/picasso/Picasso$LoadedFrom;->MEMORY:Lcom/squareup/picasso/Picasso$LoadedFrom;

    invoke-virtual {p1, v0, v1}, Lcom/squareup/picasso/RemoteViewsAction;->complete(Landroid/graphics/Bitmap;Lcom/squareup/picasso/Picasso$LoadedFrom;)V

    return-void

    .line 790
    :cond_0
    iget v0, p0, Lcom/squareup/picasso/RequestCreator;->placeholderResId:I

    if-eqz v0, :cond_1

    .line 791
    iget v0, p0, Lcom/squareup/picasso/RequestCreator;->placeholderResId:I

    invoke-virtual {p1, v0}, Lcom/squareup/picasso/RemoteViewsAction;->setImageResource(I)V

    .line 794
    :cond_1
    iget-object v0, p0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    invoke-virtual {v0, p1}, Lcom/squareup/picasso/Picasso;->enqueueAndSubmit(Lcom/squareup/picasso/Action;)V

    return-void
.end method


# virtual methods
.method public centerCrop()Lcom/squareup/picasso/RequestCreator;
    .locals 2

    .line 245
    iget-object v0, p0, Lcom/squareup/picasso/RequestCreator;->data:Lcom/squareup/picasso/Request$Builder;

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Lcom/squareup/picasso/Request$Builder;->centerCrop(I)Lcom/squareup/picasso/Request$Builder;

    return-object p0
.end method

.method public centerCrop(I)Lcom/squareup/picasso/RequestCreator;
    .locals 1

    .line 255
    iget-object v0, p0, Lcom/squareup/picasso/RequestCreator;->data:Lcom/squareup/picasso/Request$Builder;

    invoke-virtual {v0, p1}, Lcom/squareup/picasso/Request$Builder;->centerCrop(I)Lcom/squareup/picasso/Request$Builder;

    return-object p0
.end method

.method public centerInside()Lcom/squareup/picasso/RequestCreator;
    .locals 1

    .line 264
    iget-object v0, p0, Lcom/squareup/picasso/RequestCreator;->data:Lcom/squareup/picasso/Request$Builder;

    invoke-virtual {v0}, Lcom/squareup/picasso/Request$Builder;->centerInside()Lcom/squareup/picasso/Request$Builder;

    return-object p0
.end method

.method clearTag()Lcom/squareup/picasso/RequestCreator;
    .locals 1

    const/4 v0, 0x0

    .line 216
    iput-object v0, p0, Lcom/squareup/picasso/RequestCreator;->tag:Ljava/lang/Object;

    return-object p0
.end method

.method public config(Landroid/graphics/Bitmap$Config;)Lcom/squareup/picasso/RequestCreator;
    .locals 1
    .param p1    # Landroid/graphics/Bitmap$Config;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 296
    iget-object v0, p0, Lcom/squareup/picasso/RequestCreator;->data:Lcom/squareup/picasso/Request$Builder;

    invoke-virtual {v0, p1}, Lcom/squareup/picasso/Request$Builder;->config(Landroid/graphics/Bitmap$Config;)Lcom/squareup/picasso/Request$Builder;

    return-object p0
.end method

.method public error(I)Lcom/squareup/picasso/RequestCreator;
    .locals 1
    .param p1    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    if-nez p1, :cond_0

    .line 147
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Error image resource invalid."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 149
    :cond_0
    iget-object v0, p0, Lcom/squareup/picasso/RequestCreator;->errorDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_1

    .line 150
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Error image already set."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 152
    :cond_1
    iput p1, p0, Lcom/squareup/picasso/RequestCreator;->errorResId:I

    return-object p0
.end method

.method public error(Landroid/graphics/drawable/Drawable;)Lcom/squareup/picasso/RequestCreator;
    .locals 1
    .param p1    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    if-nez p1, :cond_0

    .line 159
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Error image may not be null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 161
    :cond_0
    iget v0, p0, Lcom/squareup/picasso/RequestCreator;->errorResId:I

    if-eqz v0, :cond_1

    .line 162
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Error image already set."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 164
    :cond_1
    iput-object p1, p0, Lcom/squareup/picasso/RequestCreator;->errorDrawable:Landroid/graphics/drawable/Drawable;

    return-object p0
.end method

.method public fetch()V
    .locals 1

    const/4 v0, 0x0

    .line 439
    invoke-virtual {p0, v0}, Lcom/squareup/picasso/RequestCreator;->fetch(Lcom/squareup/picasso/Callback;)V

    return-void
.end method

.method public fetch(Lcom/squareup/picasso/Callback;)V
    .locals 12
    .param p1    # Lcom/squareup/picasso/Callback;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .line 452
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    .line 454
    iget-boolean v2, p0, Lcom/squareup/picasso/RequestCreator;->deferred:Z

    if-eqz v2, :cond_0

    .line 455
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Fit cannot be used with fetch."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 457
    :cond_0
    iget-object v2, p0, Lcom/squareup/picasso/RequestCreator;->data:Lcom/squareup/picasso/Request$Builder;

    invoke-virtual {v2}, Lcom/squareup/picasso/Request$Builder;->hasImage()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 459
    iget-object v2, p0, Lcom/squareup/picasso/RequestCreator;->data:Lcom/squareup/picasso/Request$Builder;

    invoke-virtual {v2}, Lcom/squareup/picasso/Request$Builder;->hasPriority()Z

    move-result v2

    if-nez v2, :cond_1

    .line 460
    iget-object v2, p0, Lcom/squareup/picasso/RequestCreator;->data:Lcom/squareup/picasso/Request$Builder;

    sget-object v3, Lcom/squareup/picasso/Picasso$Priority;->LOW:Lcom/squareup/picasso/Picasso$Priority;

    invoke-virtual {v2, v3}, Lcom/squareup/picasso/Request$Builder;->priority(Lcom/squareup/picasso/Picasso$Priority;)Lcom/squareup/picasso/Request$Builder;

    .line 463
    :cond_1
    invoke-direct {p0, v0, v1}, Lcom/squareup/picasso/RequestCreator;->createRequest(J)Lcom/squareup/picasso/Request;

    move-result-object v6

    .line 464
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v6, v0}, Lcom/squareup/picasso/Utils;->createKey(Lcom/squareup/picasso/Request;Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object v10

    .line 466
    iget v0, p0, Lcom/squareup/picasso/RequestCreator;->memoryPolicy:I

    invoke-static {v0}, Lcom/squareup/picasso/MemoryPolicy;->shouldReadFromMemoryCache(I)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 467
    iget-object v0, p0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    invoke-virtual {v0, v10}, Lcom/squareup/picasso/Picasso;->quickMemoryCacheCheck(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 469
    iget-object v0, p0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    iget-boolean v0, v0, Lcom/squareup/picasso/Picasso;->loggingEnabled:Z

    if-eqz v0, :cond_2

    const-string v0, "Main"

    const-string v1, "completed"

    .line 470
    invoke-virtual {v6}, Lcom/squareup/picasso/Request;->plainId()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "from "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v4, Lcom/squareup/picasso/Picasso$LoadedFrom;->MEMORY:Lcom/squareup/picasso/Picasso$LoadedFrom;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/squareup/picasso/Utils;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    if-eqz p1, :cond_3

    .line 473
    invoke-interface {p1}, Lcom/squareup/picasso/Callback;->onSuccess()V

    :cond_3
    return-void

    .line 479
    :cond_4
    new-instance v0, Lcom/squareup/picasso/FetchAction;

    iget-object v5, p0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    iget v7, p0, Lcom/squareup/picasso/RequestCreator;->memoryPolicy:I

    iget v8, p0, Lcom/squareup/picasso/RequestCreator;->networkPolicy:I

    iget-object v9, p0, Lcom/squareup/picasso/RequestCreator;->tag:Ljava/lang/Object;

    move-object v4, v0

    move-object v11, p1

    invoke-direct/range {v4 .. v11}, Lcom/squareup/picasso/FetchAction;-><init>(Lcom/squareup/picasso/Picasso;Lcom/squareup/picasso/Request;IILjava/lang/Object;Ljava/lang/String;Lcom/squareup/picasso/Callback;)V

    .line 481
    iget-object p1, p0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    invoke-virtual {p1, v0}, Lcom/squareup/picasso/Picasso;->submit(Lcom/squareup/picasso/Action;)V

    :cond_5
    return-void
.end method

.method public fit()Lcom/squareup/picasso/RequestCreator;
    .locals 1

    const/4 v0, 0x1

    .line 204
    iput-boolean v0, p0, Lcom/squareup/picasso/RequestCreator;->deferred:Z

    return-object p0
.end method

.method public get()Landroid/graphics/Bitmap;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 415
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    .line 416
    invoke-static {}, Lcom/squareup/picasso/Utils;->checkNotMain()V

    .line 418
    iget-boolean v2, p0, Lcom/squareup/picasso/RequestCreator;->deferred:Z

    if-eqz v2, :cond_0

    .line 419
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Fit cannot be used with get."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 421
    :cond_0
    iget-object v2, p0, Lcom/squareup/picasso/RequestCreator;->data:Lcom/squareup/picasso/Request$Builder;

    invoke-virtual {v2}, Lcom/squareup/picasso/Request$Builder;->hasImage()Z

    move-result v2

    if-nez v2, :cond_1

    const/4 v0, 0x0

    return-object v0

    .line 425
    :cond_1
    invoke-direct {p0, v0, v1}, Lcom/squareup/picasso/RequestCreator;->createRequest(J)Lcom/squareup/picasso/Request;

    move-result-object v3

    .line 426
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v3, v0}, Lcom/squareup/picasso/Utils;->createKey(Lcom/squareup/picasso/Request;Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object v7

    .line 428
    new-instance v0, Lcom/squareup/picasso/GetAction;

    iget-object v2, p0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    iget v4, p0, Lcom/squareup/picasso/RequestCreator;->memoryPolicy:I

    iget v5, p0, Lcom/squareup/picasso/RequestCreator;->networkPolicy:I

    iget-object v6, p0, Lcom/squareup/picasso/RequestCreator;->tag:Ljava/lang/Object;

    move-object v1, v0

    invoke-direct/range {v1 .. v7}, Lcom/squareup/picasso/GetAction;-><init>(Lcom/squareup/picasso/Picasso;Lcom/squareup/picasso/Request;IILjava/lang/Object;Ljava/lang/String;)V

    .line 429
    iget-object v1, p0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    iget-object v2, p0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    iget-object v2, v2, Lcom/squareup/picasso/Picasso;->dispatcher:Lcom/squareup/picasso/Dispatcher;

    iget-object v3, p0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    iget-object v3, v3, Lcom/squareup/picasso/Picasso;->cache:Lcom/squareup/picasso/Cache;

    iget-object v4, p0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    iget-object v4, v4, Lcom/squareup/picasso/Picasso;->stats:Lcom/squareup/picasso/Stats;

    invoke-static {v1, v2, v3, v4, v0}, Lcom/squareup/picasso/BitmapHunter;->forRequest(Lcom/squareup/picasso/Picasso;Lcom/squareup/picasso/Dispatcher;Lcom/squareup/picasso/Cache;Lcom/squareup/picasso/Stats;Lcom/squareup/picasso/Action;)Lcom/squareup/picasso/BitmapHunter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/squareup/picasso/BitmapHunter;->hunt()Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method getTag()Ljava/lang/Object;
    .locals 1

    .line 222
    iget-object v0, p0, Lcom/squareup/picasso/RequestCreator;->tag:Ljava/lang/Object;

    return-object v0
.end method

.method public into(Landroid/widget/ImageView;)V
    .locals 1

    const/4 v0, 0x0

    .line 665
    invoke-virtual {p0, p1, v0}, Lcom/squareup/picasso/RequestCreator;->into(Landroid/widget/ImageView;Lcom/squareup/picasso/Callback;)V

    return-void
.end method

.method public into(Landroid/widget/ImageView;Lcom/squareup/picasso/Callback;)V
    .locals 15

    move-object v0, p0

    move-object/from16 v3, p1

    move-object/from16 v11, p2

    .line 678
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v1

    .line 679
    invoke-static {}, Lcom/squareup/picasso/Utils;->checkMain()V

    if-nez v3, :cond_0

    .line 682
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Target must not be null."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 685
    :cond_0
    iget-object v4, v0, Lcom/squareup/picasso/RequestCreator;->data:Lcom/squareup/picasso/Request$Builder;

    invoke-virtual {v4}, Lcom/squareup/picasso/Request$Builder;->hasImage()Z

    move-result v4

    if-nez v4, :cond_2

    .line 686
    iget-object v1, v0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    invoke-virtual {v1, v3}, Lcom/squareup/picasso/Picasso;->cancelRequest(Landroid/widget/ImageView;)V

    .line 687
    iget-boolean v1, v0, Lcom/squareup/picasso/RequestCreator;->setPlaceholder:Z

    if-eqz v1, :cond_1

    .line 688
    invoke-direct {v0}, Lcom/squareup/picasso/RequestCreator;->getPlaceholderDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-static {v3, v1}, Lcom/squareup/picasso/PicassoDrawable;->setPlaceholder(Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;)V

    :cond_1
    return-void

    .line 693
    :cond_2
    iget-boolean v4, v0, Lcom/squareup/picasso/RequestCreator;->deferred:Z

    if-eqz v4, :cond_7

    .line 694
    iget-object v4, v0, Lcom/squareup/picasso/RequestCreator;->data:Lcom/squareup/picasso/Request$Builder;

    invoke-virtual {v4}, Lcom/squareup/picasso/Request$Builder;->hasSize()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 695
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Fit cannot be used with resize."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 697
    :cond_3
    invoke-virtual/range {p1 .. p1}, Landroid/widget/ImageView;->getWidth()I

    move-result v4

    .line 698
    invoke-virtual/range {p1 .. p1}, Landroid/widget/ImageView;->getHeight()I

    move-result v5

    if-eqz v4, :cond_5

    if-nez v5, :cond_4

    goto :goto_0

    .line 706
    :cond_4
    iget-object v6, v0, Lcom/squareup/picasso/RequestCreator;->data:Lcom/squareup/picasso/Request$Builder;

    invoke-virtual {v6, v4, v5}, Lcom/squareup/picasso/Request$Builder;->resize(II)Lcom/squareup/picasso/Request$Builder;

    goto :goto_1

    .line 700
    :cond_5
    :goto_0
    iget-boolean v1, v0, Lcom/squareup/picasso/RequestCreator;->setPlaceholder:Z

    if-eqz v1, :cond_6

    .line 701
    invoke-direct {v0}, Lcom/squareup/picasso/RequestCreator;->getPlaceholderDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-static {v3, v1}, Lcom/squareup/picasso/PicassoDrawable;->setPlaceholder(Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;)V

    .line 703
    :cond_6
    iget-object v1, v0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    new-instance v2, Lcom/squareup/picasso/DeferredRequestCreator;

    invoke-direct {v2, v0, v3, v11}, Lcom/squareup/picasso/DeferredRequestCreator;-><init>(Lcom/squareup/picasso/RequestCreator;Landroid/widget/ImageView;Lcom/squareup/picasso/Callback;)V

    invoke-virtual {v1, v3, v2}, Lcom/squareup/picasso/Picasso;->defer(Landroid/widget/ImageView;Lcom/squareup/picasso/DeferredRequestCreator;)V

    return-void

    .line 709
    :cond_7
    :goto_1
    invoke-direct {v0, v1, v2}, Lcom/squareup/picasso/RequestCreator;->createRequest(J)Lcom/squareup/picasso/Request;

    move-result-object v7

    .line 710
    invoke-static {v7}, Lcom/squareup/picasso/Utils;->createKey(Lcom/squareup/picasso/Request;)Ljava/lang/String;

    move-result-object v9

    .line 712
    iget v1, v0, Lcom/squareup/picasso/RequestCreator;->memoryPolicy:I

    invoke-static {v1}, Lcom/squareup/picasso/MemoryPolicy;->shouldReadFromMemoryCache(I)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 713
    iget-object v1, v0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    invoke-virtual {v1, v9}, Lcom/squareup/picasso/Picasso;->quickMemoryCacheCheck(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v4

    if-eqz v4, :cond_a

    .line 715
    iget-object v1, v0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    invoke-virtual {v1, v3}, Lcom/squareup/picasso/Picasso;->cancelRequest(Landroid/widget/ImageView;)V

    .line 716
    iget-object v1, v0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    iget-object v2, v1, Lcom/squareup/picasso/Picasso;->context:Landroid/content/Context;

    sget-object v5, Lcom/squareup/picasso/Picasso$LoadedFrom;->MEMORY:Lcom/squareup/picasso/Picasso$LoadedFrom;

    iget-boolean v6, v0, Lcom/squareup/picasso/RequestCreator;->noFade:Z

    iget-object v1, v0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    iget-boolean v8, v1, Lcom/squareup/picasso/Picasso;->indicatorsEnabled:Z

    move-object v1, v3

    move-object v3, v4

    move-object v4, v5

    move v5, v6

    move v6, v8

    invoke-static/range {v1 .. v6}, Lcom/squareup/picasso/PicassoDrawable;->setBitmap(Landroid/widget/ImageView;Landroid/content/Context;Landroid/graphics/Bitmap;Lcom/squareup/picasso/Picasso$LoadedFrom;ZZ)V

    .line 717
    iget-object v1, v0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    iget-boolean v1, v1, Lcom/squareup/picasso/Picasso;->loggingEnabled:Z

    if-eqz v1, :cond_8

    const-string v1, "Main"

    const-string v2, "completed"

    .line 718
    invoke-virtual {v7}, Lcom/squareup/picasso/Request;->plainId()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "from "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v5, Lcom/squareup/picasso/Picasso$LoadedFrom;->MEMORY:Lcom/squareup/picasso/Picasso$LoadedFrom;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v2, v3, v4}, Lcom/squareup/picasso/Utils;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_8
    if-eqz v11, :cond_9

    .line 721
    invoke-interface/range {p2 .. p2}, Lcom/squareup/picasso/Callback;->onSuccess()V

    :cond_9
    return-void

    .line 727
    :cond_a
    iget-boolean v1, v0, Lcom/squareup/picasso/RequestCreator;->setPlaceholder:Z

    if-eqz v1, :cond_b

    .line 728
    invoke-direct {v0}, Lcom/squareup/picasso/RequestCreator;->getPlaceholderDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-static {v3, v1}, Lcom/squareup/picasso/PicassoDrawable;->setPlaceholder(Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;)V

    .line 731
    :cond_b
    new-instance v13, Lcom/squareup/picasso/ImageViewAction;

    iget-object v2, v0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    iget v5, v0, Lcom/squareup/picasso/RequestCreator;->memoryPolicy:I

    iget v6, v0, Lcom/squareup/picasso/RequestCreator;->networkPolicy:I

    iget v8, v0, Lcom/squareup/picasso/RequestCreator;->errorResId:I

    iget-object v10, v0, Lcom/squareup/picasso/RequestCreator;->errorDrawable:Landroid/graphics/drawable/Drawable;

    iget-object v12, v0, Lcom/squareup/picasso/RequestCreator;->tag:Ljava/lang/Object;

    iget-boolean v14, v0, Lcom/squareup/picasso/RequestCreator;->noFade:Z

    move-object v1, v13

    move-object v4, v7

    move v7, v8

    move-object v8, v10

    move-object v10, v12

    move v12, v14

    invoke-direct/range {v1 .. v12}, Lcom/squareup/picasso/ImageViewAction;-><init>(Lcom/squareup/picasso/Picasso;Landroid/widget/ImageView;Lcom/squareup/picasso/Request;IIILandroid/graphics/drawable/Drawable;Ljava/lang/String;Ljava/lang/Object;Lcom/squareup/picasso/Callback;Z)V

    .line 735
    iget-object v1, v0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    invoke-virtual {v1, v13}, Lcom/squareup/picasso/Picasso;->enqueueAndSubmit(Lcom/squareup/picasso/Action;)V

    return-void
.end method

.method public into(Landroid/widget/RemoteViews;IILandroid/app/Notification;)V
    .locals 6
    .param p1    # Landroid/widget/RemoteViews;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # I
        .annotation build Landroid/support/annotation/IdRes;
        .end annotation
    .end param
    .param p4    # Landroid/app/Notification;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    .line 573
    invoke-virtual/range {v0 .. v5}, Lcom/squareup/picasso/RequestCreator;->into(Landroid/widget/RemoteViews;IILandroid/app/Notification;Ljava/lang/String;)V

    return-void
.end method

.method public into(Landroid/widget/RemoteViews;IILandroid/app/Notification;Ljava/lang/String;)V
    .locals 7
    .param p1    # Landroid/widget/RemoteViews;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # I
        .annotation build Landroid/support/annotation/IdRes;
        .end annotation
    .end param
    .param p4    # Landroid/app/Notification;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p5    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    move-object v5, p5

    .line 582
    invoke-virtual/range {v0 .. v6}, Lcom/squareup/picasso/RequestCreator;->into(Landroid/widget/RemoteViews;IILandroid/app/Notification;Ljava/lang/String;Lcom/squareup/picasso/Callback;)V

    return-void
.end method

.method public into(Landroid/widget/RemoteViews;IILandroid/app/Notification;Ljava/lang/String;Lcom/squareup/picasso/Callback;)V
    .locals 17
    .param p1    # Landroid/widget/RemoteViews;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # I
        .annotation build Landroid/support/annotation/IdRes;
        .end annotation
    .end param
    .param p4    # Landroid/app/Notification;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p5    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    move-object/from16 v0, p0

    .line 591
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v1

    if-nez p1, :cond_0

    .line 594
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "RemoteViews must not be null."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_0
    if-nez p4, :cond_1

    .line 597
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Notification must not be null."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 599
    :cond_1
    iget-boolean v3, v0, Lcom/squareup/picasso/RequestCreator;->deferred:Z

    if-eqz v3, :cond_2

    .line 600
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Fit cannot be used with RemoteViews."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 602
    :cond_2
    iget-object v3, v0, Lcom/squareup/picasso/RequestCreator;->placeholderDrawable:Landroid/graphics/drawable/Drawable;

    if-nez v3, :cond_4

    iget v3, v0, Lcom/squareup/picasso/RequestCreator;->placeholderResId:I

    if-nez v3, :cond_4

    iget-object v3, v0, Lcom/squareup/picasso/RequestCreator;->errorDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v3, :cond_3

    goto :goto_0

    .line 607
    :cond_3
    invoke-direct {v0, v1, v2}, Lcom/squareup/picasso/RequestCreator;->createRequest(J)Lcom/squareup/picasso/Request;

    move-result-object v5

    .line 608
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v5, v1}, Lcom/squareup/picasso/Utils;->createKey(Lcom/squareup/picasso/Request;Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object v13

    .line 610
    new-instance v1, Lcom/squareup/picasso/RemoteViewsAction$NotificationAction;

    iget-object v4, v0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    iget v11, v0, Lcom/squareup/picasso/RequestCreator;->memoryPolicy:I

    iget v12, v0, Lcom/squareup/picasso/RequestCreator;->networkPolicy:I

    iget-object v14, v0, Lcom/squareup/picasso/RequestCreator;->tag:Ljava/lang/Object;

    iget v15, v0, Lcom/squareup/picasso/RequestCreator;->errorResId:I

    move-object v3, v1

    move-object/from16 v6, p1

    move/from16 v7, p2

    move/from16 v8, p3

    move-object/from16 v9, p4

    move-object/from16 v10, p5

    move-object/from16 v16, p6

    invoke-direct/range {v3 .. v16}, Lcom/squareup/picasso/RemoteViewsAction$NotificationAction;-><init>(Lcom/squareup/picasso/Picasso;Lcom/squareup/picasso/Request;Landroid/widget/RemoteViews;IILandroid/app/Notification;Ljava/lang/String;IILjava/lang/String;Ljava/lang/Object;ILcom/squareup/picasso/Callback;)V

    .line 614
    invoke-direct {v0, v1}, Lcom/squareup/picasso/RequestCreator;->performRemoteViewInto(Lcom/squareup/picasso/RemoteViewsAction;)V

    return-void

    .line 603
    :cond_4
    :goto_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Cannot use placeholder or error drawables with remote views."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public into(Landroid/widget/RemoteViews;I[I)V
    .locals 1
    .param p1    # Landroid/widget/RemoteViews;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # I
        .annotation build Landroid/support/annotation/IdRes;
        .end annotation
    .end param
    .param p3    # [I
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 623
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/squareup/picasso/RequestCreator;->into(Landroid/widget/RemoteViews;I[ILcom/squareup/picasso/Callback;)V

    return-void
.end method

.method public into(Landroid/widget/RemoteViews;I[ILcom/squareup/picasso/Callback;)V
    .locals 15
    .param p1    # Landroid/widget/RemoteViews;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # I
        .annotation build Landroid/support/annotation/IdRes;
        .end annotation
    .end param
    .param p3    # [I
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    move-object v0, p0

    .line 632
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v1

    if-nez p1, :cond_0

    .line 635
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "remoteViews must not be null."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_0
    if-nez p3, :cond_1

    .line 638
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "appWidgetIds must not be null."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 640
    :cond_1
    iget-boolean v3, v0, Lcom/squareup/picasso/RequestCreator;->deferred:Z

    if-eqz v3, :cond_2

    .line 641
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Fit cannot be used with remote views."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 643
    :cond_2
    iget-object v3, v0, Lcom/squareup/picasso/RequestCreator;->placeholderDrawable:Landroid/graphics/drawable/Drawable;

    if-nez v3, :cond_4

    iget v3, v0, Lcom/squareup/picasso/RequestCreator;->placeholderResId:I

    if-nez v3, :cond_4

    iget-object v3, v0, Lcom/squareup/picasso/RequestCreator;->errorDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v3, :cond_3

    goto :goto_0

    .line 648
    :cond_3
    invoke-direct {v0, v1, v2}, Lcom/squareup/picasso/RequestCreator;->createRequest(J)Lcom/squareup/picasso/Request;

    move-result-object v5

    .line 649
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v5, v1}, Lcom/squareup/picasso/Utils;->createKey(Lcom/squareup/picasso/Request;Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object v11

    .line 651
    new-instance v1, Lcom/squareup/picasso/RemoteViewsAction$AppWidgetAction;

    iget-object v4, v0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    iget v9, v0, Lcom/squareup/picasso/RequestCreator;->memoryPolicy:I

    iget v10, v0, Lcom/squareup/picasso/RequestCreator;->networkPolicy:I

    iget-object v12, v0, Lcom/squareup/picasso/RequestCreator;->tag:Ljava/lang/Object;

    iget v13, v0, Lcom/squareup/picasso/RequestCreator;->errorResId:I

    move-object v3, v1

    move-object/from16 v6, p1

    move/from16 v7, p2

    move-object/from16 v8, p3

    move-object/from16 v14, p4

    invoke-direct/range {v3 .. v14}, Lcom/squareup/picasso/RemoteViewsAction$AppWidgetAction;-><init>(Lcom/squareup/picasso/Picasso;Lcom/squareup/picasso/Request;Landroid/widget/RemoteViews;I[IIILjava/lang/String;Ljava/lang/Object;ILcom/squareup/picasso/Callback;)V

    .line 655
    invoke-direct {v0, v1}, Lcom/squareup/picasso/RequestCreator;->performRemoteViewInto(Lcom/squareup/picasso/RemoteViewsAction;)V

    return-void

    .line 644
    :cond_4
    :goto_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Cannot use placeholder or error drawables with remote views."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public into(Lcom/squareup/picasso/Target;)V
    .locals 14
    .param p1    # Lcom/squareup/picasso/Target;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 531
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    .line 532
    invoke-static {}, Lcom/squareup/picasso/Utils;->checkMain()V

    if-nez p1, :cond_0

    .line 535
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Target must not be null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 537
    :cond_0
    iget-boolean v2, p0, Lcom/squareup/picasso/RequestCreator;->deferred:Z

    if-eqz v2, :cond_1

    .line 538
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Fit cannot be used with a Target."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 541
    :cond_1
    iget-object v2, p0, Lcom/squareup/picasso/RequestCreator;->data:Lcom/squareup/picasso/Request$Builder;

    invoke-virtual {v2}, Lcom/squareup/picasso/Request$Builder;->hasImage()Z

    move-result v2

    const/4 v3, 0x0

    if-nez v2, :cond_3

    .line 542
    iget-object v0, p0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    invoke-virtual {v0, p1}, Lcom/squareup/picasso/Picasso;->cancelRequest(Lcom/squareup/picasso/Target;)V

    .line 543
    iget-boolean v0, p0, Lcom/squareup/picasso/RequestCreator;->setPlaceholder:Z

    if-eqz v0, :cond_2

    invoke-direct {p0}, Lcom/squareup/picasso/RequestCreator;->getPlaceholderDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    :cond_2
    invoke-interface {p1, v3}, Lcom/squareup/picasso/Target;->onPrepareLoad(Landroid/graphics/drawable/Drawable;)V

    return-void

    .line 547
    :cond_3
    invoke-direct {p0, v0, v1}, Lcom/squareup/picasso/RequestCreator;->createRequest(J)Lcom/squareup/picasso/Request;

    move-result-object v7

    .line 548
    invoke-static {v7}, Lcom/squareup/picasso/Utils;->createKey(Lcom/squareup/picasso/Request;)Ljava/lang/String;

    move-result-object v11

    .line 550
    iget v0, p0, Lcom/squareup/picasso/RequestCreator;->memoryPolicy:I

    invoke-static {v0}, Lcom/squareup/picasso/MemoryPolicy;->shouldReadFromMemoryCache(I)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 551
    iget-object v0, p0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    invoke-virtual {v0, v11}, Lcom/squareup/picasso/Picasso;->quickMemoryCacheCheck(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 553
    iget-object v1, p0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    invoke-virtual {v1, p1}, Lcom/squareup/picasso/Picasso;->cancelRequest(Lcom/squareup/picasso/Target;)V

    .line 554
    sget-object v1, Lcom/squareup/picasso/Picasso$LoadedFrom;->MEMORY:Lcom/squareup/picasso/Picasso$LoadedFrom;

    invoke-interface {p1, v0, v1}, Lcom/squareup/picasso/Target;->onBitmapLoaded(Landroid/graphics/Bitmap;Lcom/squareup/picasso/Picasso$LoadedFrom;)V

    return-void

    .line 559
    :cond_4
    iget-boolean v0, p0, Lcom/squareup/picasso/RequestCreator;->setPlaceholder:Z

    if-eqz v0, :cond_5

    invoke-direct {p0}, Lcom/squareup/picasso/RequestCreator;->getPlaceholderDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    :cond_5
    invoke-interface {p1, v3}, Lcom/squareup/picasso/Target;->onPrepareLoad(Landroid/graphics/drawable/Drawable;)V

    .line 561
    new-instance v0, Lcom/squareup/picasso/TargetAction;

    iget-object v5, p0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    iget v8, p0, Lcom/squareup/picasso/RequestCreator;->memoryPolicy:I

    iget v9, p0, Lcom/squareup/picasso/RequestCreator;->networkPolicy:I

    iget-object v10, p0, Lcom/squareup/picasso/RequestCreator;->errorDrawable:Landroid/graphics/drawable/Drawable;

    iget-object v12, p0, Lcom/squareup/picasso/RequestCreator;->tag:Ljava/lang/Object;

    iget v13, p0, Lcom/squareup/picasso/RequestCreator;->errorResId:I

    move-object v4, v0

    move-object v6, p1

    invoke-direct/range {v4 .. v13}, Lcom/squareup/picasso/TargetAction;-><init>(Lcom/squareup/picasso/Picasso;Lcom/squareup/picasso/Target;Lcom/squareup/picasso/Request;IILandroid/graphics/drawable/Drawable;Ljava/lang/String;Ljava/lang/Object;I)V

    .line 564
    iget-object p1, p0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    invoke-virtual {p1, v0}, Lcom/squareup/picasso/Picasso;->enqueueAndSubmit(Lcom/squareup/picasso/Action;)V

    return-void
.end method

.method public varargs memoryPolicy(Lcom/squareup/picasso/MemoryPolicy;[Lcom/squareup/picasso/MemoryPolicy;)Lcom/squareup/picasso/RequestCreator;
    .locals 3
    .param p1    # Lcom/squareup/picasso/MemoryPolicy;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # [Lcom/squareup/picasso/MemoryPolicy;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    if-nez p1, :cond_0

    .line 349
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Memory policy cannot be null."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 351
    :cond_0
    iget v0, p0, Lcom/squareup/picasso/RequestCreator;->memoryPolicy:I

    iget p1, p1, Lcom/squareup/picasso/MemoryPolicy;->index:I

    or-int/2addr p1, v0

    iput p1, p0, Lcom/squareup/picasso/RequestCreator;->memoryPolicy:I

    if-nez p2, :cond_1

    .line 353
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Memory policy cannot be null."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 355
    :cond_1
    array-length p1, p2

    if-lez p1, :cond_3

    .line 356
    array-length p1, p2

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p1, :cond_3

    aget-object v1, p2, v0

    if-nez v1, :cond_2

    .line 358
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Memory policy cannot be null."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 360
    :cond_2
    iget v2, p0, Lcom/squareup/picasso/RequestCreator;->memoryPolicy:I

    iget v1, v1, Lcom/squareup/picasso/MemoryPolicy;->index:I

    or-int/2addr v1, v2

    iput v1, p0, Lcom/squareup/picasso/RequestCreator;->memoryPolicy:I

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    return-object p0
.end method

.method public varargs networkPolicy(Lcom/squareup/picasso/NetworkPolicy;[Lcom/squareup/picasso/NetworkPolicy;)Lcom/squareup/picasso/RequestCreator;
    .locals 3
    .param p1    # Lcom/squareup/picasso/NetworkPolicy;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # [Lcom/squareup/picasso/NetworkPolicy;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    if-nez p1, :cond_0

    .line 373
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Network policy cannot be null."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 375
    :cond_0
    iget v0, p0, Lcom/squareup/picasso/RequestCreator;->networkPolicy:I

    iget p1, p1, Lcom/squareup/picasso/NetworkPolicy;->index:I

    or-int/2addr p1, v0

    iput p1, p0, Lcom/squareup/picasso/RequestCreator;->networkPolicy:I

    if-nez p2, :cond_1

    .line 377
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Network policy cannot be null."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 379
    :cond_1
    array-length p1, p2

    if-lez p1, :cond_3

    .line 380
    array-length p1, p2

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p1, :cond_3

    aget-object v1, p2, v0

    if-nez v1, :cond_2

    .line 382
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Network policy cannot be null."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 384
    :cond_2
    iget v2, p0, Lcom/squareup/picasso/RequestCreator;->networkPolicy:I

    iget v1, v1, Lcom/squareup/picasso/NetworkPolicy;->index:I

    or-int/2addr v1, v2

    iput v1, p0, Lcom/squareup/picasso/RequestCreator;->networkPolicy:I

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    return-object p0
.end method

.method public noFade()Lcom/squareup/picasso/RequestCreator;
    .locals 1

    const/4 v0, 0x1

    .line 404
    iput-boolean v0, p0, Lcom/squareup/picasso/RequestCreator;->noFade:Z

    return-object p0
.end method

.method public noPlaceholder()Lcom/squareup/picasso/RequestCreator;
    .locals 2

    .line 96
    iget v0, p0, Lcom/squareup/picasso/RequestCreator;->placeholderResId:I

    if-eqz v0, :cond_0

    .line 97
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Placeholder resource already set."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 99
    :cond_0
    iget-object v0, p0, Lcom/squareup/picasso/RequestCreator;->placeholderDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_1

    .line 100
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Placeholder image already set."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    const/4 v0, 0x0

    .line 102
    iput-boolean v0, p0, Lcom/squareup/picasso/RequestCreator;->setPlaceholder:Z

    return-object p0
.end method

.method public onlyScaleDown()Lcom/squareup/picasso/RequestCreator;
    .locals 1

    .line 273
    iget-object v0, p0, Lcom/squareup/picasso/RequestCreator;->data:Lcom/squareup/picasso/Request$Builder;

    invoke-virtual {v0}, Lcom/squareup/picasso/Request$Builder;->onlyScaleDown()Lcom/squareup/picasso/Request$Builder;

    return-object p0
.end method

.method public placeholder(I)Lcom/squareup/picasso/RequestCreator;
    .locals 1
    .param p1    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    .line 112
    iget-boolean v0, p0, Lcom/squareup/picasso/RequestCreator;->setPlaceholder:Z

    if-nez v0, :cond_0

    .line 113
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Already explicitly declared as no placeholder."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_0
    if-nez p1, :cond_1

    .line 116
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Placeholder image resource invalid."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 118
    :cond_1
    iget-object v0, p0, Lcom/squareup/picasso/RequestCreator;->placeholderDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_2

    .line 119
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Placeholder image already set."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 121
    :cond_2
    iput p1, p0, Lcom/squareup/picasso/RequestCreator;->placeholderResId:I

    return-object p0
.end method

.method public placeholder(Landroid/graphics/drawable/Drawable;)Lcom/squareup/picasso/RequestCreator;
    .locals 1
    .param p1    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 134
    iget-boolean v0, p0, Lcom/squareup/picasso/RequestCreator;->setPlaceholder:Z

    if-nez v0, :cond_0

    .line 135
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Already explicitly declared as no placeholder."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 137
    :cond_0
    iget v0, p0, Lcom/squareup/picasso/RequestCreator;->placeholderResId:I

    if-eqz v0, :cond_1

    .line 138
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Placeholder image already set."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 140
    :cond_1
    iput-object p1, p0, Lcom/squareup/picasso/RequestCreator;->placeholderDrawable:Landroid/graphics/drawable/Drawable;

    return-object p0
.end method

.method public priority(Lcom/squareup/picasso/Picasso$Priority;)Lcom/squareup/picasso/RequestCreator;
    .locals 1
    .param p1    # Lcom/squareup/picasso/Picasso$Priority;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 317
    iget-object v0, p0, Lcom/squareup/picasso/RequestCreator;->data:Lcom/squareup/picasso/Request$Builder;

    invoke-virtual {v0, p1}, Lcom/squareup/picasso/Request$Builder;->priority(Lcom/squareup/picasso/Picasso$Priority;)Lcom/squareup/picasso/Request$Builder;

    return-object p0
.end method

.method public purgeable()Lcom/squareup/picasso/RequestCreator;
    .locals 1

    .line 398
    iget-object v0, p0, Lcom/squareup/picasso/RequestCreator;->data:Lcom/squareup/picasso/Request$Builder;

    invoke-virtual {v0}, Lcom/squareup/picasso/Request$Builder;->purgeable()Lcom/squareup/picasso/Request$Builder;

    return-object p0
.end method

.method public resize(II)Lcom/squareup/picasso/RequestCreator;
    .locals 1

    .line 235
    iget-object v0, p0, Lcom/squareup/picasso/RequestCreator;->data:Lcom/squareup/picasso/Request$Builder;

    invoke-virtual {v0, p1, p2}, Lcom/squareup/picasso/Request$Builder;->resize(II)Lcom/squareup/picasso/Request$Builder;

    return-object p0
.end method

.method public resizeDimen(II)Lcom/squareup/picasso/RequestCreator;
    .locals 1

    .line 227
    iget-object v0, p0, Lcom/squareup/picasso/RequestCreator;->picasso:Lcom/squareup/picasso/Picasso;

    iget-object v0, v0, Lcom/squareup/picasso/Picasso;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 228
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    .line 229
    invoke-virtual {v0, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    .line 230
    invoke-virtual {p0, p1, p2}, Lcom/squareup/picasso/RequestCreator;->resize(II)Lcom/squareup/picasso/RequestCreator;

    move-result-object p1

    return-object p1
.end method

.method public rotate(F)Lcom/squareup/picasso/RequestCreator;
    .locals 1

    .line 279
    iget-object v0, p0, Lcom/squareup/picasso/RequestCreator;->data:Lcom/squareup/picasso/Request$Builder;

    invoke-virtual {v0, p1}, Lcom/squareup/picasso/Request$Builder;->rotate(F)Lcom/squareup/picasso/Request$Builder;

    return-object p0
.end method

.method public rotate(FFF)Lcom/squareup/picasso/RequestCreator;
    .locals 1

    .line 285
    iget-object v0, p0, Lcom/squareup/picasso/RequestCreator;->data:Lcom/squareup/picasso/Request$Builder;

    invoke-virtual {v0, p1, p2, p3}, Lcom/squareup/picasso/Request$Builder;->rotate(FFF)Lcom/squareup/picasso/Request$Builder;

    return-object p0
.end method

.method public stableKey(Ljava/lang/String;)Lcom/squareup/picasso/RequestCreator;
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 305
    iget-object v0, p0, Lcom/squareup/picasso/RequestCreator;->data:Lcom/squareup/picasso/Request$Builder;

    invoke-virtual {v0, p1}, Lcom/squareup/picasso/Request$Builder;->stableKey(Ljava/lang/String;)Lcom/squareup/picasso/Request$Builder;

    return-object p0
.end method

.method public tag(Ljava/lang/Object;)Lcom/squareup/picasso/RequestCreator;
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    if-nez p1, :cond_0

    .line 188
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Tag invalid."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 190
    :cond_0
    iget-object v0, p0, Lcom/squareup/picasso/RequestCreator;->tag:Ljava/lang/Object;

    if-eqz v0, :cond_1

    .line 191
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Tag already set."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 193
    :cond_1
    iput-object p1, p0, Lcom/squareup/picasso/RequestCreator;->tag:Ljava/lang/Object;

    return-object p0
.end method

.method public transform(Lcom/squareup/picasso/Transformation;)Lcom/squareup/picasso/RequestCreator;
    .locals 1
    .param p1    # Lcom/squareup/picasso/Transformation;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 328
    iget-object v0, p0, Lcom/squareup/picasso/RequestCreator;->data:Lcom/squareup/picasso/Request$Builder;

    invoke-virtual {v0, p1}, Lcom/squareup/picasso/Request$Builder;->transform(Lcom/squareup/picasso/Transformation;)Lcom/squareup/picasso/Request$Builder;

    return-object p0
.end method

.method public transform(Ljava/util/List;)Lcom/squareup/picasso/RequestCreator;
    .locals 1
    .param p1    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/squareup/picasso/Transformation;",
            ">;)",
            "Lcom/squareup/picasso/RequestCreator;"
        }
    .end annotation

    .line 338
    iget-object v0, p0, Lcom/squareup/picasso/RequestCreator;->data:Lcom/squareup/picasso/Request$Builder;

    invoke-virtual {v0, p1}, Lcom/squareup/picasso/Request$Builder;->transform(Ljava/util/List;)Lcom/squareup/picasso/Request$Builder;

    return-object p0
.end method

.method unfit()Lcom/squareup/picasso/RequestCreator;
    .locals 1

    const/4 v0, 0x0

    .line 210
    iput-boolean v0, p0, Lcom/squareup/picasso/RequestCreator;->deferred:Z

    return-object p0
.end method