Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B963AC54F4C
	for <linux-i3c@archiver.kernel.org>; Tue, 28 Jul 2026 07:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U9oTSHy4ZK2H/BER87oeUjzNh93pCOl8RnG3hrH27Wk=; b=PVdQeJ6SztKJVk
	I7s1pPFWeHJpQoVdPeBlfEIgiuj8kfqy5NLOZTTtfbsRdQsevCKOxqAQ2fbrIg1E1mZblr4XAlmp6
	eLlnCoCi+L/Ii26ij2MzrKXUIgBZ1Nt5JAgQjjqFXWecfvYewDPfUIcViqHPS7nX60zg4CMk8n74J
	+jgWHIdZQL38qqdhmfqr+G5jWenP1ACyHk7LXdwo0W7czv7p3MomlxPmXalbGDOOeI4fNtFc14Nj3
	TZPur5PRIr2bTGyWoKKIv+8en35ND/70QmkO+89JJnw3KFQGsiMViDE2EpugjnsJ41eOp4ElIZqg6
	Huu7yqa5EuyDBSJXBdog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woc5W-00000004cnc-1sZH;
	Tue, 28 Jul 2026 07:18:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woc5V-00000004cnF-0IIe
	for linux-i3c@lists.infradead.org;
	Tue, 28 Jul 2026 07:18:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3C6D660A62;
	Tue, 28 Jul 2026 07:18:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 805601F000E9;
	Tue, 28 Jul 2026 07:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785223131;
	bh=hX3FoODlklE4gbrjQhyVvWLr79cPx/v4Rq01LdYF73g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ltgW2sxLrLNjdRtAjedyhPa0Ll7yx4n8as8esqyC1/EPuMfwwy5yDksIXdNddgQhg
	 /KR/rsLdvG8sedhrmOdZ5HwsHKNKY6s/3rqQgS9UCAnLg/OlFAQYPikYluOwIyNgNz
	 4st0Le9/M6Ri7JVq7jx64asiJxIvjnLAwO1wambmqj4MMkd4BITr2hAnC9BQxvXVZN
	 8IihwVZpEMOqgUDfMOz194TX8qE8SAoj6JDD4BSjArKT6b9Uelcv1aq1ubdptpg3t6
	 Zh3tOeOoOTht89s32dFCdewh7uofEDi2tP/kaU57DQkDwdbqAiTwy5sTRiC5gho8RH
	 ZBjbkDU9oJUQA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 10/12] hwmon: spd5118: Remove 16-bit addressing
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Frank.Li@kernel.org
In-Reply-To: <20260728065955.809445-11-akhilrajeev@nvidia.com>
References: <20260728065955.809445-1-akhilrajeev@nvidia.com>
 <20260728065955.809445-11-akhilrajeev@nvidia.com>
Date: Tue, 28 Jul 2026 07:18:51 +0000
Message-Id: <20260728071851.805601F000E9@smtp.kernel.org>
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

PiBUaGUgaW50ZW50IG9mIGludHJvZHVjaW5nIDE2LWJpdCBhZGRyZXNzaW5nIHdhcyB0byBzdXBw
b3J0IEkzQywgYnV0IGl0Cj4gdHVybnMgb3V0IHRoYXQgSTNDIGRvZXMgbm90IHJlcXVpcmUgcmVh
ZGluZyB0aGUgTGVnYWN5IE1vZGUgcmVnaXN0ZXIsCj4gbm9yIGFueSBzcGVjaWZpYyBlbmNvZGlu
ZyBmb3IgcGFnZSB0cmFuc2xhdGlvbi4gVGhlIHRlc3Rpbmcgb2YgMTYtYml0Cj4gY29kZSB3YXMg
bGltaXRlZCBhbmQgdGhlcmUgYXJlIG5vIGtub3duIHVzZXJzIGZvciB0aGlzIGZlYXR1cmUuIFJl
bW92ZQo+IHRoZSBzZWN0aW9ucyB0aGF0IHN1cHBvcnQgMTYtYml0IGFkZHJlc3NpbmcgYW5kIHBy
ZXBhcmUgdGhlIGRyaXZlciB0bwo+IHN1cHBvcnQgSTNDIGFwcHJvcHJpYXRlbHkuCj4gCj4gU3Vn
Z2VzdGVkLWJ5OiBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+Cj4gQWNrZWQtYnk6
IEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNrLXVzLm5ldD4KPiBTaWduZWQtb2ZmLWJ5OiBBa2hp
bCBSIDxha2hpbHJhamVldkBudmlkaWEuY29tPgoKU2FzaGlrbyBoYXMgcmV2aWV3ZWQgdGhpcyBw
YXRjaCBhbmQgZm91bmQgbm8gaXNzdWVzLiBJdCBsb29rcyBncmVhdCEKCi0tIApTYXNoaWtvIEFJ
IHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA3MjgwNjU5NTUu
ODA5NDQ1LTEtYWtoaWxyYWplZXZAbnZpZGlhLmNvbT9wYXJ0PTEwCgoKLS0gCmxpbnV4LWkzYyBt
YWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
