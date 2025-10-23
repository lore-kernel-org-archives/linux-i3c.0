Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C702FCCD1BC
	for <linux-i3c@archiver.kernel.org>; Thu, 23 Oct 2025 08:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QUUwxPO50Ci9DI3ixlg+T50tVfi/j4KamhTN2VRuG44=; b=GObFck3bOuhWLg
	fzrEj46WItzHdfjf0yh8YQAwyPIgnAhitU3EwTax/2v16uHD9zWmO5ih9JB91g093jJjV0AwXIVcD
	4TrfaHrM7OOjDoYtypHXJVrRvas8HZrUDS+2CzYZDN2ic3TQZqqino7CZ2eh0GEydGicTg9LVAn1R
	3Ee2jNalPkYDpCXBDY6oPydLI865SX53HkuuL3gtplP5jRwZ3rHRmJD7rMmidtjchC8HX8v50he1s
	V71b/ER5Fcc+eUXorue+eZGkwVa405ayI8FKixYSu5RHWowjnPF/OZ2ISvubxJPxu0xYDAeKEKGJ6
	4bxPrMajUkTDhEmKrnKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBqbv-00000005X7k-2Hsz;
	Thu, 23 Oct 2025 08:23:51 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBqbt-00000005X6S-2Epl
	for linux-i3c@lists.infradead.org;
	Thu, 23 Oct 2025 08:23:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761207830; x=1792743830;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ptxKv8x6ylevA5yI5wa4vryf/6lVRy0gbUbnxJJtU2c=;
  b=LvpC2I5YY4gLkf3arGgIbHMRJrxxVVW10ay3TbtX9bISIGYvcFjsCuQu
   YVSXBpeRGIzM3e3ZFnylqJpn8J/Z5fkERSIpOLBREg5SUqAO+A0CIK0Ce
   QtCvTLdwwrHFIl6rqY83+MRQZMEwPUJgFcOliYOx5OV9hG6ICshtRR6Ap
   xIxWeaxoMqbK+OFypfrXB+Rg5y2zihr7EJIFWqhKqGn9qAAqCuzW9hzra
   o2RWZDYwmCu9mVldk4+aRsLGMgpy+WoIO+tdABDbotKEUo0syAsheeppO
   ldEI5SLsb1pSAIp18TSsbYDUJly/M1RcWnaQIFwoIZKZtww86osG+lRB2
   Q==;
X-CSE-ConnectionGUID: tuD7JO/aRuGPipuRuVh69A==
X-CSE-MsgGUID: 2i+qrJvERWGpURumDgQIhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63074678"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="63074678"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 01:23:46 -0700
X-CSE-ConnectionGUID: xewb7CYnSHm2QYHap8wVgA==
X-CSE-MsgGUID: lpfHCmtBSPKbcNs6POSKHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="183270380"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.163])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 01:23:42 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1vBqbj-00000001tXy-1owL;
	Thu, 23 Oct 2025 11:23:39 +0300
Date: Thu, 23 Oct 2025 11:23:39 +0300
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
	devicetree@vger.kernel.org
Subject: Re: [PATCH v6 1/5] i3c: Add HDR API support
Message-ID: <aPnmCwwZVZ5egqkP@smile.fi.intel.com>
References: <20251014-i3c_ddr-v6-0-3afe49773107@nxp.com>
 <20251014-i3c_ddr-v6-1-3afe49773107@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251014-i3c_ddr-v6-1-3afe49773107@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_012349_626424_9F37F39D 
X-CRM114-Status: GOOD (  20.33  )
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

On Tue, Oct 14, 2025 at 12:40:00PM -0400, Frank Li wrote:
> Rename struct i3c_priv_xfer to struct i3c_xfer, since private xfer in the
> I3C spec refers only to SDR transfers. Ref: i3c spec ver1.2, section 3,
> Technical Overview.
> 
> i3c_xfer will be used for both SDR and HDR.
> 
> Rename enum i3c_hdr_mode to i3c_xfer_mode. Previous definition need match
> CCC GET_CAP1 bit position. Use 31 as SDR transfer mode.
> 
> Add i3c_device_do_xfers() with an xfer mode argument, while keeping
> i3c_device_do_priv_xfers() as a wrapper that calls i3c_device_do_xfers()
> with I3C_SDR for backward compatibility.
> 
> Introduce a 'cmd' field in struct i3c_xfer as an anonymous union with
> 'rnw', since HDR mode uses read/write commands instead of the SDR address
> bit.
> 
> Add .i3c_xfers() callback for master controllers. If not implemented, fall
> back to SDR with .priv_xfers(). The .priv_xfers() API can be removed once
> all controllers switch to .i3c_xfers().
> 
> Add 'mode_mask' bitmask to advertise controller capability.

...

>  static int i3c_master_check_ops(const struct i3c_master_controller_ops *ops)
>  {
> -	if (!ops || !ops->bus_init || !ops->priv_xfers ||
> +	if (!ops || !ops->bus_init ||
>  	    !ops->send_ccc_cmd || !ops->do_daa || !ops->i2c_xfers)
>  		return -EINVAL;
>  
> +	if (!ops->priv_xfers && !ops->i3c_xfers)
> +		return -EINVAL;

I would find the logically coupled proto-based xfers:

	if (!ops->i2c_xfers && !ops->i3c_xfers)
		return -EINVAL;


>  	if (ops->request_ibi &&
>  	    (!ops->enable_ibi || !ops->disable_ibi || !ops->free_ibi ||
>  	     !ops->recycle_ibi_slot))

>  }

...

> -enum i3c_hdr_mode {
> +enum i3c_xfer_mode {
> +	/* The below 3 value (I3C_HDR*) must match GETCAP1 Byte bit position */
>  	I3C_HDR_DDR,
>  	I3C_HDR_TSP,
>  	I3C_HDR_TSL,
> +	/* Use for default SDR transfer mode */
> +	I3C_SDR = 0x31,

Why has this a specific value, while the rest have not? If it's HW mandated,
the all of them has to be assigned properly to avoid potential bugs.

>  };

...

>  /**
> - * struct i3c_priv_xfer - I3C SDR private transfer
> + * struct i3c_xfer - I3C data transfer
>   * @rnw: encodes the transfer direction. true for a read, false for a write
> + * @cmd: Read/Write command in HDR mode, read: 0x80 - 0xff, write: 0x00 - 0x7f
>   * @len: transfer length in bytes of the transfer
>   * @actual_len: actual length in bytes are transferred by the controller
>   * @data: input/output buffer

>   * @data.out: output buffer. Must point to a DMA-able buffer
>   * @err: I3C error code
>   */
> -struct i3c_priv_xfer {
> -	u8 rnw;
> +struct i3c_xfer {
> +	union {
> +		u8 rnw;
> +		u8 cmd;
> +	};

What field is used to distinguish the union member in current use?
In another word, union must be accompanied with a selector.

>  	u16 len;
>  	u16 actual_len;
>  	union {

>  	enum i3c_error_code err;
>  };

...

> +/* keep back compatible */
> +#define i3c_priv_xfer i3c_xfer

How many of the current users do this? Can't we just rename treewide?

-- 
With Best Regards,
Andy Shevchenko



-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
