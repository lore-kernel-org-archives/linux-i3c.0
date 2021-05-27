Return-Path: <SRS0=f8rI=KW=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5716CC47089
	for <linux-i3c@archiver.kernel.org>; Thu, 27 May 2021 10:01:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D0F6610A6
	for <linux-i3c@archiver.kernel.org>; Thu, 27 May 2021 10:01:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D0F6610A6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9UGRkxe1HT9PXWKBT8GzOOTFwbSGTU0SZgxPRZFa7m0=; b=mbrolnicfO4WXs
	iHLr6GVKNXyLh5H9X3fQmJXs/GB533GifyVd/qHm/UoN0+gfRkLym+vphu1Uc5BzZqzdhL0R8sjnN
	p3XofWnDzIfo0J3eGzMhjL0wvRI8v7CkZj9ORxwEbjXBVzL0FO2ztZgKqBgO4m+vwA4/daAcDsquO
	xnZsvF0zRuOdSZw+hYFPb4IpFImNgopAEhC7HaNfNzUjCwqS7z2qaaqurqhiT16Y7wVxsJ+gufgQV
	pDfJ3EgjnF7VxpWorqZJ3szN6ZfrD5rMNBUAiVbVEnnAHlPxsSJAFK6NfV0ddfgJX2JrDHrbgtz85
	VXc0Gw5IIX3HLdu+X/9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmCpf-004aBr-6Y; Thu, 27 May 2021 10:01:39 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmCpb-004a7M-3F
 for linux-i3c@lists.infradead.org; Thu, 27 May 2021 10:01:36 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 75FBD100005;
 Thu, 27 May 2021 10:01:29 +0000 (UTC)
Date: Thu, 27 May 2021 12:01:23 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-i3c@lists.infradead.org>,
 <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH -next] i3c: master: svc: drop free_irq of
 devm_request_irq allocated irq
Message-ID: <20210527120123.75f2ea09@xps13>
In-Reply-To: <20210518131127.1308550-1-yangyingliang@huawei.com>
References: <20210518131127.1308550-1-yangyingliang@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_030135_317415_A92F48B9 
X-CRM114-Status: GOOD (  14.38  )
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
IG9uIFR1ZSwgMTggTWF5IDIwMjEKMjE6MTE6MjcgKzA4MDA6Cgo+IGlycSBhbGxvY2F0ZWQgd2l0
aCBkZXZtX3JlcXVlc3RfaXJxIHNob3VsZCBub3QgYmUgZnJlZWQgdXNpbmcKPiBmcmVlX2lycSwg
YmVjYXVzZSBkb2luZyBzbyBjYXVzZXMgYSBkYW5nbGluZyBwb2ludGVyLCBhbmQgYQo+IHN1YnNl
cXVlbnQgZG91YmxlIGZyZWUuCj4gCj4gUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtjaUBo
dWF3ZWkuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFlhbmcgWWluZ2xpYW5nIDx5YW5neWluZ2xpYW5n
QGh1YXdlaS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5j
IHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMgYi9k
cml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYwo+IGluZGV4IDFmNmJhNDIyMTgxNy4u
NzYxYzljNDY4MzU3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1h
c3Rlci5jCj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMKPiBAQCAt
MTQ0OCw3ICsxNDQ4LDcgQEAgc3RhdGljIGludCBzdmNfaTNjX21hc3Rlcl9yZW1vdmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCWlmIChyZXQpCj4gIAkJcmV0dXJuIHJldDsKPiAg
Cj4gLQlmcmVlX2lycShtYXN0ZXItPmlycSwgbWFzdGVyKTsKPiArCWRldm1fZnJlZV9pcnEoJnBk
ZXYtPmRldiwgbWFzdGVyLT5pcnEsIG1hc3Rlcik7CgpXb3VsZG4ndCByZW1vdmluZyB0aGlzIGNh
bGwgdGhlIHJpZ2h0IHNvbHV0aW9uPyBJZiBpdCdzIGEgZGV2aWNlCm1hbmFnZWQgcmVzb3VyY2Us
IGl0IHdvbid0IHByb2JhYmx5IGJlIG5lZWRlZCB0byBmcmVlIGl0IGV4cGxpY2l0bHkgaW4KdGhl
IHJlbW92ZSBwYXRoLgoKPiAgCWNsa19kaXNhYmxlX3VucHJlcGFyZShtYXN0ZXItPnBjbGspOwo+
ICAJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKG1hc3Rlci0+ZmNsayk7Cj4gIAljbGtfZGlzYWJsZV91
bnByZXBhcmUobWFzdGVyLT5zY2xrKTsKClRoYW5rcywKTWlxdcOobAoKLS0gCmxpbnV4LWkzYyBt
YWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
