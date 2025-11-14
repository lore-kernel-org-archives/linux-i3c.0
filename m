Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C92D3CE8D60
	for <linux-i3c@archiver.kernel.org>; Fri, 14 Nov 2025 17:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sjKxBvd0vmiJigyErHj+C375Iiy7PQg4BgjuvRdFuSA=; b=kA/prOtXcOSQLi
	34G4Z8fdFVTAoTEC+yjXxplaH/lhp/sR97g7NaBguyPK1ju6C3xQuSyAvPhqr/rnXF+velNrDzOqI
	puIKlq377jGBrgkUe+dAREYLTa+EkmVCllOUGQCu6FP/2Gq0RVK4fEKHzdkkuVDDZLdI2r32KF5Ki
	zRVgC6NAkv5h58Zy3zBvqAsrntw+KOi3Vl9SlehO8NeUqIqvcAsJK7vmDH1ZrzE5xd1kKIgUPNo8H
	1CAPb+Y1vKDyenz8gm+CTyvvkRqTnfGzBAxH+d0gSjLEF0YbUqZk34PM4dRVC/k3SSZyNvehDXtwV
	aBU9laIsvcOI9+REI5qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxTz-0000000CpR5-2S7W;
	Fri, 14 Nov 2025 17:21:12 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxTs-0000000CpQP-1cCP
	for linux-i3c@lists.infradead.org;
	Fri, 14 Nov 2025 17:21:09 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 71F241A1AAB;
	Fri, 14 Nov 2025 17:21:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3817D6060E;
	Fri, 14 Nov 2025 17:21:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9818410371C23;
	Fri, 14 Nov 2025 18:20:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763140859; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YBIOibJH0wXbFI7hpD4CJ/NOLofxhQo6+ElJdA/NnKw=;
	b=NLFAkv39+gsgRKr0YKRSHvJn9qU76qltBj3G7W3J28EoN7dImpxpUImX0YpfiHIE8MRyws
	awQX2K9SWIVAS1IBIa5h5toUeavFNlVPVvmE+9Xx3JKjPLOFhynkJGjaMF2bMTxKLE5wId
	aDFizfJm2Jc/xV4wjtgmLdPV4aO+nODXzg3sP9I4rGOvbJZeLhQCEhIPHiBoprBQ3Lq+uM
	f+6n/SfTgKM6VFUBU749dSDV8zYbdh5QB91ygzOXR3tpSfQ7f0h65RLHxoK24/Or4jN0ev
	ka2NoJ3UnhXk8fOadkGp0APj05s4OkO8uZ7A0C/3wUzjYZgbdbg3zO7NAzN3lg==
Date: Fri, 14 Nov 2025 18:20:58 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 04/13] i3c: mipi-i3c-hci-pci: Use readl_poll_timeout()
Message-ID: <202511141720583d31a5e7@mail.local>
References: <20251112100339.51726-1-adrian.hunter@intel.com>
 <20251112100339.51726-5-adrian.hunter@intel.com>
 <aRSu/cH5/m1TtZil@lizhi-Precision-Tower-5810>
 <20251114160205b95bb565@mail.local>
 <aRdcOH3vXPkxWScy@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aRdcOH3vXPkxWScy@lizhi-Precision-Tower-5810>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_092104_580233_0346EBBE 
X-CRM114-Status: GOOD (  26.05  )
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

On 14/11/2025 11:43:36-0500, Frank Li wrote:
> On Fri, Nov 14, 2025 at 05:02:05PM +0100, Alexandre Belloni wrote:
> > On 12/11/2025 10:59:57-0500, Frank Li wrote:
> > > On Wed, Nov 12, 2025 at 12:03:30PM +0200, Adrian Hunter wrote:
> > > > Use readl_poll_timeout() instead of open-coding the polling loop.
> > >
> > > nice
> > > >
> > > > Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> > > > ---
> > > >  drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 14 ++++++----=
----
> > > >  1 file changed, 6 insertions(+), 8 deletions(-)
> > > >
> > > > diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/d=
rivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> > > > index c74cc511a344..c15e0556a691 100644
> > > > --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> > > > +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> > > > @@ -8,6 +8,7 @@
> > > >   */
> > > >  #include <linux/acpi.h>
> > > >  #include <linux/idr.h>
> > > > +#include <linux/iopoll.h>
> > > >  #include <linux/kernel.h>
> > > >  #include <linux/module.h>
> > > >  #include <linux/pci.h>
> > > > @@ -24,11 +25,12 @@ static DEFINE_IDA(mipi_i3c_hci_pci_ida);
> > > >  #define INTEL_RESETS			0x04
> > > >  #define INTEL_RESETS_RESET		BIT(0)
> > > >  #define INTEL_RESETS_RESET_DONE		BIT(1)
> > > > +#define INTEL_RESETS_TIMEOUT_US		10000
> > >
> > > 10 * USEC_PER_MSEC
> >
> > This is super hard nitpicking, I guess everyone knows 10000=B5s is 10ms
> =

> It is from
> https://lore.kernel.org/all/aPnrc-Z5WVJorGr7@smile.fi.intel.com/
> =


Well, Andy is super nitpicky. I guess 10000 has US just before so there
won't be any confusion on the actual unit

In your patch, I wouldn't change it for MMC5633_WAIT_SET_RESET_US but I
agree the call to regmap_read_poll_timeout needs to be clearer.

> Generally, I only provide such nit at early version.
> =

> I think benefit is avoid miss count 0. Maybe C23, 10'000, especially when
> number is big.
> =

> Frank
> >
> > >
> > > Frank
> > > >
> > > >  static int intel_init(struct pci_dev *pci)
> > > >  {
> > > > -	unsigned long timeout;
> > > >  	void __iomem *priv;
> > > > +	u32 reg;
> > > >  	int ret;
> > > >
> > > >  	priv =3D devm_ioremap(&pci->dev,
> > > > @@ -43,13 +45,9 @@ static int intel_init(struct pci_dev *pci)
> > > >
> > > >  	/* Assert reset, wait for completion and release reset */
> > > >  	writel(0, priv + INTEL_RESETS);
> > > > -	timeout =3D jiffies + msecs_to_jiffies(10);
> > > > -	while (!(readl(priv + INTEL_RESETS) &
> > > > -		 INTEL_RESETS_RESET_DONE)) {
> > > > -		if (time_after(jiffies, timeout))
> > > > -			break;
> > > > -		cpu_relax();
> > > > -	}
> > > > +	readl_poll_timeout(priv + INTEL_RESETS, reg,
> > > > +			   reg & INTEL_RESETS_RESET_DONE, 0,
> > > > +			   INTEL_RESETS_TIMEOUT_US);
> > > >  	writel(INTEL_RESETS_RESET, priv + INTEL_RESETS);
> > > >
> > > >  	return 0;
> > > > --
> > > > 2.51.0
> > > >
> > > >
> > > > --
> > > > linux-i3c mailing list
> > > > linux-i3c@lists.infradead.org
> > > > http://lists.infradead.org/mailman/listinfo/linux-i3c
> >
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
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
