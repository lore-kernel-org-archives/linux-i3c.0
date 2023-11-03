Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84447C4332F
	for <linux-i3c@archiver.kernel.org>; Fri,  3 Nov 2023 23:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PdYpwvENAVqAqwEwIn4clju9dON43gRZs6apaZ1CYQU=; b=EYrkEScDSR2Y8o
	rUFGkmvTYUZjdFBreYeFY4RT4gTRvFz0cSTXYswwC36Slpmqkao1PjfL5xu1/j6V0LFhqE7qeVJRw
	6cdTi7/U3pybohpVJb/IhbOjkezCmbw997JMz/4bgxP9Y4Ana3E/UtE2AhNbmaTtC5JiOGU3QTyK7
	qqaZB4XkBK2Sjr8otcM/KofIISv4SWxndeVYBNArpJTVymXj3MJ7DVVuVk40fHSn1e3eIgJwgtprw
	xaObgcNwyzTy6I5LBgds7+zjJnP3pMaJySa/YxuOyFwswrss2g5Q2BAuTie7LzY5q/bw8HtjzAo7u
	0xt7Ye+uNKUgnxzJkTlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qz3qX-00CLTl-0d;
	Fri, 03 Nov 2023 23:45:01 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qz3qV-00CLTQ-00
	for linux-i3c@lists.infradead.org;
	Fri, 03 Nov 2023 23:45:00 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7F0EC40003;
	Fri,  3 Nov 2023 23:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699055096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LvZbY8n3TbbqhYlVAfQSZGBZEm+tBQZKIiqgXT9tZZ8=;
	b=mZIxxhxiV0dqVY89K/UWVJf37U9ZTERrXJStzWUi+rEoOMxqtIIe/q3B5a2OUAB7hdajCY
	FbRPHtMOct+yJN84cF924eex12ZRte/qE/73kbFeYuQAavPfBMpo0D1MS7QejDVI8ca5Ue
	01jMO/XCG7FlSm3fmVlaMWOuyNt/V8lOQff9nqXJ7IQf5SeNmyRaYNJIMevM0Sw/2HZhs2
	iDwSEBCY1HylzkBvpee7hwxL/g8oe6/mxAUvN2afOMoQqLmm9KxaVnETimLKCUmWvrJ4OA
	trSaXwj3W6MhRqA15oLCUsfqFzBX76Lc7u/gyARcTZMl4vEgXTsjB+/0WKKOjw==
Date: Sat, 4 Nov 2023 00:44:55 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-i3c@lists.infradead.org,
	Zbigniew Lukwinski <zbigniew.lukwinski@linux.intel.com>
Subject: Re: [PATCH v1 0/1] Fix for IBI handling order
Message-ID: <169905508448.440113.6352651253083554612.b4-ty@bootlin.com>
References: <20231015222334.1652401-1-zbigniew.lukwinski@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231015222334.1652401-1-zbigniew.lukwinski@linux.intel.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_164459_205988_C2796218 
X-CRM114-Status: UNSURE (   9.14  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


On Mon, 16 Oct 2023 00:23:33 +0200, Zbigniew Lukwinski wrote:
> I would like to introduce here patch to cover IBI handling order broken.
> 
> IBI shall be handled in order they appear on the bus. Otherwise could hit
> case when order of handling them in device driver will be different. It may
> lead to invalid assembling fragmented packets or events order broken.
> 
> There are two use cases when this problem can happen.
> 
> [...]

Applied, thanks!

[1/1] i3c: master: handle IBIs in order they came
      commit: 9fd00df05e81a2e1080ce6e9abc35533dca99d74

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
