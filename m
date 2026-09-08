Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599FAC79F82
	for <linux-i3c@archiver.kernel.org>; Tue,  8 Sep 2026 09:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OjzhBTkm2HVzIu9jqEJx+PK15jfCuNkF2Bjd7zj1k3w=; b=qSP7hD8DIZ/XvK
	NNk7x6HaCJvtdVocJZXaSvVzBC/PrPKHxPjSZS33UsD0TSNoO5dDrSTEX12gfw/div1BBR89wimEw
	AQ9rtrrJEYeExAGEkejpRIf3xX5Sb95gHGQj/WxAAOHYe11LWS/VEqSmaYs7ATOBNs+BON0WvhjVn
	bWMeRg+2hPhidWliinQAse/y3MCgF6mP01cJQpMW/iW/HoXOtdkeunL/Aj+8E20q7RDFTfi825/FM
	MBbwMCvkO+ct39qg8d8zSnu8611pAU4/TUzWklXKMd2N3xukxHa3T3SaHQ/tBoiMrURYGJcFxH9CD
	Vs4ys/wmmHxZo0P7YaZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sY7-00000008h4B-0F8G;
	Tue, 08 Sep 2026 09:55:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sY6-00000008h3m-1DDb
	for linux-i3c@lists.infradead.org;
	Tue, 08 Sep 2026 09:55:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BF4B1437FE;
	Tue,  8 Sep 2026 09:55:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47D591F00A3D;
	Tue,  8 Sep 2026 09:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788861329;
	bh=3rsR0vfPqpKX/m0gC5lVtYpSF5cbRTsjp/Jj+XkSNRA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hpZOOTI9m/Xg76V50CV5u0q6iaGcBrwb4lYtXcC+84IL/OqtB8f91HKLHoZrEOAXq
	 ZtjgadVaV11xFklxkNaFQ9rS6o+Lpc+ysQEcOJAvpTvDEFXtPmqyzSB9SiVL+5fGVP
	 xiydIj1Ldu4nKBMEXWhZWRQc6p0KCpYT2yo+RlE+AyUsSRojUQZ86IOal8ptA8k+JJ
	 KpSDmZoEk4+et4S/X/2XUQATfoc5CHNuc/YmowAuA7luiyaEwoeW2lzy18s+65PuA6
	 ceXqTbMNXD5e6UuCWhzLTwaLAEDivdMuHIhqV2DdZwzEduV+/obH0mZHyqwVDCX8++
	 1d+D2DsDELxUw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] i3c: master: amd: Add hot-join support
To: "Shubham Patil" <shubhamsanjay.patil@amd.com>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, conor+dt@kernel.org, Frank.Li@kernel.org, robh@kernel.org, linux-i3c@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20260908094257.3196120-4-shubhamsanjay.patil@amd.com>
References: <20260908094257.3196120-1-shubhamsanjay.patil@amd.com>
 <20260908094257.3196120-4-shubhamsanjay.patil@amd.com>
Date: Tue, 08 Sep 2026 09:55:28 +0000
Message-Id: <20260908095529.47D591F00A3D@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIEhvdC1Kb2luIEFDS3Mg
YXJlIG5vdCBzdXBwcmVzc2VkIGR1cmluZyBhY3RpdmUgdHJhbnNmZXJzLCB3aGljaCBjYW4gbGVh
ZCB0byBhYm9ydGVkIHRyYW5zZmVycy4KLS0KCmNvbW1pdCAzNThjNTQzMTE3OGY1MmM4YWE1MzY4
OWZjZjAzOTZiYzEyN2U5ZTA1CkF1dGhvcjogU2h1YmhhbSBQYXRpbCA8c2h1YmhhbXNhbmpheS5w
YXRpbEBhbWQuY29tPgoKaTNjOiBtYXN0ZXI6IGFtZDogQWRkIGhvdC1qb2luIHN1cHBvcnQKICAg
IApUaGlzIGNvbW1pdCBhZGRzIGhvdC1qb2luIHN1cHBvcnQgZm9yIHRoZSBBTUQgQVhJIEkzQyBt
YXN0ZXIgY29udHJvbGxlci4KSXQgaW50cm9kdWNlcyBhIHN5c2ZzIGVudHJ5IHRvIGVuYWJsZSBo
b3Qtam9pbiBhY2tub3dsZWRnbWVudHMgYW5kIGhhbmRzCmhvdC1qb2luIGV2ZW50cyB0byB0aGUg
aTNjIGNvcmUgZm9yIGRldmljZSBlbnVtZXJhdGlvbi4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
aTNjL21hc3Rlci9hbWQtaTNjLW1hc3Rlci5jIGIvZHJpdmVycy9pM2MvbWFzdGVyL2FtZC1pM2Mt
bWFzdGVyLmMKPiBpbmRleCA4YThhYjNjZDJmYTQwLi42MjE0ZmVmMTQwODFmIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvaTNjL21hc3Rlci9hbWQtaTNjLW1hc3Rlci5jCj4gKysrIGIvZHJpdmVycy9p
M2MvbWFzdGVyL2FtZC1pM2MtbWFzdGVyLmMKPiBAQCAtNTUsOSArNTUsMTEgQEAKPiAgI2RlZmlu
ZSBYSTNDX0NSX0VOX01BU0sJCQkJQklUKDApCS8qIENvcmUgRW5hYmxlICovCj4gICNkZWZpbmUg
WEkzQ19DUl9SRVNVTUVfTUFTSwkJCUJJVCgyKQkvKiBDb3JlIFJlc3VtZSAqLwo+ICAjZGVmaW5l
IFhJM0NfQ1JfSUJJX01BU0sJCQlCSVQoMykJLyogSUJJIEFDSyBlbmFibGUgKi8KPiArI2RlZmlu
ZSBYSTNDX0NSX0hKX01BU0sJCQkJQklUKDQpCS8qIEhvdC1Kb2luIEFDSyBlbmFibGUgKi8KCltT
ZXZlcml0eTogSGlnaF0KRG9lcyB0aGlzIHBhdGNoIGFsc28gbmVlZCB0byBzdXBwcmVzcyBIb3Qt
Sm9pbiBBQ0tzIGR1cmluZyBhY3RpdmUgdHJhbnNmZXJzPwoKTG9va2luZyBhdCB4aTNjX21hc3Rl
cl9zdXBwcmVzc19pYmlfZm9yX3hmZXIoKSwgaXQgc3VwcHJlc3NlcyBJQkkgQUNLcyB0bwpwcmV2
ZW50IHRoZSBjb250cm9sbGVyIGZyb20gQUNLaW5nIGFuIElCSSBhbmQgcHJlZW1wdGluZyB0aGUg
bWFzdGVyJ3MKdHJhbnNmZXI6CgoJY3IgPSBpb3JlYWQzMihtYXN0ZXItPm1lbWJhc2UgKyBYSTND
X0NSX09GRlNFVCk7CglpZiAoc3VwcHJlc3MgfHwgIW1hc3Rlci0+aWJpLmVuYWJsZWRfY291bnQp
CgkJY3IgJj0gflhJM0NfQ1JfSUJJX01BU0s7CgllbHNlCgkJY3IgfD0gWEkzQ19DUl9JQklfTUFT
SzsKCWlvd3JpdGUzMihjciwgbWFzdGVyLT5tZW1iYXNlICsgWEkzQ19DUl9PRkZTRVQpOwoKU2lu
Y2UgSG90LUpvaW5zIHVzZSB0aGUgc2FtZSBtYWNoaW5lcnksIGxlYXZpbmcgWEkzQ19DUl9ISl9N
QVNLIGVuYWJsZWQKZHVyaW5nIGEgdHJhbnNmZXIgYWxsb3dzIHRoZSBjb250cm9sbGVyIHRvIEFD
SyBhIEhvdC1Kb2luIHJlcXVlc3QKbWlkLXRyYW5zZmVyLiBDb3VsZCB0aGlzIGFib3J0IHRoZSBv
bmdvaW5nIHRyYW5zZmVyIGFuZCBwb3RlbnRpYWxseQpjb25mdXNlIHRoZSByZXNwb25zZSBGSUZP
IHN0YXRlPwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9w
YXRjaHNldC8yMDI2MDkwODA5NDI1Ny4zMTk2MTIwLTEtc2h1YmhhbXNhbmpheS5wYXRpbEBhbWQu
Y29tP3BhcnQ9MwoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1pM2MK
