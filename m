Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57BB2CCF9FE
	for <linux-i3c@archiver.kernel.org>; Mon,  3 Nov 2025 08:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dddRLuCd8KZVnatmxkKLCsaozYsefcsl7Z8ew5edjhU=; b=32OKSjC9w5jidZ
	7keWG0YzU71yb9BgpSRtI1lyA6ObDLCxSZxtyeWhLQxAqLqUbnp5cEScwA3+jekdgLGUoK8YbnXp3
	ZWha021hddQhBRtYJwdLR3UsqSdbZIuBFfW7cJ0n6VV9u9xP54vx5z6LRFrcLt9OcI5QA4yFL5SdF
	iUEg9QwhyxE1dYCu9yOtIXw9bGnZuyxTc9iV5otctTt1c3dGzAH8wpOI3+Lyn1+dI6remLlq5rZQf
	6iT/ZZ3Y6XcXGsB6eKgmhkbQlEYGaPcN9qrBHEcavLV1EppxhaTpC7WotzLJum4hjwmdQW17WpsPJ
	IFagv4Pl6rUdA1UlUjog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFpXf-00000009PId-0PAP;
	Mon, 03 Nov 2025 08:03:55 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFpXc-00000009PHk-1kC2
	for linux-i3c@lists.infradead.org;
	Mon, 03 Nov 2025 08:03:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762157032; x=1793693032;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5pXyRXIxVt0Iau8mWou9oXadjFJmaZdgpbKlkoLVbSU=;
  b=DLzwhkf6JVtn5aygnbhHB9zYbfO9dnSoPkNSp1SpCq4UGOTRGGCPwhGH
   U2ux0/j0ZbeBeaOv3AdzrxHACPQP65Vwsxq+CZhR6l0QkHoHTzicNrhXR
   shg3KEjxQ6cuSwt8em6lMjP9nt1sbLhx3SchVWNi0m3no/95/y5zsAqey
   bn6O2BFEt0KWmd5ugh7mpZWFy9zWlyh0nifVBezZfupI0/VURnXo5z1S8
   Ok+YdKx8t9xue71f8yLwPfjTVBHP5+EydkDgOodmgCd0oDrx6LrASTTvK
   riiEeWGsS6MDPj/Qrm4/CTpeAJfQQEyIkRP/KktXa1+yldfeoi9CjZGl9
   A==;
X-CSE-ConnectionGUID: RNK2AMMuQsemBTUi8XYWEQ==
X-CSE-MsgGUID: e+W7vTh3Q2G+6EKQUZrIEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="64114199"
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="64114199"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 00:03:51 -0800
X-CSE-ConnectionGUID: W2KynLE4QPibqsxiZlCTFg==
X-CSE-MsgGUID: x44oWC41SpWrm2y4Xsghpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="186042022"
Received: from smoehrl-linux.amr.corp.intel.com (HELO ashevche-desk.local) ([10.124.220.216])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 00:03:47 -0800
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1vFpXQ-000000055GF-3PTd;
	Mon, 03 Nov 2025 10:03:40 +0200
Date: Mon, 3 Nov 2025 10:03:39 +0200
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
	Carlos Song <carlos.song@nxp.com>
Subject: Re: [PATCH v9 4/6] i3c: master: svc: Add basic HDR mode support
Message-ID: <aQhh2zZVxh1oVuJz@smile.fi.intel.com>
References: <20251031-i3c_ddr-v9-0-f1e523ebaf78@nxp.com>
 <20251031-i3c_ddr-v9-4-f1e523ebaf78@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251031-i3c_ddr-v9-4-f1e523ebaf78@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_000352_496084_20F38F3C 
X-CRM114-Status: GOOD (  19.03  )
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

On Fri, Oct 31, 2025 at 12:39:16PM -0400, Frank Li wrote:
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

>  static bool svc_cmd_is_read(u32 rnw_cmd, u32 type)
>  {
> -	return rnw_cmd;
> +	return (type == SVC_I3C_MCTRL_TYPE_DDR) ? !!(rnw_cmd & 0x80) : rnw_cmd;

This seems confusing. Either !! is redundant (which is actually the case) or
I don't know what the idea behind this.

> +}

...

> +static void svc_i3c_master_emit_force_exit(struct svc_i3c_master *master)
> +{
> +	u32 reg;
> +
> +	writel(SVC_I3C_MCTRL_REQUEST_FORCE_EXIT, master->regs + SVC_I3C_MCTRL);
> +
> +	/*
> +	 * Not need check error here because it is never happen at hardware. IP

If you move 'IP' to the next line it will be better to read.

> +	 * just wait for few fclk cycle to complete DDR exit pattern. Even
> +	 * though fclk stop, timeout happen here, the whole data actually
> +	 * already finish transfer. The next command will be timeout because
> +	 * wrong hardware state.
> +	 */
> +	readl_poll_timeout_atomic(master->regs + SVC_I3C_MSTATUS, reg,
> +				  SVC_I3C_MSTATUS_MCTRLDONE(reg), 0, 1000);
> +
> +	/*
> +	 * This delay is necessary after the emission of a stop, otherwise eg.
> +	 * repeating IBIs do not get detected. There is a note in the manual
> +	 * about it, stating that the stop condition might not be settled
> +	 * correctly if a start condition follows too rapidly.
> +	 */
> +	udelay(1);
>  }

-- 
With Best Regards,
Andy Shevchenko



-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
