Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE12CE6748E
	for <linux-i3c@archiver.kernel.org>; Thu, 31 Oct 2024 23:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/cHBCgeyWg4cHyhCR5hyLuUvcnJSssKbhm9dR8iLlPE=; b=KixttikLpPPP0N
	6G4lBHzSzIHIeANbfjvhSAwHGyUVpaqSJ9WqH2u/aWIz8eFp4vEY1oA0+d2znMmEtyxlTKlLOxcfw
	xXFkI0ZTR1BNdaKtt2vUdHebHIboCsSbg2RXxjeBFnqVhgT7k56WfzJ1CxqXieo868eKlTTfALsl3
	AMSGf52nz8E+z1aJFKfpe/01/k8wsVy/ryMiUUQ65CmIQIXjvuk7HwKVJsVav6hapt2qcrFr29lt5
	2a8K95ccY5RHm1DRC1upX+Ih4pQvG0htn3VWLH41fctMqpqhfwijFiyT6fXZWEngfKU9TJmZvf4xK
	fguBkMRniQAv+cV3fc2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6eE9-000000058CI-1kGW;
	Thu, 31 Oct 2024 23:05:17 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6eE6-000000058BJ-1h5S
	for linux-i3c@lists.infradead.org;
	Thu, 31 Oct 2024 23:05:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6CD3A60005;
	Thu, 31 Oct 2024 23:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730415910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+dr+WbouWG08b3ueIX4Ar5hKem1okbqw/Lq5iSFgUBY=;
	b=KtUlIP/+1X3FlzencxuXhU9kmKLoGem34if3sYm6TSxFs6N6B0tVriuTFhAOXx1scg/8ox
	hpaleZngpo++WjSkA/PVPyT8i5CDiE4acTYRWghHns3sxde74e7LUeKH7d14urA93suJlo
	5hGkQGdfGyv6rU6iGLAHOMBPm1yCxmOkP9CxIfD/yQaIN+JUDcSGsxwSuE9gIGKnJmRQlm
	TYmbu0LeYVbLcD/qLlf78AjWoVVq2j5qduDrIXM0vZCxUhEbTqPldYd5iy0qUG5fwr5onM
	CVbQOA0AuXGdghwygeUURSKdp03cQlkrlO4I4OJK+6bG9vzYW+DhbmPwulcDug==
Date: Fri, 1 Nov 2024 00:05:10 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Culhane <conor.culhane@silvaco.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	"moderated list:SILVACO I3C DUAL-ROLE MASTER" <linux-i3c@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] i3c: master: svc: Modify enabled_events bit 7:0 to
 act as IBI enable counter
Message-ID: <202410312305108f8c61cf@mail.local>
References: <20241024203855.1584416-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241024203855.1584416-1-Frank.Li@nxp.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_160514_615154_00CDAA23 
X-CRM114-Status: GOOD (  16.62  )
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

Hello,

On 24/10/2024 16:38:55-0400, Frank Li wrote:
> Fix issue where disabling IBI on one device disables the entire IBI
> interrupt. Modify bit 7:0 of enabled_events to serve as an IBI enable
> counter, ensuring that the system IBI interrupt is disabled only when all
> I3C devices have IBI disabled.
> 
> Cc: stable@kernel.org
> Fixes: 7ff730ca458e ("i3c: master: svc: enable the interrupt in the enable ibi function")
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

This doesn't apply on i3c/next after applying your patches, can you
rebase?

> ---
>  drivers/i3c/master/svc-i3c-master.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
> index d1ebfba3739c1..66fe0fc12c897 100644
> --- a/drivers/i3c/master/svc-i3c-master.c
> +++ b/drivers/i3c/master/svc-i3c-master.c
> @@ -130,8 +130,8 @@
>  /* This parameter depends on the implementation and may be tuned */
>  #define SVC_I3C_FIFO_SIZE 16
>  
> -#define SVC_I3C_EVENT_IBI	BIT(0)
> -#define SVC_I3C_EVENT_HOTJOIN	BIT(1)
> +#define SVC_I3C_EVENT_IBI	GENMASK(7, 0)
> +#define SVC_I3C_EVENT_HOTJOIN	BIT(31)
>  
>  struct svc_i3c_cmd {
>  	u8 addr;
> @@ -214,7 +214,7 @@ struct svc_i3c_master {
>  		spinlock_t lock;
>  	} ibi;
>  	struct mutex lock;
> -	int enabled_events;
> +	u32 enabled_events;
>  };
>  
>  /**
> @@ -1532,7 +1532,7 @@ static int svc_i3c_master_enable_ibi(struct i3c_dev_desc *dev)
>  		return ret;
>  	}
>  
> -	master->enabled_events |= SVC_I3C_EVENT_IBI;
> +	master->enabled_events++;
>  	svc_i3c_master_enable_interrupts(master, SVC_I3C_MINT_SLVSTART);
>  
>  	return i3c_master_enec_locked(m, dev->info.dyn_addr, I3C_CCC_EVENT_SIR);
> @@ -1544,7 +1544,7 @@ static int svc_i3c_master_disable_ibi(struct i3c_dev_desc *dev)
>  	struct svc_i3c_master *master = to_svc_i3c_master(m);
>  	int ret;
>  
> -	master->enabled_events &= ~SVC_I3C_EVENT_IBI;
> +	master->enabled_events--;
>  	if (!master->enabled_events)
>  		svc_i3c_master_disable_interrupts(master);
>  
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
