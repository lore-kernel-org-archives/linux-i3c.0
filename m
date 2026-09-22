Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1254EC982F1
	for <linux-i3c@archiver.kernel.org>; Tue, 22 Sep 2026 10:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DrJMRkNsLBZBwZJMdlY++PY2OpUw+nNfUNVUPSS+GPY=; b=qsXiKRpbReAYrw
	tiQ8C4OwcuZWDkPULVmQRMRZynMlzcBj4wlVgDlZdRym0a2OuR1SS/vu2g4haoCdMvQwaEKONos96
	VRL+pPmcB7hSxY9NwhkR4k5OyC9rqZHbPWqLeqAbleksz6zEKB2Ynh/f1qprpd60KtLAxXJn3DGWd
	Z6Pw0BrHvFO4jGRFbqxqgr6kRblABa6jr6zKQNMhMgDnU8qyHyrGYXnqtguouFqlGwAB7HjRQlHHG
	y7equwIpRQkFM1QJFaJgjXfGGubb2DyoZQ8lvBlGo3vOPHBXXcf6SfOg8CvilQyfxtO3CWVq4zbmz
	h0yg8IR5/gqcxnIs1oAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8y3T-000000056TY-39lL;
	Tue, 22 Sep 2026 10:48:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8y3S-000000056So-0d2K
	for linux-i3c@lists.infradead.org;
	Tue, 22 Sep 2026 10:48:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4800660DE9;
	Tue, 22 Sep 2026 10:48:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 740561F000FF;
	Tue, 22 Sep 2026 10:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790074133;
	bh=tlFFiZRxfgx1Jj0XoMt/FlYoTm4Jk3kOQYOucZTA4lI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MOCZ7uKD+yQJIe3pIxg++oA1F9B25OfBINPzRBIyqkfIEiJVN8XDTtVfuFpJkFiLk
	 McrhI2qEt55ZTAulGfzVDjiJigkLmd8S34dTfcygzE0jcWzbaoMA4ByStcgI0U1RM1
	 YBg2hsfNbmRWKF27PoimbHshBpSuUrExyRXajTCPK2E36ejfG9m7qsirs6PZilV8MU
	 sHNuz5on7VeVS24WqxSK0V/4IGQt8MfLv/rksztiteyTqlW+TsC6i6OF9gmXFSWiOg
	 YnM1q2CWX3Io9ncnu+NimclHyCK8Z3S1Rcg38IO9auLyF3Lj/T7c3YWXoKlBMRGeqH
	 Jrpd6sdGJQyNg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v20 1/8] i3c: master: Add APIs for I3C hub support
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev, linux-i3c@lists.infradead.org, lee@kernel.org, robh@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260922103551.2754613-2-lakshay.piplani@nxp.com>
References: <20260922103551.2754613-1-lakshay.piplani@nxp.com>
 <20260922103551.2754613-2-lakshay.piplani@nxp.com>
Date: Tue, 22 Sep 2026 10:48:52 +0000
Message-Id: <20260922104852.740561F000FF@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gaTNjOiBtaXNzaW5nIGxv
Y2tpbmcgZG9jdW1lbnRhdGlvbiBmb3IgZXhwb3J0ZWQgaTNjX2J1c19zZXRfYWRkcl9zbG90X3N0
YXR1cygpCi0tCgpjb21taXQgNzMyNTg5YjJmZGFiMDM1YTcwYTAyNjU3ZjQ1NTBkODI1ZWRmNDZh
MQpBdXRob3I6IEFtYW4gS3VtYXIgUGFuZGV5IDxhbWFuLmt1bWFycGFuZGV5QG54cC5jb20+ClN1
YmplY3Q6IGkzYzogbWFzdGVyOiBBZGQgQVBJcyBmb3IgSTNDIGh1YiBzdXBwb3J0CgpBZGQgQ0ND
IGhlbHBlcnMgdG8gY2hlY2sgQ0NDIHN1cHBvcnQgYW5kIHNlbmQgQ0NDIGNvbW1hbmRzLCBhZGRy
ZXNzIHNsb3QKaGVscGVycyB0byBxdWVyeSBhbmQgdXBkYXRlIEkzQyBidXMgYWRkcmVzcyBzbG90
IHN0YXRlLCByZWdpc3RlcmluZyB2aXJ0dWFsCm1hc3RlcnMgd2l0aCBhbiBleHBsaWNpdCBmaXJt
d2FyZSBub2RlLCBhbmQgZXhwb3NpbmcgdGhlIGJ1cyBtYWludGVuYW5jZQpsb2NrIGhlbHBlcnMu
Cgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIuYyBiL2RyaXZlcnMvaTNjL21hc3Rl
ci5jCj4gaW5kZXggMmNkYmZmZDMzZmQ3Zi4uZDFlOGNhZTM3NGI5NyAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2kzYy9tYXN0ZXIuYwo+ICsrKyBiL2RyaXZlcnMvaTNjL21hc3Rlci5jClsgLi4uIF0K
PiBAQCAtNDIzLDExICs0MzUsMTggQEAgc3RhdGljIHZvaWQgaTNjX2J1c19zZXRfYWRkcl9zbG90
X3N0YXR1c19tYXNrKHN0cnVjdCBpM2NfYnVzICpidXMsIHUxNiBhZGRyLAo+ICAJKnB0ciB8PSAo
KHVuc2lnbmVkIGxvbmcpc3RhdHVzICYgbWFzaykgPDwgKGJpdHBvcyAlIEJJVFNfUEVSX0xPTkcp
Owo+ICB9Cj4gIAo+IC1zdGF0aWMgdm9pZCBpM2NfYnVzX3NldF9hZGRyX3Nsb3Rfc3RhdHVzKHN0
cnVjdCBpM2NfYnVzICpidXMsIHUxNiBhZGRyLAo+IC0JCQkJCSBlbnVtIGkzY19hZGRyX3Nsb3Rf
c3RhdHVzIHN0YXR1cykKPiArLyoqCj4gKyAqIGkzY19idXNfc2V0X2FkZHJfc2xvdF9zdGF0dXMo
KSAtIFNldCBJM0MgYnVzIGFkZHJlc3Mgc2xvdCBzdGF0dXMKPiArICogQGJ1czogSTNDIGJ1cy4K
PiArICogQGFkZHI6IEkzQyBhZGRyZXNzIHRvIHVwZGF0ZS4KPiArICogQHN0YXR1czogQWRkcmVz
cyBzbG90IHN0YXR1cyB0byBzZXQuCj4gKyAqLwo+ICt2b2lkIGkzY19idXNfc2V0X2FkZHJfc2xv
dF9zdGF0dXMoc3RydWN0IGkzY19idXMgKmJ1cywgdTE2IGFkZHIsCj4gKwkJCQkgIGVudW0gaTNj
X2FkZHJfc2xvdF9zdGF0dXMgc3RhdHVzKQoKW1NldmVyaXR5OiBMb3ddCkNvdWxkIHRoZSBrZXJu
ZWwtZG9jIGZvciB0aGlzIG5ld2x5IGV4cG9ydGVkIGZ1bmN0aW9uIGJlIHVwZGF0ZWQgdG8gZG9j
dW1lbnQKdGhlIGxvY2tpbmcgcmVxdWlyZW1lbnRzPwoKQmVjYXVzZSBpM2NfYnVzX3NldF9hZGRy
X3Nsb3Rfc3RhdHVzKCkgY2FsbHMgaTNjX2J1c19zZXRfYWRkcl9zbG90X3N0YXR1c19tYXNrKCks
CndoaWNoIG1vZGlmaWVzIGJ1cy0+YWRkcnNsb3RzIHVzaW5nIG5vbi1hdG9taWMgYml0d2lzZSBv
cGVyYXRpb25zLCB0aGUgY2FsbGVyCm5lZWRzIHRvIGhvbGQgdGhlIGJ1cy0+bG9jayAoZm9yIGV4
YW1wbGUsIGJ5IGNhbGxpbmcgaTNjX2J1c19tYWludGVuYW5jZV9sb2NrKCkpCnRvIHByZXZlbnQg
ZGF0YSByYWNlcy4gRG9jdW1lbnRpbmcgdGhpcyByZXF1aXJlbWVudCB3b3VsZCBoZWxwIHByZXZl
bnQgZnV0dXJlCmNvbnN1bWVycyBvZiB0aGlzIEFQSSBmcm9tIGludHJvZHVjaW5nIGNvbmN1cnJl
bmN5IGlzc3Vlcy4KCj4gIHsKPiAgCWkzY19idXNfc2V0X2FkZHJfc2xvdF9zdGF0dXNfbWFzayhi
dXMsIGFkZHIsIHN0YXR1cywgSTNDX0FERFJfU0xPVF9TVEFUVVNfTUFTSyk7Cj4gIH0KPiArRVhQ
T1JUX1NZTUJPTF9HUEwoaTNjX2J1c19zZXRfYWRkcl9zbG90X3N0YXR1cyk7CgotLSAKU2FzaGlr
byBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwOTIyMTAz
NTUxLjI3NTQ2MTMtMS1sYWtzaGF5LnBpcGxhbmlAbnhwLmNvbT9wYXJ0PTEKCi0tIApsaW51eC1p
M2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
