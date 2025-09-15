Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B53CAC58E
	for <linux-i3c@archiver.kernel.org>; Mon, 15 Sep 2025 08:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SSJB1A1mTatj9oPCma1oY0AAJhhzRTTDnxctFJjIfC8=; b=zVQ9uz4ckexBAq
	mNFzMsRgLmJOwImDfOwvZO4m4jX4E9ejou1r4g+TNzGsed0G9d1o/L2wLOld8JYIsZ7Q5EsgW40HF
	3xgDAsCxI2DsF6mQ8SIAgsvys9aPTMcXHNwCU+IVl4Wk3Lu2PZHZrYxI7h5T91guHfnZ4vS77wvd+
	6aGSTAjXlbvsZqKC+/CIXh3omQXlChPLOOJfFw1YifPniBG0PSC7qnensl24V37ab/YpXLqKpsZgi
	NCaaQvBbT1iehQMJwu+aqc6Wmc0JFbXDnBBIdaVqzUpJpSMgaJslymoIpY2dy10ivpE/ut0N1EX2O
	tE1bojPqvsXOtp+Ndt5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy4Mc-00000003A3l-3wK6;
	Mon, 15 Sep 2025 08:15:06 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy4MY-00000003A1x-2tJ0
	for linux-i3c@lists.infradead.org;
	Mon, 15 Sep 2025 08:15:05 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CD93F4E40C12;
	Mon, 15 Sep 2025 08:14:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A49FB6063F;
	Mon, 15 Sep 2025 08:14:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 39169102F2A89;
	Mon, 15 Sep 2025 10:14:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757924099; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=J4ZHyfOG3mddClrgERbeFUSggvWLdgY9gMYKYK4Xtdk=;
	b=jaUGRhRb51fDCGigVl6x9C544/OGs8vwh+ip42g7lPJPE78w3hHySjLc6AeWIlmGh4c6bG
	U4YdNgOr2zoqoDDW7ezJcyg2oQF/hkgifLTEtdQo9gxAbQMwFTcL5g9k23Lvb8qg6MUaWD
	Jvutg0lbbCIr+FXWDV0SXt98EwHDKbf8RfUIBXQGGR2P+iP7YfkQP38y1e9egHlUijX2qR
	+WvnrD8J5nBfn04cBnhyCPH1QD0lU91qoqK5xWEqb+R0zrsEWVKbxlS5P3LR4py4xLhI70
	koCIocyaKsw9nRySeMY5y3ZJYvfKQbbUhYK+4XCcIU2iKwcCxS4RNdv+QpX4Mw==
Date: Mon, 15 Sep 2025 10:14:55 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Frank Li <Frank.li@nxp.com>, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 5/5] i3c: mipi-i3c-hci: Convert remaining DBG() prints to
 dev_dbg()
Message-ID: <20250915081455ad63f5d9@mail.local>
References: <20250827103009.243771-1-jarkko.nikula@linux.intel.com>
 <20250827103009.243771-6-jarkko.nikula@linux.intel.com>
 <aMQuxQ2Rk8ILUl5i@lizhi-Precision-Tower-5810>
 <b5cd2d90-9b51-4760-9b2f-3505a6b02f73@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b5cd2d90-9b51-4760-9b2f-3505a6b02f73@linux.intel.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_011503_225238_C38F93E5 
X-CRM114-Status: GOOD (  18.92  )
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

On 15/09/2025 11:06:54+0300, Jarkko Nikula wrote:
> On 9/12/25 5:31 PM, Frank Li wrote:
> > On Wed, Aug 27, 2025 at 01:30:09PM +0300, Jarkko Nikula wrote:
> > > Get rid of local DBG() macro and convert remaining debug prints to
> > > dev_dbg() which can be controlled without code recompile when kernel is
> > > built with dynamic debug support.
> > > 
> > > Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> > > ---
> > >   drivers/i3c/master/mipi-i3c-hci/cmd_v1.c   |  9 ++-
> > >   drivers/i3c/master/mipi-i3c-hci/cmd_v2.c   |  7 ++-
> > >   drivers/i3c/master/mipi-i3c-hci/core.c     | 16 +++---
> > >   drivers/i3c/master/mipi-i3c-hci/dma.c      | 15 +++--
> > >   drivers/i3c/master/mipi-i3c-hci/ext_caps.c | 11 ++--
> > >   drivers/i3c/master/mipi-i3c-hci/hci.h      |  3 -
> > >   drivers/i3c/master/mipi-i3c-hci/pio.c      | 66 +++++++++++++---------
> > >   7 files changed, 72 insertions(+), 55 deletions(-)
> > ...
> > > -#define DBG(x, ...) pr_devel("%s: " x "\n", __func__, ##__VA_ARGS__)
> > > -
> > >   /* 32-bit word aware bit and mask macros */
> > >   #define W0_MASK(h, l)  GENMASK((h) - 0,  (l) - 0)
> > >   #define W1_MASK(h, l)  GENMASK((h) - 32, (l) - 32)
> > > diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/mipi-i3c-hci/pio.c
> > > index cde883137bc7..01e7d2833301 100644
> > > --- a/drivers/i3c/master/mipi-i3c-hci/pio.c
> > > +++ b/drivers/i3c/master/mipi-i3c-hci/pio.c
> > > @@ -213,7 +213,7 @@ static void hci_pio_cleanup(struct i3c_hci *hci)
> > >   	pio_reg_write(INTR_SIGNAL_ENABLE, 0x0);
> > > 
> > >   	if (pio) {
> > > -		DBG("status = %#x/%#x",
> > > +		dev_dbg(&hci->master.dev, "status = %#x/%#x",
> > >   		    pio_reg_read(INTR_STATUS), pio_reg_read(INTR_SIGNAL_ENABLE));
> > 
> > fix pio_reg_read() align to (
> > 
> Ah, this slipped my eyes. I can send a follow up patch giving kudos to you
> since this patch was now applied or leave it as it.

I fixed it while applying.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
