Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C57CD484A
	for <linux-i3c@archiver.kernel.org>; Fri, 22 Sep 2023 17:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dubBRAH45wnlhi0EhGAnmc9vl6rth1QiZ6mgtbI74o8=; b=K8oyp98HxUK6+7
	1Vis0v4r4OM1Cm5TOhaxHgrLZEDuQs3J72L1hVoyjiOS11nVCOP8UJoWLevA85J5TO5hbO/ILm2Jp
	P0IgyxE3CBCxIDsBhp7SIg3LQ8RRoXLEyG+ozG36YKVDFxeBaRSMkEEQdBD8T8RX94E4UdVZDqlz0
	9+Iiq5s1rWRFmFP3raEOHDgXGLQModzsmCRKN49IGWVJcyQvTOZh7fukXbAuw4Hd4Z4JTtStT9Chh
	faoSTXSr8uxS4oyFHm+zikIz+DMz6ZegChvF5gWn1Bwx/XFpIQBcrithKEA1uob0x9V9mdFzuHdur
	qYh07GIijjRy6tVwwG2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjkNY-009Zqx-1X;
	Fri, 22 Sep 2023 17:55:48 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjkNV-009Zom-1w
	for linux-i3c@lists.infradead.org;
	Fri, 22 Sep 2023 17:55:47 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 76D0820008;
	Fri, 22 Sep 2023 17:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695405341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oCGVOgvY4s16fxeT66XA9Eh5rDl/9HDtlmqeH6RjkoU=;
	b=Y0LRVQDLcKtDrLDqeMHV0I1ZNxm+9zhyWjyvX375eWeEiVtm0HXDIM8ut4QJLyJLBpXfka
	32b9my3qGADpbERF9o+hkOvhW/E3A/Yi3TseGMlOMBBa7EFGBJhpBlEiG1Bdy1YSLIuckJ
	Tr5vva1tYdbcVQcTL/oGESCbOrKuY9wMptDbuKQh8MFB7L6XYYIhv5UlcuWabGjqMC2iEj
	/33Oo/gA6G2cEFLDvrPofAfgT0hE04e4+2DnHjUAKhgQufQE7CklUQLaOzAgAlu+UnA23i
	o1ONnbR2G4Be7ak2dHtQtHG/w37nsEQ2kb9f8KzL+shsZI515TDZvrp6gGljmA==
Date: Fri, 22 Sep 2023 19:55:37 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Kees Cook <keescook@chromium.org>
Cc: Conor Culhane <conor.culhane@silvaco.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] i3c: svc: Annotate struct svc_i3c_xfer with
 __counted_by
Message-ID: <20230922195537.2ed8c479@xps-13>
In-Reply-To: <20230922175023.work.239-kees@kernel.org>
References: <20230922175023.work.239-kees@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_105545_776877_58EDF796 
X-CRM114-Status: UNSURE (   7.10  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

SGksCgprZWVzY29va0BjaHJvbWl1bS5vcmcgd3JvdGUgb24gRnJpLCAyMiBTZXAgMjAyMyAxMDo1
MDoyMyAtMDcwMDoKCj4gUHJlcGFyZSBmb3IgdGhlIGNvbWluZyBpbXBsZW1lbnRhdGlvbiBieSBH
Q0MgYW5kIENsYW5nIG9mIHRoZSBfX2NvdW50ZWRfYnkKPiBhdHRyaWJ1dGUuIEZsZXhpYmxlIGFy
cmF5IG1lbWJlcnMgYW5ub3RhdGVkIHdpdGggX19jb3VudGVkX2J5IGNhbiBoYXZlCj4gdGhlaXIg
YWNjZXNzZXMgYm91bmRzLWNoZWNrZWQgYXQgcnVuLXRpbWUgY2hlY2tpbmcgdmlhIENPTkZJR19V
QlNBTl9CT1VORFMKPiAoZm9yIGFycmF5IGluZGV4aW5nKSBhbmQgQ09ORklHX0ZPUlRJRllfU09V
UkNFIChmb3Igc3RyY3B5L21lbWNweS1mYW1pbHkKPiBmdW5jdGlvbnMpLgo+IAo+IEFzIGZvdW5k
IHdpdGggQ29jY2luZWxsZVsxXSwgYWRkIF9fY291bnRlZF9ieSBmb3Igc3RydWN0IHN2Y19pM2Nf
eGZlci4KPiAKPiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL2tlZXMva2VybmVsLXRvb2xzL2Jsb2Iv
dHJ1bmsvY29jY2luZWxsZS9leGFtcGxlcy9jb3VudGVkX2J5LmNvY2NpCj4gCj4gQ2M6IE1pcXVl
bCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gQ2M6IENvbm9yIEN1bGhhbmUg
PGNvbm9yLmN1bGhhbmVAc2lsdmFjby5jb20+Cj4gQ2M6IEFsZXhhbmRyZSBCZWxsb25pIDxhbGV4
YW5kcmUuYmVsbG9uaUBib290bGluLmNvbT4KPiBDYzogbGludXgtaTNjQGxpc3RzLmluZnJhZGVh
ZC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4K
ClJldmlld2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoK
VGhhbmtzLApNaXF1w6hsCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWkzYwo=
