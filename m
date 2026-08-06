Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE4DDC55ABF
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Aug 2026 13:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I606fb87/GoUcOkI4dsVLBHlPfYdh3w187K+PNUEyJ8=; b=M8XpevPU4Z3c7i
	Z70qv0voBg4MK15JvnQfSpJRHLNVqfeveAbSXcEoModtjtixJq5pjFMX9VNtiuTUXTq3qDVmW04cU
	7aNS0LAIuCr+Vs6bLBvmwMH8Iq0xuOgthnpN545ggEqpfIthmoMlvKbfwlJZnbu+fWwIawuozylpj
	vXC7IZyoKV6Jv2+rtoQ4dxgJnDm6sQlUdgvsFNfBDa49BZ9TMKkaa4R/EYFCvTjXqJm/5SXiEE5sK
	tArhSoCTTBMbc+iMhZhDO6rZOR+qjla+xrPI/6MEmKEmMTsRZuj9pFY+fM3qInvPfihWhv2RFD0DI
	AaLj0JK71J0+lYsu/acw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wryJ4-00000005vPu-1mV3;
	Thu, 06 Aug 2026 13:38:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wryJ3-00000005vPo-1rlG
	for linux-i3c@lists.infradead.org;
	Thu, 06 Aug 2026 13:38:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6DD6A60A5C;
	Thu,  6 Aug 2026 13:38:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D71761F000E9;
	Thu,  6 Aug 2026 13:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786023524;
	bh=rwexFvcO8J6HlOD2oYnykRyYcs8hO7xAMMpF1P8eSno=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kfwBdexZm06vgrXzI3Ks1auLWz3XFCzrvLEzItJK3l0XLhJ1aksR566uBgGxaPM/I
	 w52IxIqzO4JMxMRxtRkch4usouBzAB0o6s2fKhSz1pk8boL71yCX69nhOvWeSRUjSU
	 VRCWFgOCQucg7ghZvAB2rgsonSCjpVRAPFmnHHlhXtca9qClfy+CoGOzYHr+dH2Km2
	 4FsncaXt3dmMlZ+gumdiCmwRgzGtjB2RPiSu3c6HP7LzvSzj0Sp1TEsnAEH7mle75+
	 8hu16vbN3TZh9MoAYeRkNwQ/QTcMd9qJutENk2WXwz2KBxc6cRsjffSC/tiljTa0R0
	 rPP6fh+7e2iCQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V4 02/14] i3c: Fix unlocked dereference of dev->desc in
 i3c_device_get_supported_xfer_mode()
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, linux-pci@vger.kernel.org, Frank.Li@kernel.org, linux-i3c@lists.infradead.org
In-Reply-To: <20260806131857.119830-3-adrian.hunter@intel.com>
References: <20260806131857.119830-1-adrian.hunter@intel.com>
 <20260806131857.119830-3-adrian.hunter@intel.com>
Date: Thu, 06 Aug 2026 13:38:43 +0000
Message-Id: <20260806133843.D71761F000E9@smtp.kernel.org>
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

PiBpM2NfZGV2aWNlX2dldF9zdXBwb3J0ZWRfeGZlcl9tb2RlKCkgdXNlcyBkZXYtPmRlc2MgdG8g
b2J0YWluIHRoZQo+IG1hc3RlciBjb250cm9sbGVyLiAgSG93ZXZlciwgZGV2LT5kZXNjIG11c3Qg
bm90IGJlIGRlcmVmZXJlbmNlZCB1bmxlc3MKPiBidXMtPmxvY2sgaXMgaGVsZCwgYW5kIHRoaXMg
ZnVuY3Rpb24gZG9lcyBub3QgdGFrZSB0aGF0IGxvY2suCj4gCj4gVGhlIGZ1bmN0aW9uIG9ubHkg
bmVlZHMgYWNjZXNzIHRvIHRoZSBtYXN0ZXIgY29udHJvbGxlciBhc3NvY2lhdGVkIHdpdGgKPiB0
aGUgZGV2aWNlJ3MgYnVzLiAgVXNlIGRldi0+YnVzIGluc3RlYWQsIHdoaWNoIGlzIGFsd2F5cyB2
YWxpZCBmb3IgdGhlCj4gbGlmZXRpbWUgb2YgdGhlIGRldmljZSBhbmQgZG9lcyBub3QgcmVxdWly
ZSBkZXJlZmVyZW5jaW5nIGRldi0+ZGVzYy4KPiAKPiBGaXhlczogMjU2YTIxNzQzZDkxICgiaTNj
OiBBZGQgSERSIEFQSSBzdXBwb3J0IikKPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IFNp
Z25lZC1vZmYtYnk6IEFkcmlhbiBIdW50ZXIgPGFkcmlhbi5odW50ZXJAaW50ZWwuY29tPgoKU2Fz
aGlrbyBoYXMgcmV2aWV3ZWQgdGhpcyBwYXRjaCBhbmQgZm91bmQgbm8gaXNzdWVzLiBJdCBsb29r
cyBncmVhdCEKCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMv
cGF0Y2hzZXQvMjAyNjA4MDYxMzE4NTcuMTE5ODMwLTEtYWRyaWFuLmh1bnRlckBpbnRlbC5jb20/
cGFydD0yCgoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1pM2MK
