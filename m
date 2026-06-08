Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73421CD8CA4
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Jun 2026 20:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WRtUEUHlt4KHtZmhqYAvyPnLHLq2GywQmtnYsZO8nWw=; b=hrmaOV6PuImSa/
	YSG73FFZRrxJG+OxIoge8Mj9v+Bef7ZU9/UW75GoAqrIZtpJT9vidGkr9OlS8Hppbpeit8nj9Qtb8
	hYGlaq7Qt/yBRfLccLstYeoxuauaGpTSBmkMOtOznldSU9ihEWD/XwSmyvHUkpPy4NrIu0R26bLTG
	Yi0Fkb2dakrCAyd7YK/q/omSCCeMNsnD5dsiBBxkyEL5r9IbZCaOfyfk7vBviRLIhPSg8vb+AE1EJ
	TuvilLDhK+UApqSBQG17YysLm8QUsFUdwnCvix7rS3Nj50Tf0EwK0zPs/asHwOdAar0aHd3YGAf2C
	Z0f0vbk2RyvXmBVPX5yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWga0-00000004MPQ-0pTP;
	Mon, 08 Jun 2026 20:28:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgZz-00000004MPK-2d6I
	for linux-i3c@lists.infradead.org;
	Mon, 08 Jun 2026 20:28:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3137141A7D;
	Mon,  8 Jun 2026 20:28:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB9C51F00893;
	Mon,  8 Jun 2026 20:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780950495;
	bh=a4VdQFi2qxY2WdbCyG6UEo2b0/ayv97aa/nAIlyEInE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E8NS9Fgn+gweoX3N6xK6QgqfuI6xDfz7zxkb6wthau4/MpU+ufcgZATsaxDbOJILi
	 6gKulvvujIspjJT1F5K8qXAeYjhFt+v8ySEdhW5ISwbS0h66KWl3hmRCPIZR+SDct+
	 mLVYUHFU2TdMDrPQ46ezPglN2QKrOXsFGkCwK0OeZwpoTMMyqfJ2Y2/tb4rEwMXM01
	 L1y6jqv7hE3Hz0UXa/7+9ytI3BbwnyXrX3PHfDREGaLg920t5kUR5TQNatzcT5PCKU
	 fVfUp7KMUZMR8plW8fHLc2tlUwHvSiWP3nx/QJJBaz8wAyji6Qatr5hlWXyUmLmKmQ
	 W6wJTahOcvhYA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 04/17] i3c: renesas: Reconfigure the DATBAS register
 on re-attach
To: "Claudiu Beznea" <claudiu.beznea@kernel.org>
Cc: Frank.Li@kernel.org, wsa+renesas@sang-engineering.com, linux-i3c@lists.infradead.org
In-Reply-To: <20260608201543.804902-5-claudiu.beznea@kernel.org>
References: <20260608201543.804902-5-claudiu.beznea@kernel.org>
Date: Mon, 08 Jun 2026 20:28:14 +0000
Message-Id: <20260608202814.CB9C51F00893@smtp.kernel.org>
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIFRoZSByZWF0dGFjaF9p
M2NfZGV2IGZ1bmN0aW9uIHVuY29uZGl0aW9uYWxseSBtb3ZlcyBkZXZpY2VzIHRvIGEgZGlmZmVy
ZW50IGZyZWUgaW5kZXggb24gZXZlcnkgY2FsbCwgY2F1c2luZyBlbmRsZXNzIGluZGV4IGJvdW5j
aW5nLCBhcnJheSBmcmFnbWVudGF0aW9uLCBhbmQgdW5uZWNlc3NhcnkgREFUQkFTIHJlZ2lzdGVy
IHJld3JpdGVzLCB3aGljaCBsaWtlbHkgYnJlYWtzIER5bmFtaWMgQWRkcmVzcyBBc3NpZ25tZW50
IChEQUEpLgotLQoKY29tbWl0IDE1ZDVlMDczNTIxNTQwMzllZDEzNGI5NzFkZjBkNjNlNzNkNjA3
YzAKQXV0aG9yOiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWEudWpAYnAucmVuZXNhcy5j
b20+CgppM2M6IHJlbmVzYXM6IFJlY29uZmlndXJlIHRoZSBEQVRCQVMgcmVnaXN0ZXIgb24gcmUt
YXR0YWNoCgpUaGlzIGNvbW1pdCByZWNvbmZpZ3VyZXMgdGhlIERBVEJBUyByZWdpc3RlciBkdXJp
bmcgZGV2aWNlIHJlLWF0dGFjaCB3aGVuIGEKZGV2aWNlIGNoYW5nZXMgaXRzIHBvc2l0aW9uIGlu
IHRoZSBpM2MtPmFkZHJzW10gYXJyYXkuIEl0IGFsc28gdXBkYXRlcyB0aGUKc29mdHdhcmUgY2Fj
aGVzLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyL3JlbmVzYXMtaTNjLmMgYi9k
cml2ZXJzL2kzYy9tYXN0ZXIvcmVuZXNhcy1pM2MuYwo+IGluZGV4IDRjODZlNzI1NzgwNDMuLjc2
YTQ4MzEwOThjOTQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyL3JlbmVzYXMtaTNj
LmMKPiArKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvcmVuZXNhcy1pM2MuYwo+IEBAIC04OTIsMTAg
Kzg5MiwyNiBAQCBzdGF0aWMgaW50IHJlbmVzYXNfaTNjX3JlYXR0YWNoX2kzY19kZXYoc3RydWN0
IGkzY19kZXZfZGVzYyAqZGV2LAo+ICAJc3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxlciAqbSA9
IGkzY19kZXZfZ2V0X21hc3RlcihkZXYpOwo+ICAJc3RydWN0IHJlbmVzYXNfaTNjICppM2MgPSB0
b19yZW5lc2FzX2kzYyhtKTsKPiAgCXN0cnVjdCByZW5lc2FzX2kzY19pMmNfZGV2X2RhdGEgKmRh
dGEgPSBpM2NfZGV2X2dldF9tYXN0ZXJfZGF0YShkZXYpOwo+ICsJaW50IHBvczsKPiArCj4gKwlw
b3MgPSByZW5lc2FzX2kzY19nZXRfZnJlZV9wb3MoaTNjKTsKPiArCj4gKwlpZiAoZGF0YS0+aW5k
ZXggIT0gcG9zICYmIHBvcyA+PSAwKSB7CgpbU2V2ZXJpdHk6IEhpZ2hdCkRvZXMgdGhpcyBsb2dp
YyB1bmNvbmRpdGlvbmFsbHkgbW92ZSBkZXZpY2VzIHRvIGEgZGlmZmVyZW50IGluZGV4IG9uIGV2
ZXJ5CnJlYXR0YWNoIGNhbGw/CgpCZWNhdXNlIHRoZSBkZXZpY2UgY3VycmVudGx5IG9jY3VwaWVz
IGRhdGEtPmluZGV4LCB0aGF0IGluZGV4J3MgYml0IGlzIGNsZWFyZWQKaW4gaTNjLT5mcmVlX3Bv
cyAobWVhbmluZyBpdCBpcyBub3QgZnJlZSkuIFRoZXJlZm9yZSwgdGhlIGxvd2VzdCBmcmVlIHNs
b3QKKHBvcykgcmV0dXJuZWQgYnkgcmVuZXNhc19pM2NfZ2V0X2ZyZWVfcG9zKCkgY2FuIG5ldmVy
IGVxdWFsIHRoZSBjdXJyZW50bHkKb2NjdXBpZWQgc2xvdCAoZGF0YS0+aW5kZXgpLgoKQXMgYSBy
ZXN1bHQsIHRoaXMgY29uZGl0aW9uIHVuY29uZGl0aW9uYWxseSBldmFsdWF0ZXMgdG8gdHJ1ZSBv
biBldmVyeQpyZWF0dGFjaCBjYWxsIGFzIGxvbmcgYXMgYSBmcmVlIHNsb3QgZXhpc3RzLiBUaGlz
IGZvcmNlcyB0aGUgZGV2aWNlIHRvIHZhY2F0ZQppdHMgY3VycmVudCBoYXJkd2FyZSBpbmRleCwg
bW92ZSB0byB0aGUgbmV3IHBvc2l0aW9uLCBhbmQgcmV3cml0ZSBpdHMgREFUQkFTCnJlZ2lzdGVy
cywgcmVzdWx0aW5nIGluIHBlcnBldHVhbCBwaW5nLXBvbmdpbmcgb2Ygc2xvdHMgaW5zdGVhZCBv
ZiBjb21wYWN0aW5nCnRoZSBhcnJheS4KCkZ1cnRoZXJtb3JlLCB0aGlzIGZyYWdtZW50YXRpb24g
bGVhdmVzIGxvd2VyIGluZGljZXMgZnJlZSB3aGlsZSB1cHBlciBvbmVzIGFyZQpvY2N1cGllZC4g
RHVyaW5nIHJlbmVzYXNfaTNjX2RhYSgpLCB0aGUgY29udHJvbGxlciBjYWxjdWxhdGVzIHRoZSBu
dW1iZXIgb2YKZXhwZWN0ZWQgREFBIGRldmljZXMgYXMgbWF4ZGV2cyAtIHJldCAod2hlcmUgcmV0
IGlzIHRoZSBsb3dlc3QgZnJlZSBpbmRleCkuCklmIHRoZXJlIGFyZSBmcmFnbWVudGVkIGFjdGl2
ZSBkZXZpY2VzIGF0IGhpZ2hlciBpbmRpY2VzLCB3aWxsIHRoZSBoYXJkd2FyZSdzCnNlcXVlbnRp
YWwgREFBIGFzc2lnbm1lbnQgb3ZlcndyaXRlIHRoZWlyIERBVEJBUyBjb25maWd1cmF0aW9uIGFu
ZCBsZWFkIHRvCmZ1bmN0aW9uYWwgZmFpbHVyZXM/Cgo+ICsJCXJlbmVzYXNfd3JpdGVsKGkzYy0+
cmVncywgREFUQkFTKGRhdGEtPmluZGV4KSwgMCk7Cj4gKwkJaTNjLT5hZGRyc1tkYXRhLT5pbmRl
eF0gPSAwOwo+ICsJCWkzYy0+ZnJlZV9wb3MgfD0gQklUKGRhdGEtPmluZGV4KTsKPiArCj4gKwkJ
ZGF0YS0+aW5kZXggPSBwb3M7Cj4gKwkJaTNjLT5mcmVlX3BvcyAmPSB+QklUKGRhdGEtPmluZGV4
KTsKPiArCX0KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMv
cGF0Y2hzZXQvMjAyNjA2MDgyMDE1NDMuODA0OTAyLTEtY2xhdWRpdS5iZXpuZWFAa2VybmVsLm9y
Zz9wYXJ0PTQKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtaTNjCg==
