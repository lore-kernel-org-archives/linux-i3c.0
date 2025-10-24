Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A139FCCF9E0
	for <linux-i3c@archiver.kernel.org>; Fri, 24 Oct 2025 16:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GVIS61k0EcsK9E9j3beawQlt0kkd4y33OEsCqSe6UfQ=; b=haVHs21RzJLCP5
	JvS6IRQ/mt98Sd5pGx7Y5Q7BUGcafbzt19TmnpMcWS7PwCr/9TObMkVEj3ran7BrAgTuOcjzo0/cc
	lL1VT0AUmftQMvpWMZ5+tMzeOwA7uUwGiBOnMKk3eVRvTdt+FQ4gymRgX9DScM5TlMoYhh6HsBGvI
	cnJFvtzhlhxkrR3yOn/TONgvNAhDbtiR6cJAxbSacMb2yPfEH7k9IXc9FB8fKJ3mKUi/ujrJzYfCo
	VhbboGDV6Lii7q6cbne4yfER4rywn6Ip/IPKQ4JG+ELv8bygw9vDvJo8LqRnusXYHr6gTn+8In1DU
	4yEQF7QCoBCxtCpbkgZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKGe-00000009tbT-1kIs;
	Fri, 24 Oct 2025 16:03:52 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKGb-00000009taQ-1KrU
	for linux-i3c@lists.infradead.org;
	Fri, 24 Oct 2025 16:03:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761321830; x=1792857830;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=4rQ06hcRDPh06TcIr4Hhsm2kdiwKuNYxumRXFNrUjJA=;
  b=E8LewufVOxQ5HbMhl4pPzsvceo8qzmYX8Zw0jI61OYSmJYCHZ/kQduSA
   SnjYLzl0Ahru1o6ZAzTWcobcGe5Qe9d7SDFRVLvmMg9uCTYw8fQK5QSCh
   nilq95pjqPgfPYHCN2Bjz7ozsi+Xt0PV7qeO/OBIIoTrfq1LT9/sFrVvb
   ENVWn244n+WWYnIhlUUKarnp8lUtzixF8fhFBhlm0VyKA5YFmDK7rpVD7
   0OMD20wEnLsF5HW3GdRRk23e8S0lJYLebnWGHc2+77+tMwQ+L80hge7EF
   RTaTeMAwsJ7xs41devNKfcmj3Dt8NgfWXVYWxpt7sHvNaiti52koYOcTW
   Q==;
X-CSE-ConnectionGUID: F96njwrtSMeE1bbb6Imvjg==
X-CSE-MsgGUID: lA90CEurQhuzEpdQZ2rs9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74949800"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="74949800"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 09:03:49 -0700
X-CSE-ConnectionGUID: oM1QeLgRR2izo7nsOkSYWQ==
X-CSE-MsgGUID: nRGZyRpfSYK4S0x3HQThpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="215117928"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.245.147])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 09:03:45 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1vCKGT-00000002Cpo-42le;
	Fri, 24 Oct 2025 19:03:41 +0300
Date: Fri, 24 Oct 2025 19:03:41 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-iio@vger.kernel.org, joshua.yeong@starfivetech.com,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v6 1/5] i3c: Add HDR API support
Message-ID: <aPujXUO2h5zHy2fj@smile.fi.intel.com>
References: <20251014-i3c_ddr-v6-0-3afe49773107@nxp.com>
 <20251014-i3c_ddr-v6-1-3afe49773107@nxp.com>
 <aPnmCwwZVZ5egqkP@smile.fi.intel.com>
 <aPpHTej/vKfiN68k@lizhi-Precision-Tower-5810>
 <aPpyf1xPmU_koEXH@smile.fi.intel.com>
 <aPq/6/+63sHuq/qy@lizhi-Precision-Tower-5810>
 <aPsZB44qXR77jNHF@smile.fi.intel.com>
 <aPuHKs3u344zoI2+@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aPuHKs3u344zoI2+@lizhi-Precision-Tower-5810>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_090349_423101_AB56758C 
X-CRM114-Status: GOOD (  23.65  )
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

On Fri, Oct 24, 2025 at 10:03:22AM -0400, Frank Li wrote:
> On Fri, Oct 24, 2025 at 09:13:27AM +0300, Andy Shevchenko wrote:
> > On Thu, Oct 23, 2025 at 07:53:15PM -0400, Frank Li wrote:
> > > On Thu, Oct 23, 2025 at 09:22:55PM +0300, Andy Shevchenko wrote:
> > > > On Thu, Oct 23, 2025 at 11:18:37AM -0400, Frank Li wrote:
> > > > > On Thu, Oct 23, 2025 at 11:23:39AM +0300, Andy Shevchenko wrote:
> > > > > > On Tue, Oct 14, 2025 at 12:40:00PM -0400, Frank Li wrote:

...

> > > > > > > +/* keep back compatible */
> > > > > > > +#define i3c_priv_xfer i3c_xfer
> > > > > >
> > > > > > How many of the current users do this? Can't we just rename tre=
ewide?
> > > > >
> > > > > git grep -r priv_xfer drivers/
> > > >
> > > > `git grep -lw ...` is a better approach :-)
> > > >
> > > > > drivers/base/regmap/regmap-i3c.c:       struct i3c_priv_xfer xfer=
s[] =3D {
> > > > > drivers/base/regmap/regmap-i3c.c:       return i3c_device_do_priv=
_xfers(i3c, xfers, 1);
> > > > > drivers/base/regmap/regmap-i3c.c:       struct i3c_priv_xfer xfer=
s[2];
> > > > > drivers/base/regmap/regmap-i3c.c:       return i3c_device_do_priv=
_xfers(i3c, xfers, 2);
> > > > > drivers/hwmon/lm75.c:   struct i3c_priv_xfer xfers[] =3D {
> > > > > drivers/hwmon/lm75.c:   ret =3D i3c_device_do_priv_xfers(i3cdev, =
xfers, 2);
> > > > > drivers/hwmon/lm75.c:   struct i3c_priv_xfer xfers[] =3D {
> > > > > drivers/hwmon/lm75.c:   return i3c_device_do_priv_xfers(i3cdev, x=
fers, 1);
> > > > > drivers/i3c/device.c:int i3c_device_do_xfers(struct i3c_device *d=
ev, struct i3c_priv_xfer *xfers,
> > > > > drivers/i3c/master.c:   if (!ops->priv_xfers && !ops->i3c_xfers)
> > > > > drivers/i3c/master.c:   if (!master->ops->priv_xfers)
> > > > > drivers/i3c/master.c:   return master->ops->priv_xfers(dev, xfers=
, nxfers);
> > > > > drivers/i3c/master/dw-i3c-master.c:static int dw_i3c_master_priv_=
xfers(struct i3c_dev_desc *dev,
> > > > > drivers/i3c/master/dw-i3c-master.c:                              =
   struct i3c_priv_xfer *i3c_xfers,
> > > > > drivers/i3c/master/dw-i3c-master.c:     .priv_xfers =3D dw_i3c_ma=
ster_priv_xfers,
> > > > > drivers/i3c/master/i3c-master-cdns.c:static int cdns_i3c_master_p=
riv_xfers(struct i3c_dev_desc *dev,
> > > > > drivers/i3c/master/i3c-master-cdns.c:                            =
     struct i3c_priv_xfer *xfers,
> > > > > drivers/i3c/master/i3c-master-cdns.c:   .priv_xfers =3D cdns_i3c_=
master_priv_xfers,
> > > > > drivers/i3c/master/mipi-i3c-hci/core.c:static int i3c_hci_priv_xf=
ers(struct i3c_dev_desc *dev,
> > > > > drivers/i3c/master/mipi-i3c-hci/core.c:                       str=
uct i3c_priv_xfer *i3c_xfers,
> > > > > drivers/i3c/master/mipi-i3c-hci/core.c: .priv_xfers             =
=3D i3c_hci_priv_xfers,
> > > > > drivers/i3c/master/renesas-i3c.c:static int renesas_i3c_priv_xfer=
s(struct i3c_dev_desc *dev, struct i3c_priv_xfer *i3c_xfers,
> > > > > drivers/i3c/master/renesas-i3c.c:       .priv_xfers =3D renesas_i=
3c_priv_xfers,
> > > > > drivers/i3c/master/svc-i3c-master.c:    struct i3c_priv_xfer *xfe=
r;
> > > > > drivers/i3c/master/svc-i3c-master.c:     * at svc_i3c_master_priv=
_xfers().
> > > > > drivers/i3c/master/svc-i3c-master.c:static int svc_i3c_master_i3c=
_xfers(struct i3c_dev_desc *dev, struct i3c_priv_xfer *xfers,
> > > > > drivers/net/mctp/mctp-i3c.c:    struct i3c_priv_xfer xfer =3D { .=
rnw =3D 1, .len =3D mi->mrl };
> > > > > drivers/net/mctp/mctp-i3c.c:    rc =3D i3c_device_do_priv_xfers(m=
i->i3c, &xfer, 1);
> > > > > drivers/net/mctp/mctp-i3c.c:    struct i3c_priv_xfer xfer =3D { .=
rnw =3D false };
> > > > > drivers/net/mctp/mctp-i3c.c:    rc =3D i3c_device_do_priv_xfers(m=
i->i3c, &xfer, 1);
> > > > >
> > > > > After this patch merged, I can clean up it at difference subsytem=
. After
> > > > > all cleanup done, we can safely remove this define.
> > > >
> > > > I counted 9. I think it's not a big deal to convert all of them at =
once without
> > > > leaving an intermediate state. But this is a call for the I=B3C sub=
system maintaiiner.
> > >
> > > There also are other cleanup works. The key point is that everyone ag=
ree my
> > > HDR solution. Cleanup these is not big deal. I am not sure how to avo=
id
> > > build broken at difference subsystem.
> > >
> > > After this patch merge, cleanup will be easier and safer.
> >
> > Then leave that renaming to the cleanup series. No need to use a define=
, just
> > use the old function name.
> =

> Using old function name for HDR will be very strange and conflict with
> spec's name convention.
> =

> The term 'private' transfer in i3c spec is specific for SDR transfer. It
> is neccessary steps to complete whole naming switches.

Right, but this out of scope OR a prerequisite to this series. My point that
these two shouldn't be mixed and one left half-baked.

-- =

With Best Regards,
Andy Shevchenko



-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
