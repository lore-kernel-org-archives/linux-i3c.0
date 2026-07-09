Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91818C43458
	for <linux-i3c@archiver.kernel.org>; Thu,  9 Jul 2026 10:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+g99ItWuuDbbZ3nZdLIBF3Ys0go6LVQNVeKiQbfGrFA=; b=bo+wivYXhTpDNB
	YTVdJkEMGJBHohFgTmR48QU6KOwUD6+HTT3pnvWIV8U4GUgFP0TD42AjCbmDK9l4ODZgaPzjSWFbK
	g+P0cwg+myiCeoFqypITL3QXrWEm4w7kth3sPe5YcE6Rd6eo3UZCpzQIqFwH+THAww50KS9F6v+wT
	t/rt10lVLAdMLnzH5XG1np0Mxec9tDZjNxWGtOQUgxRREYBYHqpGjBqqwa0/8Vf7VDp76wlAeLfDj
	8aPtW7zQZP3HbtBsgl+4hjZWbf6roUo5pQAC8BOHPVC7SnpAucrp8D0wYQGUf6bOqmh1ljpZS4nuz
	G69aYBp4MnBai62kcuZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whljB-00000001ty2-1Mub;
	Thu, 09 Jul 2026 10:11:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlj9-00000001txg-2wnq
	for linux-i3c@lists.infradead.org;
	Thu, 09 Jul 2026 10:11:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0F5A06001A;
	Thu,  9 Jul 2026 10:11:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 041B71F00A3A;
	Thu,  9 Jul 2026 10:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783591890;
	bh=B2OZqhPNbHPz2NNiIEyBu8B9EXpp87800ccaAr1cLSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ge9pmZYCCrMDIafhqKOcMhWdfl0kOvTMKId4wiFTsyTZSrwq9g9guaBtzXnuHnz/G
	 mCEIGpIfD5Nk6gpDjeCFFBRiFyxn6Kk15wkUECf7SgKVhaqk9oHaqpoP++yt5zkpcA
	 Z6qgZ4iwSfp1Ra36lEkRn2aRGsmusnj4s+aP6Vmx+gp8GjQ9kP3zZjT4wpTNgq6iJd
	 I0JZ8ZWn/yiPxfpAnJedRVQ+twXQ0o8BIxcr+D36tD/k32CC7B9gPFfxnIH3VAN1uw
	 EvvF/2tZCcXh5MBwGbf7loNoB9dfaeUXB6o6Qu/E03m1RWFNqXFMJg91FxCN/yu+0J
	 1yTs5l56Z2CfA==
Date: Thu, 9 Jul 2026 11:11:25 +0100
From: Lee Jones <lee@kernel.org>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"broonie@kernel.org" <broonie@kernel.org>,
	Frank Li <frank.li@nxp.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	Vikash Bansal <vikash.bansal@nxp.com>,
	Priyanka Jain <priyanka.jain@nxp.com>,
	Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Subject: Re: [EXT] Re: [PATCH v13 3/7] mfd: p3h2x4x: Add driver for NXP
 P3H2x4x i3c hub and on-die regulator
Message-ID: <20260709101125.GE2045740@google.com>
References: <20260701065755.2067793-1-lakshay.piplani@nxp.com>
 <20260701065755.2067793-4-lakshay.piplani@nxp.com>
 <20260708192034.GA1727174@google.com>
 <PAXPR04MB935077516683DD73CADC0FC6FBFE2@PAXPR04MB9350.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <PAXPR04MB935077516683DD73CADC0FC6FBFE2@PAXPR04MB9350.eurprd04.prod.outlook.com>
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

On Thu, 09 Jul 2026, Lakshay Piplani wrote:

> > > --- /dev/null
> > > +++ b/drivers/mfd/p3h2840.c
> > > @@ -0,0 +1,126 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright 2025-2026 NXP
> > 
> > Nit: '\n' here.
> > 
> 
> Sure, will remove the extra blank line.

In future, you only need to reply to review comments that you don't
agree with or require more information.  Snip the rest please.

> > > +static const struct regmap_config p3h2x4x_regmap_config = {
> > > +     .reg_bits = P3H2X4X_REG_BITS,
> > > +     .val_bits = P3H2X4X_VAL_BITS,
> > > +     .max_register = 0xFF,
> > > +};
> > > +
> > > +static int p3h2x4x_device_probe_i3c(struct i3c_device *i3cdev)
> > 
> > How many of these are comming down the pipe?
> > 
> > Might be worth expanding drivers/mfd/simple-mfd-i2c.c instead?
> 
> The P3H2x4x MFD supports both I2C and I3C transports. While the I2C path is conceptually similar to simple-mfd-i2c.c,
> the I3C path additionally requires device matching/probing, devm_regmap_init_i3c(), PID/manufacturer validation, and 
> retaining the parent struct i3c_device * for use by the hub child driver. As these requirements are specific to I3C 
> and not handled by the existing simple-MFD helpers, I believe a dedicated MFD driver is the more suitable approach.

Sure.  What I'm saying is; taking into consideration that this device
doesn't do anything useful (beyond generic device registration that
'simple' provides), if there are lots of I3C based devices coming, it
may be more prudent to create an I3C version.

However, it's probably too early to make that call.

> > >  enum i3c_dcr {
> > >       I3C_DCR_GENERIC_DEVICE = 0,
> > > +     I3C_DCR_HUB = 194,
> > 
> > What is this value?
> 
> 194 is the Device Characteristics Register (DCR) value assigned to I3C Hub devices by the MIPI I3C specification.

Is it described in base-10?  Registers are usually described in hex.

-- 
Lee Jones

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
