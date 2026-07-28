Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F36C53219
	for <linux-i3c@archiver.kernel.org>; Tue, 28 Jul 2026 07:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TwDkPEJDlzCHEJ2UVY1gkRE7PX9I3/hXjru6Xy0ZPoI=; b=APfzB8gme2nxky
	uEJIdwJgcln9alw+sTgXBbJafBSItt4MaVyOSPzSy3J0GRqohuqUGdBbRtVwDANVgDjMR1+acq2LS
	5+BTZdTLvmEr6QfHDXRLaTtLib5HoYKr/n8PbWvQjoJB/Q7TENgnQiglBRcIvXMdZdZZBuz2s+5Wy
	iesORvVQ1KG4SKmjZa9wgsbf6S0NXmktlL/XzjNsYFvYpIc+PowaURTgIN70EVaDreyGuqkFt2QSX
	/eAIJhFUlRJ2imOhbdpgqQ6mVeHqPhxzhbbjzaCEu+FpuwtPmT2fg3accQITvzN6C682u0wGOUWjn
	WHJzoWLs52meh/KvHrTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woc1h-00000004cQC-07Dg;
	Tue, 28 Jul 2026 07:14:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woc1f-00000004cQ6-0r2m
	for linux-i3c@lists.infradead.org;
	Tue, 28 Jul 2026 07:14:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B092C4346A;
	Tue, 28 Jul 2026 07:14:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F413F1F000E9;
	Tue, 28 Jul 2026 07:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785222894;
	bh=uCU4YvqvwCbuEjT7p7O4wRTp6xVEnn521ev9QqbQYHQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FRgqFIB9tZezgmXydi4Zg+x7js8hRUOv0iZhljLlnGfT9N4pgV1NXyfeFEJiIGRWY
	 PEzyjCEZ/ECW/5UD4agnv8+9bKefJkbh+a08qZqyLwbJgeYRKS3wq90wJubbSrBQz0
	 j7ZJQc1t2pNc0eSLESiwzZfSeQ9A5c3OJvuP3T9yPa9aAaAtqjVPZSZh5nx0TIrWWD
	 wMcGH5esmmXjoTN7AdEfGjj6EpA9MGC3jikXQYluWcIdtQJOsxXplRtueccnSYKbdJ
	 ph8wnQvIRqyz+YdO7+wUcMecttWkBxTdZuYFCV8uWd1vsOpQHjjDozZ6QvNimEF+Oo
	 pHdogLQ8Gm6NQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 07/12] i3c: dw-i3c-master: Add SETAASA as supported
 CCC
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org, Frank.Li@kernel.org
In-Reply-To: <20260728065955.809445-8-akhilrajeev@nvidia.com>
References: <20260728065955.809445-1-akhilrajeev@nvidia.com>
 <20260728065955.809445-8-akhilrajeev@nvidia.com>
Date: Tue, 28 Jul 2026 07:14:53 +0000
Message-Id: <20260728071453.F413F1F000E9@smtp.kernel.org>
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

PiBBZGQgU0VUQUFTQSBhbmQgU0VUSElEIHRvIHRoZSBzdXBwb3J0ZWQgbGlzdCBvZiBDQ0MgY29t
bWFuZHMgZm9yCj4gRGVzaWduV2FyZSBJM0MgaG9zdCBjb250cm9sbGVyLgo+IAo+IFNFVEFBU0Eg
aXMgYSBicm9hZGNhc3QgY29tbWFuZCB0aGF0IGFzc2lnbnMgcHJlZGVmaW5lZCBzdGF0aWMgYWRk
cmVzc2VzCj4gdG8gYWxsIEkzQyBkZXZpY2VzIG9uIHRoZSBidXMuCj4gCj4gU0VUSElEIGlzIHRv
IHN0b3AgSElEIGJpdCBmbGlwcGluZyBieSB0aGUgU1BEIEh1YiB0byB3aGljaCB0aGUgU1BEIGRl
dmljZXMKPiBhcmUgY29ubmVjdGVkLiBJdCBpcyBhIHByZXJlcXVpc2l0ZSBjb21tYW5kIHRvIGJl
IHNlbnQgYmVmb3JlIFNFVEFBU0EgYXMKPiByZWNvbW1lbmRlZCBieSBKRVNEMzAwLTUgYW5kIEpF
U0Q0MDMgc2lkZWJhbmQgYnVzIHNwZWNpZmljYXRpb25zLgo+IAo+IFJldmlld2VkLWJ5OiBGcmFu
ayBMaSA8RnJhbmsuTGlAbnhwLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBBa2hpbCBSIDxha2hpbHJh
amVldkBudmlkaWEuY29tPgoKU2FzaGlrbyBoYXMgcmV2aWV3ZWQgdGhpcyBwYXRjaCBhbmQgZm91
bmQgbm8gaXNzdWVzLiBJdCBsb29rcyBncmVhdCEKCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBo
dHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA3MjgwNjU5NTUuODA5NDQ1LTEtYWto
aWxyYWplZXZAbnZpZGlhLmNvbT9wYXJ0PTcKCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdAps
aW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
