Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1121DCCF9FC
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Oct 2025 07:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gyF2yOyHVCJSPKxI6wUWvLgOuEFNaSw/gQx2VDkq2IA=; b=MPEtiyT53rQ9vS
	w0ALrItrC+ZEHt/+a5Q2rksuSGddIaOTWCZVGXHAw/zv6KnBSfovWYfNKy5xM9liOGm8vmFL/00jU
	wjhl+rVto6t+8PTyUrTvlKnE5T1HXKvutgmvoWqPX5dUhjI+iK4NuEqU5VtCbCy88l8heDTaR2siQ
	3ICYRN+RI2364xBJpSSIUjaUayxSwWD/lkYzFJprM4XfsdjDzbNVO948QZWfJzkzvyw6B2Vs+3ja0
	cy3R1Zx7N9MeN/tLuP7OZQ4XHrsvDcpVN81Cgr2ijZv4h8aMrXxUmfJrSliIJlDNChjPYSlx1z/K+
	77VfrjJZokrtpQf7WUog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vENRH-00000003eXs-3Pip;
	Thu, 30 Oct 2025 07:51:19 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vENRF-00000003eWb-3kaT
	for linux-i3c@lists.infradead.org;
	Thu, 30 Oct 2025 07:51:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761810678; x=1793346678;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=i2o3lPX24fKmxQVeAxzXXKnFXNnmPunVGpcSChGJjZ4=;
  b=mL9dvFU+jaetvl8FAHDrEWglI5oR8HnMBV0DSQ++s9RE4HIi+Y5Uqw52
   L+N+4wGEDARihYZjczJboiI1QDCbr0zfP6GxyhFMfJidkglUQLPxC3uCr
   jhWjs091eHpSRtLnogpvcUZEy85Wfvs5fOyEbVgDu+rZ1dh/JQjlb5OJG
   6j0pVQZYQ+Lt5iJZDJLg3Gu6rd8L4GJGB9f0V/1MEhCrszQU8ZAKHtYpv
   /zv5w0i/hrO8j+Z8dCovGq3GgQdHCrMvZA1vWOzxWbU+WIMBWuRRfVEPz
   aQNefj1K6kQiAPCj6m6FjmLBVbytNRMV4a9ZYoY+iBkyz+5bYvOtgn7TX
   Q==;
X-CSE-ConnectionGUID: F/FfqKiPQJmZ/+KtLBlZyg==
X-CSE-MsgGUID: LZCwxaHwRASuYzGogfvAAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="64093471"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="64093471"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 00:51:16 -0700
X-CSE-ConnectionGUID: I2DDdL9vQWaAvAcwSGvghg==
X-CSE-MsgGUID: MHQTsx82RMa03zag5bzJtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="186231747"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.245.174])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 00:51:12 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1vENR7-00000003ps3-2Wqs;
	Thu, 30 Oct 2025 09:51:09 +0200
Date: Thu, 30 Oct 2025 09:51:09 +0200
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
	devicetree@vger.kernel.org, Carlos Song <carlos.song@nxp.com>,
	Adrian Fluturel <fluturel.adrian@gmail.com>
Subject: Re: [PATCH v7 5/5] iio: magnetometer: Add mmc5633 sensor
Message-ID: <aQMY7WaDixv9C2QE@smile.fi.intel.com>
References: <20251027-i3c_ddr-v7-0-866a0ff7fc46@nxp.com>
 <20251027-i3c_ddr-v7-5-866a0ff7fc46@nxp.com>
 <aQCgD3iVOXoNr7uY@smile.fi.intel.com>
 <aQI4v1lVcagBWY3i@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aQI4v1lVcagBWY3i@lizhi-Precision-Tower-5810>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_005117_970067_979C1C8C 
X-CRM114-Status: GOOD (  17.68  )
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

On Wed, Oct 29, 2025 at 11:54:39AM -0400, Frank Li wrote:
> On Tue, Oct 28, 2025 at 12:50:55PM +0200, Andy Shevchenko wrote:
> > On Mon, Oct 27, 2025 at 04:08:33PM -0400, Frank Li wrote:

...

> > > +static const struct {
> > > +   int val;
> > > +   int val2;
> >
> > No need. Just
> >
> > > +} mmc5633_samp_freq[] =3D {
> =

> There are some place will like
> =

>         if (mmc5633_samp_freq[i][0] =3D=3D val &&
>                 mmc5633_samp_freq[i][1] =3D=3D val2)
> =

> previous
>         if (mmc5633_samp_freq[i].val =3D=3D val &&
>                 mmc5633_samp_freq[i].val2 =3D=3D val2)
> =

> Previous version seem have better readablity. But it is not big deal, if
> you like, I change to [0][1].

It's not my preference, it's how all but this driver do in IIO, it's about
consistency of the style / patterns.

...

> > struct i3c_device doesn't have a name, does it?
> =

> It has name, but it is hexnumber (VID+PID), like 0-4a20000f000.
> So use friend/readable name here.

I think it's better to use the name provided by the subsystem. This way we =
may
guarantee the unique one. The hard coded values potentially might collide
(imagine some I=B3C driver for the very similar chip, let's say, in hwmon).

-- =

With Best Regards,
Andy Shevchenko



-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
