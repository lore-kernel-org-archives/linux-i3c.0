Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F629CE79A4
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Sep 2023 21:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2nI/aQ8rOWACE5ZMzBVO/nGCn42nVjMfXBldSLnMjmY=; b=giOKG8XfWQhu+W
	yfgFt8qxcTSptE4UhEQEupq0QVZj06sBNXYwgwTK5xPr8Qj+63B4F5Tspg/zU2ng6pDsKTrLHtjC1
	oxnL08a6+4OBNNAeeYiE+irQ3eEL3diyxtVURHLlgag6kKfcqAk4qBZxk8bnA53fsTcTpbwnAOiUE
	kk1Xg5ij1WOTfmL/iindvuKYq1+FKwrQBymHYieRy/XiJkfbtW3SdMdWN2xG5sz3+qsYF0xfhz30y
	URbiyE5BjtmPm7s8egW5WNzKfywqcTkGh+e9f3GkpuIwseajgGyklpO0h4czk/usYdD7qzDfNFmjL
	VDlbTYmokyrgeCtgXayQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qktGE-00F4R6-0J;
	Mon, 25 Sep 2023 21:36:58 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qktG8-00F4Pn-2o
	for linux-i3c@lists.infradead.org;
	Mon, 25 Sep 2023 21:36:56 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 294D2C0004;
	Mon, 25 Sep 2023 21:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695677809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zyQR+FXwt/TZA0WIxWRqOGY3Y73PyOWlb1rrHXXeJg8=;
	b=hOsheLCcmIbbRpIhtLk8Tn0xYBPqRaRyuqd5SuV2DUbZiI36ESAPCBmPbP7DtOWE5JJpQb
	mpo2Kz1i+D3Sor48ukixPNGN+YvI5us9uoALnqlhqeLORQsZ1uMOEN7dny8iqnvQ1zjgOG
	n48jUAdmP8o0MtO3GyUYxkIZg5MM47kc6nhyv70VJ75Yu3/hnaWM56Iu9BQsEweUFpZsIB
	EMz8ivgBNg2cj2y2lEtZW/bRS31nBkve1M2W10qo8zbHHLFEJo8bFmzbItI/28BZxdpNrB
	3gUKz5ekq92iVLRe+0cwaLuxseQ6tNqGD0R0+Q60LRYwIyGbjPrykTzPl4FfUw==
Date: Mon, 25 Sep 2023 23:36:46 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Kees Cook <keescook@chromium.org>
Cc: Jeremy Kerr <jk@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
	linux-i3c@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Matt Johnston <matt@codeconstruct.com.au>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Jack Chen <zenghuchen@google.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] i3c: dw: Annotate struct dw_i3c_xfer with __counted_by
Message-ID: <169567773737.243402.14069734796583624800.b4-ty@bootlin.com>
References: <20230922175011.work.800-kees@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230922175011.work.800-kees@kernel.org>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_143653_042762_F7CF83F6 
X-CRM114-Status: UNSURE (   7.66  )
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


On Fri, 22 Sep 2023 10:50:11 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct dw_i3c_xfer.
> 
> [...]

Applied, thanks!

[1/1] i3c: dw: Annotate struct dw_i3c_xfer with __counted_by
      commit: 014c9a0e6f9ff573099051e1e2ff6efc3470d02d

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
