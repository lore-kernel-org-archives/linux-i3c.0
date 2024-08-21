Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C6DC54732
	for <linux-i3c@archiver.kernel.org>; Sun, 25 Aug 2024 01:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vAFeiO+uoOcm5ypRJt9QfdaIkED8bV25NVW+skN8B/I=; b=lkFUvN1J3eCJ+u
	eRl+f6fPbxCM2w7cWQp8j7QNU08apNQK80rr71Na3TgnJdiooX20/AeLtXfzvD9Xx/pAi2E+M2KH+
	u8TTU3cKGiqJIp0t6xCSXIvkzynd1PcECOA75sRn9JW2U/v5+3Fq4I6tjOYuoiycRlL6ZwRtq46+Y
	jBHz5JzBZ1OcnxMVzBa53XNfsWOP9Gk8pcuNV+sqIJICMCzNl6Pz/TNoGuYqheD2XpiZeX7kwLS/x
	ghZ7mG8uW3p67rHlBxwbcYN7tytQJO6J5iYO+IfnjwzHlbkIZm3wzezqgb8rYdl7JZNzreVU9tbWd
	sBfTsjlo11vRmzGyFc9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1si1tt-00000003EBv-16cs;
	Sun, 25 Aug 2024 01:18:37 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgnQT-00000009Wts-1dZO
	for linux-i3c@lists.infradead.org;
	Wed, 21 Aug 2024 15:39:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724254749; x=1755790749;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5HDlGsmUc/rInp0PWhpsW+zXPX4wPe0+sZYPNbXRbNo=;
  b=Zsu73gX6zIz7JNapC5+5fXQqLFSg2PnZvCZO0xwZx2nxigIF76MO76ca
   WURZUEQy1mv+QL1A+G984Vft0aotouMR+i3OxIzK/qkw8hmCKFCATOuw9
   DUtHD7EKLRyCFHzZO+SmvutlLQ8Ah0K4fUBOvvlt55qr1OoXS7muGrFFT
   scnIKbDTQuXGeADH1rzTDWoGtjFcbKwzOl1Y0i0AtzBJHD2SiR1aZ6+3c
   0abfzrUCoTbAcpuXaVbxR4CrnRJT8t3W8NCGcSwqliUQF9OYcfuwE9mzD
   Ouf50FnWmxjvR3GFc7/F2AXShQhUIy/QhmEEXWevqeflB2Z4BUE3hDz9e
   Q==;
X-CSE-ConnectionGUID: LU+sAf5xTVezhRtYvnrVkw==
X-CSE-MsgGUID: 89pJgPnGT3qN0HAVART7ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="13134603"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="13134603"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 08:39:08 -0700
X-CSE-ConnectionGUID: JSjHD66qTvC/7iLE9OIA3A==
X-CSE-MsgGUID: E+ItOtA9ThCIO0RP0Zbdug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="61152631"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 08:39:07 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sgnQO-0000000087U-1T15;
	Wed, 21 Aug 2024 18:39:04 +0300
Date: Wed, 21 Aug 2024 18:39:04 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>,
	Krishnamoorthi M <krishnamoorthi.m@amd.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/6] i3c: mipi-i3c-hci: Add AMDI5017 ACPI ID to the
 I3C Support List
Message-ID: <ZsYKGOLN3_2VU6Ld@smile.fi.intel.com>
References: <20240821133554.391937-1-Shyam-sundar.S-k@amd.com>
 <20240821133554.391937-2-Shyam-sundar.S-k@amd.com>
 <9584ddb0-6e39-4d04-9242-a68eb4b86eba@amd.com>
 <ZsXyHfLJ8SJOW0RF@smile.fi.intel.com>
 <236aa6d9-bb5d-4854-86e3-5473f5ea6337@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <236aa6d9-bb5d-4854-86e3-5473f5ea6337@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_083909_502158_357834BA 
X-CRM114-Status: GOOD (  13.22  )
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

On Wed, Aug 21, 2024 at 08:42:12PM +0530, Shyam Sundar S K wrote:
> On 8/21/2024 19:26, Andy Shevchenko wrote:
> > On Wed, Aug 21, 2024 at 07:07:45PM +0530, Shyam Sundar S K wrote:
> >> On 8/21/2024 19:05, Shyam Sundar S K wrote:

...

> >>> This update adds the AMDI5017 ACPI ID to the list of supported IDs.

s/This update adds/Add/

> > Please, provide a DSDT excerpt to show how it will look like in the ACPI
> > tables.
> 
>     Scope (_SB)
>     {
> 	...
> 
>         Name (HCID, "AMDI5017")
>         Device (I3CA)
>         {
>             Method (_HID, 0, Serialized)  // _HID: Hardware ID
>             {
>                 If ((I30M == Zero))
>                 {
>                     If (CondRefOf (HCIB))
>                     {
>                         Return (HCID) /* \_SB_.HCID */
>                     }
>                     Else
>                     {
>                         Return (I3ID) /* \_SB_.I3ID */

Do I understand correctly that I3ID is the old one (as per another path I have
seen last week or so), i.o.w. *not* a MIPI allocated one?

If it's the case, feel free to add
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
from ACPI ID perspective.

>                     }
>                 }
>                 Else
>                 {
>                     Return (I2ID) /* \_SB_.I2ID */
>                 }
>             }
> 	
> 	...
>     }

-- 
With Best Regards,
Andy Shevchenko



-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
