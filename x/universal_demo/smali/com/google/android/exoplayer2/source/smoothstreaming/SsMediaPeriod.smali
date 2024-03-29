.class final Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaPeriod;
.super Ljava/lang/Object;
.source "SsMediaPeriod.java"

# interfaces
.implements Lcom/google/android/exoplayer2/source/MediaPeriod;
.implements Lcom/google/android/exoplayer2/source/SequenceableLoader$Callback;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/exoplayer2/source/MediaPeriod;",
        "Lcom/google/android/exoplayer2/source/SequenceableLoader$Callback<",
        "Lcom/google/android/exoplayer2/source/chunk/ChunkSampleStream<",
        "Lcom/google/android/exoplayer2/source/smoothstreaming/SsChunkSource;",
        ">;>;"
    }
.end annotation


# static fields
.field private static final INITIALIZATION_VECTOR_SIZE:I = 0x8


# instance fields
.field private final allocator:Lcom/google/android/exoplayer2/upstream/Allocator;

.field private callback:Lcom/google/android/exoplayer2/source/MediaPeriod$Callback;

.field private final chunkSourceFactory:Lcom/google/android/exoplayer2/source/smoothstreaming/SsChunkSource$Factory;

.field private final eventDispatcher:Lcom/google/android/exoplayer2/source/AdaptiveMediaSourceEventListener$EventDispatcher;

.field private manifest:Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/SsManifest;

.field private final manifestLoaderErrorThrower:Lcom/google/android/exoplayer2/upstream/LoaderErrorThrower;

.field private final minLoadableRetryCount:I

.field private sampleStreams:[Lcom/google/android/exoplayer2/source/chunk/ChunkSampleStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lcom/google/android/exoplayer2/source/chunk/ChunkSampleStream<",
            "Lcom/google/android/exoplayer2/source/smoothstreaming/SsChunkSource;",
            ">;"
        }
    .end annotation
.end field

.field private sequenceableLoader:Lcom/google/android/exoplayer2/source/CompositeSequenceableLoader;

.field private final trackEncryptionBoxes:[Lcom/google/android/exoplayer2/extractor/mp4/TrackEncryptionBox;

.field private final trackGroups:Lcom/google/android/exoplayer2/source/TrackGroupArray;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/SsManifest;Lcom/google/android/exoplayer2/source/smoothstreaming/SsChunkSource$Factory;ILcom/google/android/exoplayer2/source/AdaptiveMediaSourceEventListener$EventDispatcher;Lcom/google/android/exoplayer2/upstream/LoaderErrorThrower;Lcom/google/android/exoplayer2/upstream/Allocator;)V
    .locals 1

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    iput-object p2, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaPeriod;->chunkSourceFactory:Lcom/google/android/exoplayer2/source/smoothstreaming/SsChunkSource$Factory;

    .line 62
    iput-object p5, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaPeriod;->manifestLoaderErrorThrower:Lcom/google/android/exoplayer2/upstream/LoaderErrorThrower;

    .line 63
    iput p3, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaPeriod;->minLoadableRetryCount:I

    .line 64
    iput-object p4, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaPeriod;->eventDispatcher:Lcom/google/android/exoplayer2/source/AdaptiveMediaSourceEventListener$EventDispatcher;

    .line 65
    iput-object p6, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaPeriod;->allocator:Lcom/google/android/exoplayer2/upstream/Allocator;

    .line 67
    invoke-static {p1}, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaPeriod;->buildTrackGroups(Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/SsManifest;)Lcom/google/android/exoplayer2/source/TrackGroupArray;

    move-result-object p2

    iput-object p2, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaPeriod;->trackGroups:Lcom/google/android/exoplayer2/source/TrackGroupArray;

    .line 68
    iget-object p2, p1, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/SsManifest;->protectionElement:Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/SsManifest$ProtectionElement;

    const/4 p3, 0x0

    if-eqz p2, :cond_0

    .line 70
    iget-object p2, p2, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/SsManifest$ProtectionElement;->data:[B

    invoke-static {p2}, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaPeriod;->getProtectionElementKeyId([B)[B

    move-result-object p2

    const/4 p4, 0x1

    .line 71
    new-array p5, p4, [Lcom/google/android/exoplayer2/extractor/mp4/TrackEncryptionBox;

    new-instance p6, Lcom/google/android/exoplayer2/extractor/mp4/TrackEncryptionBox;

    const/16 v0, 0x8

    invoke-direct {p6, p4, v0, p2}, Lcom/google/android/exoplayer2/extractor/mp4/TrackEncryptionBox;-><init>(ZI[B)V

    aput-object p6, p5, p3

    iput-object p5, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaPeriod;->trackEncryptionBoxes:[Lcom/google/android/exoplayer2/extractor/mp4/TrackEncryptionBox;

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    .line 74
    iput-object p2, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaPeriod;->trackEncryptionBoxes:[Lcom/google/android/exoplayer2/extractor/mp4/TrackEncryptionBox;

    .line 76
    :goto_0
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaPeriod;->manifest:Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/SsManifest;

    .line 77
    invoke-static {p3}, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaPeriod;->newSampleStreamArray(I)[Lcom/google/android/exoplayer2/source/chunk/ChunkSampleStream;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaPeriod;->sampleStreams:[Lcom/google/android/exoplayer2/source/chunk/ChunkSampleStream;

    .line 78
    new-instance p1, Lcom/google/android/exoplayer2/source/CompositeSequenceableLoader;

    iget-object p2, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaPeriod;->sampleStreams:[Lcom/google/android/exoplayer2/source/chunk/ChunkSampleStream;

    invoke-direct {p1, p2}, Lcom/google/android/exoplayer2/source/CompositeSequenceableLoader;-><init>([Lcom/google/android/exoplayer2/source/SequenceableLoader;)V

    iput-object p1, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaPeriod;->sequenceableLoader:Lcom/google/android/exoplayer2/source/CompositeSequenceableLoader;

    return-void
.end method

.method private buildSampleStream(Lcom/google/android/exoplayer2/trackselection/TrackSelection;J)Lcom/google/android/exoplayer2/source/chunk/ChunkSampleStream;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer2/trackselection/TrackSelection;",
            "J)",
            "Lcom/google/android/exoplayer2/source/chunk/ChunkSampleStream<",
            "Lcom/google/android/exoplayer2/source/smoothstreaming/SsChunkSource;",
            ">;"
        }
    .end annotation

    .line 190
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaPeriod;->trackGroups:Lcom/google/android/exoplayer2/source/TrackGroupArray;

    invoke-interface {p1}, Lcom/google/android/exoplayer2/trackselection/TrackSelection;->getTrackGroup()Lcom/google/android/exoplayer2/source/TrackGroup;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/source/TrackGroupArray;->indexOf(Lcom/google/android/exoplayer2/source/TrackGroup;)I

    move-result v0

    .line 191
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaPeriod;->chunkSourceFactory:Lcom/google/android/exoplayer2/source/smoothstreaming/SsChunkSource$Factory;

    iget-object v3, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaPeriod;->manifestLoaderErrorThrower:Lcom/google/android/exoplayer2/upstream/LoaderErrorThrower;

    iget-object v4, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaPeriod;->manifest:Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/SsManifest;

    iget-object v7, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaPeriod;->trackEncryptionBoxes:[Lcom/google/android/exoplayer2/extractor/mp4/TrackEncryptionBox;

    move v5, v0

    move-object v6, p1

    invoke-interface/range {v2 .. v7}, Lcom/google/android/exoplayer2/source/smoothstreaming/SsChunkSource$Factory;->createChunkSource(Lcom/google/android/exoplayer2/upstream/LoaderErrorThrower;Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/SsManifest;ILcom/google/android/exoplayer2/trackselection/TrackSelection;[Lcom/google/android/exoplayer2/extractor/mp4/TrackEncryptionBox;)Lcom/google/android/exoplayer2/source/smoothstreaming/SsChunkSource;

    move-result-object v3

    .line 193
    new-instance v10, Lcom/google/android/exoplayer2/source/chunk/ChunkSampleStream;

    iget-object v1, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaPeriod;->manifest:Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/SsManifest;

    iget-object v1, v1, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/SsManifest;->streamElements:[Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/SsManifest$StreamElement;

    aget-object v0, v1, v0

    iget v1, v0, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/SsManifest$StreamElement;->type:I

    iget-object v5, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaPeriod;->allocator:Lcom/google/android/exoplayer2/upstream/Allocator;

    iget v8, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaPeriod;->minLoadableRetryCount:I

    iget-object v9, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaPeriod;->eventDispatcher:Lcom/google/android/exoplayer2/source/AdaptiveMediaSourceEventListener$EventDispatcher;

    const/4 v2, 0x0

    move-object v0, v10

    move-object v4, p0

    move-wide v6, p2

    invoke-direct/range {v0 .. v9}, Lcom/google/android/exoplayer2/source/chunk/ChunkSampleStream;-><init>(I[ILcom/google/android/exoplayer2/source/chunk/ChunkSource;Lcom/google/android/exoplayer2/source/SequenceableLoader$Callback;Lcom/google/android/exoplayer2/upstream/Allocator;JILcom/google/android/exoplayer2/source/AdaptiveMediaSourceEventListener$EventDispatcher;)V

    return-object v10
.end method

.method private static buildTrackGroups(Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/SsManifest;)Lcom/google/android/exoplayer2/source/TrackGroupArray;
    .locals 4

    .line 198
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/SsManifest;->streamElements:[Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/SsManifest$StreamElement;

    array-length v0, v0

    new-array v0, v0, [Lcom/google/android/exoplayer2/source/TrackGroup;

    const/4 v1, 0x0

    .line 199
    :goto_0
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/SsManifest;->streamElements:[Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/SsManifest$StreamElement;

    array-length v2, v2

    if-ge v1, v2, :cond_0

    .line 200
    new-instance v2, Lcom/google/android/exoplayer2/source/TrackGroup;

    iget-object v3, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/SsManifest;->streamElements:[Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/SsManifest$StreamElement;

    aget-object v3, v3, v1

    iget-object v3, v3, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/SsManifest$StreamElement;->formats:[Lcom/google/android/exoplayer2/Format;

    invoke-direct {v2, v3}, Lcom/google/android/exoplayer2/source/TrackGroup;-><init>([Lcom/google/android/exoplayer2/Format;)V

    aput-object v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 202
    :cond_0
    new-instance p0, Lcom/google/android/exoplayer2/source/TrackGroupArray;

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer2/source/TrackGroupArray;-><init>([Lcom/google/android/exoplayer2/source/TrackGroup;)V

    return-object p0
.end method

.method private static getProtectionElementKeyId([B)[B
    .locals 4

    .line 211
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 212
    :goto_0
    array-length v3, p0

    if-ge v2, v3, :cond_0

    .line 213
    aget-byte v3, p0, v2

    int-to-char v3, v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x2

    goto :goto_0

    .line 215
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "<KID>"

    .line 217
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v2, 0x5

    add-int/2addr v0, v2

    const-string v3, "</KID>"

    invoke-virtual {p0, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    .line 216
    invoke-virtual {p0, v0, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 218
    invoke-static {p0, v1}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object p0

    const/4 v0, 0x3

    .line 219
    invoke-static {p0, v1, v0}, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaPeriod;->swap([BII)V

    const/4 v0, 0x1

    const/4 v1, 0x2

    .line 220
    invoke-static {p0, v0, v1}, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaPeriod;->swap([BII)V

    const/4 v0, 0x4

    .line 221
    invoke-static {p0, v0, v2}, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaPeriod;->swap([BII)V

    const/4 v0, 0x6

    const/4 v1, 0x7

    .line 222
    invoke-static {p0, v0, v1}, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaPeriod;->swap([BII)V

    return-object p0
.end method

.method private static newSampleStreamArray(I)[Lcom/google/android/exoplayer2/source/chunk/ChunkSampleStream;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)[",
            "Lcom/google/android/exoplayer2/source/chunk/ChunkSampleStream<",
            "Lcom/google/android/exoplayer2/source/smoothstreaming/SsChunkSource;",
            ">;"
        }
    .end annotation

    .line 207
    new-array p0, p0, [Lcom/google/android/exoplayer2/source/chunk/ChunkSampleStream;

    return-object p0
.end method

.method private static swap([BII)V
    .locals 2

    .line 227
    aget-byte v0, p0, p1

    .line 228
    aget-byte v1, p0, p2

    aput-byte v1, p0, p1

    .line 229
    aput-byte v0, p0, p2

    return-void
.end method


# virtual methods
.method public continueLoading(J)Z
    .locals 1

    .line 146
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaPeriod;->sequenceableLoader:Lcom/google/android/exoplayer2/source/CompositeSequenceableLoader;

    invoke-virtual {v0, p1, p2}, Lcom/google/android/exoplayer2/source/CompositeSequenceableLoader;->continueLoading(J)Z

    move-result p1

    return p1
.end method

.method public discardBuffer(J)V
    .locals 0

    return-void
.end method

.method public getBufferedPositionUs()J
    .locals 12

    .line 162
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaPeriod;->sampleStreams:[Lcom/google/android/exoplayer2/source/chunk/ChunkSampleStream;

    array-length v1, v0

    const-wide v2, 0x7fffffffffffffffL

    const/4 v4, 0x0

    move-wide v5, v2

    :goto_0
    const-wide/high16 v7, -0x8000000000000000L

    if-ge v4, v1, :cond_1

    aget-object v9, v0, v4

    .line 163
    invoke-virtual {v9}, Lcom/google/android/exoplayer2/source/chunk/ChunkSampleStream;->getBufferedPositionUs()J

    move-result-wide v9

    cmp-long v11, v9, v7

    if-eqz v11, :cond_0

    .line 165
    invoke-static {v5, v6, v9, v10}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v5

    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_1
    cmp-long v0, v5, v2

    if-nez v0, :cond_2

    move-wide v5, v7

    :cond_2
    return-wide v5
.end method

.method public getNextLoadPositionUs()J
    .locals 2

    .line 151
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaPeriod;->sequenceableLoader:Lcom/google/android/exoplayer2/source/CompositeSequenceableLoader;

    invoke-virtual {v0}, Lcom/google/android/exoplayer2/source/CompositeSequenceableLoader;->getNextLoadPositionUs()J

    move-result-wide v0

    return-wide v0
.end method

.method public getTrackGroups()Lcom/google/android/exoplayer2/source/TrackGroupArray;
    .locals 1

    .line 108
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaPeriod;->trackGroups:Lcom/google/android/exoplayer2/source/TrackGroupArray;

    return-object v0
.end method

.method public maybeThrowPrepareError()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 103
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaPeriod;->manifestLoaderErrorThrower:Lcom/google/android/exoplayer2/upstream/LoaderErrorThrower;

    invoke-interface {v0}, Lcom/google/android/exoplayer2/upstream/LoaderErrorThrower;->maybeThrowError()V

    return-void
.end method

.method public bridge synthetic onContinueLoadingRequested(Lcom/google/android/exoplayer2/source/SequenceableLoader;)V
    .locals 0

    .line 40
    check-cast p1, Lcom/google/android/exoplayer2/source/chunk/ChunkSampleStream;

    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaPeriod;->onContinueLoadingRequested(Lcom/google/android/exoplayer2/source/chunk/ChunkSampleStream;)V

    return-void
.end method

.method public onContinueLoadingRequested(Lcom/google/android/exoplayer2/source/chunk/ChunkSampleStream;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer2/source/chunk/ChunkSampleStream<",
            "Lcom/google/android/exoplayer2/source/smoothstreaming/SsChunkSource;",
            ">;)V"
        }
    .end annotation

    .line 183
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaPeriod;->callback:Lcom/google/android/exoplayer2/source/MediaPeriod$Callback;

    invoke-interface {p1, p0}, Lcom/google/android/exoplayer2/source/MediaPeriod$Callback;->onContinueLoadingRequested(Lcom/google/android/exoplayer2/source/SequenceableLoader;)V

    return-void
.end method

.method public prepare(Lcom/google/android/exoplayer2/source/MediaPeriod$Callback;)V
    .locals 0

    .line 97
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaPeriod;->callback:Lcom/google/android/exoplayer2/source/MediaPeriod$Callback;

    .line 98
    invoke-interface {p1, p0}, Lcom/google/android/exoplayer2/source/MediaPeriod$Callback;->onPrepared(Lcom/google/android/exoplayer2/source/MediaPeriod;)V

    return-void
.end method

.method public readDiscontinuity()J
    .locals 2

    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    return-wide v0
.end method

.method public release()V
    .locals 4

    .line 90
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaPeriod;->sampleStreams:[Lcom/google/android/exoplayer2/source/chunk/ChunkSampleStream;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 91
    invoke-virtual {v3}, Lcom/google/android/exoplayer2/source/chunk/ChunkSampleStream;->release()V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public seekToUs(J)J
    .locals 4

    .line 173
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaPeriod;->sampleStreams:[Lcom/google/android/exoplayer2/source/chunk/ChunkSampleStream;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 174
    invoke-virtual {v3, p1, p2}, Lcom/google/android/exoplayer2/source/chunk/ChunkSampleStream;->seekToUs(J)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-wide p1
.end method

.method public selectTracks([Lcom/google/android/exoplayer2/trackselection/TrackSelection;[Z[Lcom/google/android/exoplayer2/source/SampleStream;[ZJ)J
    .locals 4

    .line 114
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    .line 115
    :goto_0
    array-length v2, p1

    if-ge v1, v2, :cond_4

    .line 116
    aget-object v2, p3, v1

    if-eqz v2, :cond_2

    .line 118
    aget-object v2, p3, v1

    check-cast v2, Lcom/google/android/exoplayer2/source/chunk/ChunkSampleStream;

    .line 119
    aget-object v3, p1, v1

    if-eqz v3, :cond_1

    aget-boolean v3, p2, v1

    if-nez v3, :cond_0

    goto :goto_1

    .line 123
    :cond_0
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 120
    :cond_1
    :goto_1
    invoke-virtual {v2}, Lcom/google/android/exoplayer2/source/chunk/ChunkSampleStream;->release()V

    const/4 v2, 0x0

    .line 121
    aput-object v2, p3, v1

    .line 126
    :cond_2
    :goto_2
    aget-object v2, p3, v1

    if-nez v2, :cond_3

    aget-object v2, p1, v1

    if-eqz v2, :cond_3

    .line 127
    aget-object v2, p1, v1

    invoke-direct {p0, v2, p5, p6}, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaPeriod;->buildSampleStream(Lcom/google/android/exoplayer2/trackselection/TrackSelection;J)Lcom/google/android/exoplayer2/source/chunk/ChunkSampleStream;

    move-result-object v2

    .line 128
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 129
    aput-object v2, p3, v1

    const/4 v2, 0x1

    .line 130
    aput-boolean v2, p4, v1

    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 133
    :cond_4
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p1

    invoke-static {p1}, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaPeriod;->newSampleStreamArray(I)[Lcom/google/android/exoplayer2/source/chunk/ChunkSampleStream;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaPeriod;->sampleStreams:[Lcom/google/android/exoplayer2/source/chunk/ChunkSampleStream;

    .line 134
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaPeriod;->sampleStreams:[Lcom/google/android/exoplayer2/source/chunk/ChunkSampleStream;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 135
    new-instance p1, Lcom/google/android/exoplayer2/source/CompositeSequenceableLoader;

    iget-object p2, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaPeriod;->sampleStreams:[Lcom/google/android/exoplayer2/source/chunk/ChunkSampleStream;

    invoke-direct {p1, p2}, Lcom/google/android/exoplayer2/source/CompositeSequenceableLoader;-><init>([Lcom/google/android/exoplayer2/source/SequenceableLoader;)V

    iput-object p1, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaPeriod;->sequenceableLoader:Lcom/google/android/exoplayer2/source/CompositeSequenceableLoader;

    return-wide p5
.end method

.method public updateManifest(Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/SsManifest;)V
    .locals 4

    .line 82
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaPeriod;->manifest:Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/SsManifest;

    .line 83
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaPeriod;->sampleStreams:[Lcom/google/android/exoplayer2/source/chunk/ChunkSampleStream;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 84
    invoke-virtual {v3}, Lcom/google/android/exoplayer2/source/chunk/ChunkSampleStream;->getChunkSource()Lcom/google/android/exoplayer2/source/chunk/ChunkSource;

    move-result-object v3

    check-cast v3, Lcom/google/android/exoplayer2/source/smoothstreaming/SsChunkSource;

    invoke-interface {v3, p1}, Lcom/google/android/exoplayer2/source/smoothstreaming/SsChunkSource;->updateManifest(Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/SsManifest;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 86
    :cond_0
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaPeriod;->callback:Lcom/google/android/exoplayer2/source/MediaPeriod$Callback;

    invoke-interface {p1, p0}, Lcom/google/android/exoplayer2/source/MediaPeriod$Callback;->onContinueLoadingRequested(Lcom/google/android/exoplayer2/source/SequenceableLoader;)V

    return-void
.end method
