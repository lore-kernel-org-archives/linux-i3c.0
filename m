Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23357C52D7F
	for <linux-i3c@archiver.kernel.org>; Sat, 17 Aug 2024 09:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K5mGuPJbDplMlK4tWKj8v1/2TfSEiaD+hXSBORf4C6I=; b=QUGioNzmQSU0LL
	d6JuON+/rZpG/XmmLCuNnQpOJEqGZdje3xuqsBB8oDZLirmCYKEFl+n/S09CFBFhA3xC06FkdCIMI
	6OZPeo13kIb3lPthLfuYnxPVIfCqtY7sZLjMXea1rHWt8NYohVTNXWwrPh/d8ikArZs+pbqS73bIA
	HvJmLL7c8ixsg5vCxqFS+O2Gdzx9PBhAa6JnL4v7GemnSf7aA8ulBNURL9qNwH/fOn118sRKfhhai
	6HoTk/SQ9ew3eh+UDvOHOSPM1sz8rtelwwmZqUnXMBE4qyj11u7aIC4oU0szC1m4uVdwU11j0of/K
	4GwCvWQTCDoaUpfCo/wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfGE3-0000000F33Y-1w9Z;
	Sat, 17 Aug 2024 09:59:59 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scQS0-0000000BUuy-2UTe
	for linux-i3c@lists.infradead.org;
	Fri, 09 Aug 2024 14:18:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723213121; x=1754749121;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jR8DUHypHhaZJ2U/6q5+nM49Nrsd6Q8QBOaKaMTM9T4=;
  b=QXXBerKXyp1dBoHRvTsOc97ZSIxc/nbK20qtxtaUP1M1yXDcGALugzLV
   a7X4BEX6LV6DT/94CdFzJdAHFyns8POOmIVerVuOF3gM+ogNynsBrbb7Z
   gXljzkR+CyMgGG7/kCQosNwxC/KgPhwqs2IGCUpniX1057EWJr9AM5lzW
   DmQxWU3NHsNU39APPCFWGflZ5tEZ7jNzp2/BZJgbLX5SazPxEJ8TPPKek
   0TAqLjtnrvJrmTMLjbtOxi9HIMg0F110bPCmsbnlJN71+J1CToP4flHhQ
   OsseShPp6cLO4n7s7b2HdNuWnJ7nfvxPp2/3TT3QPG4Mf3NctkJTledyb
   g==;
X-CSE-ConnectionGUID: SmQA3SE0Tye4KNJSTzRYeQ==
X-CSE-MsgGUID: XlAe501GTlS6uWOHmqHkGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21362755"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; 
   d="scan'208";a="21362755"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 07:18:40 -0700
X-CSE-ConnectionGUID: s4KZTVdLSVyVEDRtoS1eqA==
X-CSE-MsgGUID: +rmy6afXTn+mfvua97pYDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; 
   d="scan'208";a="80812388"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 07:18:32 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1scQRo-0000000DRKO-3Dyo;
	Fri, 09 Aug 2024 17:18:28 +0300
Date: Fri, 9 Aug 2024 17:18:28 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>,
	Krishnamoorthi M <krishnamoorthi.m@amd.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH RESEND v3 1/6] i3c: mipi-i3c-hci: Add MIPI0100 ACPI ID to
 the I3C Support List
Message-ID: <ZrYlNOjFQE9dHsVV@smile.fi.intel.com>
References: <20240807052359.290046-1-Shyam-sundar.S-k@amd.com>
 <20240807052359.290046-2-Shyam-sundar.S-k@amd.com>
 <e94efd42-bc3f-4003-8ad8-2da6500f0f13@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e94efd42-bc3f-4003-8ad8-2da6500f0f13@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240809_071841_065883_D1D81F62 
X-CRM114-Status: GOOD (  15.27  )
X-Mailman-Approved-At: Sat, 17 Aug 2024 02:59:57 -0700
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

On Fri, Aug 09, 2024 at 04:54:18PM +0300, Jarkko Nikula wrote:
> Hi
> 
> I Cc'ed Andy and Rafael because of ACPI ID allocation question that came to
> my mind below which I'm not expert enough to answer.
> 
> On 8/7/24 8:23 AM, Shyam Sundar S K wrote:
> > The current driver code lacks the necessary plumbing for ACPI IDs,
> > preventing the mipi-i3c-hci driver from being loaded on x86
> > platforms that advertise I3C ACPI support.
> > 
> > This update adds the MIPI0100 ACPI ID to the list of supported IDs.

When adding a new ACPI ID, always provide the following information:

1) link (in some form) to the official confirmation / documentation for
the allocated ID by the vendor (MIPI in this case) _OR_ (very exceptional!)
why the bad ID had been allocated;

2) are there devices in the wild (on the market) that use the being added ID(s)?

3) excerpt from the device (independently if it's public already, see above,
or not) DSDT ACPI table.

With the given patch it looks to me that you most likely need a local, AMD
specific ID as well.

So, in my ideal world the DSDT should be like

	Device (I3CC)
	{
		Name (_HID, "...") // AMD specific _HID
		Name (_CID, "MIPI0100") // Compatible ID for generic I3C controller
		...
	}

Is this the case? Why not?

P.S. Make sure you Cc me on ACPI ID matters in the future.

-- 
With Best Regards,
Andy Shevchenko



-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
