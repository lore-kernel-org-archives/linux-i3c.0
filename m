Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB50AC3DA4A
	for <linux-i3c@archiver.kernel.org>; Wed, 14 Aug 2024 23:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OMPXIwUtwaHsPPHqB1aA7l+ZPR3WH2BGtt+HYb9y6fs=; b=ODo2iyDvp46z1r
	yy0+3e7liHzso5k+vl8Oo55jwd7WT9bbVBNAK+FiJVCP/8hao5YYVftJPCGtV6yD+IzQK1LLR8rPW
	p0cGfKir4g+m1yO5FFZv4CnYc/MXvqCI66+/YD1Q1F6w8Lxv+vBBoe2T1V3hEOc3D1BghQv3XllZH
	XcimZtha6Q+le478CAd6LUloha0O4AjgCwWBr4bEe7U4R0TFdAguc4jm1KDXDW9UslVmNA6aDY/gZ
	lDyhiEOLTr8a3LgAFydfC7GxlFJQf5kkcJIitCaXsZKWwTI0mTbgiSvmXi/27hYY8HIWxaX9dP549
	u57BHWg10cbxK9QDdlkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seN7F-00000008WhU-4AYE;
	Wed, 14 Aug 2024 23:09:17 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seN79-00000008Wgn-1vEw
	for linux-i3c@lists.infradead.org;
	Wed, 14 Aug 2024 23:09:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B9457240004;
	Wed, 14 Aug 2024 23:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723676948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zcxP5EsgtxCZMUGLLhH3WKQwDy1VPGiAYJ745P2bBuE=;
	b=RPpvOwDx42C6sY67jHhI6CO1krXDCwlaQyGIj1tzG8lZc5IJ8/ZZytMJRCtkAmXPiMAICz
	phSimiANRz8kHSw6geq0AXd2bRhoBv87ayWGzaPv3lv7f2fg+RVBgyxN41KIMihy6uLqHT
	AMyGbNnbTatHtkQ67/P2aHmm/hCz762tCiLIl1MSIzD4OUvm+25jmkkhPQ5Ione2vwB+I9
	fXri6cFyXgzRWWU+JrQNlLcBWt0cicu0VIDAkE2v3ocKkvU4ArOWz7hSerPlESBgncmOKY
	d141gwpw3/bGtM6NhsqWlxNPM2D+hGgxfnAE//tOUWobO4XSoi9c4/m8dkMNKA==
Date: Thu, 15 Aug 2024 01:09:07 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: arnd@arndb.de, bbrezillon@kernel.org, boris.brezillon@collabora.com,
	conor.culhane@silvaco.com, gregkh@linuxfoundation.org,
	imx@lists.linux.dev, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, miquel.raynal@bootlin.com,
	pthombar@cadence.com, stable@kernel.org
Subject: Re: [PATCH 1/1] MAINTAINERS: I3C: Add Frank Li as nxp I3C controller
 driver maintainer
Message-ID: <20240814230855a6d6b54c@mail.local>
References: <20240814210915.4046554-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240814210915.4046554-1-Frank.Li@nxp.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_160912_312949_8AFFD188 
X-CRM114-Status: GOOD (  14.30  )
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

On 14/08/2024 17:09:15-0400, Frank Li wrote:
> Add Frank Li as NXP i3c controller driver as maintainer and add mail list
> imx@lists.linux.dev for it.
> 
> Add Frank Li as I3C subsystem reviewer.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Recently, I submit many i3c related patches and become familiar with i3c
> protocol. So add me as svc-i3c-master.c maintainer.
> 
> I reviewed other i3c patches. So add me as i3c subsystem reviewer.
> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2b96899a78890..92da600c3f189 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10701,6 +10701,13 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml
>  F:	drivers/i3c/master/i3c-master-cdns.c
>  
> +I3C DRIVER FOR NXP I3C IP
> +M:	Frank Li <Frank.Li@nxp.com>
> +L:	imx@lists.linux.dev
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
> +F:	drivers/i3c/master/svc-i3c-master.c

I guess you should rather add yourself to the existing entry

> +
>  I3C DRIVER FOR SYNOPSYS DESIGNWARE
>  S:	Orphan
>  F:	Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> @@ -10708,6 +10715,7 @@ F:	drivers/i3c/master/dw*
>  
>  I3C SUBSYSTEM
>  M:	Alexandre Belloni <alexandre.belloni@bootlin.com>
> +R:	Frank Li <Frank.Li@nxp.com>
>  L:	linux-i3c@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
>  C:	irc://chat.freenode.net/linux-i3c
> -- 
> 2.34.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
