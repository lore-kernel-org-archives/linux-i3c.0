Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 152D4CE8D4D
	for <linux-i3c@archiver.kernel.org>; Fri, 14 Nov 2025 16:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dJRW39DAfUWy2CreZmRbmvFAE9ud6xdlBhnJw7V2FAI=; b=D5LPY5ZTP+yHIY
	qUUc23Zr8EAsMEbjOVlpxEV/dOAD7XeMhtRMp82RkMUPgaVD3NPnNBWaAvT2tQe7sPmE7IdIzi1tV
	1D/lg36rP8ANEV3cczsrNv8Cn4PJ4lXWmZtq62Qw3ODHnmfWRv3BTlA2/69GrA3jJVpXc5rBBrP4g
	RZxVrW6c5BfO4yNx93jzCD+fnXskigMh0B0nBLWtn8JZPFW5ujMLPL8va924G3boTAB/mXHF5mBmc
	H9ExUSkcbqxELf9H9rGeKa2qhYS9QhONo8h4Mw9ne7oVSusfVJGFe5f5HpKshtc7VAx+InrziRcMM
	hjLjBgORMyhVf1/vuF0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwFc-0000000CeHX-3Z1g;
	Fri, 14 Nov 2025 16:02:16 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwFY-0000000CeGq-3nkq
	for linux-i3c@lists.infradead.org;
	Fri, 14 Nov 2025 16:02:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 648024E416B3;
	Fri, 14 Nov 2025 16:02:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3A0436060E;
	Fri, 14 Nov 2025 16:02:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1CB2D10371CCB;
	Fri, 14 Nov 2025 17:02:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763136127; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CbBPQgJ0QB2BoAKPdhJjXxJQTXFFGUusCIAf4wOX1cM=;
	b=i4zcjhTrt8UISXS25z74vYEXSCSTKqhK9ocM4ZPZpN7iznuL4YHD61QAW/SlEOCxM+/tMJ
	BEHOIp7yAc/tV37opCIwvBv+muq1BSIPtdACHyOwPJuCzDnuLcYE6abBSxwbZETH9M5epg
	chz4dfWfNNHZg1LKC/mcNaa3Ur+MvH4Ap4F8I42FdlvB+JIWPAAzG9QXvEIY8xYYicXTNi
	gUI5OWtH1tCo1im8c0MtyxAVUq+4drXIG+HDDJNJ7DHxWj1KH/rw6Zujx9XrMWHVSDHA36
	owfl73vkB05arxVFJ2uBe1VrjY5adafAjachMTzTtmM+IURObneJKsINT0UOsg==
Date: Fri, 14 Nov 2025 17:02:05 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 04/13] i3c: mipi-i3c-hci-pci: Use readl_poll_timeout()
Message-ID: <20251114160205b95bb565@mail.local>
References: <20251112100339.51726-1-adrian.hunter@intel.com>
 <20251112100339.51726-5-adrian.hunter@intel.com>
 <aRSu/cH5/m1TtZil@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aRSu/cH5/m1TtZil@lizhi-Precision-Tower-5810>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_080213_423210_C8E46712 
X-CRM114-Status: GOOD (  18.84  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On 12/11/2025 10:59:57-0500, Frank Li wrote:
> On Wed, Nov 12, 2025 at 12:03:30PM +0200, Adrian Hunter wrote:
> > Use readl_poll_timeout() instead of open-coding the polling loop.
> =

> nice
> >
> > Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> > ---
> >  drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 14 ++++++--------
> >  1 file changed, 6 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drive=
rs/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> > index c74cc511a344..c15e0556a691 100644
> > --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> > +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> > @@ -8,6 +8,7 @@
> >   */
> >  #include <linux/acpi.h>
> >  #include <linux/idr.h>
> > +#include <linux/iopoll.h>
> >  #include <linux/kernel.h>
> >  #include <linux/module.h>
> >  #include <linux/pci.h>
> > @@ -24,11 +25,12 @@ static DEFINE_IDA(mipi_i3c_hci_pci_ida);
> >  #define INTEL_RESETS			0x04
> >  #define INTEL_RESETS_RESET		BIT(0)
> >  #define INTEL_RESETS_RESET_DONE		BIT(1)
> > +#define INTEL_RESETS_TIMEOUT_US		10000
> =

> 10 * USEC_PER_MSEC

This is super hard nitpicking, I guess everyone knows 10000=B5s is 10ms

> =

> Frank
> >
> >  static int intel_init(struct pci_dev *pci)
> >  {
> > -	unsigned long timeout;
> >  	void __iomem *priv;
> > +	u32 reg;
> >  	int ret;
> >
> >  	priv =3D devm_ioremap(&pci->dev,
> > @@ -43,13 +45,9 @@ static int intel_init(struct pci_dev *pci)
> >
> >  	/* Assert reset, wait for completion and release reset */
> >  	writel(0, priv + INTEL_RESETS);
> > -	timeout =3D jiffies + msecs_to_jiffies(10);
> > -	while (!(readl(priv + INTEL_RESETS) &
> > -		 INTEL_RESETS_RESET_DONE)) {
> > -		if (time_after(jiffies, timeout))
> > -			break;
> > -		cpu_relax();
> > -	}
> > +	readl_poll_timeout(priv + INTEL_RESETS, reg,
> > +			   reg & INTEL_RESETS_RESET_DONE, 0,
> > +			   INTEL_RESETS_TIMEOUT_US);
> >  	writel(INTEL_RESETS_RESET, priv + INTEL_RESETS);
> >
> >  	return 0;
> > --
> > 2.51.0
> >
> >
> > --
> > linux-i3c mailing list
> > linux-i3c@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-i3c

-- =

Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
