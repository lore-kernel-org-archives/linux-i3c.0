Return-Path: <SRS0=f8rI=KW=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4683C47089
	for <linux-i3c@archiver.kernel.org>; Thu, 27 May 2021 15:05:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67DE46128D
	for <linux-i3c@archiver.kernel.org>; Thu, 27 May 2021 15:05:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67DE46128D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xOSVWcQiwciZ28lYMW6Btb/S+KwY49FSKBSmSZTtW9c=; b=rMw/Cb32zVopqh
	eAiWyj0/yrj04w6uRj9FvCu0DUr48A2SxZthX3gD1N6Qp4p85+6H7LpWdhme6UAIzGwL9jYunD8s/
	t59pMdat9YyVcJJxfkQJVYVxB2ymxrh92G5mVfOrVKJSP5uClMM+OOLhw/M2BeOepV7bJrslSYI8I
	wegwf91cwUeMVUVy7AKaCvG6PAC2KVC9Z5MIPV14+fQs1syuoiSR5GE7h9lSyTBEBDjxlh2a/e7/6
	cYw4DxTCad64MEdTASbLP9vkBT3ndh8sW0Cbj8MZ8ZtayBGqADvrItG9TRPS1Vy+fXK2GTftQQHvX
	NZDzePmQEYQ1Yo9Ur6pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmHZJ-0071Qm-7U; Thu, 27 May 2021 15:05:05 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmHC4-006ref-6r
 for linux-i3c@lists.infradead.org; Thu, 27 May 2021 14:41:08 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 4E33C100006;
 Thu, 27 May 2021 14:40:59 +0000 (UTC)
Date: Thu, 27 May 2021 16:40:58 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-i3c@lists.infradead.org>,
 <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH -next] i3c: master: svc: drop free_irq of
 devm_request_irq allocated irq
Message-ID: <20210527164058.3c9145b2@xps13>
In-Reply-To: <7052d19a-54cb-d634-f195-dbd8ef37f1e7@huawei.com>
References: <20210518131127.1308550-1-yangyingliang@huawei.com>
 <20210527120123.75f2ea09@xps13>
 <7052d19a-54cb-d634-f195-dbd8ef37f1e7@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_074104_430728_F71CAB3A 
X-CRM114-Status: GOOD (  24.03  )
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

SGkgWWFuZywKCllhbmcgWWluZ2xpYW5nIDx5YW5neWluZ2xpYW5nQGh1YXdlaS5jb20+IHdyb3Rl
IG9uIFRodSwgMjcgTWF5IDIwMjEKMjE6NDk6NTMgKzA4MDA6Cgo+IEhpLAo+IAo+IE9uIDIwMjEv
NS8yNyAxODowMSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IEhpIFlhbmcsCj4gPgo+ID4gWWFu
ZyBZaW5nbGlhbmcgPHlhbmd5aW5nbGlhbmdAaHVhd2VpLmNvbT4gd3JvdGUgb24gVHVlLCAxOCBN
YXkgMjAyMQo+ID4gMjE6MTE6MjcgKzA4MDA6Cj4gPiAgCj4gPj4gaXJxIGFsbG9jYXRlZCB3aXRo
IGRldm1fcmVxdWVzdF9pcnEgc2hvdWxkIG5vdCBiZSBmcmVlZCB1c2luZwo+ID4+IGZyZWVfaXJx
LCBiZWNhdXNlIGRvaW5nIHNvIGNhdXNlcyBhIGRhbmdsaW5nIHBvaW50ZXIsIGFuZCBhCj4gPj4g
c3Vic2VxdWVudCBkb3VibGUgZnJlZS4KPiA+Pgo+ID4+IFJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90
IDxodWxrY2lAaHVhd2VpLmNvbT4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBZYW5nIFlpbmdsaWFuZyA8
eWFuZ3lpbmdsaWFuZ0BodWF3ZWkuY29tPgo+ID4+IC0tLQo+ID4+ICAgZHJpdmVycy9pM2MvbWFz
dGVyL3N2Yy1pM2MtbWFzdGVyLmMgfCAyICstCj4gPj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kz
Yy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYyBiL2RyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1h
c3Rlci5jCj4gPj4gaW5kZXggMWY2YmE0MjIxODE3Li43NjFjOWM0NjgzNTcgMTAwNjQ0Cj4gPj4g
LS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMKPiA+PiArKysgYi9kcml2
ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYwo+ID4+IEBAIC0xNDQ4LDcgKzE0NDgsNyBA
QCBzdGF0aWMgaW50IHN2Y19pM2NfbWFzdGVyX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQo+ID4+ICAgCWlmIChyZXQpCj4gPj4gICAJCXJldHVybiByZXQ7ICAKPiA+PiAgID4+
IC0JZnJlZV9pcnEobWFzdGVyLT5pcnEsIG1hc3Rlcik7ICAKPiA+PiArCWRldm1fZnJlZV9pcnEo
JnBkZXYtPmRldiwgbWFzdGVyLT5pcnEsIG1hc3Rlcik7ICAKPiA+IFdvdWxkbid0IHJlbW92aW5n
IHRoaXMgY2FsbCB0aGUgcmlnaHQgc29sdXRpb24/IElmIGl0J3MgYSBkZXZpY2UKPiA+IG1hbmFn
ZWQgcmVzb3VyY2UsIGl0IHdvbid0IHByb2JhYmx5IGJlIG5lZWRlZCB0byBmcmVlIGl0IGV4cGxp
Y2l0bHkgaW4KPiA+IHRoZSByZW1vdmUgcGF0aC4gIAo+IFNvbWUgZHJpdmVycyB3b3VsZCBleHBl
Y3QgdG8gZnJlZSBpcnEgaXRzZWxmLAoKSSBkb24ndCBnZXQgaXQuIERyaXZlcnMgZG8gbm90IGV4
cGVjdCBhbnl0aGluZywgdGhleSBzaG91bGQganVzdCBjb21wbHkKd2l0aCB0aGUgQVBJLiBJZiBy
b2JvdHMgY29tcGxhaW4gYmVjYXVzZSBhIGRldmljZSBtYW5hZ2VkIHJlc291cmNlIGlzCmJlaW5n
IGZyZWVkIHdpdGhvdXQgdGhlIGRldmljZSBtYW5hZ2VkIGhlbHBlciwgdGhpcyBkb2VzIG5vdCBt
ZWFuIHRoYXQKdGhlIHJlc291cmNlIHNob3VsZCBleHBsaWNpdGx5IGJlIGZyZWVkLCBpdCBqdXN0
IG1lYW5zIHRoYXQgKmlmKiBpdAptdXN0IGJlIGV4cGxpY2l0bHkgZnJlZWQsIHRoZSB3cm9uZyBo
ZWxwZXIgaXMgYmVpbmcgdXNlZC4KCj4gSSBhbSBub3Qgc3VyZSBpZiBpdCdzIG9rIHRvIHJlbW92
ZSB0aGUgZnJlZV9pcnEoKSBpbiBpM2MsCgpXaGF0IGlzIHRoZSBsaW5rIHdpdGggSTNDPyBTb3Jy
eSBJIG1pZ2h0IGJlIG1pc3Npbmcgc29tZXRoaW5nIGJ1dAptYXN0ZXItPmlycSBpcyBhIGRyaXZl
ciB2YXJpYWJsZSwgSSBkb24ndCBnZXQgdGhlIGxpbmsgd2l0aCB0aGUgSTNDCmZyYW1ld29yayBh
bmQgd2h5IGl0IHdvdWxkIGludGVyZmVyZS4KCj4gSSBqdXN0IGtlZXAgdGhlIG9yaWdpbmFsIGxv
Z2ljIGhlcmUgYW5kIGF2b2lkIGRvdWJsZSBmcmVlLgoKSSBkb24ndCB0aGluayBpdCBpcyBzYW5l
LiBDYWxsaW5nIGRldm1fZnJlZV9pcnEoKSBtYXliZSBpcyB0aGUgcmlnaHQKc29sdXRpb24gLSBJ
IGRvbid0IGZlZWwgbGlrZSBpdCBpcyAtIGJ1dCB5b3VyIGNlcnRhaW5seSBjYW4ndCBoaWRlCmJl
aGluZCBhICdJIGp1c3Qgd2FudCB0aGUgcm9ib3RzIHRvIGJlIGhhcHB5JyBqdXN0aWZpY2F0aW9u
LiBIaWRpbmcKYnVncyBvbiBwdXJwb3NlIGlzIG5vdCBzb21ldGhpbmcgdGhhdCBJIHBlcnNvbmFs
bHkgYXBwcmVjaWF0ZSBtdWNoLgoKVGhhbmtzLApNaXF1w6hsCgotLSAKbGludXgtaTNjIG1haWxp
bmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
