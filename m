Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EDD2C83F17
	for <linux-i3c@archiver.kernel.org>; Wed, 30 Aug 2023 15:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Gr+rFuWtze/ILXlF+ofYk5Lz7J8BbsI5e0VA2S8OVI=; b=HOWa31daTfv9gp
	LhQ1zyqnzp7j8GePexpbzC83pVR7SSe8mq834gzZ0EzQl/VanmavZj8AI6KTJAvOEFB/jRw4Phx8T
	ZNFqsyYnf52jbcrHe2a1TiS4cNAOS8kZkx9xyILyw6Vs9DQ2JOdKC+BTdIwiJflE2RCphHdldl+yK
	2meqvWRAQrtdDA1r0Wmtz3z+x2MlfuhL7Adp7mEgj4N63g4oaXI0BlYQfntv1CyBzkXBgsaB6AC+g
	HyRcEUcM0OAFd4v6zHkT9lVoBdfkhAkS9+R1ONSpMn4u3RmU2jN/fL1sGoFhUGfn/VbMouN1UkD+8
	BEnhe28Ty3/sXjCU/76w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbNWC-00Dnaw-1o;
	Wed, 30 Aug 2023 15:54:08 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbNW9-00Dna2-2s
	for linux-i3c@lists.infradead.org;
	Wed, 30 Aug 2023 15:54:08 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 11279FF805;
	Wed, 30 Aug 2023 15:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1693410839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Oi9bdR5IDoywXio4JSGMkFbpZz4FjKhq3Oh8bcaX1wE=;
	b=KtPCsMuZ5YdkYsWMf1/CYZXUyzOP9Y9jNIW9Ubez9F6Ih4o7nMfAMfdvrF5Lp+wQKC9l1w
	rUlfnoZXDtIs0lXKDdx8jawwcYT7DkFoOnZd/GafvHt2dhMIc2gLzbyYe13s4PJalpPyxa
	BCf10pY+5ZAbXHzIZ74D+MnR+2+g3+CWBhCLaZO38qHpH8tzO8sqRLmrrA990mT14jUSj6
	mkgURjjVMSuQgyz6+CB/o769KXvZnQRkNyBasbvbepH5DJY0Tlfbb+KOEV6wRLgw7JuGMQ
	pfXRMApBnZsWh7wy6s2tsRsOqCGYUxLZ5ymJNYglmCyEKxV0R0x89aIPepiztQ==
Date: Wed, 30 Aug 2023 17:53:55 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
 imx@lists.linux.dev, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] i3c: master: fixes i3c bus driver probe failure
 if no i3c device attached
Message-ID: <20230830175355.4bc2b8d2@xps-13>
In-Reply-To: <20230830141727.3794152-1-Frank.Li@nxp.com>
References: <20230830141727.3794152-1-Frank.Li@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_085406_231055_32FBA720 
X-CRM114-Status: GOOD (  15.21  )
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

SGkgRnJhbmssCgpGcmFuay5MaUBueHAuY29tIHdyb3RlIG9uIFdlZCwgMzAgQXVnIDIwMjMgMTA6
MTc6MjYgLTA0MDA6Cgo+IEluIGkzY19tYXN0ZXJfYnVzX2luaXQoKQo+IHsJLi4uCj4gCXJldCA9
IGkzY19tYXN0ZXJfcnN0ZGFhX2xvY2tlZChtYXN0ZXIsIEkzQ19CUk9BRENBU1RfQUREUik7Cj4g
CWlmIChyZXQgJiYgcmV0ICE9IEkzQ19FUlJPUl9NMikKPiAJCQkgIF5eXiAvLyBpdCBpcyBlbnVt
IGkzY19lcnJvcl9jb2RlCj4gCS4uLgo+IH0KPiAKPiBJbiBkdy1pM2MtbWFzdGVyLmMgaW1wbGVt
ZW50YXRpb246Cj4gZHdfaTNjX2NjY19zZXQoKQo+IHsJLi4uCj4gCXJldCA9IHhmZXItPnJldDsK
PiAJaWYgKHhmZXItPmNtZHNbMF0uZXJyb3IgPT0gUkVTUE9OU0VfRVJST1JfSUJBX05BQ0spCj4g
CQljY2MtPmVyciA9IEkzQ19FUlJPUl9NMjsKPiAKPiAJZHdfaTNjX21hc3Rlcl9mcmVlX3hmZXIo
eGZlcik7Cj4gCj4gCXJldHVybiByZXQ7Cj4gfQo+IAo+IFJldHVybiBlbnVtIGkzY19lcnJvcl9j
b2RlIHdoZW4gZXJyb3IgaGFwcGVuIGluIGkzY19tYXN0ZXJfcnN0ZGFhX2xvY2tlZCgpLgoKSSBh
bSBzb3JyeSBidXQgdGhlIGNvbW1pdCBsb2cgbmVlZHMgdG8gYmUgd29ya2VkIG9uLgoKPiAKPiBD
Yzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IEZpeGVzOiAzYTM3OWJiY2VhMGEgKCJpM2M6IEFk
ZCBjb3JlIEkzQyBpbmZyYXN0cnVjdHVyZSIpCj4gU2lnbmVkLW9mZi1ieTogRnJhbmsgTGkgPEZy
YW5rLkxpQG54cC5jb20+Cj4gLS0tCj4gCj4gTm90ZXM6Cj4gICAgIENoYW5nZSBmcm9tIHYxIHRv
IHYyOgo+ICAgICAtIGNjIHN0YWJsZQo+IAo+ICBkcml2ZXJzL2kzYy9tYXN0ZXIuYyB8IDMgKysr
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9pM2MvbWFzdGVyLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIuYwo+IGluZGV4IDA4YWViNjlh
NzgwMDMuLjAwYTgyZjNhYjlhYzAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyLmMK
PiArKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIuYwo+IEBAIC03ODMsNiArNzgzLDkgQEAgc3RhdGlj
IGludCBpM2NfbWFzdGVyX3JzdGRhYV9sb2NrZWQoc3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxl
ciAqbWFzdGVyLAo+ICAJcmV0ID0gaTNjX21hc3Rlcl9zZW5kX2NjY19jbWRfbG9ja2VkKG1hc3Rl
ciwgJmNtZCk7Cj4gIAlpM2NfY2NjX2NtZF9kZXN0X2NsZWFudXAoJmRlc3QpOwo+ICAKPiArCWlm
IChyZXQpCj4gKwkJcmV0ID0gY21kLmVycjsKClNob3VsZG4ndCB0aGlzIGhhcHBlbiBpbiBpM2Nf
bWFzdGVyX3NlbmRfY2NjX2NtZF9sb2NrZWQoKT8KCj4gKwo+ICAJcmV0dXJuIHJldDsKPiAgfQo+
ICAKCgpUaGFua3MsCk1pcXXDqGwKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkz
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtaTNjCg==
