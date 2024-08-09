Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 233BAC5320E
	for <linux-i3c@archiver.kernel.org>; Sat, 17 Aug 2024 10:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XXu7DreDcE+jOu1I6VEk0syR8PNFrpV8ilmeUAmrMlU=; b=WvyHYHNRqWjmx6
	kLHkD2X/Qz7cMP+fPiN4I7BCeM1QyIYL/+cKH7Qc/CDMQK5b3KyX+G0y/7MO9SZwPTFFbJ+BOgUNg
	aZSkrhjWHHq4bhFDvZr+fdxabpvfrSee7WHmtCoxotFKSvHufu82aLBXhV+9xJ+aNS6yIMq0z+ZfN
	sc9bpdDkCoQT2YAO8y6Uxb1wNvQFJhKwhGZGyoHhFk0grXukdsbkbUvufxoAsJpnGnDHIpmzlQjqN
	L4GT5hGyPzB7cw+z1zsJ+c8DP/q52HPGuKHXyck579S1wPeY+wwLCNByjB8ef0eQ1jXuftPC/VVP6
	ChSQ5si7CkHUWvGgnqCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfGE3-0000000F33q-3Jl5;
	Sat, 17 Aug 2024 09:59:59 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scS03-0000000BnrX-1BD7
	for linux-i3c@lists.infradead.org;
	Fri, 09 Aug 2024 15:57:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723219076; x=1754755076;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y8edBrqv1pzht7Xi4mM+aUWqnoTHAgGonimtxluGamw=;
  b=NQSPJde2yZzCMIGXRrdsVJLYZbmDKk93pyP+aiBQ8DBFUWsKGbWYfCJW
   Yb6GHx3KW02PKu/wBEVoVGiu5OlxHBXya338zcIFpjLeSqp+JOomID+Nw
   etX/8Bu/1okmxz4o4SEB+MSee9xG6l0YDjYqMY32nl0ltpTpMVosw1mPl
   d9sbd5/F8Ds5o5u6pxbBjtt6Y6PiFF3wI1aq7HdOX4+Uwqxwq73uqUOxc
   CUW59bi6/W7GfeS0GEu7CozvH5lyvnkZWBxy72TZ8eHvUCmhJv3JcOpaK
   yX61/LSVldQGNVJ3sEYyQWPvjtYNOdD3SGmvK7sB7pLXS23cIYKmM4rv7
   A==;
X-CSE-ConnectionGUID: 8R235TEERuOzTiwvbMzewg==
X-CSE-MsgGUID: b0OpVyAPQmWIkM9B1OkcZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="25193363"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; 
   d="scan'208";a="25193363"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 08:57:10 -0700
X-CSE-ConnectionGUID: HIDNdw4fQI26LVRB1vR5OA==
X-CSE-MsgGUID: 3mVOzCSmSrOQTpCMNvGOkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; 
   d="scan'208";a="57565751"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 08:57:07 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1scRzE-0000000DTBB-3uIV;
	Fri, 09 Aug 2024 18:57:04 +0300
Date: Fri, 9 Aug 2024 18:57:04 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>,
	Krishnamoorthi M <krishnamoorthi.m@amd.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH RESEND v3 1/6] i3c: mipi-i3c-hci: Add MIPI0100 ACPI ID to
 the I3C Support List
Message-ID: <ZrY8UOIsud8-NM_F@smile.fi.intel.com>
References: <20240807052359.290046-1-Shyam-sundar.S-k@amd.com>
 <20240807052359.290046-2-Shyam-sundar.S-k@amd.com>
 <e94efd42-bc3f-4003-8ad8-2da6500f0f13@linux.intel.com>
 <ZrYlNOjFQE9dHsVV@smile.fi.intel.com>
 <c6ef0253-9f32-46d6-a658-295e39c926b2@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c6ef0253-9f32-46d6-a658-295e39c926b2@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240809_085755_402424_BA3A03C5 
X-CRM114-Status: GOOD (  29.87  )
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

On Fri, Aug 09, 2024 at 09:02:35PM +0530, Shyam Sundar S K wrote:
> On 8/9/2024 19:48, Andy Shevchenko wrote:
> > On Fri, Aug 09, 2024 at 04:54:18PM +0300, Jarkko Nikula wrote:
> >> On 8/7/24 8:23 AM, Shyam Sundar S K wrote:

...

> > When adding a new ACPI ID, always provide the following information:
> > 
> > 1) link (in some form) to the official confirmation / documentation for
> > the allocated ID by the vendor (MIPI in this case) _OR_ (very exceptional!)
> > why the bad ID had been allocated;
> 
> Member version:
> https://members.mipi.org/wg/All-Members/document/previewpdf/89465
> 
> Public version: https://www.mipi.org/mipi-disco-for-i3c-download (this
> requires a signup).
> 
> Since there is no direct link available for preview, I did not include
> them in the commit-msg. But left a note that the MIPI ID is the one as
> specified in the MIPI DisCo spec.

It's fine.

> > 2) are there devices in the wild (on the market) that use the being added ID(s)?
> 
> Not in the wild. But the latest platform will have this support
> included. So, these device IDs are crucial for the i3c-hci to be
> supported on AMD platforms.

Good, let's do it right then!

> > 3) excerpt from the device (independently if it's public already, see above,
> > or not) DSDT ACPI table.
> > 
> > With the given patch it looks to me that you most likely need a local, AMD
> > specific ID as well.
> > 
> > So, in my ideal world the DSDT should be like
> > 
> > 	Device (I3CC)
> > 	{
> > 		Name (_HID, "...") // AMD specific _HID
> > 		Name (_CID, "MIPI0100") // Compatible ID for generic I3C controller
> > 		...
> > 	}
> > 
> > Is this the case? Why not?
> 
> Please refer to the MIPI HCI I3C DisCo specification
> (https://members.mipi.org/wg/All-Members/document/previewpdf/89465)
> section 5.4. The ASL looks the same in case of AMD.
> 
> MSFT says that they want to use MIPI0100 as mentioned in the
> specification.

MIPI doesn't know how to assign the ACPI ID correctly. But again, what I put in
the above is the correct way of approaching.

> What would you advise?

Since my intuition and experience tells me that the two devices even based on
the same IP are not the same (see word 'quirk' or '.driver_data' or alike in
the kernel sources) the generic ID may not be used for the specific vendor
unless it's _the only_ vendor for the certain IP.

So, please do as I suggested above. And file a error report (and correction
proposal) to the MIPI, so in "5.1 I3C Host Controller ACPI Hardware ID (_HID)"
they should use _CID instead of _HID and add some text like
"Each vendor should dedicate it's own _HID for the platform in question. The
same _HID as _CID may be used if and only if vendor guarantees that there 100%
compatibility with MIPI as described in this and other related documents."

I.o.w. do you 100% guarantee that MIPI HCI I3C DisCo covers all necessary
properties that you need for _your_ hardware? If not, use my approach, if yes,
use the same _HID *and* _CID.

Microsoft should know this as well and much better than MIPI.

-- 
With Best Regards,
Andy Shevchenko



-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
