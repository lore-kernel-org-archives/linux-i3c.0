Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C44C47073
	for <linux-i3c@archiver.kernel.org>; Thu, 11 Jan 2024 00:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OPorZBJhywCvc6Ep6IAxM5GLmGMDHKSCToiLQgvXDwE=; b=D/EBGZAiFpRF/0
	poI4V549tQaK6D7zYfgwYNgiI9NcCietoPMCtpeBjvPnas1SFg6nCYcO4YH7iwXXPvjuRpaXmxlJt
	0WurntbcMQGfkF9iNTUGW8nyB2sR8FOrqeBLBA5lmKbvhHBbFQUDbOo2vNGZqypM+eF6qr1Kh3Nq1
	v145Q/TE4+7NS5Xnuz7M06xszH7S3esGxoTfzanNx7jiPDjj+ZWbyae9vMrw/WiX3HvJ/AwmnHTsr
	eqp4Vnt2L2my35C3z0d1zUbZZtch13EZb3AA0ffsPs+369XuD3XSBpDBKMAt7iJuyy2Gw+TEVWLRZ
	B0iGJZfIjAeShLCE8ZVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNijP-00EsPj-0b;
	Thu, 11 Jan 2024 00:15:35 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNijL-00EsNK-0H
	for linux-i3c@lists.infradead.org;
	Thu, 11 Jan 2024 00:15:33 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B1F6B240003;
	Thu, 11 Jan 2024 00:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1704932125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L956n0qI7eMoQ9LeBFrRDOVKdOpf1Z3wRlhs+uI//gs=;
	b=pk18AGWzv7CtCKJ4ALrIYofo0V0sitodrffpsHo79GpHrr4gs0ALx/cjRscWDBMd4zIpAU
	+ewsqokLP8V+yQ1ByPEnaXggblDGR40x6/r7W4KJT4vyPqZr+K/ctsQTBohGqX4OSZXISb
	LkEG2eT9qzWhE4ZygoHzWyXPSuy3vQZJ3il8grd+PWe0+FeFCj36ntHzkXWK3aBiiqWleA
	IPfuR8iq92qe1Mhbby9/o7UlgjctwvXlVYSDtKCNs1TH1JR/mX5R8qKDbVBHf/geyq3neu
	UDkRVOZv44eyO4okI4SI606q6RoUCGl29mF5A3QqoSVTulbs5kFmYrL2zbyhSw==
Date: Thu, 11 Jan 2024 01:15:23 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: conor.culhane@silvaco.com, imx@lists.linux.dev, joe@perches.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	miquel.raynal@bootlin.com, zbigniew.lukwinski@linux.intel.com
Subject: Re: [PATCH 1/1] i3c: master: svc: return error when read length
 bigger than 255
Message-ID: <20240111001523f69f6a29@mail.local>
References: <20240110222503.2381599-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240110222503.2381599-1-Frank.Li@nxp.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_161531_429047_7D5EE932 
X-CRM114-Status: GOOD (  15.11  )
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

On 10/01/2024 17:25:03-0500, Frank Li wrote:
> RDTERM in MCTRL is 8 bits. Add a length check to prevent silent data errors
> when the read length exceeds 255 bytes during each i3c_priv_xfer operation.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/i3c/master/svc-i3c-master.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
> index bd10bb698da0f..181b56953fb28 100644
> --- a/drivers/i3c/master/svc-i3c-master.c
> +++ b/drivers/i3c/master/svc-i3c-master.c
> @@ -1375,6 +1375,11 @@ static int svc_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
>  		cmd->len = xfers[i].len;
>  		cmd->actual_len = xfers[i].rnw ? xfers[i].len : 0;
>  		cmd->continued = (i + 1) < nxfers;
> +
> +		if (cmd->rnw && cmd->len > 255) {
> +			dev_err(master->dev, "only support read less than 255 each xfer\n");

What would be the end user action upon seeing this message? Is it actually
useful?

> +			return -EINVAL;
> +		}
>  	}
>  
>  	mutex_lock(&master->lock);
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
