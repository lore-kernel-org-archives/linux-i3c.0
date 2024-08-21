Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C1EAC5472F
	for <linux-i3c@archiver.kernel.org>; Sun, 25 Aug 2024 01:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MI2jaJNvGKEqC6lN3fEfxiaTGxv4Z0qH40T0tQCNwtk=; b=MkDn1rBQQbsjpe
	tQO+s9+iqFBbdWvAXEdBDiEEUzN0H5usU0kTbDbdZA9scwr5soXyvIyuJISkCYIqefrZUxgup6Bys
	3+oY5poWRb6H+EZxLo3Qkh+pYLhOVvFeQagS8DShVeNSb5H1WVGqv7pqWwS5SpUB3Y42leHl+d8+Z
	06QcYLB5V5Go+1+d4UM8yEsFqY9qKyPyWrcLEj4FITA5WmTPaVawSH1DeOf0qWBKUivSqjPshLUkk
	R+eluvym7dImzhINxM2JyjsZLKEVHGI4vZ/kqElDXFuMeiC0kpt78m88W1wWYxOxFxGl6G2BIqS45
	zS+HTAQ9Bczwhq4MxQPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1si1ts-00000003EBX-41AJ;
	Sun, 25 Aug 2024 01:18:36 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sglpV-00000009Cb3-04vL
	for linux-i3c@lists.infradead.org;
	Wed, 21 Aug 2024 13:56:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724248613; x=1755784613;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tu0TnCrkCWoRLS38XXnu3gUicmftHm/PcZVfj4gnrrg=;
  b=DwB0arFz8Chwl0fanmDxYFewCkkA0bCDAayG/6hElZQ+ndZwm/hr7rho
   UOYlVM9PmR3MbgLGnkxspGDa7cugAeXmTjgoBxTr6k5rposSWqIxm+m1P
   UetgCfpHg9C3BB6trIKU9lEjArfbcDDsudBtArn5KmWNmyZXAc5yTVZYe
   hqEJFGaRwlTlKjwbxkC34E/+Us1CvUEiXw6Dx3setwIDbvcXRmmdBAmcT
   9nAAac4JDyJ4u0toQgze5v1rh4Lj1JsokOxOpZArov6W/FYDRCavfNXdn
   1AzDFQ0QBEHkQkDr+FHG71rQ18NHalqE8hmqa+neSGqqlY05cISU/aHHj
   Q==;
X-CSE-ConnectionGUID: FahaeHyaSyaLeOcg/bV1zQ==
X-CSE-MsgGUID: 6MQCtLy0Tben9eO8Hb1xCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22221398"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="22221398"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 06:56:51 -0700
X-CSE-ConnectionGUID: zJ0Wy885SOym5WxJCCGkzw==
X-CSE-MsgGUID: JVA/9GUdRv6pSxjVrKSL0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="61077347"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 06:56:49 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sglpO-0000000066B-1674;
	Wed, 21 Aug 2024 16:56:46 +0300
Date: Wed, 21 Aug 2024 16:56:45 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>,
	Krishnamoorthi M <krishnamoorthi.m@amd.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/6] i3c: mipi-i3c-hci: Add AMDI5017 ACPI ID to the
 I3C Support List
Message-ID: <ZsXyHfLJ8SJOW0RF@smile.fi.intel.com>
References: <20240821133554.391937-1-Shyam-sundar.S-k@amd.com>
 <20240821133554.391937-2-Shyam-sundar.S-k@amd.com>
 <9584ddb0-6e39-4d04-9242-a68eb4b86eba@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9584ddb0-6e39-4d04-9242-a68eb4b86eba@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_065653_183829_103E0EE5 
X-CRM114-Status: GOOD (  13.35  )
X-Mailman-Approved-At: Sat, 24 Aug 2024 18:18:33 -0700
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

On Wed, Aug 21, 2024 at 07:07:45PM +0530, Shyam Sundar S K wrote:
> + Andy

Thank you!

> On 8/21/2024 19:05, Shyam Sundar S K wrote:
> > The current driver code lacks the necessary plumbing for ACPI IDs,
> > preventing the mipi-i3c-hci driver from being loaded on x86
> > platforms that advertise I3C ACPI support.
> > 
> > This update adds the AMDI5017 ACPI ID to the list of supported IDs.

Please, provide a DSDT excerpt to show how it will look like in the ACPI
tables.

...

> > +static const struct acpi_device_id i3c_hci_acpi_match[] = {
> > +	{"AMDI5017"},

Spaces are missing

	{ "AMDI5017" },

> > +	{}
> > +};
> > +MODULE_DEVICE_TABLE(acpi, i3c_hci_acpi_match);

...

Otherwise LGTM, thanks!

-- 
With Best Regards,
Andy Shevchenko



-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
