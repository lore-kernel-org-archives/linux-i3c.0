Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19550C48BF6
	for <linux-i3c@archiver.kernel.org>; Sun, 18 Feb 2024 23:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wo+sYikVkTsGdNAYx7QIz4ENRvsn1m/3kbW/VMLJn2c=; b=3eYK1w0eiVLuzE
	phTMCrPb5RH8q6+96/iD5wDZuzGsZnDb38XZ0EPfutqrmU5GyKqlLgOYc/R7o9Txy5+gz8JBpRwP0
	Xp9oVyoaLQigvvvl2Bzaa22Wb0WBO48frZOUDFxVvhAbEjVa+vE3XTtAWHZ+Q6QQxHR4kd+FWqOTo
	Mgaqk8Hn4v9edZlRHPigfw+JJ/jsKPOd3WQtwX1qINIKu1p8M5spck9Dt/Zzf9cDgd+7UqqVA/Kvo
	z0LcZyfWyFtlwngrvTxTfRDXsZa4aIVT0/Gn9C4Bs5+VwzS1lXiNgCiMnNB42EklwY2QWyUkh7r1H
	ngJ2YtEU3GJs84Z/+U2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbqem-00000008djc-1Dfq;
	Sun, 18 Feb 2024 23:33:12 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbqeh-00000008dj4-1vxy
	for linux-i3c@lists.infradead.org;
	Sun, 18 Feb 2024 23:33:10 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 851F01C0002;
	Sun, 18 Feb 2024 23:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708299181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+no/GNABth1l0cxT+LAZBU7GSVGx2JdSvGLYECdt/oc=;
	b=LJkToLRMsmXu/iAfv0cwBNopGZkv8ral52E1ilxtwB58ecLPgIjqm5j/33+l7oXcQR7/Iz
	goi5Mh70PwQTsFFIpbB0qc/GnOkDkdKannSDtdAA9oHcIeOaqiUCDDnbVsGGU8xpIPuc0s
	hzNPxyYVSYRJs3kA+MlDOe/8/WMKe8MEWSaOo/wl+moTNu7XGtTllPKtBmuQnhQpwehm/z
	ac3kmjVCfExSRWWHXyE6MiJhBCbDCZ7m15E2vpKRfya5wXxCzpCBwdf77uwI6jPTSLqDnZ
	uiWp7wve057vMuO4Q6GgmCUK2fMrAah12cndFsArogAz6xIEd/N4SKqLp9muBA==
Date: Mon, 19 Feb 2024 00:32:59 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: jk@codeconstruct.com.au, joel@jms.id.au, u.kleine-koenig@pengutronix.de,
	gustavoars@kernel.org, krzysztof.kozlowski@linaro.org,
	zenghuchen@google.com, matt@codeconstruct.com.au,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	Dylan Hung <dylan_hung@aspeedtech.com>
Cc: BMC-SW@aspeedtech.com
Subject: Re: [PATCH] i3c: dw: Disable IBI IRQ depends on hot-join and SIR
 enabling
Message-ID: <170829917129.1161351.6293000766390759805.b4-ty@bootlin.com>
References: <20240119054547.983693-1-dylan_hung@aspeedtech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240119054547.983693-1-dylan_hung@aspeedtech.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240218_153307_801063_DD4877AE 
X-CRM114-Status: UNSURE (   5.58  )
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

On Fri, 19 Jan 2024 13:45:47 +0800, Dylan Hung wrote:
> Disable IBI IRQ signal and status only when hot-join and SIR enabling of
> all target devices attached to the bus are disabled.
> 
> Fixes: e389b1d72a62 ("i3c: dw: Add support for in-band interrupts")
> 
> 

Applied, thanks!

[1/1] i3c: dw: Disable IBI IRQ depends on hot-join and SIR enabling
      https://git.kernel.org/abelloni/c/10201396ef64

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
