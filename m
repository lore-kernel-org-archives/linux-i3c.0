Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E82C4451C
	for <linux-i3c@archiver.kernel.org>; Tue, 21 Jul 2026 04:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ms7N/GYKCbLHeFL6HccyLEf9sDZJ5b7mnYa0bimU8UU=; b=s3BLe6cymz7pxi
	1/fQEzmCzr0FnCgLUNmWdujnY0Zx8k5uda23eJqVt7d+3hxIBG+ksXAc6Ddu2+bf5GrjDbNmDaXK2
	zyJjrHZdgMtR89G38EZIG1t3Xe6tDMD80hfx0kuy4RekT5+TB6mkb+w/ZrC8frMZuHefGkfFgQvRd
	W+8C3VWMMRewfykrEnu2m4CMZNrouSul80Q4hAM8XcWSCDJ4gJH3qCiAgZCOpbbFIX4JAMeu8Or2I
	MiES53gsjzct1MmMiBPmqeGrY/Lk814lnKE86SV/xEAj7iUezDncfBlbD32BsRgBjRusCRGvwJnoN
	0s+cutphUwItvR5MMOKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm1tw-00000008N7y-2xiN;
	Tue, 21 Jul 2026 04:16:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm1tv-00000008N7m-1zxM
	for linux-i3c@lists.infradead.org;
	Tue, 21 Jul 2026 04:16:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9306140F4B;
	Tue, 21 Jul 2026 04:16:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 098A01F000E9;
	Tue, 21 Jul 2026 04:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784607374;
	bh=ZcbVNUy6bdPG2VBbKcu8MGYUrEFaPv6zYVkLsJGnjtk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bFnO/jO3M396EgAoVcY1O3pffiPxhM6tKOZ0ovG+20ZnUSWgBqPdbzv2C6Pj7+c80
	 Mbut6fh+KbmOWY7F9neYoBN0UBWlxRBwhyJeMy6+tM6EbbbzACfioNo6eX+uYKuynw
	 Kzlwnsk2LYpcgKvMEhZHMrVPPk2zU3BNnFL6df8Azq6y8WC8HueeI39DQGnb0dEDpC
	 XJyHx386iFf5l4d3PbmPTw8nbjhxKICM3UNUHaodrd2UHnWbTTGUzbHBbJ7OXy1N1s
	 mcjF89DoNzOrjTgjWoTEUl9J3IrFKcrJWH9M30fUVNs3GF5B0a6h4B4caPPw5TT+Lt
	 S9gVduqdv4r5w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 01/12] dt-bindings: i3c: Add mipi-i3c-static-method
 to support SETAASA
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Frank.Li@kernel.org
In-Reply-To: <20260721040805.1696503-2-akhilrajeev@nvidia.com>
References: <20260721040805.1696503-1-akhilrajeev@nvidia.com>
 <20260721040805.1696503-2-akhilrajeev@nvidia.com>
Date: Tue, 21 Jul 2026 04:16:13 +0000
Message-Id: <20260721041614.098A01F000E9@smtp.kernel.org>
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

PiBBZGQgdGhlICdtaXBpLWkzYy1zdGF0aWMtbWV0aG9kJyBwcm9wZXJ0eSBtZW50aW9uZWQgaW4g
dGhlIE1JUEkgSTNDCj4gRGlzY292ZXJ5IGFuZCBDb25maWd1cmF0aW9uIFNwZWNpZmljYXRpb24g
WzFdIHRvIHNwZWNpZnkgd2hpY2ggZGlzY292ZXJ5Cj4gbWV0aG9kIGFuIEkzQyBkZXZpY2Ugc3Vw
cG9ydHMgZHVyaW5nIGJ1cyBpbml0aWFsaXphdGlvbi4gVGhlIHByb3BlcnR5IGlzCj4gYSBiaXRt
YXAsIHdoZXJlIGEgYml0IHZhbHVlIG9mIDEgaW5kaWNhdGVzIHN1cHBvcnQgZm9yIHRoYXQgbWV0
aG9kLCBhbmQgMAo+IGluZGljYXRlcyBsYWNrIG9mIHN1cHBvcnQuCj4gCj4gQml0IDA6IFNFVERB
U0EgQ0NDIChEaXJlY3QpCj4gQml0IDE6IFNFVEFBU0EgQ0NDIChCcm9hZGNhc3QpCj4gQml0IDI6
IE90aGVyIENDQyAodmVuZG9yIC8gc3RhbmRhcmRzIGV4dGVuc2lvbikKPiBBbGwgb3RoZXIgYml0
cyBhcmUgcmVzZXJ2ZWQuCj4gCj4gSXQgaXMgc3BlY2lmaWNhbGx5IG5lZWRlZCB3aGVuIGFuIEkz
QyBkZXZpY2UgcmVxdWlyZXMgU0VUQUFTQSBmb3IgdGhlCj4gYWRkcmVzcyBhc3NpZ25tZW50LiBT
RVREQVNBIHdpbGwgYmUgc3VwcG9ydGVkIGJ5IGRlZmF1bHQgaWYgdGhpcyBwcm9wZXJ0eQo+IGlz
IGFic2VudCwgd2hpY2ggbWVhbnMgZm9yIG5vdyB0aGUgcHJvcGVydHkganVzdCBzZXJ2ZXMgYXMg
YSBmbGFnIHRvCj4gZW5hYmxlIFNFVEFBU0EsIGJ1dCBrZWVwIHRoZSBwcm9wZXJ0eSBhcyBhIGJp
dG1hcCB0byBhbGlnbiB3aXRoIHRoZQo+IHNwZWNpZmljYXRpb25zLgo+IAo+IFsxXSBodHRwczov
L3d3dy5taXBpLm9yZy9taXBpLWRpc2NvLWZvci1pM2MtZG93bmxvYWQKPiAKPiBSZXZpZXdlZC1i
eTogRnJhbmsgTGkgPEZyYW5rLkxpQG54cC5jb20+Cj4gUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5n
IChBcm0pIDxyb2JoQGtlcm5lbC5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogQWtoaWwgUiA8YWtoaWxy
YWplZXZAbnZpZGlhLmNvbT4KClNhc2hpa28gaGFzIHJldmlld2VkIHRoaXMgcGF0Y2ggYW5kIGZv
dW5kIG5vIGlzc3Vlcy4gSXQgbG9va3MgZ3JlYXQhCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcg
aHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNzIxMDQwODA1LjE2OTY1MDMtMS1h
a2hpbHJhamVldkBudmlkaWEuY29tP3BhcnQ9MQoKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0
CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
