Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69CBFCCD1BC
	for <linux-i3c@archiver.kernel.org>; Thu, 23 Oct 2025 18:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vrpDoc06aVwCSLx53rhkDZs77lMHK1S4QYZtOCHiK80=; b=MUCDN6SDne1ZZ7
	RKTcD6684KvHFcusB2IFKNmlvJcimbxH7BJE/DxmdPOIEFPVlHzuvVCLt53UUe1dkGfgZw8MbYhYO
	lvHkhL66fjaANjT2SstySVQVROJ+6FwRpTMUohsALonYLWV3F986unlNO3YGKdnJnWsT5QzbxANbv
	w7NXrHYeT1qMHFf7yn3B7o6C3KTGy6owqdJE2Fweggvhjx2aGZmq9GvFG16Cswa5Nue5zj8aq3vs5
	zqgH7x+Tp9PIipD6bYfuwZQ7v1DDRMm7LWfhw55YNWI6PGI3hLVn88x93r/Mb+dC+s/8W8t0LCJJG
	F7BVQmStZAZFQN6toG4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBzzq-00000007Dd4-0qEg;
	Thu, 23 Oct 2025 18:25:10 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBzzo-00000007Dce-2Yyi
	for linux-i3c@lists.infradead.org;
	Thu, 23 Oct 2025 18:25:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761243909; x=1792779909;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zwCmN86sqMbHXrITH7YOhA0fPI1EnrI6nXVZagQBh7I=;
  b=cyxVmd0wnxAeY2o5Ao4cRe2A3PCFaQ7FtaKIbnwaPbro5t5fXGaPTsTt
   IAM10u+C3+UNeDtAzlz8Xgcyw4Wqpeue4hK6NKhiRHkLEH32cluVDG0Rd
   FjG4+pqbAl+hmg5UTsOr+rCZx2dnTOkDkhKnhlyiDTpLse1UzN1i00Q57
   WAZobOrymrqz5YxwdRYn06+A0pF79kuP1JVxYNpOGiF4KiPaJpbpPtgbz
   YppahVxdWQ6bFpYGa1jvvmBAe5LWl5EL7KSElY2sUmea7wQdN9lTIjdBV
   G7/pwQ/4z6y0KUwIpMbUApbkQ6bAqU2PTHPFTsOWk1aBOLkzFmx+qu+iS
   g==;
X-CSE-ConnectionGUID: cYE/KyjfR4WkmSicouYEZw==
X-CSE-MsgGUID: quwCP9TBRdeEbEpim5F5HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63347697"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63347697"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 11:25:08 -0700
X-CSE-ConnectionGUID: rZGXvA+rTRisloNEidpLPA==
X-CSE-MsgGUID: 4eRJcodlREGrhOmUXQuDVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; 
   d="scan'208";a="214884102"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.163])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 11:25:04 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1vBzzg-000000020qc-1HGR;
	Thu, 23 Oct 2025 21:25:00 +0300
Date: Thu, 23 Oct 2025 21:25:00 +0300
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
	devicetree@vger.kernel.org, Carlos Song <carlos.song@nxp.com>
Subject: Re: [PATCH v6 3/5] i3c: master: svc: Add basic HDR mode support
Message-ID: <aPpy_FNh0DB_1x-w@smile.fi.intel.com>
References: <20251014-i3c_ddr-v6-0-3afe49773107@nxp.com>
 <20251014-i3c_ddr-v6-3-3afe49773107@nxp.com>
 <aPnngQdwEqHgPc7R@smile.fi.intel.com>
 <aPpIkqjeWsi7xAAn@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aPpIkqjeWsi7xAAn@lizhi-Precision-Tower-5810>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_112508_691767_187DCF06 
X-CRM114-Status: GOOD (  13.66  )
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

On Thu, Oct 23, 2025 at 11:24:02AM -0400, Frank Li wrote:
> On Thu, Oct 23, 2025 at 11:29:53AM +0300, Andy Shevchenko wrote:
> > On Tue, Oct 14, 2025 at 12:40:02PM -0400, Frank Li wrote:

...

> > > +	readl_poll_timeout(master->regs + SVC_I3C_MSTATUS, reg,
> > > +			   SVC_I3C_MSTATUS_MCTRLDONE(reg), 0, 1000);
> >
> > No error checks? Why is it okay?
> > Why is the first parameter 0 while it's not an _atomic() call?
> >
> > > +	udelay(1);
> >
> > No explanations given. Also is it really need to be atomic? If not, use
> > fsleep() and it will choose the best suitable API under the hood.
> 
> It is in atomic context. I will add comments.

Not only, the call that's used in the code from iopoll.h is wrong in such a
case. Haven't you tested this with debug atomic context?

-- 
With Best Regards,
Andy Shevchenko



-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
