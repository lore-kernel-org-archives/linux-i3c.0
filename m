Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA8F4CCF9FE
	for <linux-i3c@archiver.kernel.org>; Mon,  3 Nov 2025 08:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gS+O4EU1KDRKoB/agyVgty1pBj6xZPqEUW7MeJEeEak=; b=yjQNK6gpKtfeQ3
	WTvs221PpoyC7UbtvIkbpsDtRZ2co3LYFFhecHl2cvfvI+LuUQFWx1zEXci+uBt/xiO8a/Q9mD2QF
	qFhmZS91qyDDser55N5Cx8v6OAomDgFBg0wzuq1ZBsPA1FXAlkM9+QDFjWj/hKrKf78QVQPqb9D2p
	6BpL7xkR++z+b3d4O9RQAxs9A92xAvhu+nvuC3id+eG8YN5w5lHFN/y9+clhz6QroHR5tJHWgiJWZ
	ntziLNlJv1jwFqwSpHpoAX1wOvZfzVIijAgAUL1nXAT9jQtiXHhQoknC4NLPOyKqkPcSaYx7TrCX+
	wJ67qUJlCgqlqiGvo8lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFphh-00000009Ptl-1saA;
	Mon, 03 Nov 2025 08:14:17 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFphe-00000009PtM-3P9B
	for linux-i3c@lists.infradead.org;
	Mon, 03 Nov 2025 08:14:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762157654; x=1793693654;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eUC7CdLY2n+Ok064KsLsxj3DXcXd7nr4SrWNiG96MhI=;
  b=RFKUQuvv4xWOigzyFQO/0m74O+06xrgJvzd8Xo0VCmbkwr088s6V5Yba
   Q52tg1SkMngSbzTzWbKoZmIioxUYjFd6SpjuEKu+j4iTmsHLSVyZoGxla
   MHHNRy3Zqs0DqtYKfWzmE3+0WgTylhOzjsG6x4+Jc11uBFVAKqEeaXP0N
   XLanKdE8rHeRojclZzI+uRrXrPS1KLkd8qSeWgpHicaCCfhfdtodFlUG9
   m+rk/WgQUV9CMM4laHYkmj8+LDigeX2X2YG13XXh3Wouki10AvuaC2FZk
   y4/gHIA/Jv1iIy0l7P2fm1MMwlZcqEJhvT3eroG6UW4es3cw9oaNCEJ9t
   A==;
X-CSE-ConnectionGUID: y4ylXpduSL65lqeUfOfFSg==
X-CSE-MsgGUID: VqTvZq1XSW2AaYeWDUHJbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="75675125"
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="75675125"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 00:14:09 -0800
X-CSE-ConnectionGUID: ndL/zb5NTZGkQ8kBQOxdhw==
X-CSE-MsgGUID: wc3i3tJZR1O9K3nOaBqx6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="186952919"
Received: from smoehrl-linux.amr.corp.intel.com (HELO ashevche-desk.local) ([10.124.220.216])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 00:14:06 -0800
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1vFphP-000000055OO-0fwu;
	Mon, 03 Nov 2025 10:13:59 +0200
Date: Mon, 3 Nov 2025 10:13:58 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Frank Li <Frank.Li@nxp.com>
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
	devicetree@vger.kernel.org, linux@roeck-us.net,
	Carlos Song <carlos.song@nxp.com>,
	Adrian Fluturel <fluturel.adrian@gmail.com>
Subject: Re: [PATCH v9 6/6] iio: magnetometer: Add mmc5633 sensor
Message-ID: <aQhkRmtJMoB7vv8U@smile.fi.intel.com>
References: <20251031-i3c_ddr-v9-0-f1e523ebaf78@nxp.com>
 <20251031-i3c_ddr-v9-6-f1e523ebaf78@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251031-i3c_ddr-v9-6-f1e523ebaf78@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_001414_897439_8F569122 
X-CRM114-Status: GOOD (  11.34  )
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

On Fri, Oct 31, 2025 at 12:39:18PM -0400, Frank Li wrote:
> Add mmc5633 sensor basic support.
> - Support read 20 bits X/Y/Z magnetic.
> - Support I3C HDR mode to send start measurememt command.
> - Support I3C HDR mode to read all sensors data by one command.

...

> - 1 -> ARRAY_SIZE()

Maybe I missed the answer, but why are the arrays to begin with?

...

> +#define MMC5633_REG_YOUT_H	0x03
> +#define MMC5633_REG_ZOUT_L	0x04
> +#define MMC5633_REG_ZOUT_H	0x05
> +#define MMC5633_REG_XOUT_2	0x06
> +#define MMC5633_REG_YOUT_2	0x07
> +#define MMC5633_REG_ZOUT_2	0x08
> +#define MMC5633_REG_TOUT	0x09

Are those _L, _H, _2 come from the datasheet?

...

> +struct mmc5633_data {
> +	struct i3c_device *i3cdev;
> +	struct mutex mutex; /* protect to finish one whole measurement */
> +	struct regmap *regmap;

Btw, have you experimented to shuffle this to put regmap to be the first
member, for example? Does it affect the binary (compiled object) size?

> +};

...

> +	regmap = devm_regmap_init_i2c(client, &mmc5633_regmap_config);
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(dev, PTR_ERR(regmap), "regmap init failed");

Missing trailing \n. Please, double check all messages for this.

...

> +	ret = regmap_attach_dev(dev, regmap, &mmc5633_regmap_config);
> +	if (ret)
> +		return ret;

Why?

...

> +	ret = regmap_attach_dev(dev, regmap, &mmc5633_regmap_config);
> +	if (ret)
> +		return ret;


Ditto.

-- 
With Best Regards,
Andy Shevchenko



-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
