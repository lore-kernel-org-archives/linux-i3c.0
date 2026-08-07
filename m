Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E178EC5AC7A
	for <linux-i3c@archiver.kernel.org>; Fri,  7 Aug 2026 15:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pAIEUj9RZ4eWgS8r30F2wyrkaQzMDijKY+0/tLHYfHE=; b=4fEcgPTkcBiaRl
	kBFYHrpVwAe9WUAgL5QykoMxKBgX742sD8rWDPw+hO8EbiZhhOIRY7kdIq8s+B7MxV2oq5nm3zlKr
	As6yaPTu61w6HkOZf+om2YyTmr0w/FULBfnlWajfXK7QJDsHipig8K8XX3ahiOq535/Vxdv1fVQLI
	Pmh+sxpQaQtWpfAHzTCtj6y3Ze2ylyABS8ZJRrz+2ZMdDS0e1SYj4LwJgi7e6YZR7mVICGeYywTOi
	AxsAfmRCMkCgRX2q9nP5zlpf2k/1UyOZSvVSjhma02uQN2KUq5oiCjvw+F3aaF6S7NMPp5vTt0wZ6
	EZ0tMxyaSQf6gcdZMNeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMOA-00000008KWy-2jr5;
	Fri, 07 Aug 2026 15:21:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMO9-00000008KWp-2ieY
	for linux-i3c@lists.infradead.org;
	Fri, 07 Aug 2026 15:21:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3200E4325C;
	Fri,  7 Aug 2026 15:21:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C661E1F00A3A;
	Fri,  7 Aug 2026 15:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786116097;
	bh=HvfVx2px783ZK0zxIrZXbXck7O6Nyc6MDpDYDMfNcPM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gU3TFgOrXlcPIeUMQxlEsp+IDdIX4DN+oysi9xzBL0LXAWPDbpZGxEI2eOH3GoWzG
	 yuVjphiINBt/9Hk75w/gSb0aNuFho1K4UMWGRzD5xivmmAVfMnO4j8DGfls7HJL9Cq
	 5y/GjOwk4jsID94fz1ZJP2KZC4zOJa/mMTZGfIxn8i2U6Gq+Tw+OO34c62lllnMevR
	 9gdcXlxa8I2l4jmEPmVaEU+Qq3ZT6ZAUam2q+OS1fpXXIXHaEGb9tEUh8+xhHuoxZU
	 KViux5NJg4n0Yd65gCmcEzYVFTz+vz6A4LHt2OiJsy95go3f0DIWgPY8KSREmVPMmN
	 VWmMwF5YsQtsg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V5 06/14] i3c: master: Fix potential UAF in
 i3c_device_uevent()
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, Frank.Li@kernel.org, linux-i3c@lists.infradead.org, linux-pci@vger.kernel.org
In-Reply-To: <20260807145638.168865-7-adrian.hunter@intel.com>
References: <20260807145638.168865-1-adrian.hunter@intel.com>
 <20260807145638.168865-7-adrian.hunter@intel.com>
Date: Fri, 07 Aug 2026 15:21:35 +0000
Message-Id: <20260807152136.C661E1F00A3A@smtp.kernel.org>
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
dC8yMDI2MDgwNzE0NTYzOC4xNjg4NjUtMS1hZHJpYW4uaHVudGVyQGludGVsLmNvbT9wYXJ0PTYK
CgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
