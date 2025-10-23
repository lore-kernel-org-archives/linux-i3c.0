Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9335BCCD193
	for <linux-i3c@archiver.kernel.org>; Thu, 23 Oct 2025 08:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NleJt94m7nZZqBqlZ8bLafsIzQb3R70Y2TXVWF+uBtI=; b=e5TuZMzS6cqEcv
	WgXpr1PrwZepuFZs9GrLJWf4bOMdvgBGya8WPYi0UHknHehtLCwQNwdzYYBOt/AqBJhilruXKMP7K
	MaRZxIHuhd7NQELHpX+MS318IlDPuvnEZ081dyoByDxq8hw6iUXwHSlf9B/g6nf3bz/rwzf/ZbOxV
	cwYc0XcLsRrjQHCc50OnaMkIcqGV3OWzM59dGsYzefUgT6oDfy7oQIk+XkNC38704F6gjBGTqtgv5
	MnJ3mS2qQGzNKfu2s3PB/QDkCKqHBsn/mqeL7HjACfcZEFrcOHdFBX7UXi4xslqDC+udG8pTWVkst
	+0Geww+NxqvIWvSlEehQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBqek-00000005Xpc-1UgW;
	Thu, 23 Oct 2025 08:26:46 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBqei-00000005Xp3-3ODu
	for linux-i3c@lists.infradead.org;
	Thu, 23 Oct 2025 08:26:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761208005; x=1792744005;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hIgKZLpwh9ypnh/7PbIPkTvyj83dO52fKwwzYQwLGK4=;
  b=h4nDh4zTnrHukgjdRYmcTTEoJiX6RyTQ8IliVgeDQk+TrgucgO4Isk6a
   EDbizDpO8K4KU9+O+GfMOn30uhP74Jw0m/Xwnay53B+pGzQ5/Y37i/fyO
   WJx5XZex39ST87J6fyxgYAkQ9+ISc1jOzpyB7KQLk1biDNoNDgTBODdHc
   Duu5cqJxScx5oRrvME8GiED0eiyjCHmrDE83P/fbAfHcTcCIDOowQzspp
   XKMVVR1m/Dmst5DVAHOllvp8vT9CkZbvRLJ/BUHnOGk6p64bBab7jrYmy
   eJxGzhI6qyEw41QW2NfP3DamfNEsa3t19vYl5E/bptYSAVG7SeDK9pg+j
   g==;
X-CSE-ConnectionGUID: DYmkJDNnRQeNaB2RzxA7Vw==
X-CSE-MsgGUID: fq+0CWyIR66SqEkqu8qllQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63274743"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63274743"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 01:26:44 -0700
X-CSE-ConnectionGUID: uyTyVUMQSvK5tiZL0uQvlw==
X-CSE-MsgGUID: WxnY47zNRrmucoia1M0YvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="188495374"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.163])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 01:26:40 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1vBqeb-00000001tZK-466A;
	Thu, 23 Oct 2025 11:26:37 +0300
Date: Thu, 23 Oct 2025 11:26:37 +0300
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
Subject: Re: [PATCH v6 2/5] i3c: master: svc: Replace bool rnw with union for
 HDR support
Message-ID: <aPnmvepToKtZnAI-@smile.fi.intel.com>
References: <20251014-i3c_ddr-v6-0-3afe49773107@nxp.com>
 <20251014-i3c_ddr-v6-2-3afe49773107@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251014-i3c_ddr-v6-2-3afe49773107@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_012644_886633_00AF6210 
X-CRM114-Status: GOOD (  10.84  )
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

On Tue, Oct 14, 2025 at 12:40:01PM -0400, Frank Li wrote:
> Replace the bool rnw field with a union in preparation for adding HDR
> support. HDR uses a cmd field instead of the rnw bit to indicate read or
> write direction.
> 
> Add helper function svc_cmd_is_read() to check transfer direction.
> 
> Add a local variable 'rnw' in svc_i3c_master_priv_xfers() to avoid
> repeatedly accessing xfers[i].rnw.
> 
> No functional change.

...

>  struct svc_i3c_cmd {
>  	u8 addr;
> -	bool rnw;
> +	union {
> +		bool rnw;
> +		u8 cmd;
> +		u32 rnw_cmd;
> +	};

Same Q, what is the selector?

>  	u8 *in;
>  	const void *out;
>  	unsigned int len;

>  }

> +static bool svc_cmd_is_read(u32 rnw_cmd, u32 type)
> +{
> +	return rnw_cmd;
> +}

Useless?

-- 
With Best Regards,
Andy Shevchenko



-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
