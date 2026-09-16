Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2130DC88E7F
	for <linux-i3c@archiver.kernel.org>; Wed, 16 Sep 2026 18:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nK8nCFh7wRDWwGawBFmfLLKYtNWUNBYFtahLo9VhHSI=; b=E646KOkB/P1Exi
	lq1M/pnJsGM9an7M9GEE4ELWnXg7suJNFwkxCSzCeAn/b0rcU3QvCNUOaX7ofXWabb5eN5qIsQfcJ
	5Z/HeDTib9x3HOUtJNVjppIAU5BRy8ZDHtKQhMNafp/uyS8zkf0/WHvAPCrit/glcEvrH929/V6wd
	ryRjZOxPoyLTfGCNBfsE2vpD5c9zL1ArxE+xcOuNo3qWsFKZ9odMsbDCetv9n/1JX1WiM/Km6i+nl
	eq76xtKYcaA1tX8/1WPe+mTadYtYovZDaQXIGAEH4geyrRKGzVX1QCZbYM2iEkdvGGItBT7kdZhuK
	SM0lIBh2fffppJA52NUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6uYb-00000009yPA-3846;
	Wed, 16 Sep 2026 18:40:33 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6uYZ-00000009yOm-1TUO
	for linux-i3c@lists.infradead.org;
	Wed, 16 Sep 2026 18:40:32 +0000
Received: by linux.microsoft.com (Postfix, from userid 1223)
	id D4DAE20B7169; Wed, 16 Sep 2026 11:39:45 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D4DAE20B7169
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1789583985;
	bh=8lK+5oMYPj6NqJmz8Ck8rGQ6ji2Aa8RX6M1pRCw0k50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FWiUM2N2gFXZJw07S+29h619H1s8PFSkSWlMg8+hGsUTHSD3M+KxJjpiqd8hEAL1r
	 mBi0K3Rfp1JrvGbZ2f/h85Rkbt+u91WCFxzPbscplgi3y6ZRbbTX8DhG/+z50fCjh8
	 YiBnIqduPbFabLtw8eRPpoL44+M2yHtsTKkpL7PE=
Date: Wed, 16 Sep 2026 11:39:45 -0700
From: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Meagan Lloyd <meaganlloyd@linux.microsoft.com>,
	linux-i3c@lists.infradead.org, alexandre.belloni@bootlin.com,
	vitor.soares@toradex.com, samagazaryan@google.com,
	gregkh@linuxfoundation.org, arnd@arndb.de,
	boris.brezillon@collabora.com,
	oleksandr.shulzhenko.viktorovych@intel.com,
	tgopinath@linux.microsoft.com, corbet@lwn.net,
	skhan@linuxfoundation.org, linux@roeck-us.net, Frank.Li@nxp.com,
	jorge.marques@analog.com, pgaj@cadence.com,
	wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
	nuno.sa@analog.com, Michael.Hennerich@analog.com, jic23@kernel.org,
	dlechner@baylibre.com, andy@kernel.org, lorenzo@kernel.org,
	enelsonmoore@gmail.com, rppt@kernel.org, pratyush@kernel.org,
	giovanni.cabiddu@intel.com, gabewhigham@gmail.com,
	haren@linux.ibm.com, pasha.tatashin@soleen.com,
	jirislaby@kernel.org, adrian.ho.yin.ng@altera.com,
	ustc.gu@gmail.com, jszhang@kernel.org, adrian.hunter@intel.com,
	akhilrajeev@nvidia.com, tze.yee.ng@altera.com,
	manikanta.guntupalli@amd.com, shubhrajyoti.datta@amd.com,
	jarkko.nikula@linux.intel.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux@analog.com, linux-iio@vger.kernel.org
Subject: Re: [PATCH 1/3] i3c: master: enable driver_override for I3C
Message-ID: <20260916-6e46fd06ccaca5d99fe1d30a@linux.microsoft.com>
References: <20260911210935.1353126-1-meaganlloyd@linux.microsoft.com>
 <20260911210935.1353126-2-meaganlloyd@linux.microsoft.com>
 <aqVR-jBabQKcsfjL@ashevche-desk.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aqVR-jBabQKcsfjL@ashevche-desk.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_114031_416490_0D435ABB 
X-CRM114-Status: UNSURE (   8.35  )
X-CRM114-Notice: Please train this message.
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

> > Signed-off-by: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
> > Assisted-by: Claude:claude-opus-4.8 copilot
> 
> Assisted-by: LLM

Sure, I can update the tag accordingly. Thanks!

> 
> ...
> 
> >  drivers/hwmon/lm75.c                        |  7 ++++++-
> >  drivers/hwmon/tmp108.c                      |  2 ++
> >  drivers/i3c/master.c                        |  6 ++++++
> >  drivers/iio/adc/ad4062.c                    | 10 ++++++++--
> >  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c |  3 +++
> 
> No, each IIO driver should have its own patch.
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
Got it. Thanks for the feedback.

Sincerely,
Meagan

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
