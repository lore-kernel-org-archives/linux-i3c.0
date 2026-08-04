Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62CBFC55184
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Aug 2026 13:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3yETIAYk+5iqQSLdjfXBpNfZInxIrKRJl7siyF/sPX4=; b=qQlNeu0r+WQttT
	ySQqcqIw1k8Hec/HWwjyB8+jj3AHG2qM9hMeVFhoSISNgZ/8l4F8aD52BXLVRYbIYt3rNhjJ7Gmnh
	tPy1IQoolXDocYAJv+PisxxkRJD/qUP6d2y5TNlTSzQMZOWwnhF5ccsZW6UKjdwffSjlsSV7VYXuI
	kT30To8hc2EWsx2hs+rpmLlZcgm7NIK2/g4nKNlwZmop+FYaWmjFEyD3cxypbu2hvBYefrZ0anrlI
	C7FZMKNcgZcz7zH6x49zOX2QFojzR+FEvLJGkVRhAVo5IClTqYi9xiLl58ABzQPDJiwHgyjgj0Izo
	KN6j0ieYACMBDtehLuJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFaT-00000001ydl-0QIg;
	Tue, 04 Aug 2026 13:53:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFaS-00000001ydQ-2SQ8
	for linux-i3c@lists.infradead.org;
	Tue, 04 Aug 2026 13:53:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DD86260A78;
	Tue,  4 Aug 2026 13:53:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A0B31F000E9;
	Tue,  4 Aug 2026 13:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785851623;
	bh=x4PQVs4XOHErmYmftuQgFrIbGKM+Li97RwpTz/Vkfcs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HmFRdMEg+Av6gL2xj+f1MdGeR9lgSDq2hZMgrkRn1wgN52K2382UoglWgeXgcOBq/
	 NqGSVX1t1yN4YqExHgYBdtfW1EoeK7rbC5XO8QxoKzsBu/CIOQPccal7s8oROomuzT
	 nOH++oR8Ql8ZBOraDH94LIcw6IRD4FpbG7yClJ3VleNhneOQPXqjnhEZdxDID9gXt3
	 Zi/mMGqgvit3WW3NRW2vFEdL6wn6s8l9c5pIFcoZi7xV+KiMTe64HYAVEpEWsulKrY
	 AY79GSivxDbS8lFNhw/jA+D1r8iN5+SNopmRFylkwpNZQ1yC/Yz1QKMYrewI9q/VVx
	 +Pn7ea8CH23cQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V3 10/14] i3c: master: Add helper to query bus wakeup
 requirements
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: linux-pci@vger.kernel.org, linux-i3c@lists.infradead.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Frank.Li@kernel.org
In-Reply-To: <20260804133810.184905-11-adrian.hunter@intel.com>
References: <20260804133810.184905-1-adrian.hunter@intel.com>
 <20260804133810.184905-11-adrian.hunter@intel.com>
Date: Tue, 04 Aug 2026 13:53:42 +0000
Message-Id: <20260804135343.4A0B31F000E9@smtp.kernel.org>
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

PiBBZGQgaTNjX21hc3Rlcl9hbnlfd2FrZXVwX2VuYWJsZWQoKSwgd2hpY2ggaXRlcmF0ZXMgb3Zl
ciB0aGUgZGV2aWNlcyBvbgo+IGFuIEkzQyBidXMgYW5kIHJlcG9ydHMgd2hldGhlciBhbnkgb2Yg
dGhlbSBhcmUgZW5hYmxlZCBmb3Igc3lzdGVtCj4gd2FrZXVwIGFuZCBoYXZlIElCSSBlbmFibGVk
Lgo+IAo+IENvbnRyb2xsZXIgZHJpdmVycyBjYW4gdXNlIHRoaXMgaGVscGVyIHRvIGRldGVybWlu
ZSB3aGV0aGVyIHdha2V1cAo+IHN1cHBvcnQgbXVzdCByZW1haW4gYXZhaWxhYmxlIHdoaWxlIHRo
ZSBzeXN0ZW0gaXMgc3VzcGVuZGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFkcmlhbiBIdW50ZXIg
PGFkcmlhbi5odW50ZXJAaW50ZWwuY29tPgoKU2FzaGlrbyBoYXMgcmV2aWV3ZWQgdGhpcyBwYXRj
aCBhbmQgZm91bmQgbm8gaXNzdWVzLiBJdCBsb29rcyBncmVhdCEKCi0tIApTYXNoaWtvIEFJIHJl
dmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA4MDQxMzM4MTAuMTg0
OTA1LTEtYWRyaWFuLmh1bnRlckBpbnRlbC5jb20/cGFydD0xMAoKCi0tIApsaW51eC1pM2MgbWFp
bGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
