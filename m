Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE9FC5DF97
	for <linux-i3c@archiver.kernel.org>; Wed, 26 Aug 2026 10:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MVfJXOefugtC2JlYa7EdVTYbNcwo9ernb60s/4H72BI=; b=i+3AzMbozJ0EvY
	X0+ddiiPEKX/BpFpxhl6wcNpB4Mh9BARxunTiaMy5p6ryVkKu2n0VExkZfwHMCmezR0B+u0oItgxk
	zgMskRdcEuS1P0ARTw/KdOElgkmJmRzl/xTejs2Jx5XW0GJb+AOGlY52Dj0zSr5uGgnRSEVywLhlk
	DyoEpnFAlon143OvLYrDqYkwITP5F3gqeaPFL3ZT27HPfMtxQ0c/j7dat1d6OmqDSwWbk3EeL7oFk
	zX/H0wIdZU5z7c4N64CfRRzGy/jxpQQ7MOwQ8Kb8BNxnXZVIP5rK7o566g3dQCIygY7HjmdZSmVEh
	TiE2tyj7aRQGBiHO5Gkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzBBU-00000002JnY-3Z1s;
	Wed, 26 Aug 2026 10:48:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzBBT-00000002JnQ-16GZ
	for linux-i3c@lists.infradead.org;
	Wed, 26 Aug 2026 10:48:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A269E4401C;
	Wed, 26 Aug 2026 10:48:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36E8A1F00A3A;
	Wed, 26 Aug 2026 10:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787741322;
	bh=7+Nit2vONnXM3RV+nM1TrimxvDI5VQnjHLPfDm5U6Lg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QBQEpieo+jG9Cm21vjjK0+RigO8esQlwhCmDkuuFLpg3dgESeEKgYp50gcIgzo9xF
	 S3vwss8z5Z3yGz7ZiGjvFvxkwrpEGMmJSHXDBfo98Di0BykyY27+mEwwrZYhw3Du/E
	 P7vxZhc4aleL9NY3XcIxbXtkCZ3S6xN9lSlp/ub/tnoIa1y6cxJss0p0VjeUo5hBKL
	 FV0J2J/GX+AxRf0U3kuXYigE//UCmTKO/70oX4MFEEpNG1GgNOn5D1tC1bsJqBP4XJ
	 0OXp0eqKmXDBCdrhBAuW8V/71GTkQ4+O3p7+rTdVuD2RcsY5BMtRNuLTWqWndJiLAO
	 OPVIyvaiEVk9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 5/8] regulator: p3h2x4x: Add driver for on-die
 regulators in NXP P3H2x4x i3c hub
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: linux-i3c@lists.infradead.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260826103819.1614843-6-lakshay.piplani@nxp.com>
References: <20260826103819.1614843-1-lakshay.piplani@nxp.com>
 <20260826103819.1614843-6-lakshay.piplani@nxp.com>
Date: Wed, 26 Aug 2026 10:48:41 +0000
Message-Id: <20260826104842.36E8A1F00A3A@smtp.kernel.org>
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

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gRHJpdmVyLXNwZWNpZmlj
IGhlYWRlciBmaWxlIGlzIGluY29ycmVjdGx5IHBsYWNlZCBpbiB0aGUgZ2xvYmFsIGluY2x1ZGUv
bGludXgvbWZkLyBkaXJlY3RvcnkuCi0tCgpjb21taXQgZjAzNTZkNzc4OTg1YjM2Mjc4M2Y5NWVj
ZDM5NGMxNjYwOThlNWMzMQpBdXRob3I6IEFtYW4gS3VtYXIgUGFuZGV5IDxhbWFuLmt1bWFycGFu
ZGV5QG54cC5jb20+CgpyZWd1bGF0b3I6IHAzaDJ4NHg6IEFkZCBkcml2ZXIgZm9yIG9uLWRpZSBy
ZWd1bGF0b3JzIGluIE5YUCBQM0gyeDR4IGkzYyBodWIKClRoaXMgY29tbWl0IGludHJvZHVjZXMg
YSBkcml2ZXIgZm9yIHRoZSBvbi1kaWUgcmVndWxhdG9ycyBvZiB0aGUgTlhQIFAzSDJ4NHgKaTNj
IGh1YiBmYW1pbHkuIEl0IHJlZ2lzdGVycyB0aGUgcmVndWxhdG9ycyB2aWEgdGhlIE1GRCBmcmFt
ZXdvcmsgYW5kIGV4cG9zZXMKdGhlbSB0byB0aGUgcmVndWxhdG9yIHN1YnN5c3RlbS4KCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvcmVndWxhdG9yL3AzaDI4NDBfaTNjX2h1Yl9yZWd1bGF0b3IuYyBi
L2RyaXZlcnMvcmVndWxhdG9yL3AzaDI4NDBfaTNjX2h1Yl9yZWd1bGF0b3IuYwo+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2RyaXZlcnMvcmVndWxhdG9yL3Az
aDI4NDBfaTNjX2h1Yl9yZWd1bGF0b3IuYwo+IEBAIC0wLDAgKzEsMjg0IEBACj4gKy8vIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4gKy8qCj4gKyAqIENvcHlyaWdodCAyMDI1LTIw
MjYgTlhQCj4gKyAqIE5YUCBQM0gyWDRYIHJlZ3VsYXRvciBkcml2ZXIgZmlsZSBjb250YWluIGZ1
bmN0aW9ucyBmb3IgZW5hYmxlL2Rpc2FibGUgcmVndWxhdG9yCj4gKyAqIGFuZCB2b2x0YWdlIHNl
dC9nZXQuCj4gKyAqLwo+ICsjaW5jbHVkZSA8bGludXgvYml0ZmllbGQuaD4KPiArI2luY2x1ZGUg
PGxpbnV4L2NsZWFudXAuaD4KPiArI2luY2x1ZGUgPGxpbnV4L21mZC9wM2gyODQwLmg+CgpbU2V2
ZXJpdHk6IExvd10KRG9lcyB0aGlzIGRyaXZlci1zcGVjaWZpYyBoZWFkZXIgbmVlZCB0byBiZSBw
bGFjZWQgaW4gdGhlIGdsb2JhbAppbmNsdWRlL2xpbnV4L21mZC8gZGlyZWN0b3J5PyAKCkFjY29y
ZGluZyB0byBNRkQgc3Vic3lzdGVtIGd1aWRlbGluZXMsIGRyaXZlci1zcGVjaWZpYyBoZWFkZXIg
ZmlsZXMgdGhhdCBhcmUKb25seSB1c2VkIGJ5IHRoZSBwYXJlbnQgYW5kIGl0cyBpbW1lZGlhdGUg
Y2hpbGRyZW4gc2hvdWxkIGJlIGtlcHQgbG9jYWwgdG8KZHJpdmVycy9tZmQvIHJhdGhlciB0aGFu
IGNsdXR0ZXJpbmcgdGhlIGdsb2JhbCBpbmNsdWRlIHNwYWNlLiBUaGUgY29tbWl0Cm1lc3NhZ2Ug
ZXhwbGljaXRseSBub3RlcyB0aGF0IHRoaXMgaGVhZGVyIGlzICJ1c2VkIG9ubHkgYnkgdGhlIHBh
cmVudCBhbmQKaXRzIGNoaWxkcmVuIi4KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczov
L3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA4MjYxMDM4MTkuMTYxNDg0My0xLWxha3NoYXku
cGlwbGFuaUBueHAuY29tP3BhcnQ9NQoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgt
aTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1pM2MK
