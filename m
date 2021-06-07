Return-Path: <SRS0=hrBA=LB=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B3E3C4743F
	for <linux-i3c@archiver.kernel.org>; Mon,  7 Jun 2021 06:23:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A16A1611BD
	for <linux-i3c@archiver.kernel.org>; Mon,  7 Jun 2021 06:23:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A16A1611BD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iAxFDZObnEe5WtedPXWXqmVDxZSaftsiihjvLPf3nII=; b=iZ94UWo0+E/6qy
	Yge4zthYT0SKE8LaLtHGbHOQ2pGGFFiXhT1vOUwzdDua7FA3ExvEAss464Eac819yCiPN+J5rGSjU
	/Hx4CVyxhRlK6m4p/nYKyb/H0jnlwuulUlbYo9A0/6OROK6Nj3JMeft2xuEprCoNSrC5vsXpSDqbb
	2p0DQPto55Mq75fxJCoILln4OFOdcgJQJVlaucOfXOpo9bXx9frQJPS7vyqN1OJ5gLDXBRoKGsrT6
	CZSryVynb/jh44iyd1GmnAAz88i+kFUB7lcHrghzkG4WWRzqF9tR2eKnS0grbJgKJvZpVI+icU2LD
	aG9i6dCpf9I7l5rZC9jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lq8fM-001gcD-3Q; Mon, 07 Jun 2021 06:23:16 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lq8fI-001gav-Sa
 for linux-i3c@lists.infradead.org; Mon, 07 Jun 2021 06:23:15 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 6A54C240009;
 Mon,  7 Jun 2021 06:23:09 +0000 (UTC)
Date: Mon, 7 Jun 2021 08:23:08 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-i3c@lists.infradead.org>,
 <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH -next] i3c: master: svc: fix doc warning in
 svc-i3c-master.c
Message-ID: <20210607082308.551cdada@xps13>
In-Reply-To: <20210602085544.4101980-1-yangyingliang@huawei.com>
References: <20210602085544.4101980-1-yangyingliang@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_232313_077040_144B2CC3 
X-CRM114-Status: GOOD (  13.52  )
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
IG9uIFdlZCwgMiBKdW4gMjAyMQoxNjo1NTo0NCArMDgwMDoKCj4gRml4IHRoZSBmb2xsb3dpbmcg
bWFrZSBXPTEgd2FybmluZzoKPiAKPiAgIGRyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rl
ci5jOjIwNzogd2FybmluZzogZXhwZWN0aW5nIHByb3RvdHlwZSBmb3Igc3RydWN0IHN2Y19pM2Nf
aTNjX2Rldl9kYXRhLiBQcm90b3R5cGUgd2FzIGZvciBzdHJ1Y3Qgc3ZjX2kzY19pMmNfZGV2X2Rh
dGEgaW5zdGVhZAo+IAo+IFNpZ25lZC1vZmYtYnk6IFlhbmcgWWluZ2xpYW5nIDx5YW5neWluZ2xp
YW5nQGh1YXdlaS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rl
ci5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMg
Yi9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYwo+IGluZGV4IGVlYjQ5YjVkOTBl
Zi4uODc5ZTVhNjRhY2FmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNj
LW1hc3Rlci5jCj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMKPiBA
QCAtMTk1LDcgKzE5NSw3IEBAIHN0cnVjdCBzdmNfaTNjX21hc3RlciB7Cj4gIH07Cj4gIAo+ICAv
KioKPiAtICogc3RydWN0IHN2Y19pM2NfaTNjX2Rldl9kYXRhIC0gRGV2aWNlIHNwZWNpZmljIGRh
dGEKPiArICogc3RydWN0IHN2Y19pM2NfaTJjX2Rldl9kYXRhIC0gRGV2aWNlIHNwZWNpZmljIGRh
dGEKPiAgICogQGluZGV4OiBJbmRleCBpbiB0aGUgbWFzdGVyIHRhYmxlcyBjb3JyZXNwb25kaW5n
IHRvIHRoaXMgZGV2aWNlCj4gICAqIEBpYmk6IElCSSBzbG90IGluZGV4IGluIHRoZSBtYXN0ZXIg
c3RydWN0dXJlCj4gICAqIEBpYmlfcG9vbDogSUJJIHBvb2wgYXNzb2NpYXRlZCB0byB0aGlzIGRl
dmljZQoKClJldmlld2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4u
Y29tPgoKClRoYW5rcywKTWlxdcOobAoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgt
aTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1pM2MK
