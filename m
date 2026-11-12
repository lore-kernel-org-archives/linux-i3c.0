Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA62A606A321
	for <linux-i3c@archiver.kernel.org>; Thu, 12 Nov 2026 12:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KzJUjgGO;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VT9m84Uj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=T6PQXTrZFwiCItnpE2xGjpzrO4wHfj88MaeqNfZHx5I=; b=KzJUjgGONqXkNZhk0vW+o/iKJB
	Tf4J5uaROVIMEHOcVvNJ/Y9WnrN1l21Zwo+lj3w4C/J+/1Lr972pYeyPktyaN0EdxadeGtLIXGC6X
	lubLDWFwnAYBIq1hJRe5oWb9JZBHYOl8qrwkiET3QXNX/sk/v1SeS6waVhHV4hqalq0+n4mati1N5
	b/9Ctn2OySnBUcth7Ta0FTxIaY2sSZcokcg0PMqUdXHqMFR0KHUz+btH9/znzW2XsYZqVQ1RzWIXJ
	uGpnVgWXg+kYkLMvID0k18wzTGumEOtRjXGZRUN+rDIGBOhz7sDPSCaQSfOM2C69mHKmH7uLvSKkg
	XV8xxMfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRULo-00000009wUj-2GH1;
	Thu, 12 Nov 2026 12:56:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRULo-00000009wUH-05NZ
	for linux-i3c@lists.infradead.org;
	Thu, 12 Nov 2026 12:56:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1883443BBE;
	Thu, 12 Nov 2026 12:56:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B24BE1F00A05;
	Thu, 12 Nov 2026 12:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794488183;
	bh=r7yyic0ssd9BOT+OJ8UcxW2Pq7XNCgARbsSkcrQ+aKY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VT9m84UjGxroYhSj0zHqdI7LdbaiWN3e/jmVbSxQBZPdvkhbzSVq9OQDbzI9Wm17R
	 Ibx5d/yPj1MfsLoIbbK3V0vWBJ1Wj8MZYair8HsYAGaolx4nYBR6oXEUSBQtEf8ulY
	 PfiK0XDWR/rx0mWEiTOVUBuDNnAOpquGi6dlV3Hd1WySbsMIo1sK+dl5h3H1nyYKN5
	 pi3+81W63wtvsTmHao1ilBWvH7MHyA9J4NEIZpyLs8X9Ro0YlT4P9HBiWOJW0UmIb2
	 N6DvOB9BSwETps9ysWJpXOsLJWPqqjDp08BZPixSHJwp8teIrFuRGbavpeb+c7wmGH
	 L35v5IlNpTYjQ==
Message-ID: <sashiko-outbox-211123@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v21 2/4] regulator: p3h2x4x: Add driver for on-die
 regulators in NXP P3H2x4x i3c hub
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>, linux-i3c@lists.infradead.org, mfd@lists.linux.dev
Cc: Frank.Li@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, lee@kernel.org
In-Reply-To: <20261112124437.3367252-3-lakshay.piplani@nxp.com>
References: <20261112124437.3367252-1-lakshay.piplani@nxp.com>
 <20261112124437.3367252-3-lakshay.piplani@nxp.com>
Date: Thu, 12 Nov 2026 12:56:22 +0000
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gcmVndWxhdG9yOiBwM2gy
eDR4OiBPRiBub2RlIGxlYWsgaW4gcDNoMng0eF9yZWd1bGF0b3JfcHJvYmUoKQotLQoKY29tbWl0
IDBjMjJmZDdiZWNlYTVjM2RhZDA4OTRjYjgzYTYzZTNkMjdjMDRjNDUKQXV0aG9yOiBBbWFuIEt1
bWFyIFBhbmRleSA8YW1hbi5rdW1hcnBhbmRleUBueHAuY29tPgoKcmVndWxhdG9yOiBwM2gyeDR4
OiBBZGQgZHJpdmVyIGZvciBvbi1kaWUgcmVndWxhdG9ycyBpbiBOWFAgUDNIMng0eCBpM2MgaHVi
CgpUaGlzIGNvbW1pdCBhZGRzIGEgcmVndWxhdG9yIGRyaXZlciBmb3IgdGhlIGZvdXIgb24tZGll
IExET3MgaW4gdGhlIE5YUApQM0gyeDR4IEkzQyBodWIgZmFtaWx5LCByZWdpc3RlcmVkIGFzIGEg
Y2hpbGQgb2YgdGhlIE1GRCBkZXZpY2UuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3JlZ3VsYXRv
ci9wM2gyODQwX2kzY19odWJfcmVndWxhdG9yLmMgYi9kcml2ZXJzL3JlZ3VsYXRvci9wM2gyODQw
X2kzY19odWJfcmVndWxhdG9yLmMKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAw
MDAwMDAwMDAuLjI0NGYyYTRmNzBmMzgKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvZHJpdmVycy9y
ZWd1bGF0b3IvcDNoMjg0MF9pM2NfaHViX3JlZ3VsYXRvci5jCgpbIC4uLiBdCgo+ICtzdGF0aWMg
aW50IHAzaDJ4NHhfcmVndWxhdG9yX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
Cj4gK3sKPiArCXN0cnVjdCBwM2gyeDR4ICpwM2gyeDR4ID0gZGV2X2dldF9kcnZkYXRhKHBkZXYt
PmRldi5wYXJlbnQpOwo+ICsJc3RydWN0IHAzaDJ4NHhfcmVndWxhdG9yX2RldiAqcDNoMng0eF9y
ZWd1bGF0b3I7Cj4gKwlzdHJ1Y3QgcmVndWxhdG9yX2NvbmZpZyByY2ZnID0geyB9Owo+ICsJc3Ry
dWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsKPiArCXN0cnVjdCByZWd1bGF0b3JfZGV2ICpy
ZGV2Owo+ICsJaW50IGk7Cj4gKwo+ICsJcDNoMng0eF9yZWd1bGF0b3IgPSBkZXZtX2t6YWxsb2Mo
ZGV2LCBzaXplb2YoKnAzaDJ4NHhfcmVndWxhdG9yKSwgR0ZQX0tFUk5FTCk7Cj4gKwlpZiAoIXAz
aDJ4NHhfcmVndWxhdG9yKQo+ICsJCXJldHVybiAtRU5PTUVNOwo+ICsKPiArCXAzaDJ4NHhfcmVn
dWxhdG9yLT5wM2gyeDR4ID0gcDNoMng0eDsKPiArCXAzaDJ4NHhfcmVndWxhdG9yLT5yZWdtYXAg
PSBwM2gyeDR4LT5yZWdtYXA7Cj4gKwo+ICsJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgcDNo
Mng0eF9yZWd1bGF0b3IpOwo+ICsKPiArCWRldmljZV9zZXRfb2Zfbm9kZV9mcm9tX2RldihkZXYs
IGRldi0+cGFyZW50KTsKCltTZXZlcml0eTogTWVkaXVtXQpEb2VzIGNhbGxpbmcgZGV2aWNlX3Nl
dF9vZl9ub2RlX2Zyb21fZGV2KCkgaGVyZSBsZWFrIGEgcmVmZXJlbmNlIG9uCmRldi0+cGFyZW50
LT5vZl9ub2RlIHdoZW4gcGRldiBpcyB1bnJlZ2lzdGVyZWQ/CgpUaGUgTUZEIGNlbGwgZm9yIHAz
aDJ4NHgtcmVndWxhdG9yIGRvZXMgbm90IHNldCBvZl9jb21wYXRpYmxlIG9yIHN3bm9kZSwgc28K
bWZkX2FkZF9kZXZpY2UoKSBhbGxvY2F0ZXMgcGRldiB3aXRoIGRldi5md25vZGUgc2V0IHRvIE5V
TEwuCmRldmljZV9zZXRfb2Zfbm9kZV9mcm9tX2RldigpIHRha2VzIGEgcmVmZXJlbmNlIG9uIGRl
di0+cGFyZW50LT5vZl9ub2RlIGFuZAphc3NpZ25zIGRldi0+b2Zfbm9kZSB3aXRob3V0IHVwZGF0
aW5nIGRldi0+Zndub2RlLCB3aGVyZWFzCnBsYXRmb3JtX2RldmljZV9yZWxlYXNlKCkgZHJvcHMg
dGhlIGZpcm13YXJlIG5vZGUgcmVmZXJlbmNlIHZpYQpmd25vZGVfaGFuZGxlX3B1dChwYS0+cGRl
di5kZXYuZndub2RlKS4KClVzaW5nIHBsYXRmb3JtX2RldmljZV9zZXRfb2Zfbm9kZV9mcm9tX2Rl
dihwZGV2LCBkZXYtPnBhcmVudCkgc2V0cyBib3RoCmRldi5vZl9ub2RlIGFuZCBkZXYuZndub2Rl
IHNvIHBsYXRmb3JtX2RldmljZV9yZWxlYXNlKCkgYmFsYW5jZXMgdGhlCnJlZmVyZW5jZS4KCi0t
IApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAy
NjExMTIxMjQ0MzcuMzM2NzI1Mi0xLWxha3NoYXkucGlwbGFuaUBueHAuY29tP3BhcnQ9MgoKLS0g
CmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
