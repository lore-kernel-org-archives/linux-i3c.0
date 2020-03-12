Return-Path: <SRS0=SUia=46=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A449DC10DCE
	for <linux-i3c@archiver.kernel.org>; Fri, 13 Mar 2020 08:54:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B9CE206FA
	for <linux-i3c@archiver.kernel.org>; Fri, 13 Mar 2020 08:54:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J46JfrqD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B9CE206FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XnuGGI8KCEnKFNvMxah5Wt1Yfxu1EUuc1Ddk1ZzgxRw=; b=J46JfrqDlQRzB1
	0iNxRFFg4z7dIWKmGghrlxIRk3U5OL6eYjc+uGra1bRfG2a2kAussLUm39+5HuTvpktUGebfkLuNd
	ihnxB4IWBxHDTaCBSfamyjUQCW4pFie6HUA/o97SL0ns2U7+uVL5cxjRnPDdwbpO7vybYenulKfWl
	bZJLe5FfLH9sraxA+zxDtUtLcy2FxkJi8CWgcQUmpKPaH85/ASMD7SpsxZJy1Lm0XMzv5jJsgXHX7
	rVbyBT+FchJdoXTmZvO/t1E1e8fpIh8TxxIUJb7jP4DA9m1VXCl0BKaMuOZ3QiFNu0PRkyYHYJaeH
	cxDUjNIri6b1uQbkJbRA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCg5C-0003FC-Eb; Fri, 13 Mar 2020 08:54:18 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCMGa-0005uB-E9
 for linux-i3c@lists.infradead.org; Thu, 12 Mar 2020 11:44:46 +0000
X-Originating-IP: 90.66.181.224
Received: from localhost (lfbn-lyo-1-2013-224.w90-66.abo.wanadoo.fr
 [90.66.181.224])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 7A727240004;
 Thu, 12 Mar 2020 11:44:32 +0000 (UTC)
Date: Thu, 12 Mar 2020 12:44:32 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [RFC PATCH 3/7] i2c: allow DT nodes without 'compatible'
Message-ID: <20200312114432.GA3384@piout.net>
References: <20200220172403.26062-1-wsa+renesas@sang-engineering.com>
 <20200220172403.26062-4-wsa+renesas@sang-engineering.com>
 <CAMuHMdWaPfc050dZiRr+gAFzsdjSo9Vo70ztWgrMGPJxLUqupw@mail.gmail.com>
 <e43eaaf1-a294-902f-9a52-ebf8b29acab1@lucaceresoli.net>
 <20200312111950.GA1013@ninjato>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200312111950.GA1013@ninjato>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200312_044444_611758_0D275180 
X-CRM114-Status: GOOD (  18.34  )
X-Mailman-Approved-At: Fri, 13 Mar 2020 01:54:17 -0700
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Kieran Bingham <kieran@ksquared.org.uk>,
 Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jacopo Mondi <jacopo@jmondi.org>, Vladimir Zapolskiy <vz@mleia.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Linux I2C <linux-i2c@vger.kernel.org>, Luca Ceresoli <luca@lucaceresoli.net>,
 linux-i3c@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On 12/03/2020 12:19:51+0100, Wolfram Sang wrote:
> > Clearly this does not fit the case reported by Alexandre: a device
> > having a driver which is known to be badly buggy, so we don't want to
> > instantiate it. But again, this should not affect DT as it is not
> > describing the HW, but only an implementation detail. Probably disabling
> > or blacklisting the driver would be a better option there?
> 
> "Fixing the driver" is the first thing coming to my mind ;) But yeah,
> blacklisting would be another good solution. With only the information
> above, DT is not the right place to fix a broken driver.
> 

To be clear, the driver is working properly but the HW isn't. It is a
PMIC and we need to avoid linux talking to it so the PMIC doesn't end up
killing the bus.

We end up with a node properly described in the device tree but with
status = "disabled". The relevance to the discussion was that you know
what is there and you want to avoid using its address.

See the pmic node on i2c1 in arch/arm/boot/dts/at91-sama5d3_xplained.dts
for what I'm referring to.

> > My apologies to Wolfram, I appreciate a lot the effort you are doing,
> > but before reviewing this patch I have never realized what I tried to
> > explain above.
> 
> All good, Luca! Talking over code usually brings in viewpoints which
> have been missed so far. This is expected. Actually, I am very happy to
> have this discussion!
> 
> All the best,
> 
>    Wolfram
> 



-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
