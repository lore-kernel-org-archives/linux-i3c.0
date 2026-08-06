Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77AEC56208
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Aug 2026 13:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jvOuEbJr6Cj7wESDEyzrXoNVXb2AWICbO+MrcCqtb/c=; b=qWQFccfahGt3vT
	txLsryU34Y1ouC3YR05cdoE2wwdjGO9pRi73Bm1plvBSjiZq6eH7DhTlnH2Ut0mkXdFQmZEZGVL82
	51wBQx2w26YT2Vu7OVLyxbesowjo/3msB1l5vKbT7BAW1+ciOYTMrGmGVArC/qW5T/bw8QjtkZuiE
	hdn8TDqVJJHeKSfu8ULZLqPK41A3fNEUucWQtAqt7BQPb8TYiDZKvMkkRH/aSP/6XF/6f7DY+vG42
	wDYDVH82pKgPnokYP7dOzA4RD9QKl5bjM2jKKw6Sklo/6EkFZkzccWx9igjsKrxgcqx71x6TJ5jjk
	8lF3GyuN0jGtE313QX3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wryC2-00000005ufC-2NqW;
	Thu, 06 Aug 2026 13:31:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wryC0-00000005uel-4941
	for linux-i3c@lists.infradead.org;
	Thu, 06 Aug 2026 13:31:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A534B434AF;
	Thu,  6 Aug 2026 13:31:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 458541F000E9;
	Thu,  6 Aug 2026 13:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786023088;
	bh=F2bGzsTwxXraXgdiLuNA6h08iZhfdksrdlgiZdvZfJg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m1Qx6a/txv4wXTrNCTkc+eftwWDpTHUN4adAuzihpKgV44ouz289P5VNPUP3w26FM
	 Fuv6emMhf3aJfVDLHP9jZD4JJkMRPLXouNEwDazC/Oq2UcFcjFDcIOwFo5bvy5bMV5
	 7OIlduRUu2WIXXDaC0B7QlZ5hKaioP79Jxhs8iMdptlZFrBi3KJPeBfnWH5Xey0N82
	 qjggImB9vVwb7Hdl6oOoD7nYDuaIs/5uowB6PwUas/wFdR29+SDFKgoNNRf2IZrZLD
	 5SwZkoowd35oL5tnS3f+Ne5VJDs2QulVpJlRBVf6CmQPoHo5u3C0wB6ESNFy9vf8mF
	 0jAjFMs96SDvw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V4 08/14] i3c: master: Support IBI-based wakeup
 capability
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: linux-i3c@lists.infradead.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, Frank.Li@kernel.org, linux-pci@vger.kernel.org
In-Reply-To: <20260806131857.119830-9-adrian.hunter@intel.com>
References: <20260806131857.119830-1-adrian.hunter@intel.com>
 <20260806131857.119830-9-adrian.hunter@intel.com>
Date: Thu, 06 Aug 2026 13:31:27 +0000
Message-Id: <20260806133128.458541F000E9@smtp.kernel.org>
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
aHNldC8yMDI2MDgwNjEzMTg1Ny4xMTk4MzAtMS1hZHJpYW4uaHVudGVyQGludGVsLmNvbT9wYXJ0
PTgKCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkz
Ywo=
