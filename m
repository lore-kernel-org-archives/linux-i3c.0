Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70562C53219
	for <linux-i3c@archiver.kernel.org>; Tue, 28 Jul 2026 07:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/V3dqBO24xAJrfL58AD4cD+iT988WbiFBlHjJ+gSv/s=; b=SJW/K5IKmItbew
	Y6qJh3tRf/kLUWqazl/g3Xe0pAdm9YjHiTaxwrlgB4D+kI63L+7OOW2JPDmksnU+wirA1MAuYvv30
	8a0Ly3l27UUP72pkW/jVudzZ7bOWID14qpJuacGBIhBcHojsjfgzu18x4XCUVqGC01UX//pA43edt
	1abOtVudrOPSzz2JGCNWWsu58XUfiROSZHFSqpSec0OCnidnPtHRIr2cmfBxpZLPgLg7qj6Fjmd/B
	ZIo7pCsUUwdpQ/5HMasdrt2s9s2zGd1P6ukDIxXFanAI7mZCKNwutXpb7mvGwyOUwVD0WOfFPuHDr
	/NeUdk1dTHn8X4rvafzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wocJ7-00000004dm6-032U;
	Tue, 28 Jul 2026 07:32:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wocJ5-00000004dly-3MO3
	for linux-i3c@lists.infradead.org;
	Tue, 28 Jul 2026 07:32:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D146160A72;
	Tue, 28 Jul 2026 07:32:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20D781F000E9;
	Tue, 28 Jul 2026 07:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785223974;
	bh=Tr1yk5M/1ibVUSlaQQlbBDhATqYoOLL3gJFQ801csDc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hM/7tnj/2FNoT+jLg+RIGOejkPQH5m44Qws6XLmtMLE5pgNoyrO7x5Jmmma8aQDHe
	 osk1NNL0xsGJ+5gb8TnAWn4D3AxtvaUQt+3GPqFD2JnMMwH7DF1DVVIIpYJnZi2nRH
	 hGOk5uRhh5zwhRS3AcA2rzrWsGbdPcK4BcPaWlyxUWiDN+uMKKNJFewzje7JKBYjlT
	 8ET36qExiOGoTfY0ANJCYCrF2bT7qPaJy8D/oj2ZU92hry/b7HbiYv+xTjR6u7gQO+
	 FgK72yKh1tGWucTKvvOrVMWyZHMhAHzMFFkr9J6M52Axux3Z95Xq8f+3ZdWjIzHLR4
	 CmyMDjZQQjZgw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 11/12] hwmon: spd5118: Add I3C support
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, Frank.Li@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org
In-Reply-To: <20260728065955.809445-12-akhilrajeev@nvidia.com>
References: <20260728065955.809445-1-akhilrajeev@nvidia.com>
 <20260728065955.809445-12-akhilrajeev@nvidia.com>
Date: Tue, 28 Jul 2026 07:32:53 +0000
Message-Id: <20260728073254.20D781F000E9@smtp.kernel.org>
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
Oi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDcyODA2NTk1NS44MDk0NDUtMS1ha2hpbHJh
amVldkBudmlkaWEuY29tP3BhcnQ9MTEKCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51
eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
