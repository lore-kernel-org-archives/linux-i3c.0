Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 088CBCCD193
	for <linux-i3c@archiver.kernel.org>; Thu, 23 Oct 2025 18:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+N7TnrgBIuaFyc3TluXq9g7yHGKaxQ3IfFSNEPEXUEE=; b=i8sTyKLs24G/Ok
	6nOyMawk8b2uIpzzD5yuHgIh3fYneKrg9BMQE4L3tx3i0E7RbHwme/vFWfN1sRmM9ZGTKp9tDfwy4
	URCzrTUsBurbN7PbN1Yjfljg4s7KS1nfHhkFsynHQc7De7ca7nZlylYBgaL94YOFbGsC7eCk6CR39
	+3VOr/1S/I1G+TU6Vo/Ycg4j3BORQY48Gp3t16/qLLDXF8m++fpFm/V//XRI0GKsCZJW7UCbEKjxV
	myKm+6yOSBjnIF8CNwAgfuGesiETs7kFZwCsNSOnmPlfX/dssNg8yddNEZ8VtT7GaDd5ARiAfupQD
	IpF2djvWaCN9V47czkbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBzxx-00000007DRW-3HER;
	Thu, 23 Oct 2025 18:23:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBzxv-00000007DQo-2Zim
	for linux-i3c@bombadil.infradead.org;
	Thu, 23 Oct 2025 18:23:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=lrUjqQk+rkHCgURnnP5tUbaJp/xRdrDjG4NvLCYEJ28=; b=Pm9f+jrIC34F/AY8ABVfaavDeE
	+7SMSEu5wIG8pQnhqdzRVkRDUrMcb7yf0B/E+rHIUtFunMp/YU04B2vsY4DyH5uQ9Akf6Z4ID49j+
	oM1u36s4Z4oZmjNcNUSGk0N9nvMpfVJjErCDg/Q7wRIuCgZDCjqzfkPou8eegtjFUG4TDEnelgjoa
	GfSk6CTdxorK250Fg5k+jpJP+p90WVUClW3SoAkmdhioQ9tmyOMMBeUK02PcHAO5Ti8kKGo0Vtjtn
	8sODInNk9E/MhORjRtN25dZynDeJmbQDaaA5Tded2l//ZNHZpWhyR6Gdzpau0x/fCnj2EwrRWSifM
	fZOU9Fyw==;
Received: from mgamail.intel.com ([198.175.65.14])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBz6D-00000001bDI-2QzN
	for linux-i3c@lists.infradead.org;
	Thu, 23 Oct 2025 17:27:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761243788; x=1792779788;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=itQoCTiDT763lfYHDtRGD+y331SN21ssLHWuGm9/rgU=;
  b=aaeoDXu8ajIKdVzCzdPYAqcZ7MWfVeiBMf838AekInB+TQfBts2C/tMs
   FVHnRrswnGDnf/WAowRU+94JJMAPQH9C8vIHljck40MX3EpfIPHea7k3P
   w4xV0qgHEB8xKfHzt1IAJPjg2kdnfmk4NeRJNA84nQTcoQWVeKZp9Y4DW
   Ab/KehzWiZuMNUBUSpJasnYVFBPzSFHc2Zs3O9QKaVzaM8tiGgTTLkxTA
   wspbpFAQva/h7sR2nExBRS2d1QyVEHFlYqhhUswM9xx2OXOAD8c7UTeIF
   tLdL91/tP6976QY27L6C6t3VGIB7922B05hPs/u7+7mShoQ7G78Xt4wm9
   A==;
X-CSE-ConnectionGUID: IHScR4XDTtme5SzYly5iqw==
X-CSE-MsgGUID: eX8o/uibSLWT9BHpR4JTpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67261786"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="67261786"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 11:23:03 -0700
X-CSE-ConnectionGUID: VBJQp3rZR4+EoB5RQ/iw6g==
X-CSE-MsgGUID: QeJwaJXPR9CLCG111xrtAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; 
   d="scan'208";a="215149141"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.163])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 11:22:59 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1vBzxg-000000020pu-0Ekg;
	Thu, 23 Oct 2025 21:22:56 +0300
Date: Thu, 23 Oct 2025 21:22:55 +0300
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
Message-ID: <aPpyf1xPmU_koEXH@smile.fi.intel.com>
References: <20251014-i3c_ddr-v6-0-3afe49773107@nxp.com>
 <20251014-i3c_ddr-v6-1-3afe49773107@nxp.com>
 <aPnmCwwZVZ5egqkP@smile.fi.intel.com>
 <aPpHTej/vKfiN68k@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aPpHTej/vKfiN68k@lizhi-Precision-Tower-5810>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_182742_064458_01388168 
X-CRM114-Status: GOOD (  35.19  )
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

On Thu, Oct 23, 2025 at 11:18:37AM -0400, Frank Li wrote:
> On Thu, Oct 23, 2025 at 11:23:39AM +0300, Andy Shevchenko wrote:
> > On Tue, Oct 14, 2025 at 12:40:00PM -0400, Frank Li wrote:

...

> > >  static int i3c_master_check_ops(const struct i3c_master_controller_o=
ps *ops)
> > >  {
> > > -	if (!ops || !ops->bus_init || !ops->priv_xfers ||
> > > +	if (!ops || !ops->bus_init ||
> > >  	    !ops->send_ccc_cmd || !ops->do_daa || !ops->i2c_xfers)
> > >  		return -EINVAL;
> > >
> > > +	if (!ops->priv_xfers && !ops->i3c_xfers)
> > > +		return -EINVAL;
> >
> > I would find the logically coupled proto-based xfers:
> >
> > 	if (!ops->i2c_xfers && !ops->i3c_xfers)
> > 		return -EINVAL;
> =

> Not exactly, priv_xfers is old API, which supported now. I plan remove it
> after remove all from i3c master controller driver after this patch merge=
d.
> =

> i2c_xfers: must be no NULL
> =

> priv_xfers and i3c_xfers, one of both should be no NULL.
> =

> i2c_xfer is NULL, should be return -EINVAL, but you logic may success if
> i3c_xfers is not NULL.

You are right. I misread && as ||. Can you add a summary of the above in the
comment above the conditionals or kernel-doc of this function (if present)?

> > >  	if (ops->request_ibi &&
> > >  	    (!ops->enable_ibi || !ops->disable_ibi || !ops->free_ibi ||
> > >  	     !ops->recycle_ibi_slot))
> >
> > >  }

...

> > > -enum i3c_hdr_mode {
> > > +enum i3c_xfer_mode {
> > > +	/* The below 3 value (I3C_HDR*) must match GETCAP1 Byte bit positio=
n */
> > >  	I3C_HDR_DDR,
> > >  	I3C_HDR_TSP,
> > >  	I3C_HDR_TSL,
> > > +	/* Use for default SDR transfer mode */
> > > +	I3C_SDR =3D 0x31,
> >
> > Why has this a specific value, while the rest have not? If it's HW mand=
ated,
> > the all of them has to be assigned properly to avoid potential bugs.
> >
> > >  };

Are you agree on this or disagree or...?
If you agree, don't leave the unneeded context in the reply.
Otherwise, please express your objections.

...

> > >  /**
> > > - * struct i3c_priv_xfer - I3C SDR private transfer
> > > + * struct i3c_xfer - I3C data transfer
> > >   * @rnw: encodes the transfer direction. true for a read, false for =
a write
> > > + * @cmd: Read/Write command in HDR mode, read: 0x80 - 0xff, write: 0=
x00 - 0x7f
> > >   * @len: transfer length in bytes of the transfer
> > >   * @actual_len: actual length in bytes are transferred by the contro=
ller
> > >   * @data: input/output buffer
> >
> > >   * @data.out: output buffer. Must point to a DMA-able buffer
> > >   * @err: I3C error code
> > >   */
> > > -struct i3c_priv_xfer {
> > > -	u8 rnw;
> > > +struct i3c_xfer {
> > > +	union {
> > > +		u8 rnw;
> > > +		u8 cmd;
> > > +	};
> >
> > What field is used to distinguish the union member in current use?
> > In another word, union must be accompanied with a selector.
> =

> This struct use only for i3c_device_do_xfers(), which pass i3c_xfer_mode
> informaiton. argument 'mode' will distrigiush rnw/cmd.

Then why that mode field is not present here?

> i3c_xfer[] array don't allow switch transfer mode during whole i3c
> transcation. So doesn't put mode in here.

I presume that this is the answer to my above Q? If so, I think this
dislayering is not okay, because the struct effectively lost the crucial pi=
ece
of information (for example, if you need to trace the contents of it, the m=
ode
also needs to be provided again, and so on). I think the data type must have
this mode field as well (as long as union is in use).

> > >  	u16 len;
> > >  	u16 actual_len;
> > >  	union {
> >
> > >  	enum i3c_error_code err;
> > >  };

...

> > > +/* keep back compatible */
> > > +#define i3c_priv_xfer i3c_xfer
> >
> > How many of the current users do this? Can't we just rename treewide?
> =

> git grep -r priv_xfer drivers/

`git grep -lw ...` is a better approach :-)

> drivers/base/regmap/regmap-i3c.c:       struct i3c_priv_xfer xfers[] =3D {
> drivers/base/regmap/regmap-i3c.c:       return i3c_device_do_priv_xfers(i=
3c, xfers, 1);
> drivers/base/regmap/regmap-i3c.c:       struct i3c_priv_xfer xfers[2];
> drivers/base/regmap/regmap-i3c.c:       return i3c_device_do_priv_xfers(i=
3c, xfers, 2);
> drivers/hwmon/lm75.c:   struct i3c_priv_xfer xfers[] =3D {
> drivers/hwmon/lm75.c:   ret =3D i3c_device_do_priv_xfers(i3cdev, xfers, 2=
);
> drivers/hwmon/lm75.c:   struct i3c_priv_xfer xfers[] =3D {
> drivers/hwmon/lm75.c:   return i3c_device_do_priv_xfers(i3cdev, xfers, 1);
> drivers/i3c/device.c:int i3c_device_do_xfers(struct i3c_device *dev, stru=
ct i3c_priv_xfer *xfers,
> drivers/i3c/master.c:   if (!ops->priv_xfers && !ops->i3c_xfers)
> drivers/i3c/master.c:   if (!master->ops->priv_xfers)
> drivers/i3c/master.c:   return master->ops->priv_xfers(dev, xfers, nxfers=
);
> drivers/i3c/master/dw-i3c-master.c:static int dw_i3c_master_priv_xfers(st=
ruct i3c_dev_desc *dev,
> drivers/i3c/master/dw-i3c-master.c:                                 struc=
t i3c_priv_xfer *i3c_xfers,
> drivers/i3c/master/dw-i3c-master.c:     .priv_xfers =3D dw_i3c_master_pri=
v_xfers,
> drivers/i3c/master/i3c-master-cdns.c:static int cdns_i3c_master_priv_xfer=
s(struct i3c_dev_desc *dev,
> drivers/i3c/master/i3c-master-cdns.c:                                 str=
uct i3c_priv_xfer *xfers,
> drivers/i3c/master/i3c-master-cdns.c:   .priv_xfers =3D cdns_i3c_master_p=
riv_xfers,
> drivers/i3c/master/mipi-i3c-hci/core.c:static int i3c_hci_priv_xfers(stru=
ct i3c_dev_desc *dev,
> drivers/i3c/master/mipi-i3c-hci/core.c:                       struct i3c_=
priv_xfer *i3c_xfers,
> drivers/i3c/master/mipi-i3c-hci/core.c: .priv_xfers             =3D i3c_h=
ci_priv_xfers,
> drivers/i3c/master/renesas-i3c.c:static int renesas_i3c_priv_xfers(struct=
 i3c_dev_desc *dev, struct i3c_priv_xfer *i3c_xfers,
> drivers/i3c/master/renesas-i3c.c:       .priv_xfers =3D renesas_i3c_priv_=
xfers,
> drivers/i3c/master/svc-i3c-master.c:    struct i3c_priv_xfer *xfer;
> drivers/i3c/master/svc-i3c-master.c:     * at svc_i3c_master_priv_xfers().
> drivers/i3c/master/svc-i3c-master.c:static int svc_i3c_master_i3c_xfers(s=
truct i3c_dev_desc *dev, struct i3c_priv_xfer *xfers,
> drivers/net/mctp/mctp-i3c.c:    struct i3c_priv_xfer xfer =3D { .rnw =3D =
1, .len =3D mi->mrl };
> drivers/net/mctp/mctp-i3c.c:    rc =3D i3c_device_do_priv_xfers(mi->i3c, =
&xfer, 1);
> drivers/net/mctp/mctp-i3c.c:    struct i3c_priv_xfer xfer =3D { .rnw =3D =
false };
> drivers/net/mctp/mctp-i3c.c:    rc =3D i3c_device_do_priv_xfers(mi->i3c, =
&xfer, 1);
> =

> After this patch merged, I can clean up it at difference subsytem. After
> all cleanup done, we can safely remove this define.

I counted 9. I think it's not a big deal to convert all of them at once wit=
hout
leaving an intermediate state. But this is a call for the I=B3C subsystem m=
aintainer.

-- =

With Best Regards,
Andy Shevchenko



-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
