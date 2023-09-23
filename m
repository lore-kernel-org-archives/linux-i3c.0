Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E64BCE7A88
	for <linux-i3c@archiver.kernel.org>; Sat, 23 Sep 2023 08:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tmlUNZDW8862dpEr34rxg+T2xLnEwhbq2G2j5JWi31Y=; b=Vney33Y22tgYs4
	FtOEhBgw/yak9oD8qJXyV+8SdIi18oGjJ/QUnHHWAbQnpR9Qp66toO5srnNz0UeP2P+ap5XwfqjUK
	tRgn3WYLQMsRs7m02JUzBODvWDl4Jpv4+aplDYXrBtiAxnNRa7UpD7xIqhSwqVNrXOrdTCRFNscDG
	m1fIxHI/3ddMlgi9LaIl2tCoHJoiQ1q7DnkU8/LnkwRF81nsbzuhjMdriNNDYdY+5yf/FZYuO6l5V
	YWE7e8gXx0SePlmi20JCFzCbzFzBBxDgVe+BSKNYSA9DiTem0C8VWy+marnf/Nhx4VydGEH/qz1Oo
	OXtY8CbgnSWJmSxWDgYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjyUD-00AfTu-2t;
	Sat, 23 Sep 2023 08:59:37 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjyUB-00AfTH-0e
	for linux-i3c@lists.infradead.org;
	Sat, 23 Sep 2023 08:59:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 8287BB8249D;
	Sat, 23 Sep 2023 08:59:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69F15C433C8;
	Sat, 23 Sep 2023 08:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695459571;
	bh=H52331EVg7A5/+bK/CkdwvyqaImONzevbLINXxNt+x4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HpEvuWBfhxR/SSWFuXvHoDHil+6oKCVuE8hGCjzOfTPIWbeQ37p/iBHkPx++K+aS/
	 bxkeIKDodmcyqytigm95aEYLKRC219jPm8VfdVuztMAj7pw3InXoRxqT+4k8FnTXbB
	 I8ET3lUevsJrfaX9JEQWhhzGhALZ1+mUjE5ajXVgg9KFUIgcbDeE/QZIRp/+DKnQ8K
	 iZuJC5+xl830vvBtIM/ZeHmUesP2/R4lWT0akhJuSpwPCumVrtmv1hNUk7VHq8KuFd
	 DSNd7s2AtnjuJPQm2SBLPFvXa1WsR6FWkeLxO4v5aK6XcU+65V9JAhKFHIgJfFgH77
	 pC/6S2SVGlhKA==
Date: Sat, 23 Sep 2023 11:00:33 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jeremy Kerr <jk@codeconstruct.com.au>,
	Joel Stanley <joel@jms.id.au>, linux-i3c@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Matt Johnston <matt@codeconstruct.com.au>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Jack Chen <zenghuchen@google.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] i3c: dw: Annotate struct dw_i3c_xfer with __counted_by
Message-ID: <ZQ8ZsQo4yvBwKn9w@work>
References: <20230922175011.work.800-kees@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230922175011.work.800-kees@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230923_015935_422472_FF7E3523 
X-CRM114-Status: GOOD (  15.46  )
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

On Fri, Sep 22, 2023 at 10:50:11AM -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct dw_i3c_xfer.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Jeremy Kerr <jk@codeconstruct.com.au>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: linux-i3c@lists.infradead.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
--
Gustavo

> ---
>  drivers/i3c/master/dw-i3c-master.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 9332ae5f6419..ef5751e91cc9 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -233,7 +233,7 @@ struct dw_i3c_xfer {
>  	struct completion comp;
>  	int ret;
>  	unsigned int ncmds;
> -	struct dw_i3c_cmd cmds[];
> +	struct dw_i3c_cmd cmds[] __counted_by(ncmds);
>  };
>  
>  struct dw_i3c_i2c_dev_data {
> -- 
> 2.34.1
> 
> 

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
