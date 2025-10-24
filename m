Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E81CCD1BF
	for <linux-i3c@archiver.kernel.org>; Fri, 24 Oct 2025 21:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EaSVTpwS3+w0/4TwauJYeRb7XDFPtPAZbRHxmjDhCy0=; b=z1paoE6NA2MJEU
	0LskXcAxVa/P/aXLdItC23iItdOWseK6cXIzYB7l8n0zrSUBVfv/IiMxQWcbJ8uf3CrjuKm+1nHP6
	TEomZ35jM1e3htYx1Yodxf5bgdMw2QGfVIWXJTBr3qEx8uGLdbwecg0JD4LREI+7cwyckGzczdKIy
	RQAcd/TwkjMUDAJjQCniYaRavWq+fTWObHVe1dK+D5WJ5RfhBusmIV6vzkFV0deFByY6zgYZ/JSPG
	uWrAK7DIGUZRB10DQ5E4La9/JyojjQ2XNoWIwyLUOoLJYwF8at21a7FKIDqJMe98NJZH2Q7lIZzRG
	19qSfW2NFN98ZoZBv+/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCP5H-0000000AWu8-2PpS;
	Fri, 24 Oct 2025 21:12:27 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCP5D-0000000AWt6-02DW
	for linux-i3c@lists.infradead.org;
	Fri, 24 Oct 2025 21:12:25 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CBC5C4E412F7;
	Fri, 24 Oct 2025 21:12:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7A4CD60703;
	Fri, 24 Oct 2025 21:12:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D37E7102F22B5;
	Fri, 24 Oct 2025 23:12:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761340335; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=f1MDeUalmO2MBuHBwgqnu8xSGd9CwkEHdnrfQWRAgQ8=;
	b=OZVY0rw1nmczW237v6np6WNDFGQ6eR2zd3znpqkEWDafR9sNuuOUqwUVUhzR+5csGyUMqu
	ij3T6l9saudJiYUTmnsvl2Xi5nlZq3J0kyPd8Tql/Ns82Z9NGh90a4Lm+MlCnCxLryVh8S
	KBrrsGTu+0hpPp8k7pi1WG/zaRKG0oV5q3tjdi8KXdZ2QnaTa26nokWcHF+Ue5dLwX5yMF
	kIiunQ8OqPITEpQBqZaocyh3urX8kuNaPawctzTyBc18pfcZsr0EFHb1YzbfrQU9d6ZM1L
	cPBxprhTwc75j+aoy6sLKLnLsQZpfGsGAAh9hj0K8ziOSun3hTEywQcPLKJ2PQ==
Date: Fri, 24 Oct 2025 23:12:05 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
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
Message-ID: <20251024211205055af5b3@mail.local>
References: <20251014-i3c_ddr-v6-0-3afe49773107@nxp.com>
 <20251014-i3c_ddr-v6-1-3afe49773107@nxp.com>
 <aPnmCwwZVZ5egqkP@smile.fi.intel.com>
 <aPpHTej/vKfiN68k@lizhi-Precision-Tower-5810>
 <aPpyf1xPmU_koEXH@smile.fi.intel.com>
 <aPq/6/+63sHuq/qy@lizhi-Precision-Tower-5810>
 <aPsZB44qXR77jNHF@smile.fi.intel.com>
 <aPuHKs3u344zoI2+@lizhi-Precision-Tower-5810>
 <aPujXUO2h5zHy2fj@smile.fi.intel.com>
 <aPupaHEZM20Q8aJu@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aPupaHEZM20Q8aJu@lizhi-Precision-Tower-5810>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_141223_684640_97370704 
X-CRM114-Status: GOOD (  29.91  )
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

On 24/10/2025 12:29:28-0400, Frank Li wrote:
> On Fri, Oct 24, 2025 at 07:03:41PM +0300, Andy Shevchenko wrote:
> > On Fri, Oct 24, 2025 at 10:03:22AM -0400, Frank Li wrote:
> > > On Fri, Oct 24, 2025 at 09:13:27AM +0300, Andy Shevchenko wrote:
> > > > On Thu, Oct 23, 2025 at 07:53:15PM -0400, Frank Li wrote:
> > > > > On Thu, Oct 23, 2025 at 09:22:55PM +0300, Andy Shevchenko wrote:
> > > > > > On Thu, Oct 23, 2025 at 11:18:37AM -0400, Frank Li wrote:
> > > > > > > On Thu, Oct 23, 2025 at 11:23:39AM +0300, Andy Shevchenko wro=
te:
> > > > > > > > On Tue, Oct 14, 2025 at 12:40:00PM -0400, Frank Li wrote:
> >
> > ...
> >
> > > > > > > > > +/* keep back compatible */
> > > > > > > > > +#define i3c_priv_xfer i3c_xfer
> > > > > > > >
> > > > > > > > How many of the current users do this? Can't we just rename=
 treewide?
> > > > > > >
> > > > > > > git grep -r priv_xfer drivers/
> > > > > >
> > > > > > `git grep -lw ...` is a better approach :-)
> > > > > >
> > > > > > > drivers/base/regmap/regmap-i3c.c:       struct i3c_priv_xfer =
xfers[] =3D {
> > > > > > > drivers/base/regmap/regmap-i3c.c:       return i3c_device_do_=
priv_xfers(i3c, xfers, 1);
> > > > > > > drivers/base/regmap/regmap-i3c.c:       struct i3c_priv_xfer =
xfers[2];
> > > > > > > drivers/base/regmap/regmap-i3c.c:       return i3c_device_do_=
priv_xfers(i3c, xfers, 2);
> > > > > > > drivers/hwmon/lm75.c:   struct i3c_priv_xfer xfers[] =3D {
> > > > > > > drivers/hwmon/lm75.c:   ret =3D i3c_device_do_priv_xfers(i3cd=
ev, xfers, 2);
> > > > > > > drivers/hwmon/lm75.c:   struct i3c_priv_xfer xfers[] =3D {
> > > > > > > drivers/hwmon/lm75.c:   return i3c_device_do_priv_xfers(i3cde=
v, xfers, 1);
> > > > > > > drivers/i3c/device.c:int i3c_device_do_xfers(struct i3c_devic=
e *dev, struct i3c_priv_xfer *xfers,
> > > > > > > drivers/i3c/master.c:   if (!ops->priv_xfers && !ops->i3c_xfe=
rs)
> > > > > > > drivers/i3c/master.c:   if (!master->ops->priv_xfers)
> > > > > > > drivers/i3c/master.c:   return master->ops->priv_xfers(dev, x=
fers, nxfers);
> > > > > > > drivers/i3c/master/dw-i3c-master.c:static int dw_i3c_master_p=
riv_xfers(struct i3c_dev_desc *dev,
> > > > > > > drivers/i3c/master/dw-i3c-master.c:                          =
       struct i3c_priv_xfer *i3c_xfers,
> > > > > > > drivers/i3c/master/dw-i3c-master.c:     .priv_xfers =3D dw_i3=
c_master_priv_xfers,
> > > > > > > drivers/i3c/master/i3c-master-cdns.c:static int cdns_i3c_mast=
er_priv_xfers(struct i3c_dev_desc *dev,
> > > > > > > drivers/i3c/master/i3c-master-cdns.c:                        =
         struct i3c_priv_xfer *xfers,
> > > > > > > drivers/i3c/master/i3c-master-cdns.c:   .priv_xfers =3D cdns_=
i3c_master_priv_xfers,
> > > > > > > drivers/i3c/master/mipi-i3c-hci/core.c:static int i3c_hci_pri=
v_xfers(struct i3c_dev_desc *dev,
> > > > > > > drivers/i3c/master/mipi-i3c-hci/core.c:                      =
 struct i3c_priv_xfer *i3c_xfers,
> > > > > > > drivers/i3c/master/mipi-i3c-hci/core.c: .priv_xfers          =
   =3D i3c_hci_priv_xfers,
> > > > > > > drivers/i3c/master/renesas-i3c.c:static int renesas_i3c_priv_=
xfers(struct i3c_dev_desc *dev, struct i3c_priv_xfer *i3c_xfers,
> > > > > > > drivers/i3c/master/renesas-i3c.c:       .priv_xfers =3D renes=
as_i3c_priv_xfers,
> > > > > > > drivers/i3c/master/svc-i3c-master.c:    struct i3c_priv_xfer =
*xfer;
> > > > > > > drivers/i3c/master/svc-i3c-master.c:     * at svc_i3c_master_=
priv_xfers().
> > > > > > > drivers/i3c/master/svc-i3c-master.c:static int svc_i3c_master=
_i3c_xfers(struct i3c_dev_desc *dev, struct i3c_priv_xfer *xfers,
> > > > > > > drivers/net/mctp/mctp-i3c.c:    struct i3c_priv_xfer xfer =3D=
 { .rnw =3D 1, .len =3D mi->mrl };
> > > > > > > drivers/net/mctp/mctp-i3c.c:    rc =3D i3c_device_do_priv_xfe=
rs(mi->i3c, &xfer, 1);
> > > > > > > drivers/net/mctp/mctp-i3c.c:    struct i3c_priv_xfer xfer =3D=
 { .rnw =3D false };
> > > > > > > drivers/net/mctp/mctp-i3c.c:    rc =3D i3c_device_do_priv_xfe=
rs(mi->i3c, &xfer, 1);
> > > > > > >
> > > > > > > After this patch merged, I can clean up it at difference subs=
ytem. After
> > > > > > > all cleanup done, we can safely remove this define.
> > > > > >
> > > > > > I counted 9. I think it's not a big deal to convert all of them=
 at once without
> > > > > > leaving an intermediate state. But this is a call for the I=B3C=
 subsystem maintaiiner.
> > > > >
> > > > > There also are other cleanup works. The key point is that everyon=
e agree my
> > > > > HDR solution. Cleanup these is not big deal. I am not sure how to=
 avoid
> > > > > build broken at difference subsystem.
> > > > >
> > > > > After this patch merge, cleanup will be easier and safer.
> > > >
> > > > Then leave that renaming to the cleanup series. No need to use a de=
fine, just
> > > > use the old function name.
> > >
> > > Using old function name for HDR will be very strange and conflict with
> > > spec's name convention.
> > >
> > > The term 'private' transfer in i3c spec is specific for SDR transfer.=
 It
> > > is neccessary steps to complete whole naming switches.
> >
> > Right, but this out of scope OR a prerequisite to this series. My point=
 that
> > these two shouldn't be mixed and one left half-baked.
> =

> It doesn't make sense that the new iio driver still use old interface, th=
en
> replace new one later.
> =

> Is it okay I create new patch serial, which switch to new interface, but
> it's depend on this one. Let each maintainers decide how/when merge it?
> =


I'm fine with the define as I believe you are going to send the series
switching to the new name quickly enough.
I'll provide an immutable branch so the various subsystem maintainers
can apply that on their own.

-- =

Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
