.class public final Lorg/jsoup/select/Evaluator$Matches;
.super Lorg/jsoup/select/Evaluator;
.source "Evaluator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jsoup/select/Evaluator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Matches"
.end annotation


# instance fields
.field private pattern:Ljava/util/regex/Pattern;


# direct methods
.method public constructor <init>(Ljava/util/regex/Pattern;)V
    .locals 0

    .line 669
    invoke-direct {p0}, Lorg/jsoup/select/Evaluator;-><init>()V

    .line 670
    iput-object p1, p0, Lorg/jsoup/select/Evaluator$Matches;->pattern:Ljava/util/regex/Pattern;

    return-void
.end method


# virtual methods
.method public matches(Lorg/jsoup/nodes/Element;Lorg/jsoup/nodes/Element;)Z
    .locals 0

    .line 675
    iget-object p1, p0, Lorg/jsoup/select/Evaluator$Matches;->pattern:Ljava/util/regex/Pattern;

    invoke-virtual {p2}, Lorg/jsoup/nodes/Element;->text()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    .line 676
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->find()Z

    move-result p1

    return p1
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    const-string v0, ":matches(%s"

    const/4 v1, 0x1

    .line 681
    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p0, Lorg/jsoup/select/Evaluator$Matches;->pattern:Ljava/util/regex/Pattern;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
