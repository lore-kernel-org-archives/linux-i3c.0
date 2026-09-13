Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 326B9C88E53
	for <linux-i3c@archiver.kernel.org>; Sun, 13 Sep 2026 00:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6sntj0W03XZ4D+mXtItgpg7qAukbasjq0BCRunaYg4o=; b=P5EJD6rQ/zjeUc
	yw3si2d4fiAq9aymdP17zLuxPJmrhNd7Rj++G03kVV4fI1509fBoN1irT9cEVOAy05rflA5RRu51U
	41vAdBz19DbZCIRcmojVubTpaWbXt2JtE3bW0YZFG4u8f2Ah+3jnz30lHmyHdiE0BoiY0a53LPCDv
	H5JfDDL6I0ekBV+C3FD3LOmqOVTBrpyykGJ+SS0A/qyRBDEOtCnet+nwSx22V6hLyvtDhANxTYBDn
	IafOCWbwAJsKCrgIaBMMXDA3ZI2SEETYlusLs0L8ttriLXmPcHeyy/lP+EeXsA4SXZrrRHf9GA+V1
	BfBMUN98AF9RBa+DNgNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Y31-00000001Hyw-3ZKC;
	Sun, 13 Sep 2026 00:26:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Y2y-00000001Hyq-2XMo
	for linux-i3c@lists.infradead.org;
	Sun, 13 Sep 2026 00:26:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C84D660008;
	Sun, 13 Sep 2026 00:26:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4857E1F000FF;
	Sun, 13 Sep 2026 00:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789259175;
	bh=hgNGnjGjckr62DBzsPqklyBYTtJwHtzKKZEQx/7I33M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=iRf7SFu/H6AlQpjq0c2D2war4hn932/GgR988qSkoQiIvtlRo3pYqwfqJ20MrF+y2
	 VRuLAeqPkxpI4sLIvfhuWkssSxEBv9cR66eFzxNxVPtIxm7pFi+ZH6YsZk7okZ/2Ac
	 6w1JV9lq0XdO0//qVFYnhhLIAlSr+GmxVg9qlB8pX86CkLMWFxB+OGyzkYxfuw5NpC
	 iDNIzGSjCfISokc7dympuiZIM7OPsMXGygcRvY9XK3SzXn0Lps1j7Dz1j3JGsddUOI
	 ihGD8/qQu7rGlLbWw0HAI4oqX0PUmpFlwqq2U10AOduF7fTi/FO7Y4FfDVAJdGnTbx
	 CGHom3nbKRClA==
Date: Sun, 13 Sep 2026 01:26:12 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
Cc: linux-i3c@lists.infradead.org, alexandre.belloni@bootlin.com,
 vitor.soares@toradex.com, samagazaryan@google.com,
 gregkh@linuxfoundation.org, arnd@arndb.de, boris.brezillon@collabora.com,
 oleksandr.shulzhenko.viktorovych@intel.com, tgopinath@linux.microsoft.com,
 corbet@lwn.net, skhan@linuxfoundation.org, linux@roeck-us.net,
 Frank.Li@nxp.com, jorge.marques@analog.com, pgaj@cadence.com,
 wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
 nuno.sa@analog.com, Michael.Hennerich@analog.com, dlechner@baylibre.com,
 andy@kernel.org, lorenzo@kernel.org, enelsonmoore@gmail.com,
 rppt@kernel.org, pratyush@kernel.org, giovanni.cabiddu@intel.com,
 gabewhigham@gmail.com, haren@linux.ibm.com, pasha.tatashin@soleen.com,
 jirislaby@kernel.org, adrian.ho.yin.ng@altera.com, ustc.gu@gmail.com,
 jszhang@kernel.org, adrian.hunter@intel.com, akhilrajeev@nvidia.com,
 tze.yee.ng@altera.com, manikanta.guntupalli@amd.com,
 shubhrajyoti.datta@amd.com, jarkko.nikula@linux.intel.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux@analog.com, linux-iio@vger.kernel.org
Subject: Re: [PATCH 2/3] i3c: set i3c_xfer.actual_len in controller drivers
Message-ID: <20260913012612.745247fa@jic23-hlaptop>
In-Reply-To: <20260911210935.1353126-3-meaganlloyd@linux.microsoft.com>
References: <20260911210935.1353126-1-meaganlloyd@linux.microsoft.com>
	<20260911210935.1353126-3-meaganlloyd@linux.microsoft.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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

On Fri, 11 Sep 2026 14:09:34 -0700
Meagan Lloyd <meaganlloyd@linux.microsoft.com> wrote:

> Set i3c_xfer.actual_len for reads across the I3C Controller drivers.
> 
> actual_len provides a consistent location for device drivers to know the
> read response bytes without overriding the len field.

Hi Meagan,

Why is that useful in this series?  Currently this sounds like
an unrelated change.

Jonathan


> 
> Signed-off-by: Meagan Lloyd <meaganlloyd@linux.microsoft.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
