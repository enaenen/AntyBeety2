.class final Lcom/google/android/exoplayer2/source/dash/DashMediaSource$PeriodSeekInfo;
.super Ljava/lang/Object;
.source "DashMediaSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer2/source/dash/DashMediaSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "PeriodSeekInfo"
.end annotation


# instance fields
.field public final availableEndTimeUs:J

.field public final availableStartTimeUs:J

.field public final isIndexExplicit:Z


# direct methods
.method private constructor <init>(ZJJ)V
    .locals 0

    .line 611
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 612
    iput-boolean p1, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource$PeriodSeekInfo;->isIndexExplicit:Z

    .line 613
    iput-wide p2, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource$PeriodSeekInfo;->availableStartTimeUs:J

    .line 614
    iput-wide p4, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource$PeriodSeekInfo;->availableEndTimeUs:J

    return-void
.end method

.method public static createPeriodSeekInfo(Lcom/google/android/exoplayer2/source/dash/manifest/Period;J)Lcom/google/android/exoplayer2/source/dash/DashMediaSource$PeriodSeekInfo;
    .locals 18

    move-object/from16 v0, p0

    move-wide/from16 v4, p1

    .line 575
    iget-object v1, v0, Lcom/google/android/exoplayer2/source/dash/manifest/Period;->adaptationSets:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v6, 0x0

    const-wide v7, 0x7fffffffffffffffL

    move-wide v12, v7

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const-wide/16 v10, 0x0

    :goto_0
    if-ge v7, v1, :cond_4

    .line 581
    iget-object v14, v0, Lcom/google/android/exoplayer2/source/dash/manifest/Period;->adaptationSets:Ljava/util/List;

    invoke-interface {v14, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/google/android/exoplayer2/source/dash/manifest/AdaptationSet;

    iget-object v14, v14, Lcom/google/android/exoplayer2/source/dash/manifest/AdaptationSet;->representations:Ljava/util/List;

    invoke-interface {v14, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/google/android/exoplayer2/source/dash/manifest/Representation;

    invoke-virtual {v14}, Lcom/google/android/exoplayer2/source/dash/manifest/Representation;->getIndex()Lcom/google/android/exoplayer2/source/dash/DashSegmentIndex;

    move-result-object v14

    if-nez v14, :cond_0

    .line 583
    new-instance v6, Lcom/google/android/exoplayer2/source/dash/DashMediaSource$PeriodSeekInfo;

    const/4 v1, 0x1

    const-wide/16 v2, 0x0

    move-object v0, v6

    invoke-direct/range {v0 .. v5}, Lcom/google/android/exoplayer2/source/dash/DashMediaSource$PeriodSeekInfo;-><init>(ZJJ)V

    return-object v6

    .line 585
    :cond_0
    invoke-interface {v14}, Lcom/google/android/exoplayer2/source/dash/DashSegmentIndex;->isExplicit()Z

    move-result v15

    or-int/2addr v9, v15

    .line 586
    invoke-interface {v14, v4, v5}, Lcom/google/android/exoplayer2/source/dash/DashSegmentIndex;->getSegmentCount(J)I

    move-result v15

    const/16 v16, 0x1

    if-nez v15, :cond_1

    move/from16 v17, v7

    const/4 v8, 0x1

    const-wide/16 v10, 0x0

    const-wide/16 v12, 0x0

    goto :goto_1

    :cond_1
    if-nez v8, :cond_3

    .line 592
    invoke-interface {v14}, Lcom/google/android/exoplayer2/source/dash/DashSegmentIndex;->getFirstSegmentNum()I

    move-result v2

    move/from16 v17, v7

    .line 593
    invoke-interface {v14, v2}, Lcom/google/android/exoplayer2/source/dash/DashSegmentIndex;->getTimeUs(I)J

    move-result-wide v6

    .line 594
    invoke-static {v10, v11, v6, v7}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v6

    const/4 v3, -0x1

    if-eq v15, v3, :cond_2

    add-int/2addr v2, v15

    add-int/lit8 v2, v2, -0x1

    .line 597
    invoke-interface {v14, v2}, Lcom/google/android/exoplayer2/source/dash/DashSegmentIndex;->getTimeUs(I)J

    move-result-wide v10

    .line 598
    invoke-interface {v14, v2, v4, v5}, Lcom/google/android/exoplayer2/source/dash/DashSegmentIndex;->getDurationUs(IJ)J

    move-result-wide v2

    add-long v14, v10, v2

    .line 599
    invoke-static {v12, v13, v14, v15}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    move-wide v12, v2

    :cond_2
    move-wide v10, v6

    goto :goto_1

    :cond_3
    move/from16 v17, v7

    :goto_1
    add-int/lit8 v7, v17, 0x1

    const/4 v6, 0x0

    goto :goto_0

    .line 603
    :cond_4
    new-instance v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource$PeriodSeekInfo;

    move-object v8, v0

    invoke-direct/range {v8 .. v13}, Lcom/google/android/exoplayer2/source/dash/DashMediaSource$PeriodSeekInfo;-><init>(ZJJ)V

    return-object v0
.end method
