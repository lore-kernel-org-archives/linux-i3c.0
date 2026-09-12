Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E3B3C79FB6
	for <linux-i3c@archiver.kernel.org>; Sat, 12 Sep 2026 13:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PMrcMWVKYi7uosj+/TR75hHME5CMNrRrIuFXqJhrjRI=; b=ZDq7KYqVRGgePN
	LU/Wfrit34T8GwXu3I2EcKICWnahMU5txqGytYA1LEQhcbhYAiHjmYty0yJ1JEJ3Z8XY3Gw+Pk9q2
	1d/gOuXc3kHAQv38RVWWcRA3DX3uhCUUnLl2twShxzdzJPMAv8aW6NFBoV/LCOVLsJ3ey991YkfpX
	qAppU7jgVmhYp/hrR5hifW+8Csh5LneYNCFfyyfNzwHbz9N7ifkQAIjSecMuTFoJ0/+X9B8Fx71hS
	ywcqm2GvBUROGpM+yclZj+UMDakKSLSdmhUNpFWpgye0Qj/H4xTAymiCK4zn5SmO+Plfk0N25f5QA
	I75xxHJrP2CYjru0PR4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5NgS-00000000tXg-1cxe;
	Sat, 12 Sep 2026 13:22:20 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5NgP-00000000tXL-1xf4
	for linux-i3c@lists.infradead.org;
	Sat, 12 Sep 2026 13:22:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789219337; x=1820755337;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BOCroOJEaN/c+qJk5JxHZ9/qarv56VFO8jjyDmUDmlY=;
  b=MAGP+EFHivoLnS0lHhLo2g8JhEtSIuvwVqZmjZ3aAGxQCdg1haRVi3+3
   fR07XyojmwueqHLA9HmbbRFENQ6C7Ga2uma2FCaJm23+xLz9rYTB7+xbz
   RYrZMZISBDn7dMjAnY4tGlSBc6cELlgCdREcgTmkhvffJiexy/1IhOsEC
   2UTYUgQE/6eU6MpUOGYmlQorfwC4EWTNaeTv0CUJeSAOEgRkd+FiRvyp/
   TFaWAds3MpZKTI9jEXcSa0Vu6+cMbvY3fPITscY4h3IEBS2r4x/mIitIJ
   k4nSuy1w7q03pJF5Inpwz7k6n5vrNpvPTLAFvF6kcZUpI0M6iN16y+JsW
   A==;
X-CSE-ConnectionGUID: VaiMic1yQ36fqI5Gw0ScZw==
X-CSE-MsgGUID: nNTKXgeSTriAj/tkahogpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="100318963"
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="100318963"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 06:22:14 -0700
X-CSE-ConnectionGUID: B7LDMt1jQ96Kz7kW5wmCEw==
X-CSE-MsgGUID: hFNH3Yn6Qq+pFFUYU0vguw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="272158036"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.239])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 06:22:05 -0700
Date: Sat, 12 Sep 2026 16:22:02 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
Cc: linux-i3c@lists.infradead.org, alexandre.belloni@bootlin.com,
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
Message-ID: <aqVR-jBabQKcsfjL@ashevche-desk.local>
References: <20260911210935.1353126-1-meaganlloyd@linux.microsoft.com>
 <20260911210935.1353126-2-meaganlloyd@linux.microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260911210935.1353126-2-meaganlloyd@linux.microsoft.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_062217_568593_49F4820F 
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

On Fri, Sep 11, 2026 at 02:09:33PM -0700, Meagan Lloyd wrote:
> Opt-in to driver_override sysfs functionality for I3C subsystem.
> 
> Update some I3C drivers that are assuming that if their .probe is
> invoked that the bus match function already checked the ID table. Go
> ahead and verify in .probe that i3c_device_match_id() returns a valid
> match before using the i3c_device_id pointer.
> 
> Signed-off-by: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
> Assisted-by: Claude:claude-opus-4.8 copilot

Assisted-by: LLM

...

>  drivers/hwmon/lm75.c                        |  7 ++++++-
>  drivers/hwmon/tmp108.c                      |  2 ++
>  drivers/i3c/master.c                        |  6 ++++++
>  drivers/iio/adc/ad4062.c                    | 10 ++++++++--
>  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c |  3 +++

No, each IIO driver should have its own patch.

-- 
With Best Regards,
Andy Shevchenko



-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
