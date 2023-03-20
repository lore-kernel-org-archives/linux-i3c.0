Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B26DC6FD1D
	for <linux-i3c@archiver.kernel.org>; Mon, 20 Mar 2023 10:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mbp+V0sNRLP/UhSkFW6t/b6O6X3hjkf8+Ce43elC+kQ=; b=KYJCgG8cb5RvbA
	x6rGQoXrLVd2i6NFXgCcbZhYeHZTlvgPHq1wp8BpaOs8jFucQG2m2zJoRQoHQG8IrOW6YKyz6B+Tg
	eGwwYinzf6irqPsqDrTX4BpmrssmDERKQhBo4mxSJNEbjen0AM8Pc8GCTcIMuj1gvXUd5XUTXkixS
	EcNkZ1PuN3NrszinrLzux1Gsq+h/zhicXjEHijvShSwx2hoxEQqpf5jGef3T8kkSG6wpsfUEdQepm
	VIBDQ99CGq2tFEJqxQINhkgnF/zLwPZ5PKzzSQBZBeg2PvfNl6ye47i/ZK376jTDB+vjQRC9fcG5q
	Rnr918g4LPC1TrXNKSEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peD7m-008iFQ-2G;
	Mon, 20 Mar 2023 10:52:22 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peD7k-008iD8-27
	for linux-i3c@lists.infradead.org;
	Mon, 20 Mar 2023 10:52:22 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 136AC1BF211;
	Mon, 20 Mar 2023 10:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679309536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EBqjOKkU6TgxsMDfHdMmC9DveUgCBpKvG9NuCanZf1M=;
	b=KHxXTaV+tsrzMuKS3z41BqPjq1aik6HA1jWI33j7DEbluYRlZ8d36dMMV9u+iWMFCcYlyQ
	rH0G0etHj14JIcVi0//Hu6SJ/N6NyHJsb8jYFzISNzgHL3vL+IBm7TjmNhT5jtircrDvq8
	GPca96ShsIOaJb74VysDfXQfi3VyBcYy+vVzZt55P37CrkUA0R9fqsIrcZDqzsrNtZnr9i
	FFAiIEB1lp/VyacBTrIr4CEPjfHV+uhVoxg99vSwfK/DBCEKPUE5UJJYebTH8QTojL09nT
	a9jr8OSKwbZldJ6w1HzW9C/Nm5CXJ/AZKzeVexy56dcy/wzc1YTlMv/l4kF8QA==
Date: Mon, 20 Mar 2023 11:52:13 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Cc: Conor Culhane <conor.culhane@silvaco.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org,
 kernel@pengutronix.de
Subject: Re: [PATCH 5/5] i3c: svc: Convert to platform remove callback
 returning void
Message-ID: <20230320115213.0b63d7bf@xps-13>
In-Reply-To: <20230318233311.265186-6-u.kleine-koenig@pengutronix.de>
References: <20230318233311.265186-1-u.kleine-koenig@pengutronix.de>
	<20230318233311.265186-6-u.kleine-koenig@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_035220_822719_10329FEC 
X-CRM114-Status: GOOD (  19.75  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

SGkgVXdlLAoKdS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlIHdyb3RlIG9uIFN1biwgMTkg
TWFyIDIwMjMgMDA6MzM6MTEgKzAxMDA6Cgo+IFRoZSAucmVtb3ZlKCkgY2FsbGJhY2sgZm9yIGEg
cGxhdGZvcm0gZHJpdmVyIHJldHVybnMgYW4gaW50IHdoaWNoIG1ha2VzCj4gbWFueSBkcml2ZXIg
YXV0aG9ycyB3cm9uZ2x5IGFzc3VtZSBpdCdzIHBvc3NpYmxlIHRvIGRvIGVycm9yIGhhbmRsaW5n
IGJ5Cj4gcmV0dXJuaW5nIGFuIGVycm9yIGNvZGUuIEhvd2V2ZXIgdGhlIHZhbHVlIHJldHVybmVk
IGlzIChtb3N0bHkpIGlnbm9yZWQKPiBhbmQgdGhpcyB0eXBpY2FsbHkgcmVzdWx0cyBpbiByZXNv
dXJjZSBsZWFrcy4gVG8gaW1wcm92ZSBoZXJlIHRoZXJlIGlzIGEKPiBxdWVzdCB0byBtYWtlIHRo
ZSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuIHZvaWQuIEluIHRoZSBmaXJzdCBzdGVwIG9mIHRoaXMK
PiBxdWVzdCBhbGwgZHJpdmVycyBhcmUgY29udmVydGVkIHRvIC5yZW1vdmVfbmV3KCkgd2hpY2gg
YWxyZWFkeSByZXR1cm5zCj4gdm9pZC4KPiAKPiBUcml2aWFsbHkgY29udmVydCB0aGlzIGRyaXZl
ciBmcm9tIGFsd2F5cyByZXR1cm5pbmcgemVybyBpbiB0aGUgcmVtb3ZlCj4gY2FsbGJhY2sgdG8g
dGhlIHZvaWQgcmV0dXJuaW5nIHZhcmlhbnQuCj4gCj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWlu
ZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KClJldmlld2VkLWJ5OiBN
aXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKPiAtLS0KPiAgZHJpdmVy
cy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMgfCA2ICsrLS0tLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYyBiL2RyaXZlcnMvaTNjL21hc3Rlci9zdmMt
aTNjLW1hc3Rlci5jCj4gaW5kZXggZTU0NzZkMDRiNDAzLi5lM2Y0NTQxMjM4MDUgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMKPiArKysgYi9kcml2ZXJz
L2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYwo+IEBAIC0xNTY5LDcgKzE1NjksNyBAQCBzdGF0
aWMgaW50IHN2Y19pM2NfbWFzdGVyX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
Cj4gIAlyZXR1cm4gcmV0Owo+ICB9Cj4gIAo+IC1zdGF0aWMgaW50IHN2Y19pM2NfbWFzdGVyX3Jl
bW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICtzdGF0aWMgdm9pZCBzdmNfaTNj
X21hc3Rlcl9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgewo+ICAJc3Ry
dWN0IHN2Y19pM2NfbWFzdGVyICptYXN0ZXIgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsK
PiAgCj4gQEAgLTE1NzcsOCArMTU3Nyw2IEBAIHN0YXRpYyBpbnQgc3ZjX2kzY19tYXN0ZXJfcmVt
b3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAo+ICAJcG1fcnVudGltZV9kb250
X3VzZV9hdXRvc3VzcGVuZCgmcGRldi0+ZGV2KTsKPiAgCXBtX3J1bnRpbWVfZGlzYWJsZSgmcGRl
di0+ZGV2KTsKPiAtCj4gLQlyZXR1cm4gMDsKPiAgfQo+ICAKPiAgc3RhdGljIGludCBfX21heWJl
X3VudXNlZCBzdmNfaTNjX3J1bnRpbWVfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gQEAg
LTE2MTYsNyArMTYxNCw3IEBAIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIHN2Y19pM2NfbWFzdGVy
X29mX21hdGNoX3RibCk7Cj4gIAo+ICBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBzdmNf
aTNjX21hc3RlciA9IHsKPiAgCS5wcm9iZSA9IHN2Y19pM2NfbWFzdGVyX3Byb2JlLAo+IC0JLnJl
bW92ZSA9IHN2Y19pM2NfbWFzdGVyX3JlbW92ZSwKPiArCS5yZW1vdmVfbmV3ID0gc3ZjX2kzY19t
YXN0ZXJfcmVtb3ZlLAo+ICAJLmRyaXZlciA9IHsKPiAgCQkubmFtZSA9ICJzaWx2YWNvLWkzYy1t
YXN0ZXIiLAo+ICAJCS5vZl9tYXRjaF90YWJsZSA9IHN2Y19pM2NfbWFzdGVyX29mX21hdGNoX3Ri
bCwKCgpUaGFua3MsCk1pcXXDqGwKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkz
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtaTNjCg==
