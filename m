Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E80C55822
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Aug 2026 15:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+qiJwhgyP5l9bxcLNFoqCZSVhySOdZ2DzHkIPixG0xU=; b=VMmdl18VAVbN6h
	yFpIm7TrLwup209322xuvdPgUN+/xPKGYkydyd3m1noWkonD4zEpakIiPcqReBJQwi1t8huOQ/7N5
	M70oVtJIPa4BwYAOoCk6rq1u41AB2/CKGpOXlFJtgBPZ/S7RsLHDALB3BkCETwZ+pCVCK4GrbL3p+
	2Ur6jtTkXUdryBEnjyZQjcABZ3BOK9Y8kLmuSErNONE4Tqb0eU87nADiiScqAcNx+W2mIq30YUwSv
	37u1retRA9QxsUueoQ8kUxG9RCSqHNAC06vY6A9VnDSSvq/hPPmQ1RjXV6ZO7vQG43HLL1kgtuERl
	qY4okj5v4UXjGFcOd2Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGkw-00000002Acp-2Ox3;
	Tue, 04 Aug 2026 15:08:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGku-00000002Abr-2vFS
	for linux-i3c@lists.infradead.org;
	Tue, 04 Aug 2026 15:08:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C103B60A73;
	Tue,  4 Aug 2026 15:08:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 360251F000E9;
	Tue,  4 Aug 2026 15:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785856115;
	bh=8jPyyIz75LTYLVO8IYLY2uPs1TjsKgJglknHvfkxIqE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LBJk3g18KmPmrgO/7sfIvemZbl5tJpHVoZ3jPETmmajsNFjBDHclz3V6XSqDkTBMA
	 K1ZC88+5HH0m1icy9u6GcQ2DFHrRXQSPhgq4NziKlGMBGV0QBNVC5VmWsXzjLm0BiX
	 BGLsdr5xba23isKRhYwc/4LkFmlQi9rqzhpQ9PpMrSXX6d9fCI6AfZzqX4ikKCCiGd
	 b1wXzQOg2cIZxWqvLq1/Qbq/7l6qCWdpMHJDPzOq6Z1FjLE/+CXUzqtvgJAGsH3IKA
	 hb2WCUz4X5IbNy5FTEVUaNlTteg+rrUco/2PWiXA4d6mDaJMhyP4aYKHLqylgCCzk4
	 42By/5OSscAqw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V3 06/14] i3c: master: Fix potential UAF in
 i3c_device_uevent()
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org, Frank.Li@kernel.org, linux-pci@vger.kernel.org
In-Reply-To: <20260804133810.184905-7-adrian.hunter@intel.com>
References: <20260804133810.184905-1-adrian.hunter@intel.com>
 <20260804133810.184905-7-adrian.hunter@intel.com>
Date: Tue, 04 Aug 2026 15:08:34 +0000
Message-Id: <20260804150835.360251F000E9@smtp.kernel.org>
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

PiBpM2NfZGV2aWNlX3VldmVudCgpIGRlcmVmZXJlbmNlcyBpM2NkZXYtPmRlc2Mgd2l0aG91dCBo
b2xkaW5nIHRoZSBidXMKPiBub3JtYWwtdXNlIGxvY2suICBTaW5jZSB0aGUgZGVzY3JpcHRvciBw
b2ludGVyIGNhbiBiZSByZXBsYWNlZAo+IGNvbmN1cnJlbnRseSwgaW5jbHVkaW5nIHdoZW4gYSB1
ZXZlbnQgaXMgZ2VuZXJhdGVkIGZyb20gc3lzZnMsIHRoaXMgY2FuCj4gcmVzdWx0IGluIGRlcmVm
ZXJlbmNpbmcgYSBzdGFsZSBkZXNjcmlwdG9yIGFuZCBsZWFkIHRvIGEgdXNlLWFmdGVyLWZyZWUu
Cj4gCj4gVXNlIGkzY19kZXZpY2VfZ2V0X2luZm8oKSBpbnN0ZWFkLCB3aGljaCBwcm90ZWN0cyBh
Y2Nlc3MgdG8gdGhlCj4gZGVzY3JpcHRvciB3aXRoIHRoZSBub3JtYWwtdXNlIGxvY2suCj4gCj4g
Q29tbWl0IDZjZjdiNjVmNzAyOSAoImkzYzogVXNlIGkzY2Rldi0+ZGVzYy0+aW5mbyBpbnN0ZWFk
IG9mIGNhbGxpbmcKPiBpM2NfZGV2aWNlX2dldF9pbmZvKCkgdG8gYXZvaWQgZGVhZGxvY2siKSBy
ZXBsYWNlZCB0aGUgYWNjZXNzb3Igd2l0aCBhCj4gZGlyZWN0IGRlc2NyaXB0b3IgZGVyZWZlcmVu
Y2UgYmVjYXVzZSBpM2NfZGV2aWNlX2dldF9pbmZvKCkgd291bGQKPiByZWN1cnNpdmVseSBhY3F1
aXJlIGJ1cy0+bG9jayBkdXJpbmcgZGV2aWNlIHJlZ2lzdHJhdGlvbi4KPiAKPiBUaGlzIGNoYW5n
ZSBkZXBlbmRzIG9uICJpM2M6IG1hc3RlcjogRml4IHJlY3Vyc2l2ZSBsb2NraW5nIGR1cmluZyBk
ZXZpY2UKPiByZWdpc3RyYXRpb24iLCB3aGljaCBtb3ZlcyBkZXZpY2UgcmVnaXN0cmF0aW9uIG91
dCBmcm9tIHVuZGVyIGJ1cy0+bG9jawo+IGFuZCByZW1vdmVzIHRoZSBwb3NzaWJpbGl0eSBvZiB0
aGF0IGRlYWRsb2NrLiAgV2l0aG91dCB0aGF0IGNoYW5nZSwKPiByZXN0b3JpbmcgdGhlIGkzY19k
ZXZpY2VfZ2V0X2luZm8oKSBjYWxsIHdvdWxkIHJlaW50cm9kdWNlIHRoZSBkZWFkbG9jay4KPiAK
PiBGaXhlczogNmNmN2I2NWY3MDI5ICgiaTNjOiBVc2UgaTNjZGV2LT5kZXNjLT5pbmZvIGluc3Rl
YWQgb2YgY2FsbGluZyBpM2NfZGV2aWNlX2dldF9pbmZvKCkgdG8gYXZvaWQgZGVhZGxvY2siKQo+
IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnICMgcmVxdWlyZXMgImkzYzogbWFzdGVyOiBGaXgg
cmVjdXJzaXZlIGxvY2tpbmcgZHVyaW5nIGRldmljZSByZWdpc3RyYXRpb24iCj4gU2lnbmVkLW9m
Zi1ieTogQWRyaWFuIEh1bnRlciA8YWRyaWFuLmh1bnRlckBpbnRlbC5jb20+CgpTYXNoaWtvIGhh
cyByZXZpZXdlZCB0aGlzIHBhdGNoIGFuZCBmb3VuZCBubyBpc3N1ZXMuIEl0IGxvb2tzIGdyZWF0
IQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNl
dC8yMDI2MDgwNDEzMzgxMC4xODQ5MDUtMS1hZHJpYW4uaHVudGVyQGludGVsLmNvbT9wYXJ0PTYK
CgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
