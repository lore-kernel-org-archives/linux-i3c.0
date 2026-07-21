Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D581C4451C
	for <linux-i3c@archiver.kernel.org>; Tue, 21 Jul 2026 04:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eAikl9AJCvi9NK70dI7TBK1JlS+EZNgBjqacB+q68qw=; b=BOfbaK9iyTLOc6
	TIWbtw4Gqt+1ga4wvh8uoOundJC6HcVzXy/wpM84d6IQJTOJS+SQK83lETuJ4rUajzlV2+3geXH5+
	3es8CQm8uCIPi12fFGDQzGiLFcPvIFACe1jTAnjMVOd2f08GRsl8jeXrENCXM1e7XBGroc410cVwG
	sh+BnFe9+2sthgkKNi7FyPMlsFkCf5yMlJQ44Qke/84SSnOFeFMIr8VX54g7mhZTJDLPOkF1iMWua
	p0txtxg69ka/fXCWxi21IQ3qEjUFKzj7LNiJ7k0y3PZpervRyd37qhRbpTb4eB0R52m+0fqCdEAK4
	v5BMGetFJC93BWrhp9XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm2CL-00000008O8f-3Dpi;
	Tue, 21 Jul 2026 04:35:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm2CK-00000008O8X-0r7X
	for linux-i3c@lists.infradead.org;
	Tue, 21 Jul 2026 04:35:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7708B60A7A;
	Tue, 21 Jul 2026 04:35:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B73AE1F000E9;
	Tue, 21 Jul 2026 04:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784608515;
	bh=FMehk5wCbL1iRb5X9b7BSoOkDg0AR3O9qECuG9IBz4w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=osmua9jgoxJ4ulMKauEn+AbAFLNFg6mI6t2pc4RBe1nkR8cbKJ4wOxCpm2xxOEUrC
	 snWMbwwgR/ewBqHQOafNxKR8pWuxhzqQ3UN4jyxlDw49+kKgFqhiJQMVrNfp/dIijj
	 T0kyLPf2VQPSAONCsnNx+6mVH62/NPtydnj736uCm6ZeXDV3C82eRKS/tyBcjnASFj
	 uqVzhNfX0Ixv2xHgmwz0FM+pjkCVJMEV+7k9DVqjCU6AHQW/KfWMEU9GAi5NQOdsdA
	 Sk7+PqYviiOFBVZyfRfbJY709NlqXkBaCS1/MzhAtr9LoqmPQzljQGnAQpguuJMChs
	 6cOpNmDPHtq1g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 11/12] hwmon: spd5118: Add I3C support
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, Frank.Li@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260721040805.1696503-12-akhilrajeev@nvidia.com>
References: <20260721040805.1696503-1-akhilrajeev@nvidia.com>
 <20260721040805.1696503-12-akhilrajeev@nvidia.com>
Date: Tue, 21 Jul 2026 04:35:14 +0000
Message-Id: <20260721043514.B73AE1F000E9@smtp.kernel.org>
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

PiBBZGQgYSByZWdtYXAgY29uZmlnIGFuZCBhIHByb2JlIGZ1bmN0aW9uIHRvIHN1cHBvcnQgSTND
LWJhc2VkCj4gY29tbXVuaWNhdGlvbiB3aXRoIFNQRDUxMTggZGV2aWNlcy4KPiAKPiBPbiBhbiBJ
M0MgYnVzLCBTUEQ1MTE4IGRldmljZXMgYXJlIGVudW1lcmF0ZWQgdmlhIFNFVEFBU0EgYW5kIGFs
d2F5cwo+IHJlcXVpcmUgYW4gQUNQSSBvciBkZXZpY2UgdHJlZSBlbnRyeS4gRGV2aWNlIG1hdGNo
aW5nIGlzIGhlbmNlIHRocm91Z2gKPiB0aGUgT0YgbWF0Y2ggdGFibGVzIG9ubHkgYW5kIGRvZXMg
bm90IG5lZWQgYW4gSTNDIGNsYXNzIG1hdGNoIHRhYmxlLiBUaGUKPiBkZXZpY2UgaWRlbnRpdHkg
aXMgdmVyaWZpZWQgaW4gdGhlIHR5cGUgcmVnaXN0ZXJzIGJlZm9yZSBwcm9jZWVkaW5nIHRvCj4g
dGhlIGNvbW1vbiBwcm9iZSBmdW5jdGlvbi4KPiAKPiBBY2tlZC1ieTogR3VlbnRlciBSb2VjayA8
bGludXhAcm9lY2stdXMubmV0Pgo+IFNpZ25lZC1vZmYtYnk6IEFraGlsIFIgPGFraGlscmFqZWV2
QG52aWRpYS5jb20+CgpTYXNoaWtvIGhhcyByZXZpZXdlZCB0aGlzIHBhdGNoIGFuZCBmb3VuZCBu
byBpc3N1ZXMuIEl0IGxvb2tzIGdyZWF0IQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBz
Oi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDcyMTA0MDgwNS4xNjk2NTAzLTEtYWtoaWxy
YWplZXZAbnZpZGlhLmNvbT9wYXJ0PTExCgoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGlu
dXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1pM2MK
