Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EFA6C9832A
	for <linux-i3c@archiver.kernel.org>; Tue, 29 Sep 2026 06:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qqms9aYUujl9stU4yV0E717LKB5yvXNmPvpn7MT9+A8=; b=khu5/vmIK749Ke
	tMegGZ7VtPf3LklC3txPwE9vwff45Mgh4eBfckTeVznHwk/y5Oy1rI1tgTuTCwOjuQV2U/hXtCqMc
	9m1nJrakj5PrwWxdzpUfIR3ueQgfeU9ZE0Mjcu7RaC6myUqMJViY8nDYBJqpGjsEB8zgSV8mmemdU
	cfSAJvTbWUiBEU5j6XR5iuA93Mr+H+H05S3Se4v4sxmr6KUhHkRFuS/tuu0I7g4WbPhC75ipC3S4R
	XZFdjCTNC7tiwrUvaFq9QzNscQL/EvHkSmHefMVD1qjQ2mrDn76uSncMpKdiyb506jkDWsjCYUrK1
	RVudHp/8K/FZN1Dot7lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRYD-00000002WBM-0BNw;
	Tue, 29 Sep 2026 06:42:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRYB-00000002WAt-2nTn
	for linux-i3c@lists.infradead.org;
	Tue, 29 Sep 2026 06:42:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1EC6E40055;
	Tue, 29 Sep 2026 06:42:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67A691F00893;
	Tue, 29 Sep 2026 06:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790664171;
	bh=C8w3D/ONQyXLmDyhMj9j8JGLs4K1lo/jaR0Psozmq8Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jXncRjIXnWkyxlrS+6PIH+3pnIxi4lhEm4roMNoTAGxOlL9vJ0D4Lgj5vEMNwVzNy
	 EddmfCIM8HzdeVrX94vyRluq+ED8re3LNefwoLhaVLfD0SFuajdOZ9NEJBW1NMswad
	 gzKFFPtVKHadaNIeKzp/ceKiOcq8tp8+kH4wqwodxq4Scix5s1qKQaZ+50RYFVB9hK
	 h3wMVmAtkljR7TJONYeRe0sjuYripoFYeQdm7qr2u7E4GzCXLiaPvNb5uaksXraNsw
	 tETC+41AwZjKEGglkF8zKZA9YxSOFTMRpORoUWh7KGCZRn3tQclqkJnkEcoK/CY4HS
	 azXO0o5sQp9cQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 10/20] pinctrl: berlin: use u16 instead of u8 for the
 offset
To: "Jisheng Zhang" <jszhang@kernel.org>
Cc: lee@kernel.org, linux-serial@vger.kernel.org, Frank.Li@kernel.org, mfd@lists.linux.dev, linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260929061417.20733-11-jszhang@kernel.org>
References: <20260929061417.20733-1-jszhang@kernel.org>
 <20260929061417.20733-11-jszhang@kernel.org>
Date: Tue, 29 Sep 2026 06:42:49 +0000
Message-Id: <20260929064250.67A691F00893@smtp.kernel.org>
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

PiBUaGUgdTggbWF5IG5vdCBiZSBlbm91Z2ggZm9yIG5ld2VyIFN5bmFwdGljcyBTb0NzLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4KClNhc2hp
a28gaGFzIHJldmlld2VkIHRoaXMgcGF0Y2ggYW5kIGZvdW5kIG5vIGlzc3Vlcy4gSXQgbG9va3Mg
Z3JlYXQhCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3Bh
dGNoc2V0LzIwMjYwOTI5MDYxNDE3LjIwNzMzLTEtanN6aGFuZ0BrZXJuZWwub3JnP3BhcnQ9MTAK
CgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
