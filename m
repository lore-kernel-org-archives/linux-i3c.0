Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B54CA5FA1
	for <linux-i3c@archiver.kernel.org>; Tue, 29 Sep 2026 06:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bEMF34HOs5QqzvBH6U1iF+coHq2qPsyDP0h8/wzIaeY=; b=oB9GXk93M15BGt
	1YtQsPmBJmXX0la7EIz1b8zcMtL3GN4WXe+Y1W4R3GDrM5uyL5YAfw5dAojjDgZjDT/MYHtfCUS0v
	kOyFWmablNTBucEuf5oz1ukY7TS/yZyKtJ6LLcOHTQ02HQBd7ksuy3yfu3LJOluALv7vX9+u12x6e
	vbQsuRelVCEGM7ZhonsywRFJRNtTinXakc7xGjQJlF53EHHwx4dg7JMHa3X23O+BqbWi3ptmv2t4Y
	1yYyoEj+lTeQBruRg6eFHP/EhSeQ3hacINIak5BYOVq/oV2W92v8EjeWnqwiLymzDLxazoS4uPD+F
	bjwkaDEWt0+q2OSfOWjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRZE-00000002WEi-0ll0;
	Tue, 29 Sep 2026 06:43:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRZC-00000002WEb-1M7L
	for linux-i3c@lists.infradead.org;
	Tue, 29 Sep 2026 06:43:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B200160210;
	Tue, 29 Sep 2026 06:43:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0242B1F000FF;
	Tue, 29 Sep 2026 06:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790664233;
	bh=6PbmBTGfz8Mig5AQk5WhCjdQCPWzxHeythlwV9JGZcE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H4qBTO9CvCGv14KR5qUUCQkCb6RXIPcF9ddRXO90vFoxonXwagKGJ8yQslPt+8hga
	 3Jf5yy2qnBoEiZImHyQUcp7a6QkC+/+N8R8iZIxGVdtWQClmxISIyXOc+PFVv6oHoE
	 z9L6GSm3dIOvuOehKcqPAlkwIavLGNsA6YSJnhTTXIZJcU452IhHU/BUPtSZeNYDMy
	 r04xYxmiUGYlRr9Q1ziYMv+wh5VjPdD/fiJ9pJrPLCifXi0+R3chJPVV9gcstjc2Xa
	 dbivy3K+t+3kLHTeVGYOyDG/PXGOePIOXeG6CZIWB43IvcPG0Kta/ekRqJe4onz5m8
	 +U5YXHIOUXzdA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 04/20] dt-bindings: i3c: dw: support up to two reset
 lines
To: "Jisheng Zhang" <jszhang@kernel.org>
Cc: devicetree@vger.kernel.org, linux-i3c@lists.infradead.org, linux-clk@vger.kernel.org, linux-serial@vger.kernel.org, mfd@lists.linux.dev, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, robh@kernel.org, lee@kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260929061417.20733-5-jszhang@kernel.org>
References: <20260929061417.20733-1-jszhang@kernel.org>
 <20260929061417.20733-5-jszhang@kernel.org>
Date: Tue, 29 Sep 2026 06:43:52 +0000
Message-Id: <20260929064353.0242B1F000FF@smtp.kernel.org>
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

PiBUaGUgU3lub3BzeXMgRGVzaWduV2FyZSBJM0MgbWFzdGVyIGNvbnRyb2xsZXIgY2FuIGhhdmUg
bXVsdGlwbGUgcmVzZXQKPiBsaW5lcywgc3VjaCBhcyBjb3JlIHJlc2V0LCBhcGIgcmVzZXQsIGFu
ZCBkbWEgcmVzZXQuCj4gCj4gVXBkYXRlIHRoZSBEVCBiaW5kaW5nIGRvY3VtZW50YXRpb24gdG8g
aW5jcmVhc2UgbWF4SXRlbXMgZm9yIHRoZSByZXNldHMKPiBwcm9wZXJ0eSB0byAyLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4KClNhc2hpa28g
aGFzIHJldmlld2VkIHRoaXMgcGF0Y2ggYW5kIGZvdW5kIG5vIGlzc3Vlcy4gSXQgbG9va3MgZ3Jl
YXQhCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNo
c2V0LzIwMjYwOTI5MDYxNDE3LjIwNzMzLTEtanN6aGFuZ0BrZXJuZWwub3JnP3BhcnQ9NAoKCi0t
IApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
