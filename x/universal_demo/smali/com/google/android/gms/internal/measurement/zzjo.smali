.class final Lcom/google/android/gms/internal/measurement/zzjo;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic zzade:J

.field private final synthetic zzaqr:Lcom/google/android/gms/internal/measurement/zzjk;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/measurement/zzjk;J)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/measurement/zzjo;->zzaqr:Lcom/google/android/gms/internal/measurement/zzjk;

    iput-wide p2, p0, Lcom/google/android/gms/internal/measurement/zzjo;->zzade:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/measurement/zzjo;->zzaqr:Lcom/google/android/gms/internal/measurement/zzjk;

    iget-wide v1, p0, Lcom/google/android/gms/internal/measurement/zzjo;->zzade:J

    invoke-static {v0, v1, v2}, Lcom/google/android/gms/internal/measurement/zzjk;->zzb(Lcom/google/android/gms/internal/measurement/zzjk;J)V

    return-void
.end method
