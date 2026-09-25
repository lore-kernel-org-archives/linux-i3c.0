Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125D2C9830E
	for <linux-i3c@archiver.kernel.org>; Fri, 25 Sep 2026 09:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lnCsES8ViKxf0g2qTlnlUexsmJZFiXqkHW1HuVdfg1w=; b=4bPN49E1yPGCr+
	0s6fj3CyRaB/FjZ5vTX+aGb3MA93RtRBLUuVrtHM0xOzsh+lrhFwn8S+C0iEX7lojQkmS6A86rALr
	slCgeLUxuwfO78OC7ku5pXGrGQamsynfN9vV1VmRz9rCVuUmsNncpDya2IVGhWMOb9a1IZe7CA9wF
	RQXA1/F+CqbL4U3wnO6jBKxBKbTL7gb1a7HFMHK861wK1E5LErXppbGwO1Gy2KhbHlsIOc5Pa/Imf
	LO+fuczh80fgXz6DW+doHyw5VYlJWgLk1313JXJQ84H1t81am5FIx1UQuQU1D4rVVDCxEFgtym9i9
	U/tJAqWGI8IQ/aonwVew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA1v3-0000000Cyag-39OU;
	Fri, 25 Sep 2026 09:08:37 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA1v1-0000000Cya5-04Ti
	for linux-i3c@lists.infradead.org;
	Fri, 25 Sep 2026 09:08:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790327315; x=1821863315;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E2GYHV5uW7KkBzRH1jC7EgLpqnckGqKnKrr9dfnSgX8=;
  b=gAFFSRSVPUZpXVnWntv3hu/hH6nMoxLro7TLyCasWm5tvNpABDmMRNqV
   gE0sjcc2Qmf5+DYXAuQO99BGtyXLpii7fLAeJRnY/UDynlSgoVvqfiz+L
   bqEDQGG+1+E03rEyvqRCU+aJICLKlnfHyTqwFpMMXc2940tGcVkcMgJEv
   KuBzAbeOBJJA0fM9XoWEFwYon0GbQQYykXSIPFtWwtGNoM4tKaosYkL9Y
   jMH3huOa5wg3R5B/yE9Fx8qV5fCghFMsTdJvUx1WbmJA6YhcpLgKcuSEi
   ZXhcd6p6qQ0OdGir2funA+4EMEy+e5D/G+AtGEMxdzMlAyxULeyjf2Py3
   w==;
X-CSE-ConnectionGUID: o0OpJlXfRgKPomOLyT3iFQ==
X-CSE-MsgGUID: gyMX6+ouTgyLRnN3Pm4+6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90171836"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="90171836"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 02:08:34 -0700
X-CSE-ConnectionGUID: YXeULacfSUG5J1ZxS1aA6Q==
X-CSE-MsgGUID: fy98SQ89ThmkYfHBNA1TVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="278989175"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 25 Sep 2026 02:08:31 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id F1AFE99; Fri, 25 Sep 2026 11:08:29 +0200 (CEST)
Date: Fri, 25 Sep 2026 11:08:29 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Sam Agazaryan <samagazaryan@google.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Meagan Lloyd <meaganlloyd@linux.microsoft.com>,
	Vitor Soares <vitor.soares@toradex.com>,
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/5] i3c: add i3cdev module to expose i3c dev in /dev
Message-ID: <arY6DfVf_9tZ_TCu@black.igk.intel.com>
References: <20260921230603.2518652-1-samagazaryan@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260921230603.2518652-1-samagazaryan@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_020835_096801_EA4BCFEE 
X-CRM114-Status: GOOD (  17.51  )
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

On Mon, Sep 21, 2026 at 11:05:58PM +0000, Sam Agazaryan wrote:
> This patch series introduces the i3cdev module, exposing unbound I3C
> target devices to userspace via character device nodes (/dev/bus/i3c/*),
> along with the i3ctransfer userspace utility in tools/i3c/.
> 
> Userspace access to I3C targets is needed for devices that do not have a
> kernel driver bound to them, such as targets in ROM/bootloader recovery
> mode (e.g., OCP Secure Firmware Recovery v1.1 and Caliptra Silicon Root of
> Trust recovery flows), as well as hardware bring-up and diagnostics.
> 
> When a kernel driver later binds to an I3C device (for example via
> dynamic module loading), i3cdev automatically detaches via the
> BUS_NOTIFY_BIND_DRIVER notifier so kernel drivers always take
> precedence.
> 
> Testing status:
> This v5 series has been compile-tested across all modified I3C controller
> drivers with W=1. Posting v5 now so collaborators and controller owners
> can test the unified UAPI and actual_len updates on their respective
> hardware and provide Tested-by tags while we complete final hardware
> verification of the v5 updates on our platform.

I do not know how we end up here. The not-settled yet discussion is in
thread with aqt_dCazxTDR4cpk@ashevche-desk.local.

But I have a big concern about exposing i3c to user space in the way we have it
in i2c. Taking into account that i2c is an odd bus and might lead even to HW
*physical* breakage, I would thing 100 times before making the same mistake
in i3c. If you ever want to do this, this must not be user visible feature
(hidden under expert and debug and maybe even more guards for the starter).

Personally from my perspective this is no go, but I'm not a maintainer here.

P.S.
And you need to gather the opinion of Wolfram as well.

-- 
With Best Regards,
Andy Shevchenko



-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
