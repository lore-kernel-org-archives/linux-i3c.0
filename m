Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A138C36000
	for <linux-i3c@archiver.kernel.org>; Fri, 21 Mar 2025 19:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GcWyGNtTqH8O6UcZ9x3ePwNqre1gX/F+4nCsi+qvI/4=; b=RTrkGkuFQ+O0E+
	gjgtGKtaSCO46zhwcux0QmBiFg0FrK/HDXXQ6PfTbODwxEMbR5k7gNe/7ycHs9BtvFpoFB+2lVfsO
	Ck8hgEO0m4M+06fgRFJG7/ac1GqMvQjhNJCljNCoUfsJaGvLVLN1vyXVgMcLBm4AXN2bkHjC1Bvzd
	+lmhejYJs+hTXuXgAu/APmQwd774NdGOw2zZeYIR1SgAr29eK9xbpUPN7aEVJr2vP6toJ1Q7K2mAm
	zXDxZBudHnyQK8IEoDzl2Ih31pwfx+IskcaGCgThzQxpi17/xQddENjPN8LFtcZtPW+ucDca3UcUY
	m77z7LG+Kk2Xm55qrucQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvi5M-0000000G330-3vk2;
	Fri, 21 Mar 2025 19:31:16 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvi5J-0000000G32T-3gLI
	for linux-i3c@lists.infradead.org;
	Fri, 21 Mar 2025 19:31:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742585474; x=1774121474;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=TU+4P72CTJfVNP7+no4HhfCPdFLjeAD8PbJh0fR4i5c=;
  b=f4PaQ7993+f/XXDTFb8cEZowM+uC+VXVyt1+yO4Z3wL0+11kDYommMeb
   CRl3jCrPAmkEsZ82bv5CHzvD0ucdGxiqER7LxLfeWtS7K/NVtCjoR+08D
   JC/yBvdcHYDdLhnICAm1SHjFBRFv0PrUnmvVrAGlaHK3SCfBfZtKEcNnU
   6QrGmrLylS9VGQ6jK5KgHsgjma+z5QEgzpMt3dWESnXNPW3AePiVdDmUk
   XC9KbsJ/d5YtnlwZK293l/skq9hdLbETeqkb4OmS1xLXrb/SVn2fe5BFg
   RRuHylsKkbMk3hmM5P2ppjFXfD58zkJwUeyTWIGc2Yc3wh+g9EKgLBFNS
   g==;
X-CSE-ConnectionGUID: LvrKXfFjSZ+CApb67266Hw==
X-CSE-MsgGUID: J3jW+z1lSOOGSymjeid8+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="43879739"
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; 
   d="scan'208";a="43879739"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 12:31:13 -0700
X-CSE-ConnectionGUID: h02yA1/HTkWDcX1DY1ghlw==
X-CSE-MsgGUID: DAJqzZMRTCC4OTdRnbDCAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; 
   d="scan'208";a="154383976"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 12:31:11 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tvi5F-00000004blC-0IBO;
	Fri, 21 Mar 2025 21:31:09 +0200
Date: Fri, 21 Mar 2025 21:31:08 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] i3c: master: Drop duplicate check before calling
 OF APIs
Message-ID: <Z92-fNE5hrX7Oy0g@smile.fi.intel.com>
References: <20250321192527.457324-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250321192527.457324-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_123113_958472_B880C5ED 
X-CRM114-Status: UNSURE (   7.38  )
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

On Fri, Mar 21, 2025 at 09:25:26PM +0200, Andy Shevchenko wrote:
> OF APIs are usually NULL-aware and returns an error in case when
> device node is not present or supported. We already have a check
> for the returned value, no need to check for the parameter.

Ignore this, it is partially done.

-- 
With Best Regards,
Andy Shevchenko



-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
