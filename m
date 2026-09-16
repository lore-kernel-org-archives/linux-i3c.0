Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE2AC982C9
	for <linux-i3c@archiver.kernel.org>; Wed, 16 Sep 2026 19:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jjfR4CUZnx0BGf7+LHY/4vT4UOc9KlZEpwTAJjT6+zA=; b=Zw17dLQL4qBmVk
	NEgPVKQrqNJaIpq1P+4/jxrZ8LIHJlvCPlS2JqXRlOnC9b0u5WUeGTdaA/2Oj3xqAnpE2EDh6QwTD
	t/dHqbSOCWUdmw2oX1tPZ9KxwnZ3v1GA8IWrHLXAYgVynjNY9EzhPCD8H8jVkFAcU0PgUE0h5Vf4Y
	zmjbEorFd9eVEJXp7d1bk3BuV/TZ7BHhBI+ayrCdl7bOtoQ1TOisW+PLALMn4bGuxkf+7ZoeheYlI
	TnoWYgoUOCUBWcpFYjv36ekzyuHb9maZpO+NpmNgjP8nMrlwqmaZQb+DFmmtafHktcqySijestYBm
	L4WI/SCGasZQTy9C+i+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6v2y-0000000A0gT-0VFg;
	Wed, 16 Sep 2026 19:11:56 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6v2v-0000000A0g9-3b3Y
	for linux-i3c@lists.infradead.org;
	Wed, 16 Sep 2026 19:11:55 +0000
Received: by linux.microsoft.com (Postfix, from userid 1223)
	id 1694C20B716B; Wed, 16 Sep 2026 12:11:08 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1694C20B716B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1789585868;
	bh=ZMCPr2d+84idtjE/iazrjH1mICP6hgFsVquhvouYacc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sujpVWeNHaiNXNv2VUxOymEXxn2fOkPGqaHByHoa94OWmeoMQbGiSUPzUJ9dG4rDF
	 dShdCZnG87N3VAm+k5TWwn/ZAnAB6KSAcI4RHrbWSrZsuNjOotRcAjtbSWwXQyo4lg
	 9yguoKzxtjldZWdT+1wYSFrZATdspf9r0qIB2NNo=
Date: Wed, 16 Sep 2026 12:11:08 -0700
From: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
To: Jonathan Cameron <jic23@kernel.org>
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
	nuno.sa@analog.com, Michael.Hennerich@analog.com,
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
Subject: Re: [PATCH 2/3] i3c: set i3c_xfer.actual_len in controller drivers
Message-ID: <20260916-9b2d5f87119d3e1a052784e9@linux.microsoft.com>
References: <20260911210935.1353126-1-meaganlloyd@linux.microsoft.com>
 <20260911210935.1353126-3-meaganlloyd@linux.microsoft.com>
 <20260913012612.745247fa@jic23-hlaptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260913012612.745247fa@jic23-hlaptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_121153_944470_A7223374 
X-CRM114-Status: GOOD (  10.68  )
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

On Sun, Sep 13, 2026 at 01:26:12AM +0100, Jonathan Cameron wrote:
> On Fri, 11 Sep 2026 14:09:34 -0700
> Meagan Lloyd <meaganlloyd@linux.microsoft.com> wrote:
> 
> > Set i3c_xfer.actual_len for reads across the I3C Controller drivers.
> > 
> > actual_len provides a consistent location for device drivers to know the
> > read response bytes without overriding the len field.
> 
> Hi Meagan,
> 
> Why is that useful in this series?  Currently this sounds like
> an unrelated change.
> 
> Jonathan

Hi Jonathan,

For read operations, user-space allocates and provides a buffer, as well
as indicates how many bytes it would like to/can receive in that buffer.
actual_len allows us to report to user-space how many bytes were
actually received from the device and are thus valid in that buffer.

Thanks,
Meagan


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
