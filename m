Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A797C8303B
	for <linux-i3c@archiver.kernel.org>; Thu, 29 Aug 2024 11:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6bKQeuGCG6oN8DcRGGbSdwWEqc6NmaAYxCdFIVgEQDs=; b=oAugrV0PCbXJlI
	y1/MOnH82eUE3ulpPBjx7PNLgby1yy+Dwb60jcXw7P+v6Dx4jdA2MdT6jsnkzD9oSOBjXF8JVm1Qq
	TFXXYF3W8VCyBAuWjk2cI8TyfR4PPe3jXn6rWuWpPJhFGjShvNcqax2Qt8adbwaoLsUf0GueqF80z
	IRCMUtBZDDjWUWadzR5mBEFKrFEJkqhgU317jLzXXrhoYFYskuv9MYajj1nBgQvFUrUVdL35z9gkI
	NgSSQE8GxcQJXswNZrBx6IgHTrfkRpFKmvog75X5fbMvwRazymza4TlohhYn+tW6gXBT6iPW1rdU5
	ts3XO0kKRYeGe167hocA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjcxR-00000001gVx-1n0c;
	Thu, 29 Aug 2024 11:04:53 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjcxN-00000001gV0-0zdj
	for linux-i3c@lists.infradead.org;
	Thu, 29 Aug 2024 11:04:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724929489; x=1756465489;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J6fvJlJc/Ob8k1M+y/Rml88PewDlhA9IfR+J4mDzajQ=;
  b=RYRKoIMvnqmrtFx0Vr16fCjDprBbGGKzFagAk06cle3Vc4Ud72g/fkXG
   gFAup+Y6omKtVF8odPey9FaDb49GV+QPGviVLmHB06m43rJKVJb+cubwT
   XdfFVbpHbf2pI7VRyR4zoEhQ4omWBOj0fvCJX8ZDWcP8Ikng2uYqvdCmS
   VWxpCSPZBXneFQ3c5IFIEeQje5fBnb6X+opwWOrOl/fCEtJVcpNHOZG9e
   xVzjkC3Pc0s/juQOJMgRweJNeTpwQi5jxhY+cQ532bdqnwFQHnfCi69mO
   Cv3uIzYDiiIjpjYpGNgUJ2hirxstdwuNoixB5tgI5W0dwBSoYHpjV6jZl
   g==;
X-CSE-ConnectionGUID: kNVgA7AGTL23wq0RhwQctw==
X-CSE-MsgGUID: 1EDn9IV0Tu6lw0ecT7/ulw==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23088382"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="23088382"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 04:04:45 -0700
X-CSE-ConnectionGUID: u7l1uVU4SdCcFyOucV3HEA==
X-CSE-MsgGUID: MCF9pKvkTJa3Qep55W5U1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="63224001"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 04:04:43 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sjcxE-00000002yKA-2tDH;
	Thu, 29 Aug 2024 14:04:40 +0300
Date: Thu, 29 Aug 2024 14:04:40 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>,
	Krishnamoorthi M <krishnamoorthi.m@amd.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/6] i3c: mipi-i3c-hci: Add AMDI5017 ACPI ID to the
 I3C Support List
Message-ID: <ZtBVyJZc03EixpPT@smile.fi.intel.com>
References: <20240829091713.736217-1-Shyam-sundar.S-k@amd.com>
 <20240829091713.736217-2-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240829091713.736217-2-Shyam-sundar.S-k@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_040450_349535_ECCEC7D0 
X-CRM114-Status: GOOD (  14.21  )
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

On Thu, Aug 29, 2024 at 02:47:08PM +0530, Shyam Sundar S K wrote:
> The current driver code lacks the necessary plumbing for ACPI IDs,
> preventing the mipi-i3c-hci driver from being loaded on x86
> platforms that advertise I3C ACPI support.
> 
> Add the AMDI5017 ACPI ID to the list of supported IDs.

...

>  static struct platform_driver i3c_hci_driver = {
>  	.probe = i3c_hci_probe,
>  	.remove_new = i3c_hci_remove,
>  	.driver = {
>  		.name = "mipi-i3c-hci",

>  		.of_match_table = of_match_ptr(i3c_hci_of_match),

A side note (not sure if it anyhow might be related to your kernel
configurations and builds): There is an ongoing activity to kill
of_match_ptr() for good (as it's more harmful than useful). It _might_ be
that in ACPI only kernel configurations dangling i3c_hci_of_match appears
which compiler will warn about.

> +		.acpi_match_table = i3c_hci_acpi_match,
>  	},
>  };

-- 
With Best Regards,
Andy Shevchenko



-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
