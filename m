Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0EADC55184
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Aug 2026 14:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ry9MOKlh8wk7tWkz8wxF5ZR18p7rib5XtqPMXg7ZbVY=; b=jP7jGVh4EcwJDc
	Qe+6EpthuyaOekESgSyru9nzpborTS3bjjc+sBlSRi8YAOSqMHPIMTEUBjZ4C752rOeV2TqGEge7l
	rs2BQXDJUbvpHIXRtLHbSdbZrzlGuAJEOiOprZUOSnX2da6IloQBtrVKyxddsZZJinzWrIRnkt8W+
	izohV9VXpj1Lz3MIWAw2ek7GQp3HjSd9d6MYBQ0GgqmJMQfvQwPB4saa7IeWFthyhd4kBp6wTFBtc
	q5mUuSMAqjiDTwUELdQs5LxqZCIY8cW/UsI2l9FDyKEclypeke47u1a5pDKk5syX/D3S/V5AL7lmX
	Cxee4B9wtUSSv5U7aD9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFlp-000000020cf-1OAM;
	Tue, 04 Aug 2026 14:05:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFln-000000020az-3uIT
	for linux-i3c@lists.infradead.org;
	Tue, 04 Aug 2026 14:05:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 31FEB60A78;
	Tue,  4 Aug 2026 14:05:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED1121F000E9;
	Tue,  4 Aug 2026 14:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785852326;
	bh=KlHimyIqNW9qpPisieURF9kCwUKpm2byBfsHhwqj0pQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bcPvO/+3GC7NH2/ck+mxw/xTRnDTfU/Vcw5ze5H2qtRk8DRStl0ZcubeOAuKnjIyz
	 ITHRDUlKpKi4Eb9ubbM1otSqwVLLgPYziyBrED0GVp8ylrzdsft6ZNa8zVVzJjCTNQ
	 lWnmFS1G26mhVLqbvRRvDivC3cbxrx+4McxmQHqOKCLD/GXCIl/XZdsWqFUbxucYXW
	 och+ldl4WjjMZ4hLjQ+YpOROkWEDUOn8cVfZXm9ou60AQyeJzJrsd52xsnMgvdSnN/
	 YCZbiOdP7nlYDyz8Mfux5QpLPZUfssTyQ2vrJwC3JQ1kjdO6mCxSCsgdCzJroUGaK8
	 WgBW3xysxGXDg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V3 08/14] i3c: master: Support IBI-based wakeup
 capability
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: linux-i3c@lists.infradead.org, linux-pci@vger.kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Frank.Li@kernel.org
In-Reply-To: <20260804133810.184905-9-adrian.hunter@intel.com>
References: <20260804133810.184905-1-adrian.hunter@intel.com>
 <20260804133810.184905-9-adrian.hunter@intel.com>
Date: Tue, 04 Aug 2026 14:05:25 +0000
Message-Id: <20260804140525.ED1121F000E9@smtp.kernel.org>
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

PiBBbiBJM0MgY29udHJvbGxlciBhY3RzIGFzIGEgYnVzIGNvbnRyb2xsZXIgZm9yIG9uZSBvciBt
b3JlIEkzQyBkZXZpY2VzLgo+IElmIHRoZSBjb250cm9sbGVyIGNhbiB3YWtlIHRoZSBzeXN0ZW0g
aW4gcmVzcG9uc2UgdG8gYW4gSW4tQmFuZAo+IEludGVycnVwdCAoSUJJKSwgdGhlbiBhbnkgZGV2
aWNlIG9uIHRoYXQgYnVzIHRoYXQgaXMgY2FwYWJsZSBvZgo+IGdlbmVyYXRpbmcgSUJJcyBjYW4g
cG90ZW50aWFsbHkgYmUgdXNlZCBhcyBhIHdha2V1cCBzb3VyY2UuCj4gCj4gQWRkIGFuIGliaV93
YWtldXAgZmxhZyB0byBzdHJ1Y3QgaTNjX21hc3Rlcl9jb250cm9sbGVyIHNvIGNvbnRyb2xsZXIK
PiBkcml2ZXJzIGNhbiBhZHZlcnRpc2Ugc3VwcG9ydCBmb3IgSUJJLWJhc2VkIHdha2V1cC4KPiAK
PiBJZiBzZXQsIG1hcmsgSUJJLWNhcGFibGUgSTNDIGRldmljZXMgYXMgd2FrZXVwIGNhcGFibGUg
d2hlbiB0aGV5IGFyZQo+IHJlZ2lzdGVyZWQsIGFsbG93aW5nIHdha2V1cCBtYW5hZ2VtZW50IHRo
cm91Z2ggdGhlIHN0YW5kYXJkIGRldmljZQo+IHdha2V1cCBmcmFtZXdvcmsuCj4gCj4gU2lnbmVk
LW9mZi1ieTogQWRyaWFuIEh1bnRlciA8YWRyaWFuLmh1bnRlckBpbnRlbC5jb20+CgpTYXNoaWtv
IGhhcyByZXZpZXdlZCB0aGlzIHBhdGNoIGFuZCBmb3VuZCBubyBpc3N1ZXMuIEl0IGxvb2tzIGdy
ZWF0IQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRj
aHNldC8yMDI2MDgwNDEzMzgxMC4xODQ5MDUtMS1hZHJpYW4uaHVudGVyQGludGVsLmNvbT9wYXJ0
PTgKCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkz
Ywo=
