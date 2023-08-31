Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C241AC83F33
	for <linux-i3c@archiver.kernel.org>; Thu, 31 Aug 2023 14:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cTLZ6adxjJTyGVFe6E+r+V5IR62xv2twTBGJt+42iN4=; b=Cz7lUzOhImdnDS
	FITa41cOfmSYPmhnLQp/nD/uGCaVtacrhdL/x8DrtU4SX9FksvKYWe8VR8bNH574Uf53t3fPtq4WJ
	8S0M8dNRFhHj1JHVxkmU6DR20qrv7BFxJ7ie1im81wvDzgtZmUPZRdQN52eV7IWHDISX71w9uTcu9
	3Ra9ZyaDGvmvzb87ElrARFCxYTsAsx8yrPk5YC1onxJJp/ZOS+UzTfopEjIyUgpUBSUsLm0SGkozH
	fA88W3F3Hk5LaaTlHxciYLHRaEN/foilALoKpWl3pvrB8xt71PoL9BEdz+wBEZS/kUeoq1zQZC6qb
	slLHoL/gBxj7GHteBVug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbiYK-00FQvK-1T;
	Thu, 31 Aug 2023 14:21:44 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbiYG-00FQtj-1q
	for linux-i3c@lists.infradead.org;
	Thu, 31 Aug 2023 14:21:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 698991BF212;
	Thu, 31 Aug 2023 14:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1693491696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aByMOVFmM+SkUtrpBTr+ttq0hQzvoU/QCipPW40qS2o=;
	b=nvJAln9SgXRKA5Lz+jYUK/tvyRDj8d4nXwORPilNm7f2P56SAK0bEnDKXouUpvtK+wX6XX
	GwapBu/sS6LpjH0UHlteMJUFELqVM20JGwx01yuxCCsENH5lMe1QKZd7JX7GOAk0Qw/0DI
	Pj06mWEPK3PZDRC5TMcUZyzBhcUTZw1XVIhmKIwbVm361RxvBHsgloX74JjeidFd5Zg0pL
	HFPdJf6X50CAaHfYDEa8yGSZmCC5D6wOPKshWtlLcLGipYYSJS0Pa+USRDpOxDlddTQs1/
	QXWYHZP/rWv88h82GM3/o6jKZJKjjiQ4cw7zwfif3PDlFSUhelUA45fi+7Gx7A==
Date: Thu, 31 Aug 2023 16:21:34 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
 imx@lists.linux.dev, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/1] i3c: master: svc: fix probe failure when no i3c
 device exist
Message-ID: <20230831162134.6ccbaf23@xps-13>
In-Reply-To: <20230831141324.2841525-1-Frank.Li@nxp.com>
References: <20230831141324.2841525-1-Frank.Li@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_072140_759785_4B822AAC 
X-CRM114-Status: GOOD (  12.21  )
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

SGkgRnJhbmssCgpGcmFuay5MaUBueHAuY29tIHdyb3RlIG9uIFRodSwgMzEgQXVnIDIwMjMgMTA6
MTM6MjQgLTA0MDA6Cgo+IEkzQyBtYXN0ZXJzIGFyZSBleHBlY3RlZCB0byBzdXBwb3J0IGhvdC1q
b2luLiBUaGlzIG1lYW5zIGF0IGluaXRpYWxpemF0aW9uCj4gdGltZSB3ZSBtaWdodCBub3QgeWV0
IGRpc2NvdmVyIGFueSBkZXZpY2UgYW5kIHRoaXMgc2hvdWxkIG5vdCBiZSB0cmVhdGVkCj4gYXMg
YSBmYXRhbCBlcnJvci4KPiAKPiBEdXJpbmcgdGhlIERBQSBwcm9jZWR1cmUgd2hpY2ggaGFwcGVu
cyBhdCBwcm9iZSB0aW1lLCBpZiBubyBkZXZpY2UgaGFzCj4gam9pbmVkLCBhbGwgQ0NDIHdpbGwg
YmUgTkFDS2VkIChmcm9tIGEgYnVzIHBlcnNwZWN0aXZlKS4gVGhpcyBsZWFkcyB0byBhbgo+IGVh
cmx5IHJldHVybiB3aXRoIGFuIGVycm9yIGNvZGUgd2hpY2ggZmFpbHMgdGhlIHByb2JlIG9mIHRo
ZSBtYXN0ZXIuCj4gCj4gTGV0J3MgYXZvaWQgdGhpcyBieSBqdXN0IHRlbGxpbmcgdGhlIGNvcmUg
dGhyb3VnaCBhbiBJM0NfRVJST1JfTTIKPiByZXR1cm4gY29tbWFuZCBjb2RlIHRoYXQgbm8gZGV2
aWNlIHdhcyBkaXNjb3ZlcmVkLCB3aGljaCBpcyBhIHZhbGlkCj4gc2l0dWF0aW9uLiBUaGlzIHdh
eSB0aGUgbWFzdGVyIHdpbGwgbm8gbG9uZ2VyIGJhaWwgb3V0IGFuZCBmYWlsIHRvIHByb2JlCj4g
Zm9yIGEgd3JvbmcgcmVhc29uLgo+IAo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gRml4
ZXM6IGRkM2M1Mjg0NmQ1OSAoImkzYzogbWFzdGVyOiBzdmM6IEFkZCBTaWx2YWNvIEkzQyBtYXN0
ZXIgZHJpdmVyIikKPiBTaWduZWQtb2ZmLWJ5OiBGcmFuayBMaSA8RnJhbmsuTGlAbnhwLmNvbT4K
CkFja2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKVGhh
bmtzLApNaXF1w6hsCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWkzYwo=
