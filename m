Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 044D7CE79A4
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Sep 2023 21:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5K93sRa22qPSGviMUg+RgeBe2r+nDfUX598QzXGMvxc=; b=l4C2k+iULqENr9
	VxmypKBPu+Ah3XfbTeMVzCIAtx9C4sx0wQPenHlBfhTjpOw/rf0ptnMMjOebbtHKljZsyRx5E+/hL
	SVwYxbiwer/7UzS9ZASwNxqXtBzrj6snRlJLUsatJb9wHAG2hyzpTvnPwp7oM2p5kl2F5QAn9v9ss
	iWRurLcMLZvrqSQPNaqp1SsYpD5S7Q5OPRgcEO+J70l9z1XlZ2ja96FR7sgWyr2jrG41OjUMvkh5m
	uf8l0uFDXr4KgHapVlm0ZgoCRXVsud19qoqHzm/QE7jfZjoOUDGkYxwq+cVNPtKGDnZAdMWYvpJSW
	q63MqtfHhMYEpLunJejQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qktGM-00F4Sx-26;
	Mon, 25 Sep 2023 21:37:06 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qktGH-00F4RW-2o
	for linux-i3c@lists.infradead.org;
	Mon, 25 Sep 2023 21:37:06 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1B2321BF204;
	Mon, 25 Sep 2023 21:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695677819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cRwJ6cjaL2/aVyQgEfG4CwLgZ7pk+vWC5OoPdJaZhys=;
	b=pmMaHvTVbw1kcIVJLKFObevOZvn/4VilyCk1yvfjOcNtYii+xe8ov+tzwP3t7Pxo0yG4uu
	y21qrqSOmTxZFFAutyAqE7NKVSjxrB4SR2bceC2rYwM81cNP3IzYGXdUO2R86jxb4GP26f
	+V9Nfg2PgVQWWDJjeTeaXBIKWYBB/2rzIJf7YX90nlap03taWsyCKR1B0kV6Gey398W4Bx
	COhQY5kZ51DDldjuYx4JLoxonzDYaP1VECJ5IwSocQMR1NFZBaLzuxVnF211ze6HPPkVvC
	Lu7IZLkT0gpLKBG+7uYLovmpiyZlOZy/JzdT5Ovl7RH8UBCGICMFaww5NCBm4A==
Date: Mon, 25 Sep 2023 23:36:58 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: =?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Kees Cook <keescook@chromium.org>
Cc: linux-i3c@lists.infradead.org, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] i3c: master: cdns: Annotate struct cdns_i3c_xfer with
 __counted_by
Message-ID: <169567773738.243402.6652561668121064135.b4-ty@bootlin.com>
References: <20230922175014.work.637-kees@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230922175014.work.637-kees@kernel.org>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_143702_054058_98451F07 
X-CRM114-Status: UNSURE (   7.34  )
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


On Fri, 22 Sep 2023 10:50:15 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct cdns_i3c_xfer.
> 
> [...]

Applied, thanks!

[1/1] i3c: master: cdns: Annotate struct cdns_i3c_xfer with __counted_by
      commit: 49f33846efc079eb94b044bf897e90909fd3aa11

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
