Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC50CD98E1
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Jun 2026 10:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8EabFayDbC9cpZF8FdyhKOz3WTHsWoNsN4XwYa43Xb4=; b=E/CZ8cqW82I9lY
	mJxcvg+BHkBy15OfAxrORiPRigsFoXNeoBSUbgMKtkzIYMyGG/PmTxzcOW/Vw4yR7Xu7XTI9p2W5W
	MyRLZJW5MNUYJRT9y8XXsT3yHTfq6lXacbuoGDcPDmLVTwARJa/rNvq7ndv0Am3xwmOILE8yk9jps
	LoBHK1WFjCcjITc/dRwpp8EkfZfEizYSoiPxwdaj5WHHeybMAYmvQbocRk+KMjbnwRKrKWYz0RWu4
	Glmy7pthNKjPs6b3lIDGXTx0OPmvlLKfNeRrNby0DQeUnlVcGuJWGh2dY0uPWPk+asbT3GqMZBfEL
	BpNtbinWpG0tgxWS8CZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZQjf-0000000FZcz-3app;
	Tue, 16 Jun 2026 10:09:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZQje-0000000FZbz-0QLb
	for linux-i3c@lists.infradead.org;
	Tue, 16 Jun 2026 10:09:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D9670408D5;
	Tue, 16 Jun 2026 10:09:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65F2A1F00AC4;
	Tue, 16 Jun 2026 10:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781604573;
	bh=uV6sAE5MuQDix+EpLcN3XDCl4e4foIl7MdMMFw97FlI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fIs+qIkcMXW73ccx0PiF4y356tMm+2Jtqg5b0CnhgmEaWzDn/sxJX8HutnflWBofx
	 Glu93jzgB0tlJz6CBWG+04o9BIh9uIm8DDI0P/BJpdJe6KsUTdBBRPW32J0KXg9ZIv
	 1kPU6xxt6UqqnLESZ278r1O5BP/IWpUk5h2vFTuFeaO7HlMKxLIJLstnYhM4Y+ulgo
	 tqep6Tiw+4eGo4RY8DQ6NqRPqv//JWQTVUS9Qg/PGT76FWaAeTUBBcAEIrl35LaLJ5
	 VY9OiK7Z/b9lXCkfgLKGH+3lsjz+i9gNju1lZTnIALNQGB24zhWB5k/H4lRyNXYKOS
	 U4I3BMZ1iRf7g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 10/12] hwmon: spd5118: Remove 16-bit addressing
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: devicetree@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org, linux-i3c@lists.infradead.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260616095429.3947205-11-akhilrajeev@nvidia.com>
References: <20260616095429.3947205-11-akhilrajeev@nvidia.com>
Date: Tue, 16 Jun 2026 10:09:32 +0000
Message-Id: <20260616100933.65F2A1F00AC4@smtp.kernel.org>
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
IHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA2MTYwOTU0Mjku
Mzk0NzIwNS0xLWFraGlscmFqZWV2QG52aWRpYS5jb20/cGFydD0xMAoKCi0tIApsaW51eC1pM2Mg
bWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
