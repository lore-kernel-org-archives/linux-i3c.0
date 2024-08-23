Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB9E6C531DC
	for <linux-i3c@archiver.kernel.org>; Fri, 23 Aug 2024 16:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mjtFUHjoaC4pQJDiMS3U9N5z5+2luGiHWhBFu8YoQZI=; b=uyG6mjmm+wPzwZ
	aPDaYdL1B/uQZbl4UjQt+kLllXvbkttN5hQhv/7ymfPaysV5EQF7aByLZiJ82oSklRove5+ybD/2T
	GN72GVd9aFb4p223BlBLynn3/m0GiuHHNi9wgRdV2pJDHqRySRLwHPo0ID5rXI1nbWHFSP7CKjTum
	TNZHf16OHOaDimDgPUsn+ILqEsueTt24q0bIy7+nF97ZrMTTeDTsUqQyf4vGaBQWusT+MWsHCYvPW
	SsvBZDyVeDEF4VyNI6ntFgHCShhvjllDOmj5lfTrvOtk459LvUBTnGan3HewJLPom+pVLd3VRyA65
	wqAVvYSzPzc46VYJxwSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shX4H-0000000HXk3-2kQy;
	Fri, 23 Aug 2024 16:23:17 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shX3j-0000000HXan-1EZM
	for linux-i3c@lists.infradead.org;
	Fri, 23 Aug 2024 16:22:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F22132000A;
	Fri, 23 Aug 2024 16:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724430161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c6F56iukWQmBKV4FnNA9eGRhnnKZh7f5FQn4pHMuYTo=;
	b=ayf+nahesCes2xk0GsQMQ2Lp6XTVqom0g0ioc1dzKBHm2CpY+8aXOURfJFfbKDCiW0RJrV
	eOyZe4VHBpQvrE5stkxdh6dPRhUIIRe4rS6yCNDqcbvk6jyYdzSXts9crXq1UsrULd7TEb
	etl12fizgZ7EL5WVsLBGSKvh1loDTfofKq3wfU4RH/0o/1StE3hsSTRijFLgVeis6JG5kf
	fmfDaUVbE3Tu+ruIOiycqNTRiiZi2NwNn6CbJ33ejUVyh6YpJtk7/6xRRSm95hYg6Mc+wu
	Dz3mWkDBkbsxGkaOy4PpCtOBlIaouv4nMlrdZW1Kn008vEMMZzgJlTMoSIptow==
Date: Fri, 23 Aug 2024 18:22:40 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Parshuram Thombare <pthombar@cadence.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Boris Brezillon
 <bbrezillon@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Conor Culhane
 <conor.culhane@silvaco.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v3 10/11] i3c: master: svc: wait for Manual ACK/NACK
 Done before next step
Message-ID: <20240823182240.4096619b@xps-13>
In-Reply-To: <20240819-i3c_fix-v3-10-7d69f7b0a05e@nxp.com>
References: <20240819-i3c_fix-v3-0-7d69f7b0a05e@nxp.com>
	<20240819-i3c_fix-v3-10-7d69f7b0a05e@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_092243_525155_A8DBF4E1 
X-CRM114-Status: GOOD (  15.16  )
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

SGkgRnJhbmssCgpGcmFuay5MaUBueHAuY29tIHdyb3RlIG9uIE1vbiwgMTkgQXVnIDIwMjQgMTI6
MDI6MDQgLTA0MDA6Cgo+IFdhaXQgZm9yIHRoZSBjb250cm9sbGVyIHRvIGNvbXBsZXRlIGVtaXR0
aW5nIEFDSy9OQUNLLCBvdGhlcndpc2UgdGhlIG5leHQKPiBjb21tYW5kIG1heSBiZSBvbWl0dGVk
IGJ5IHRoZSBoYXJkd2FyZS4KPiAKPiBBZGQgY29tbWFuZCBkb25lIGNoZWNrIGF0IHN2Y19pM2Nf
bWFzdGVyX25hY2soYWNrKV9pYmkoKSBhbmQgY2hhbmdlIHJldHVybgoKCWEgImNvbW1hbmQgZG9u
ZSIgY2hlY2sgaW4KCnRoZSByZXV0bnIgdHlwZQoKPiB0eXBlIHRvIGludCB0byBpbmRpY2F0ZSB3
YWl0IGRvbmUgdGltZW91dC4KCgkJZmxhZyBwb3NzaWJsZSB0aW1lb3V0cy4KCj4gCj4gU2lnbmVk
LW9mZi1ieTogRnJhbmsgTGkgPEZyYW5rLkxpQG54cC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvaTNj
L21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jIHwgMzEgKysrKysrKysrKysrKysrKysrKysrKysrKy0t
LS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMgYi9k
cml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYwo+IGluZGV4IGZiYjZjZWY0MDU1Nzcu
LjIwMTA0OTU5MDZlYjMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2Mt
bWFzdGVyLmMKPiArKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYwo+IEBA
IC0zODQsMTAgKzM4NCwxMiBAQCBzdGF0aWMgaW50IHN2Y19pM2NfbWFzdGVyX2hhbmRsZV9pYmko
c3RydWN0IHN2Y19pM2NfbWFzdGVyICptYXN0ZXIsCj4gIAlyZXR1cm4gMDsKPiAgfQo+ICAKPiAt
c3RhdGljIHZvaWQgc3ZjX2kzY19tYXN0ZXJfYWNrX2liaShzdHJ1Y3Qgc3ZjX2kzY19tYXN0ZXIg
Km1hc3RlciwKPiArc3RhdGljIGludCBzdmNfaTNjX21hc3Rlcl9hY2tfaWJpKHN0cnVjdCBzdmNf
aTNjX21hc3RlciAqbWFzdGVyLAo+ICAJCQkJICAgYm9vbCBtYW5kYXRvcnlfYnl0ZSkKPiAgewo+
ICAJdW5zaWduZWQgaW50IGliaV9hY2tfbmFjazsKPiArCWludCByZXQ7Cj4gKwl1MzIgcmVnOwo+
ICAKPiAgCWliaV9hY2tfbmFjayA9IFNWQ19JM0NfTUNUUkxfUkVRVUVTVF9JQklfQUNLTkFDSzsK
PiAgCWlmIChtYW5kYXRvcnlfYnl0ZSkKPiBAQCAtMzk2LDE4ICszOTgsMzEgQEAgc3RhdGljIHZv
aWQgc3ZjX2kzY19tYXN0ZXJfYWNrX2liaShzdHJ1Y3Qgc3ZjX2kzY19tYXN0ZXIgKm1hc3RlciwK
PiAgCQlpYmlfYWNrX25hY2sgfD0gU1ZDX0kzQ19NQ1RSTF9JQklSRVNQX0FDS19XSVRIT1VUX0JZ
VEU7Cj4gIAo+ICAJd3JpdGVsKGliaV9hY2tfbmFjaywgbWFzdGVyLT5yZWdzICsgU1ZDX0kzQ19N
Q1RSTCk7Cj4gKwo+ICsJcmV0ID0gcmVhZGxfcG9sbF90aW1lb3V0X2F0b21pYyhtYXN0ZXItPnJl
Z3MgKyBTVkNfSTNDX01TVEFUVVMsIHJlZywKPiArCQkJCQlTVkNfSTNDX01TVEFUVVNfTUNUUkxE
T05FKHJlZyksIDEsIDEwMDApOwoKU3RpbGwgY29uY2VybmVkIGFib3V0IHRoZSBfYXRvbWljLgoK
PiArCXJldHVybiByZXQ7CgoJcmV0dXJuIHJlYWRsLi4uCgo+ICsKPiAgfQoKT3RoZXJ3aXNlIExH
VE0KClJldmlld2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29t
PgoKVGhhbmtzLApNaXF1w6hsCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWkzYwo=
