Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E49C88E4D
	for <linux-i3c@archiver.kernel.org>; Fri, 11 Sep 2026 21:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h+4Y1T9mHzqjNfwxExeXFxauDKfnVq1M9qeuyH7WeBQ=; b=vvX51Vg/0/1zoB
	R+IZNrJkIDVPqGt6CE3Z6dwYS6ahUIl/oKYltTRMOBhLUEip6P/YGqIiDO4m7Zrr9f0v20tpticge
	ekTydhplkcxjlWShGZtqv2czJFATlyT267kJY5az7J7qiWe/kl3y4HYx23/4YuRKg0dyL9qlHF7XW
	usxKSOXClt/uU2f1TGteu3blFI/l0UoXghRrLtE0qRDmZzfiB2tsXRidztEJ8PwSdXrlUJ/sZimfv
	5GVM3b58BPPRvcnRg5+zOgXcVX6ebcnR96fPlqv2FfNy7K8R1jJD9nS9sG5cARXnxMY49JvToPcbr
	7+DWG1XPMgGX5XHNzmwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x58hw-00000000AZQ-2L9f;
	Fri, 11 Sep 2026 21:22:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x58hv-00000000AZI-0O0i
	for linux-i3c@lists.infradead.org;
	Fri, 11 Sep 2026 21:22:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5A9EF60008;
	Fri, 11 Sep 2026 21:22:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B286C1F000FF;
	Fri, 11 Sep 2026 21:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789161770;
	bh=5HYuMnis3/THr/ZbNC/W+jqPuftD5Ue57aaltbwx1ZM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n4zRhH3dtNLDCbV5G8TSi4kEA5xR8WLdKTZquDj26CvYfORW4MwdoYjCmEzqmtmon
	 yKz2/dWnOkB6MIRy9ifHL4IGvNVZHsarBGcpdmHW6ZKA7Q2ATBZbe96u0oEcXMLdmA
	 Cz2Ts2mOyoUTrEsKK2ZZvoI+J7mIUomx6UmC5LtN1l01Y+4tmWFrB2F9W91vT2A+eM
	 Ka5Nu3d2ibhunrq+0Tc1sN86sSQgP51fSoO+agvnhSfiE5uxOrfUjAxeUEeVe4Tqm1
	 /MZl25b4/rG7W2DPajf+QPuHnKAGcM22oDZCAUBXmQhzg76kGFPjY+bxbtGRfq5TeU
	 eteT6AfwZEN4g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] i3c: master: enable driver_override for I3C
To: "Meagan Lloyd" <meaganlloyd@linux.microsoft.com>
Cc: Frank.Li@kernel.org, linux-i3c@lists.infradead.org, linux-hwmon@vger.kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260911210935.1353126-2-meaganlloyd@linux.microsoft.com>
References: <20260911210935.1353126-1-meaganlloyd@linux.microsoft.com>
 <20260911210935.1353126-2-meaganlloyd@linux.microsoft.com>
Date: Fri, 11 Sep 2026 21:22:49 +0000
Message-Id: <20260911212249.B286C1F000FF@smtp.kernel.org>
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

PiBPcHQtaW4gdG8gZHJpdmVyX292ZXJyaWRlIHN5c2ZzIGZ1bmN0aW9uYWxpdHkgZm9yIEkzQyBz
dWJzeXN0ZW0uCj4gCj4gVXBkYXRlIHNvbWUgSTNDIGRyaXZlcnMgdGhhdCBhcmUgYXNzdW1pbmcg
dGhhdCBpZiB0aGVpciAucHJvYmUgaXMKPiBpbnZva2VkIHRoYXQgdGhlIGJ1cyBtYXRjaCBmdW5j
dGlvbiBhbHJlYWR5IGNoZWNrZWQgdGhlIElEIHRhYmxlLiBHbwo+IGFoZWFkIGFuZCB2ZXJpZnkg
aW4gLnByb2JlIHRoYXQgaTNjX2RldmljZV9tYXRjaF9pZCgpIHJldHVybnMgYSB2YWxpZAo+IG1h
dGNoIGJlZm9yZSB1c2luZyB0aGUgaTNjX2RldmljZV9pZCBwb2ludGVyLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IE1lYWdhbiBMbG95ZCA8bWVhZ2FubGxveWRAbGludXgubWljcm9zb2Z0LmNvbT4KClNh
c2hpa28gaGFzIHJldmlld2VkIHRoaXMgcGF0Y2ggYW5kIGZvdW5kIG5vIGlzc3Vlcy4gSXQgbG9v
a3MgZ3JlYXQhCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8j
L3BhdGNoc2V0LzIwMjYwOTExMjEwOTM1LjEzNTMxMjYtMS1tZWFnYW5sbG95ZEBsaW51eC5taWNy
b3NvZnQuY29tP3BhcnQ9MQoKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtaTNjCg==
