Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD10C10F1A
	for <linux-i3c@archiver.kernel.org>; Tue,  7 May 2024 08:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q75hJCiz4+hg2+mAxQjVTGbh8/8vX8M9cS80jomxmCU=; b=iTans+Q5nM8g1R
	Lm2BPqwb2DjIK7PlXrsVZZo26e0a+XrRwbeXDGCaVR3ntHCmvcdXpzO/ju/kHb53BAsr/jP0UUsjm
	apPxwcdqB4Jy+Kx9gwJF5hnPFXia5xw84HQCFGxEwpYZgxWVQXOcXV8YtHCWMytB8To0XS3HybWd7
	fSNjLo2eP1dJExF4QOrHBZpIrlPkCXkzAyN3V4DJLmxJcNBPfaENx8IUE2Qb+X955vNlWGPIul1Wl
	tyb9mAKRBpSW5Ol62UXGw5PMwQThOpuqKwK1RyRz/wAP+iKUJshJmnjEMVh8fREDZLROdkXKY17Bw
	YNRTk+YCSa+U13SJQuAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4FnM-0000000A4JQ-3v2p;
	Tue, 07 May 2024 08:03:28 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4FnK-0000000A4It-0Jou
	for linux-i3c@lists.infradead.org;
	Tue, 07 May 2024 08:03:27 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 852B41BF20A;
	Tue,  7 May 2024 08:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715069001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N1Ei+DgII1ACjLBqbEo7/JpuP+L5JG4dJUUqKjECzuo=;
	b=fNwpQ7ECmfGij6EkQo/jw3zchLWtOfWIfA6jaF2G2SreFnwdb5UR/Tno9lxKR0sUuRWEQM
	oefoxxpMBWsmsdIpQmI6QxJJI7UTyFttalD4qWnKxVKcrorbjxQvGKaKJdxeIHAJLUE6O8
	reml2ByM5BXQfI7bpYkgIFPny2vYPhVWOUt5IsA4Q74JXjTaT8ar/zGqFbzDVn6c/kOO23
	UFcxittD1nWgPPDScwLL04VjLVyPoJpCPqKUNk/mJhJiJ+DNmol2fUzD/FJK9zXIeHidha
	WMIRWYKthKkM7WvAZzsCBl5sHnEUhruCiebAmpbZP+Nr15gPYnX7QyIL+FYtGw==
Date: Tue, 7 May 2024 10:03:19 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
 imx@lists.linux.dev, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] i3c: Add comment for -EAGAIN in
 i3c_device_do_priv_xfers()
Message-ID: <20240507100319.04d8039f@xps-13>
In-Reply-To: <20240506164009.21375-1-Frank.Li@nxp.com>
References: <20240506164009.21375-1-Frank.Li@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_010326_426063_0D306AA0 
X-CRM114-Status: GOOD (  13.74  )
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

SGkgRnJhbmssCgpGcmFuay5MaUBueHAuY29tIHdyb3RlIG9uIE1vbiwgIDYgTWF5IDIwMjQgMTI6
NDA6MDcgLTA0MDA6Cgo+IEluIGFjY29yZGFuY2Ugd2l0aCBJM0Mgc3BlYyB2ZXIgMS4xLjEgMDkt
SnVuLTIwMjEsIHNlY3Rpb246IDUuMS4yLjIuMywgaWYKPiBhIHRhcmdldCByZXF1ZXN0cyBob3Qg
am9pbiAoSEopLCBJbi1CYW5kIEludGVycnVwdCAoSUJJKSwgb3IgY29udHJvbGxlcgo+IHJvbGUg
cmVxdWVzdCAoQ1JSKSBkdXJpbmcgdGhlIGVtaXNzaW9uIG9mIGFuIEkzQyBhZGRyZXNzIGluCj4g
aTNjX2RldmljZV9kb19wcml2X3hmZXJzKCksIHRoZSB0YXJnZXQgbWF5IHdpbiBidXMgYXJiaXRy
YXRpb24uIEluIHN1Y2gKPiBjYXNlcywgaXQgaXMgaW1wZXJhdGl2ZSB0byBub3RpZnkgdGhlIEkz
QyBjbGllbnQgZHJpdmVyIGFuZCByZXRyeQo+IGkzY19kZXZpY2VfZG9fcHJpdl94ZmVycygpIGFm
dGVyIHNvbWUgZGVsYXkuCj4gCj4gU2lnbmVkLW9mZi1ieTogRnJhbmsgTGkgPEZyYW5rLkxpQG54
cC5jb20+Cj4gLS0tCj4gCj4gTm90ZXM6Cj4gICAgIENoYW5nZSBmcm9tIHYxIHRvIHYyCj4gICAg
IC0gbmV3IHBhdGNoCj4gCj4gIGRyaXZlcnMvaTNjL2RldmljZS5jIHwgNCArKysrCj4gIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2Mv
ZGV2aWNlLmMgYi9kcml2ZXJzL2kzYy9kZXZpY2UuYwo+IGluZGV4IDFhNmE4NzAzZGJjM2EuLmIw
NGE1NWExMzM3ZDQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pM2MvZGV2aWNlLmMKPiArKysgYi9k
cml2ZXJzL2kzYy9kZXZpY2UuYwo+IEBAIC0yNyw2ICsyNywxMCBAQAo+ICAgKiBUaGlzIGZ1bmN0
aW9uIGNhbiBzbGVlcCBhbmQgdGh1cyBjYW5ub3QgYmUgY2FsbGVkIGluIGF0b21pYyBjb250ZXh0
Lgo+ICAgKgo+ICAgKiBSZXR1cm46IDAgaW4gY2FzZSBvZiBzdWNjZXNzLCBhIG5lZ2F0aXZlIGVy
cm9yIGNvcmUgb3RoZXJ3aXNlLgo+ICsgKgkgICAtRUFHQUlOOiBjb250cm9sbGVyIGxvc3QgYWRk
cmVzcyBhcmJpdHJhdGlvbi4gVGFyZ2V0Cj4gKyAqCQkgICAgKElCSSwgSEogb3IgY29udHJvbGxl
ciByb2xlIHJlcXVlc3QpIHdpbiB0aGUgYnVzLiBDbGllbnQKPiArICoJCSAgICBkcml2ZXIgbmVl
ZCByZXNlbmQgdGhpcyAneGZlcnMnIHNvbWUgdGltZSBsYXRlci4KCgkJCSBuZWVkcyB0byByZXNl
bmQgdGhlICd4ZmVycycKCj4gKyAqCQkgICAgU2VlIEkzQyBzcGVjIHZlciAxLjEuMSAwOS1KdW4t
MjAyMS4gU2VjdGlvbjogNS4xLjIuMi4zLgo+ICAgKi8KPiAgaW50IGkzY19kZXZpY2VfZG9fcHJp
dl94ZmVycyhzdHJ1Y3QgaTNjX2RldmljZSAqZGV2LAo+ICAJCQkgICAgIHN0cnVjdCBpM2NfcHJp
dl94ZmVyICp4ZmVycywKCgpXaXRoIHRoaXMgbGl0dGxlIG5pdCwKClJldmlld2VkLWJ5OiBNaXF1
ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKClRoYW5rcywKTWlxdcOobAoK
LS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
