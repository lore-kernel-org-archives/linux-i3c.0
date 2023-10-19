Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE8DCDB465
	for <linux-i3c@archiver.kernel.org>; Thu, 19 Oct 2023 06:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DV7BQsIuh82L/zFjtqCQcIkYO9DB8CAgAZJDB5Yuyi4=; b=nGNvZvbePENegT
	aSkCJgzCSvHhGmpVv1yYZg36OBJH3y95WiRfsm+klhE8Fi4rGhFyp3SisN86YkyVGYYwFjdR3kjT/
	qUhDAu6KiaqFXTbzCiOsk7cGioqFKtyMrsRDAtR1k2AXpXRUJsmextJ1C76gCvO/tgKj7yWvKTg+3
	2SOxvIaJrVjbjMZ+it9FilzeyMUalVtKm9XoYJ9tscJ77Ca1Yv1fYV8UzKKJpRRD7In1l+JVOjBHk
	Q4QH/vBIaBj4Scp1IKNq1IN1zs/YHvhxvRfj2LXxofvC23sneI4XHOIngrgdD21OLsmO5Ugo2zDiR
	LeEQCIXvxgiD1oLNSSkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtMZj-00GVyo-25;
	Thu, 19 Oct 2023 06:32:07 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtMZb-00GVwt-33
	for linux-i3c@lists.infradead.org;
	Thu, 19 Oct 2023 06:32:05 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4651E1BF203;
	Thu, 19 Oct 2023 06:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697697113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PxEr3Vdk9ayXK9kV3+O24G8W+TiMjxVEUmGPMuzDVM4=;
	b=fuvTJqA3k5kxHNR5Hvihjvm6FlelgtmEY6TTMUTffRAflGVS+zjkrIiabIpCjn/0tChyNq
	Y3LdIQFSBOgJJraBcairiwgN9ZDgz7oo4hgOAIT6BFP3Z2yRC2hLfm6T7xf6ElbOUR/bxh
	IbCACnyE4gCKt0Zb6bAh4j2I/ZmjM8GzpBrZkDBPz/yMJrK87u+3cHpSX53SpoAGGz7jcJ
	ZVtC8dCQPt4p3jdZdpnsz1X6CFq90vpe7biGKzn5uLPyT/QLdWrbDCXRNibBhnKXzokm/s
	XL0Ljm5IZflwaKHHEDB8H7VngAdR6Dv/31jz5wfqrzxfYsStUq2uzV6xLNLorg==
Date: Thu, 19 Oct 2023 08:31:51 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
 imx@lists.linux.dev, joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 Resent 5/6] i3c: master: svc: fix SDA keep low when
 polling IBIWON timeout happen
Message-ID: <20231019083151.3bd10536@xps-13>
In-Reply-To: <20231018155926.3305476-6-Frank.Li@nxp.com>
References: <20231018155926.3305476-1-Frank.Li@nxp.com>
	<20231018155926.3305476-6-Frank.Li@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_233200_133273_92E1A74E 
X-CRM114-Status: GOOD (  13.31  )
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

SGkgRnJhbmssCgpGcmFuay5MaUBueHAuY29tIHdyb3RlIG9uIFdlZCwgMTggT2N0IDIwMjMgMTE6
NTk6MjUgLTA0MDA6Cgo+IElmIElCSVdPTiB0aW1lb3V0IGhhcHBlbiwgU0RBIGxpbmUgd2lsbCBh
bHdheXMga2VlcCBsb3cgYmVjYXVzZSBtaXNzIGVtaXQKPiBzdG9wLgoKIgpVcG9uIElCSVdPTiB0
aW1lb3V0LCB0aGUgU0RBIGxpbmUgd2lsbCBhbHdheXMgYmUga2VwdCBsb3cgaWYgd2UgZG9uJ3QK
ZW1pdCBhIHN0b3AuIENhbGxpbmcgc3ZjX2kzY19tYXN0ZXJfZW1pdF9zdG9wKCkgdGhlcmUgd2ls
bCBsZXQgdGhlIGJ1cwpyZXR1cm4gdG8gaWRsZSBzdGF0ZS4KIgoKV2l0aCB0aGlzIGNvbW1pdCBs
b2csCgpSZXZpZXdlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNv
bT4KCj4gCj4gQ2FsbCBzdmNfaTNjX21hc3Rlcl9lbWl0X3N0b3AoKSB0byBsZXQgaTNjIGJ1cyBj
b21lIGJhY2sgdG8gaWRsZSBzdGF0dWUKPiB3aGVuIElCSVdPTiB0aW1lb3V0IGhhcHBlbi4KPiAK
PiBGaXhlczogZGQzYzUyODQ2ZDU5ICgiaTNjOiBtYXN0ZXI6IHN2YzogQWRkIFNpbHZhY28gSTND
IG1hc3RlciBkcml2ZXIiKQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9m
Zi1ieTogRnJhbmsgTGkgPEZyYW5rLkxpQG54cC5jb20+Cj4gLS0tCj4gCj4gTm90ZXM6Cj4gICAg
IENoYW5nZSBmcm9tIHYxIHRvIHYyCj4gICAgIC0gVXBkYXRlIGNvbW1pdGUgbWVzc2FnZQo+IAo+
ICBkcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYyB8IDEgKwo+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVy
L3N2Yy1pM2MtbWFzdGVyLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYwo+
IGluZGV4IGIxMTM0NjBmMDU5YzMuLjFhNTdmZGViYWEyNmQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMKPiArKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIv
c3ZjLWkzYy1tYXN0ZXIuYwo+IEBAIC00MDQsNiArNDA0LDcgQEAgc3RhdGljIHZvaWQgc3ZjX2kz
Y19tYXN0ZXJfaWJpX3dvcmsoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQo+ICAJCQkJCSBTVkNf
STNDX01TVEFUVVNfSUJJV09OKHZhbCksIDAsIDEwMDApOwo+ICAJaWYgKHJldCkgewo+ICAJCWRl
dl9lcnIobWFzdGVyLT5kZXYsICJUaW1lb3V0IHdoZW4gcG9sbGluZyBmb3IgSUJJV09OXG4iKTsK
PiArCQlzdmNfaTNjX21hc3Rlcl9lbWl0X3N0b3AobWFzdGVyKTsKPiAgCQlnb3RvIHJlZW5hYmxl
X2liaXM7Cj4gIAl9Cj4gIAoKClRoYW5rcywKTWlxdcOobAoKLS0gCmxpbnV4LWkzYyBtYWlsaW5n
IGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
