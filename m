Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F2CCE7A89
	for <linux-i3c@archiver.kernel.org>; Sat, 23 Sep 2023 08:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ymRrxkyh74nrF7wcwaj0Ezv4fid7ttPaWhepJK1coE=; b=TXj/It0fGTJebJ
	FiWH1AplH6vYd1pfBzFRMQXtAIvsTYnYOvlqn+kVv25ldlZmmEicTlR0BWqJ7gp2iLM+5jC1HPwm5
	E45JVdRbElvAryWgMNpbOprc3zvFimyuHpYRMRh866jAtKpQdIyUU0uMymNeCXqK/9YLFRlUljI7D
	9QUDkDxjIy49GfcCRBNQLJkXFiPzepqebTyxnK0/MGytRpwsdC+nkFipJguTFFGLq4CYpBp9isgqZ
	QsNK480cBvsxdsL/o3MP4pXDAYvznsta2ul/zlzse124An8goV7If+FigFjXnP+P7aI6wC+RduMgy
	Gh+AspNc1tXsPmMshAkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjySb-00AfNP-03;
	Sat, 23 Sep 2023 08:57:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjySY-00AfMn-2G
	for linux-i3c@lists.infradead.org;
	Sat, 23 Sep 2023 08:57:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D8A5160BA9;
	Sat, 23 Sep 2023 08:57:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0D37C433C9;
	Sat, 23 Sep 2023 08:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695459472;
	bh=lkZTTPkhqLfjkprWT4Ia6kfXgvK3+U2RT5SryrW5fU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iNzDdi2ADZy/5iSMNEcMTw6rPJDQxwZ1X0gpCVWzWc0zGB0T1WV5/GusCdWkQLcdU
	 XUnM+6j6Piv3G8J6rmB5QiFtH0juwUwqGasjKeOF1gd+EYg7jak8AHnPnU5V7n1+Od
	 xxyBZhDS9xQb6vntJcYMIvJnE15ktDV3+CQtX6XWABq3sJcKy1ncSM6IMWcUQKTCJg
	 QoT0LWMMWz4tTZGgC7XiojTHDRDzxF9OOWBI5ADB3i4HVmlxBqtvO4juFDoVcZrI0+
	 PGowALpXhR8mJ2rUeR4RVt9BU3xXNj1JXedl+FDXQImOecyzSF0IGpMsQRike1Zq+l
	 55vUUeYL3O13A==
Date: Sat, 23 Sep 2023 10:58:55 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Culhane <conor.culhane@silvaco.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] i3c: svc: Annotate struct svc_i3c_xfer with __counted_by
Message-ID: <ZQ8ZTwbg56QgmRTd@work>
References: <20230922175023.work.239-kees@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230922175023.work.239-kees@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230923_015754_801423_669964AD 
X-CRM114-Status: GOOD (  14.96  )
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

On Fri, Sep 22, 2023 at 10:50:23AM -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct svc_i3c_xfer.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Conor Culhane <conor.culhane@silvaco.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: linux-i3c@lists.infradead.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
--
Gustavo

> ---
>  drivers/i3c/master/svc-i3c-master.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
> index 8f8295acdadb..32eca2d6caf0 100644
> --- a/drivers/i3c/master/svc-i3c-master.c
> +++ b/drivers/i3c/master/svc-i3c-master.c
> @@ -143,7 +143,7 @@ struct svc_i3c_xfer {
>  	int ret;
>  	unsigned int type;
>  	unsigned int ncmds;
> -	struct svc_i3c_cmd cmds[];
> +	struct svc_i3c_cmd cmds[] __counted_by(ncmds);
>  };
>  
>  struct svc_i3c_regs_save {
> -- 
> 2.34.1
> 
> 

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
