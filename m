Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A924CCD1BC
	for <linux-i3c@archiver.kernel.org>; Thu, 23 Oct 2025 08:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wCVwR6nLCOjysbABfE2fmYdM7ACljMIabN708gPjK60=; b=47v3BEFoiKeg/J
	vS+ABJungTd0d5bIFDnVgs6+1gNdsP4Ip2VnmiP9agTfyU4Ca+qZC+1/dCdKkepDmX0qIB3UIyIvw
	xRDEL69iylJUFXQKsjR4RxR6MECY5L4ZXQERd5902+2syAAvgmOSzIfo7hb9Y5JLYmEs0SID32rpl
	XrNSG/k2P4krBDowU4zl+zCJrdvmsGbZt/H0La0fPqKDXfXqwpLTiPxoYRNBEd2zxrufaymOnUdhm
	x6BnxoN3NVP1b4am2TS5yClD02fb/nxjQTXQwHcq3cj91tIipb5QDxoc7WmFZGmzafcT5FhWKWVae
	UigmfmyE0OvQ0VlIjQOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBqhu-00000005Yac-2vrx;
	Thu, 23 Oct 2025 08:30:02 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBqht-00000005YZQ-0SCM
	for linux-i3c@lists.infradead.org;
	Thu, 23 Oct 2025 08:30:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761208201; x=1792744201;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ch5XHan7n+TFh9cqXyKAmWNWnMzChVHFasLvrJE4wkg=;
  b=Z9yu4ZMxF68574t+pnZXDamXxaSK7hPdls1cR9K+T3iv0p70NR4jM+lX
   zaOU0levWPYGwTLouX2oliAZysFircX9o6blI++cIWOG92OLhzsvzx1iP
   q+NsH80adzxj1rsYS25Zb+FLHyTfXmchx5q8la7LNF98CFGfwo2zhcdE+
   CRzXOV+FLN5gBlt9dcIbOfDi9BnBQ9CxtsRmw/S7narDJw04G47Uo8HEz
   T1lBRUkxncG/2rCU1jsvSE3nLAJ8sgYEfHxONwXY2UTXH0ixLpM7NGbkw
   WFbgH73tQlEnlb+1Qt6ABQHRnQ8oDzSAW+qpAUVSJ5oPNZ2Ae5qlT8Lhb
   g==;
X-CSE-ConnectionGUID: 9ukDpTHfRvO1qS6kZCqhTA==
X-CSE-MsgGUID: LeGH6lZEQ++Vo5GpiE0oTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80807919"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="80807919"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 01:30:01 -0700
X-CSE-ConnectionGUID: rzmiWePRQC+B9dJ+/YBtZA==
X-CSE-MsgGUID: Nd/VzcadQXedqM1wJPyvdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="221289795"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.163])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 01:29:57 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1vBqhl-00000001tb8-3zNP;
	Thu, 23 Oct 2025 11:29:53 +0300
Date: Thu, 23 Oct 2025 11:29:53 +0300
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
	devicetree@vger.kernel.org, Carlos Song <carlos.song@nxp.com>
Subject: Re: [PATCH v6 3/5] i3c: master: svc: Add basic HDR mode support
Message-ID: <aPnngQdwEqHgPc7R@smile.fi.intel.com>
References: <20251014-i3c_ddr-v6-0-3afe49773107@nxp.com>
 <20251014-i3c_ddr-v6-3-3afe49773107@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251014-i3c_ddr-v6-3-3afe49773107@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_013001_229837_E394E9E2 
X-CRM114-Status: GOOD (  14.64  )
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

On Tue, Oct 14, 2025 at 12:40:02PM -0400, Frank Li wrote:
> Add basic HDR mode support for the svs I3C master driver.
> 
> Only support for private transfers and does not support sending CCC
> commands in HDR mode.
> 
> Key differences:
> - HDR uses commands (0x00-0x7F for write, 0x80-0xFF for read) to
> distinguish transfer direction.
> - HDR read/write commands must be written to FIFO before issuing the I3C
> address command. The hardware automatically sends the standard CCC command
> to enter HDR mode.
> - HDR exit pattern must be sent instead of send a stop after transfer
> completion.
> - Read/write data size must be an even number.

...

> +static void svc_i3c_master_emit_force_exit(struct svc_i3c_master *master)
> +{
> +	u32 reg = 0;

Useless.

> +	writel(SVC_I3C_MCTRL_REQUEST_FORCE_EXIT, master->regs + SVC_I3C_MCTRL);
> +	readl_poll_timeout(master->regs + SVC_I3C_MSTATUS, reg,
> +			   SVC_I3C_MSTATUS_MCTRLDONE(reg), 0, 1000);

No error checks? Why is it okay?
Why is the first parameter 0 while it's not an _atomic() call?

> +	udelay(1);

No explanations given. Also is it really need to be atomic? If not, use
fsleep() and it will choose the best suitable API under the hood.

>  }

...

> +	if (xfer_type == SVC_I3C_MCTRL_TYPE_DDR) {
> +		/* DDR command need prefill into FIFO */
> +		writel(rnw_cmd, master->regs + SVC_I3C_MWDATAB);
> +		if (!rnw) {
> +			/* write data also need prefill into FIFO */
> +			ret = svc_i3c_master_write(master, out, xfer_len);
> +		if (ret)
> +			goto emit_stop;
> +		}

The indentation here is a mess.

> +	}

-- 
With Best Regards,
Andy Shevchenko



-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
