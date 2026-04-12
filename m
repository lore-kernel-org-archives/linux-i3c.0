Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B2EAE937E5
	for <linux-i3c@archiver.kernel.org>; Sun, 12 Apr 2026 14:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UxEjFU+pRYH3ukS+sQ157ym1pHMLcpADTs4H2rpZdFA=; b=xZOtfsF0TIL6eX
	xsMoN4Z/Mdp8s6R38dgZY8GPchgg3aXC1zfUk0tNkuyO51vbO5HRruBtmijjerrDtI0g+ZSeSm+gG
	xT319GFtLUaWKVjTNNOLnpW8k7pjgzLGl18tJOhnx3ky2NWyHfmTApNCHyAU2ew7B2wnETkHHH1Sd
	mNq82QBKySwWUq5b33fugj1yOcnDg0lisiSZ20DbbLhkMeFBPCog57RC/y8WIrtM2wjwZgJTIOPTN
	pvW5N+5zI0w1Z9yrSixoOge/eKz7z7gxQSOn9z0t0OebtX2GTZchJMXy9d5Z2s2gDQr1hhK4sawdl
	U66UDsfJn15cHNtffS/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBwDl-0000000EPbC-3shI;
	Sun, 12 Apr 2026 14:55:33 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBwDk-0000000EPas-0USu
	for linux-i3c@lists.infradead.org;
	Sun, 12 Apr 2026 14:55:33 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6A4431A323F;
	Sun, 12 Apr 2026 14:55:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 40C0E5FFB9;
	Sun, 12 Apr 2026 14:55:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9BE3410450084;
	Sun, 12 Apr 2026 16:55:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776005729; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=0+kyyuirOBvj9I1O9rXcNJQj46MOidX/Rqij4U+d0KY=;
	b=forH6uHrQQ2AnJz4wAOqQbkCmyylSN/TCl2JlwVJ/rCb2xR6duhM2X4LSzDbpwMcZ/emeb
	GLo98XhQzhhCTbpyHY1zkWoxe1sTCD3c1lC5tzqAKkZKwk+evVIYIZgnZTNafbwBBFzAYe
	YgL+mYXJV73aZjAmcdrmnhdsvhZgGwGw619LALGwNP7Kjfwc//GhG0j/fvnq/q5Aw51J/N
	g9RVUfvwNa9BrF1nP+OzayKkt453GZVSo2pWLguvOsKzbZr6YHY0MQb9gO5TF+aI7GYtuW
	qQv/Mn/RYTC/wZVkMJre2m71KXuzd++cFuOd/ncBX6SmfkXCrpjc1Df0F/nT7w==
Date: Sun, 12 Apr 2026 16:55:25 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Jorge Marques <jorge.marques@analog.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>
Subject: Re: [PATCH v3 0/5] Fix paths unexpectedly returning Mx error codes
Message-ID: <177600570942.2789362.12815475128237899800.b4-ty@b4>
References: <20260323-ad4062-positive-error-fix-v3-0-30bdc68004be@analog.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260323-ad4062-positive-error-fix-v3-0-30bdc68004be@analog.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_075532_481668_AD7D25D7 
X-CRM114-Status: UNSURE (   6.00  )
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

On Mon, 23 Mar 2026 17:11:28 +0100, Jorge Marques wrote:
> A smatch warning on the iio/adc/ad4062.c driver raised that many i3c
> methods that documented returning "0 on success or negative error code"
> but actually propagate positive Mx error codes (I3C_ERROR_M0=1, M1=2,
> M2=3) from i3c_master_send_ccc_cmd_locked().
> 
> Close paths returning positive Mx error codes when 0 for success or
> negative error code otherwise are explicitly stated, ambiguous or
> expected.
> 
> [...]

Applied, thanks!

[1/5] i3c: master: Move rstdaa error suppression
      https://git.kernel.org/i3c/c/19a1b61fa623
[2/5] i3c: master: Move entdaa error suppression
      https://git.kernel.org/i3c/c/42247fffb304
[3/5] i3c: master: Move bus_init error suppression
      https://git.kernel.org/i3c/c/49775afa983e
[4/5] i3c: master: Fix error codes at send_ccc_cmd
      https://git.kernel.org/i3c/c/ef8b5229348f
[5/5] i3c: master: adi: Fix error propagation for CCCs
      https://git.kernel.org/i3c/c/0b73da96b6eb

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
