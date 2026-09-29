Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B116DC9832A
	for <linux-i3c@archiver.kernel.org>; Tue, 29 Sep 2026 06:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y9ka5dqznuVXKG6T27XL72g1TAHcH8crobokKqRsZMw=; b=pmZL9dameodJY0
	EyPkoQLVtqk3VNJhCfK52EWuGYAMEyI/X4981S7MBKO3YviwJ/OPwy0FlYCTasjhXrmzv8gosnEmA
	axgnLS5gd86fCfM3A3gqpLTOJcHh66TjjATdJgkPU6fLZjirb0RL79yrxaNGU9MqxzoQTJ8XAyc9k
	wZycHpfGz5+toLJ+SaLLVACl3LwsCI7jXvIaKAwOkdTkVdX/K1talMfqCDp+iLG7z7ro8Ezytvw6b
	Lc1G2BFUMNemCqS58KrkHyzbHhM3AyR5oMdT0pJbKjVNOSsYfHRyu0QiM5JYLCRewMZ0FXqsSaGUp
	vyQfl6aV/GvUZ6rnxNzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRVg-00000002VxL-1tTh;
	Tue, 29 Sep 2026 06:40:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRVe-00000002VxC-420K
	for linux-i3c@lists.infradead.org;
	Tue, 29 Sep 2026 06:40:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 55B0860A5F;
	Tue, 29 Sep 2026 06:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 700921F000FF;
	Tue, 29 Sep 2026 06:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790664014;
	bh=SNOQnXc5g57viKi9YicLCp9fP0mvSs5JJY8d9PWA2/0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eXNNarkwm952e5SbjHP2ZV4Wfz9rUhcbj8cFwbGDdUIixTyTe/cpmlFXAdzF6H4vj
	 7vUGHP1yFVUMYwodLt1rmnUyzBGlFt0Wb5+h43za/VsdKbsoQifjps07BRMei0XRi5
	 0ihbKuubRlNjzXGyXJXoMiMhJPWP+oiDY3TRKLCts2d+ZJa+XmFzM8+HzIxv894NM+
	 yuKldFeLUeP78GCKYgclSM/D7rEOsfPpJyEmfpDPUCLm+83bZOJoP4sQoNJr8Bbp7F
	 PV5IDftXyvreoNYx6SKQHi6K+Npr79x8chEwba7WRCk07pgO/FmRsiObN/ds3JT/DD
	 zNTLIMXZsx0GA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/20] arm64: kconfig: let ARCH_BERLIN cover Synaptics
 arm64 SoCs
To: "Jisheng Zhang" <jszhang@kernel.org>
Cc: devicetree@vger.kernel.org, linux-serial@vger.kernel.org, linux-i3c@lists.infradead.org, Frank.Li@kernel.org, lee@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, conor+dt@kernel.org, mfd@lists.linux.dev, robh@kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260929061417.20733-8-jszhang@kernel.org>
References: <20260929061417.20733-1-jszhang@kernel.org>
 <20260929061417.20733-8-jszhang@kernel.org>
Date: Tue, 29 Sep 2026 06:40:12 +0000
Message-Id: <20260929064013.700921F000FF@smtp.kernel.org>
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

PiBFeHRlbmQgQVJDSF9CRVJMSU4gdG8gY292ZXIgU3luYXB0aWNzIGFybTY0IFNvQ3MuCj4gCj4g
U2lnbmVkLW9mZi1ieTogSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPgoKU2FzaGlr
byBoYXMgcmV2aWV3ZWQgdGhpcyBwYXRjaCBhbmQgZm91bmQgbm8gaXNzdWVzLiBJdCBsb29rcyBn
cmVhdCEKCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0
Y2hzZXQvMjAyNjA5MjkwNjE0MTcuMjA3MzMtMS1qc3poYW5nQGtlcm5lbC5vcmc/cGFydD03CgoK
LS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
