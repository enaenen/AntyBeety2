.class public Lcom/google/android/exoplayer2/source/dash/manifest/Representation$SingleSegmentRepresentation;
.super Lcom/google/android/exoplayer2/source/dash/manifest/Representation;
.source "Representation.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer2/source/dash/manifest/Representation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SingleSegmentRepresentation"
.end annotation


# instance fields
.field private final cacheKey:Ljava/lang/String;

.field public final contentLength:J

.field private final indexUri:Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;

.field private final segmentIndex:Lcom/google/android/exoplayer2/source/dash/manifest/SingleSegmentIndex;

.field public final uri:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Ljava/lang/String;JLcom/google/android/exoplayer2/Format;Ljava/lang/String;Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SingleSegmentBase;Ljava/util/List;Ljava/lang/String;J)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "J",
            "Lcom/google/android/exoplayer2/Format;",
            "Ljava/lang/String;",
            "Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SingleSegmentBase;",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/source/dash/manifest/SchemeValuePair;",
            ">;",
            "Ljava/lang/String;",
            "J)V"
        }
    .end annotation

    move-object v9, p0

    move-object v10, p1

    const/4 v8, 0x0

    move-object v0, v9

    move-object v1, v10

    move-wide v2, p2

    move-object v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    .line 227
    invoke-direct/range {v0 .. v8}, Lcom/google/android/exoplayer2/source/dash/manifest/Representation;-><init>(Ljava/lang/String;JLcom/google/android/exoplayer2/Format;Ljava/lang/String;Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase;Ljava/util/List;Lcom/google/android/exoplayer2/source/dash/manifest/Representation$1;)V

    .line 228
    invoke-static/range {p5 .. p5}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    iput-object v0, v9, Lcom/google/android/exoplayer2/source/dash/manifest/Representation$SingleSegmentRepresentation;->uri:Landroid/net/Uri;

    .line 229
    invoke-virtual/range {p6 .. p6}, Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SingleSegmentBase;->getIndex()Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;

    move-result-object v0

    iput-object v0, v9, Lcom/google/android/exoplayer2/source/dash/manifest/Representation$SingleSegmentRepresentation;->indexUri:Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;

    const/4 v0, 0x0

    if-eqz p8, :cond_0

    move-object/from16 v1, p8

    goto :goto_0

    :cond_0
    if-eqz v10, :cond_1

    .line 230
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object v2, p4

    iget-object v2, v2, Lcom/google/android/exoplayer2/Format;->id:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-wide v2, p2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_1
    move-object v1, v0

    :goto_0
    iput-object v1, v9, Lcom/google/android/exoplayer2/source/dash/manifest/Representation$SingleSegmentRepresentation;->cacheKey:Ljava/lang/String;

    move-wide/from16 v6, p9

    .line 232
    iput-wide v6, v9, Lcom/google/android/exoplayer2/source/dash/manifest/Representation$SingleSegmentRepresentation;->contentLength:J

    .line 235
    iget-object v1, v9, Lcom/google/android/exoplayer2/source/dash/manifest/Representation$SingleSegmentRepresentation;->indexUri:Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;

    if-eqz v1, :cond_2

    goto :goto_1

    :cond_2
    new-instance v0, Lcom/google/android/exoplayer2/source/dash/manifest/SingleSegmentIndex;

    new-instance v1, Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;

    const/4 v3, 0x0

    const-wide/16 v4, 0x0

    move-object v2, v1

    invoke-direct/range {v2 .. v7}, Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;-><init>(Ljava/lang/String;JJ)V

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer2/source/dash/manifest/SingleSegmentIndex;-><init>(Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;)V

    :goto_1
    iput-object v0, v9, Lcom/google/android/exoplayer2/source/dash/manifest/Representation$SingleSegmentRepresentation;->segmentIndex:Lcom/google/android/exoplayer2/source/dash/manifest/SingleSegmentIndex;

    return-void
.end method

.method public static newInstance(Ljava/lang/String;JLcom/google/android/exoplayer2/Format;Ljava/lang/String;JJJJLjava/util/List;Ljava/lang/String;J)Lcom/google/android/exoplayer2/source/dash/manifest/Representation$SingleSegmentRepresentation;
    .locals 22
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "J",
            "Lcom/google/android/exoplayer2/Format;",
            "Ljava/lang/String;",
            "JJJJ",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/source/dash/manifest/SchemeValuePair;",
            ">;",
            "Ljava/lang/String;",
            "J)",
            "Lcom/google/android/exoplayer2/source/dash/manifest/Representation$SingleSegmentRepresentation;"
        }
    .end annotation

    .line 206
    new-instance v6, Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;

    sub-long v4, p7, p5

    const-wide/16 v7, 0x1

    add-long v9, v4, v7

    const/4 v1, 0x0

    move-object v0, v6

    move-wide/from16 v2, p5

    move-wide v4, v9

    invoke-direct/range {v0 .. v5}, Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;-><init>(Ljava/lang/String;JJ)V

    .line 208
    new-instance v17, Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SingleSegmentBase;

    sub-long v2, p11, p9

    add-long v11, v2, v7

    const-wide/16 v2, 0x1

    const-wide/16 v4, 0x0

    move-object/from16 v0, v17

    move-object v1, v6

    move-wide/from16 v6, p9

    move-wide v8, v11

    invoke-direct/range {v0 .. v9}, Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SingleSegmentBase;-><init>(Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;JJJJ)V

    .line 210
    new-instance v0, Lcom/google/android/exoplayer2/source/dash/manifest/Representation$SingleSegmentRepresentation;

    move-object v11, v0

    move-object/from16 v12, p0

    move-wide/from16 v13, p1

    move-object/from16 v15, p3

    move-object/from16 v16, p4

    move-object/from16 v18, p13

    move-object/from16 v19, p14

    move-wide/from16 v20, p15

    invoke-direct/range {v11 .. v21}, Lcom/google/android/exoplayer2/source/dash/manifest/Representation$SingleSegmentRepresentation;-><init>(Ljava/lang/String;JLcom/google/android/exoplayer2/Format;Ljava/lang/String;Lcom/google/android/exoplayer2/source/dash/manifest/SegmentBase$SingleSegmentBase;Ljava/util/List;Ljava/lang/String;J)V

    return-object v0
.end method


# virtual methods
.method public getCacheKey()Ljava/lang/String;
    .locals 1

    .line 251
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/dash/manifest/Representation$SingleSegmentRepresentation;->cacheKey:Ljava/lang/String;

    return-object v0
.end method

.method public getIndex()Lcom/google/android/exoplayer2/source/dash/DashSegmentIndex;
    .locals 1

    .line 246
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/dash/manifest/Representation$SingleSegmentRepresentation;->segmentIndex:Lcom/google/android/exoplayer2/source/dash/manifest/SingleSegmentIndex;

    return-object v0
.end method

.method public getIndexUri()Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;
    .locals 1

    .line 241
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/dash/manifest/Representation$SingleSegmentRepresentation;->indexUri:Lcom/google/android/exoplayer2/source/dash/manifest/RangedUri;

    return-object v0
.end method
