Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B6A0C02195
	for <linux-i3c@archiver.kernel.org>; Wed, 29 Jan 2025 20:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dTUHyPTY7dSWfE9iw6+xquh2s2udINpag9NAgc15FuY=; b=vVbbhItRpItwbU
	XIvarXJxl9JLQgSGjA2DwusPNs0x77sH6lWVJhTU7c7btKtDCUxXpWt3+z0YV/8Lb2iIRu8JFFqrW
	dPsYuXJ854dIAj+a84RNSfKz+hGr+hC58HxT6VKvzipAUTb/Eheb3b9M+Cg1+EzSDtn/By6U2kOrI
	sEmS6j4H+duC6JnAF4k+cZq+FZZmf1OfAnvMe/XWuvcQu4UxVef+a+k7LUIoeQq9ayVfEJ58FghcY
	dU+fi46KvooO6Bh2HTuVOT2DMS9tJQl47AEQWZ8/v0ZNMy69sF0QxKE3HhUcB/hSmNj+SWqXvLO8O
	rxlerKe0tsydr5FrmnYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdEls-00000007lNQ-1c5U;
	Wed, 29 Jan 2025 20:34:48 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taWJl-00000009iyh-0G7r
	for linux-i3c@lists.infradead.org;
	Wed, 22 Jan 2025 08:42:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1737535347;
	bh=f9zFFRYixgkzI6kpfxhjvMCO+OLhvzElHyeKP4ha0LQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A3zQmHUb5W+/4NiBRoTMUhu+n+USP1CJB5DPIarG+NqGWM1HYJqr9DPU97h740n3K
	 li4OXbuZG5vnPh/r9DksXZUcafMKQUjpuX14C9v6tpQ6qSk1dsUV9EC1IeRcPOeDPJ
	 Cw3MK7IVfin2t8RIpfVKM+XojG3NgSgVtperMzYQ=
Date: Wed, 22 Jan 2025 09:42:27 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: alexandre.belloni@bootlin.com, pgaj@cadence.com, 
	miquel.raynal@bootlin.com, conor.culhane@silvaco.com, aniketmaurya@google.com, 
	Shyam-sundar.S-k@amd.com, jarkko.nikula@linux.intel.com, wsa+renesas@sang-engineering.com, 
	xiaopei01@kylinos.cn, Guruvendra.Punugupati@amd.com, linux-i3c@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] i3c: Remove the const qualifier from i2c_msg
 pointer in i2c_xfers API
Message-ID: <23854752-435e-432e-ba21-caf690c0cecc@t-8ch.de>
References: <20250121110756.214714-1-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250121110756.214714-1-billy_tsai@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_004233_243482_1F6DD87F 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Wed, 29 Jan 2025 12:34:46 -0800
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

On 2025-01-21 19:07:55+0800, Billy Tsai wrote:
> The change is necessary to enable the use of the
> `i2c_get_dma_safe_msg_buf()` API, which requires a non-const
> `struct i2c_msg *` to operate. The `i2c_get_dma_safe_msg_buf()` function
> ensures safe handling of I2C messages when using DMA, making it essential
> for scenarios where DMA transfers are involved. By removing the `const`
> qualifier, this patch allows drivers to prepare and manage DMA-safe
> buffers directly.

Why not modify i2c_get_dma_safe_msg_buf() to accept
'const struct i2c_msg' instead?

> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  drivers/i3c/master/dw-i3c-master.c     | 2 +-
>  drivers/i3c/master/i3c-master-cdns.c   | 2 +-
>  drivers/i3c/master/mipi-i3c-hci/core.c | 2 +-
>  drivers/i3c/master/svc-i3c-master.c    | 2 +-
>  include/linux/i3c/master.h             | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
