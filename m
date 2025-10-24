Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00ACDCCD1AB
	for <linux-i3c@archiver.kernel.org>; Fri, 24 Oct 2025 06:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yX2mrqW/7P4oG5IB764Oz3f6UX9IDBy5F/As3O+9ScQ=; b=0fMCLoay3Bkipb
	Oq/QcNs5EwUArou/ViH4UmeXkEhsQLascnSFn+omoXnOFxwe98dqUgBPuPzZo70BLlTegkmZJxIxT
	2RjFurRDG4MGS86Qi/mxeLdfq+KCaiSpDEXUD4TZuw64KaEIvqr8JShi8nApJomWedwncvkyyg9N0
	5HSSkDMicHf/X+tOW/Puj5qVjmh9EjQYVYL07yHiqf2JhGdS9W99NuScZ7noBlsVMXCwfldjjh9hP
	ZrP9S4Ql8+5PhuKLzymMJfdVRPlgkfHD5jSWGj+8rDEGfZD4oSV/Ongda1c+J8arn91pFUSs+Q7SB
	POgQZwyYnFkD+tXslVEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCB3R-00000008KVL-3BaH;
	Fri, 24 Oct 2025 06:13:37 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCB3P-00000008KV1-1eDQ
	for linux-i3c@lists.infradead.org;
	Fri, 24 Oct 2025 06:13:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761286416; x=1792822416;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=pPg4tGMDdSKgzOhv/19H1ClKHTpBCPpph/N7jY8PuY0=;
  b=TutqQKVWPcmQDxCqpClK5Je+gO2goj86pU0iUIIfxk+xzLuVfyZqkxyg
   ywtdgfG/spmc4UudxXWFPQGTZ91dgGpIR8nf+NIX5IH4uG5ExGAuR4j4K
   IxSPQ8RPPdDlSG/bLNjEqSncn5xg4BVOdGVXrYrrDa5nj6F2Y53lOUgHO
   v/jasdebyZCVofgLdCTuMVhjZse8VYIuDMTRxAIKpPX3BcnP0gxI+i5Pt
   Xw0WquOZqMNq5UwLFEWLSb5HtB7y9CECfs94bQ3+Gp/u53Q/TQZJ44gYI
   ax52c3az27sUN37GNnIhxEQJeV1mSsw+I+OCHAMsNmpPN2aKKaIev6MUa
   w==;
X-CSE-ConnectionGUID: u62phUc+QFaUFAwkqjzxNQ==
X-CSE-MsgGUID: O+D3tK2aQN+U44Gf6CkYVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81091916"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="81091916"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 23:13:34 -0700
X-CSE-ConnectionGUID: EDZuUWOTS7iZKdMy7RFhHw==
X-CSE-MsgGUID: zgPfV1+5TsCKMukpOqL70Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="188740617"
Received: from opintica-mobl1 (HELO ashevche-desk.local) ([10.245.245.60])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 23:13:31 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1vCB3H-000000024n3-3VVz;
	Fri, 24 Oct 2025 09:13:27 +0300
Date: Fri, 24 Oct 2025 09:13:27 +0300
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
Message-ID: <aPsZB44qXR77jNHF@smile.fi.intel.com>
References: <20251014-i3c_ddr-v6-0-3afe49773107@nxp.com>
 <20251014-i3c_ddr-v6-1-3afe49773107@nxp.com>
 <aPnmCwwZVZ5egqkP@smile.fi.intel.com>
 <aPpHTej/vKfiN68k@lizhi-Precision-Tower-5810>
 <aPpyf1xPmU_koEXH@smile.fi.intel.com>
 <aPq/6/+63sHuq/qy@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aPq/6/+63sHuq/qy@lizhi-Precision-Tower-5810>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_231335_466426_F1BA8F44 
X-CRM114-Status: GOOD (  19.22  )
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

On Thu, Oct 23, 2025 at 07:53:15PM -0400, Frank Li wrote:
> On Thu, Oct 23, 2025 at 09:22:55PM +0300, Andy Shevchenko wrote:
> > On Thu, Oct 23, 2025 at 11:18:37AM -0400, Frank Li wrote:
> > > On Thu, Oct 23, 2025 at 11:23:39AM +0300, Andy Shevchenko wrote:
> > > > On Tue, Oct 14, 2025 at 12:40:00PM -0400, Frank Li wrote:

...

> > > > > +/* keep back compatible */
> > > > > +#define i3c_priv_xfer i3c_xfer
> > > >
> > > > How many of the current users do this? Can't we just rename treewid=
e?
> > >
> > > git grep -r priv_xfer drivers/
> >
> > `git grep -lw ...` is a better approach :-)
> >
> > > drivers/base/regmap/regmap-i3c.c:       struct i3c_priv_xfer xfers[] =
=3D {
> > > drivers/base/regmap/regmap-i3c.c:       return i3c_device_do_priv_xfe=
rs(i3c, xfers, 1);
> > > drivers/base/regmap/regmap-i3c.c:       struct i3c_priv_xfer xfers[2];
> > > drivers/base/regmap/regmap-i3c.c:       return i3c_device_do_priv_xfe=
rs(i3c, xfers, 2);
> > > drivers/hwmon/lm75.c:   struct i3c_priv_xfer xfers[] =3D {
> > > drivers/hwmon/lm75.c:   ret =3D i3c_device_do_priv_xfers(i3cdev, xfer=
s, 2);
> > > drivers/hwmon/lm75.c:   struct i3c_priv_xfer xfers[] =3D {
> > > drivers/hwmon/lm75.c:   return i3c_device_do_priv_xfers(i3cdev, xfers=
, 1);
> > > drivers/i3c/device.c:int i3c_device_do_xfers(struct i3c_device *dev, =
struct i3c_priv_xfer *xfers,
> > > drivers/i3c/master.c:   if (!ops->priv_xfers && !ops->i3c_xfers)
> > > drivers/i3c/master.c:   if (!master->ops->priv_xfers)
> > > drivers/i3c/master.c:   return master->ops->priv_xfers(dev, xfers, nx=
fers);
> > > drivers/i3c/master/dw-i3c-master.c:static int dw_i3c_master_priv_xfer=
s(struct i3c_dev_desc *dev,
> > > drivers/i3c/master/dw-i3c-master.c:                                 s=
truct i3c_priv_xfer *i3c_xfers,
> > > drivers/i3c/master/dw-i3c-master.c:     .priv_xfers =3D dw_i3c_master=
_priv_xfers,
> > > drivers/i3c/master/i3c-master-cdns.c:static int cdns_i3c_master_priv_=
xfers(struct i3c_dev_desc *dev,
> > > drivers/i3c/master/i3c-master-cdns.c:                                =
 struct i3c_priv_xfer *xfers,
> > > drivers/i3c/master/i3c-master-cdns.c:   .priv_xfers =3D cdns_i3c_mast=
er_priv_xfers,
> > > drivers/i3c/master/mipi-i3c-hci/core.c:static int i3c_hci_priv_xfers(=
struct i3c_dev_desc *dev,
> > > drivers/i3c/master/mipi-i3c-hci/core.c:                       struct =
i3c_priv_xfer *i3c_xfers,
> > > drivers/i3c/master/mipi-i3c-hci/core.c: .priv_xfers             =3D i=
3c_hci_priv_xfers,
> > > drivers/i3c/master/renesas-i3c.c:static int renesas_i3c_priv_xfers(st=
ruct i3c_dev_desc *dev, struct i3c_priv_xfer *i3c_xfers,
> > > drivers/i3c/master/renesas-i3c.c:       .priv_xfers =3D renesas_i3c_p=
riv_xfers,
> > > drivers/i3c/master/svc-i3c-master.c:    struct i3c_priv_xfer *xfer;
> > > drivers/i3c/master/svc-i3c-master.c:     * at svc_i3c_master_priv_xfe=
rs().
> > > drivers/i3c/master/svc-i3c-master.c:static int svc_i3c_master_i3c_xfe=
rs(struct i3c_dev_desc *dev, struct i3c_priv_xfer *xfers,
> > > drivers/net/mctp/mctp-i3c.c:    struct i3c_priv_xfer xfer =3D { .rnw =
=3D 1, .len =3D mi->mrl };
> > > drivers/net/mctp/mctp-i3c.c:    rc =3D i3c_device_do_priv_xfers(mi->i=
3c, &xfer, 1);
> > > drivers/net/mctp/mctp-i3c.c:    struct i3c_priv_xfer xfer =3D { .rnw =
=3D false };
> > > drivers/net/mctp/mctp-i3c.c:    rc =3D i3c_device_do_priv_xfers(mi->i=
3c, &xfer, 1);
> > >
> > > After this patch merged, I can clean up it at difference subsytem. Af=
ter
> > > all cleanup done, we can safely remove this define.
> >
> > I counted 9. I think it's not a big deal to convert all of them at once=
 without
> > leaving an intermediate state. But this is a call for the I=B3C subsyst=
em maintaiiner.
> =

> There also are other cleanup works. The key point is that everyone agree =
my
> HDR solution. Cleanup these is not big deal. I am not sure how to avoid
> build broken at difference subsystem.
> =

> After this patch merge, cleanup will be easier and safer.

Then leave that renaming to the cleanup series. No need to use a define, ju=
st
use the old function name.

-- =

With Best Regards,
Andy Shevchenko



-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
