Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDAC9CA5FA1
	for <linux-i3c@archiver.kernel.org>; Tue, 29 Sep 2026 06:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=djidqDdU+2uyZBrIlehCqhm5klVjb8PLCa0Wq00l2DI=; b=2eDuT6jqpj16s9
	e2fsmrvdOss/NVnWVerfC87jPCVzWmgC0rj12NPvlFZxYCVdonkU/c9km5Hivx6y75cGe+v0jFPMw
	EfYbPQJaqwW0Mh2xVx/xV42gPckLB5ksiyU2bVs5b/ZXzE9tL3/JBAC8HKvn5awIh9qEG7mMl6BDa
	lFosSjJFDl76vHNpa1Mi1k2b/StBCjF8NpYcykTqVfKM8fSzyZbBWW485oFMY1IbCVTi3Gb4mtlGU
	qR8E5F2riLUqiz0Qf2Q7nfW+QYMeZl0p2ekATiebK3cpVNHBhTUR67MfIikxKsOtqkiLE0HSFGl+b
	XXt/096pVUYUdwhTViRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRWW-00000002W3A-2pVo;
	Tue, 29 Sep 2026 06:41:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRWW-00000002W34-0UJu
	for linux-i3c@lists.infradead.org;
	Tue, 29 Sep 2026 06:41:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8D0A860210;
	Tue, 29 Sep 2026 06:41:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A573B1F000FF;
	Tue, 29 Sep 2026 06:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790664067;
	bh=E2n6BoOJMgmyakjDdPqYQ+iPhpNJeurZaVznbkht3k8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FseyX32bdSruDcwfTSifeaDlizHkZTOm7/fyKbbYFkzATzMxfaeMscJ1hSrmN1Dku
	 h+LwHM04/42nrBKBXLDctdz2DfJa1+ppGKH7QkSYOQoU2a8zobPmSFSrj1LW/eh2EB
	 0kpAFdXHThRyVeV+5Ria1bVGCYvMjHiGVtmpGE7i0v8fcj0FoWy820qoel2DZlZW6j
	 VXacazsjmvHxJzvP3OU8W2ptfGg46F8tEyigob3TICfDS4jH+R3rW+9VcSkNogCqVk
	 5cCwvpY8gTZ3vC9obbFnmVao++Wv9OdHMw2z3Z+WRX1uQ19vyK0bpj5+2UWwVfogb9
	 ua/2Xt7muaseA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/20] dt-bindings: i3c: Add Synaptics sl261x i3c
To: "Jisheng Zhang" <jszhang@kernel.org>
Cc: linux-serial@vger.kernel.org, robh@kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org, linux-i3c@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260929061417.20733-7-jszhang@kernel.org>
References: <20260929061417.20733-1-jszhang@kernel.org>
 <20260929061417.20733-7-jszhang@kernel.org>
Date: Tue, 29 Sep 2026 06:41:06 +0000
Message-Id: <20260929064106.A573B1F000FF@smtp.kernel.org>
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

PiBBZGQgdGhlIGNvbXBhdGlibGUgZm9yIHRoZSBTeW5hcHRpY3MgU0wyNjFYIFNvQyBJM0MgY29u
dHJvbGxlciwgd2hpY2gKPiBpcyBjb21wYXRpYmxlIHdpdGggdGhlIFN5bm9wc3lzIERlc2lnbldh
cmUgSTNDLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVs
Lm9yZz4KClNhc2hpa28gaGFzIHJldmlld2VkIHRoaXMgcGF0Y2ggYW5kIGZvdW5kIG5vIGlzc3Vl
cy4gSXQgbG9va3MgZ3JlYXQhCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNo
aWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwOTI5MDYxNDE3LjIwNzMzLTEtanN6aGFuZ0BrZXJuZWwu
b3JnP3BhcnQ9NgoKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtaTNjCg==
